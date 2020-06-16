namespace ZoomLa.WebSite.User.Content
{
    using System;
    using System.Collections;
    using System.Configuration;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Web;
    using System.Web.Security;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.WebControls.WebParts;
    using System.Web.UI.HtmlControls;
    using System.Xml;
    using ZoomLa.BLL;
    using ZoomLa.Common;
    using ZoomLa.Components;
    using ZoomLa.Model;
    using ZoomLa.SQLDAL;

    public partial class AddAttest : System.Web.UI.Page
    {
        protected M_AdminInfo adminMod = new M_AdminInfo();
        protected M_Node nodeMod = new M_Node();
        protected B_User buser = new B_User();
        protected B_Content contentBll = new B_Content();
        protected B_Content_WordChain wordBll = new B_Content_WordChain();
        protected B_DocModel docBll = new B_DocModel();
        protected B_Model modelBll = new B_Model();
        protected B_ModelField mfieldBll = new B_ModelField();
        protected B_Node nodeBll = new B_Node();
        protected B_NodeRole nodeRBll = new B_NodeRole();
        protected B_Role roleBll = new B_Role();
        B_Spec spbll = new B_Spec();
        B_Content_ScheTask taskBll = new B_Content_ScheTask();
        public int NodeID { get { return DataConvert.CLng(Request.QueryString["NodeID"]); } }
        public int ModelID { get { return DataConvert.CLng(Request.QueryString["ModelID"]); } }
        public string NodeDir { get { return ViewState["NodeDir"] as string; } set { ViewState["NodeDir"] = value; } }
        protected bool createnew = true;
        //----工作流
        B_Process proBll = new B_Process();
        M_Process proMod = new M_Process();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (function.isAjax())
            {
                string action = Request["action"];
                string value = Request["value"].Trim();
                string result = "";
                switch (action)
                {
                    case "duptitle":
                        DataTable dt = contentBll.GetByDupTitle(value);
                        result = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
                        break;
                }
                Response.Write(result); Response.Flush(); Response.End();
            }
            DataSet ds = new DataSet();
            if (ModelID > 0 && NodeID > 0)
            {
                ds = mfieldBll.GetProModelFieldS(ModelID.ToString());
                bt_txt.Text = GetAlias("Title", ds.Tables[0]);
                gjz_txt.Text = GetAlias("Tagkey", ds.Tables[0]);
                Label4.Text = GetAlias("Subtitle", ds.Tables[0]);
                py.Text = GetAlias("PYtitle", ds.Tables[0]);
                if (spbll.GetSpecList().Rows.Count > 0)
                { SpecInfo_Li.Text = "<button type='button' class='btn btn-primary' onclick='ShowSpDiag()'>添加至专题</button>"; }
                else
                { SpecInfo_Li.Text = "<div style='margin:5px;' class='btn btn-default disabled'><span class='glyphicon glyphicon-info-sign'></span> 尚未定义专题</div>"; }
                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["Source"]))
                    { function.Script(this, "SetContent();"); }
                    nodeMod = nodeBll.GetNodeXML(NodeID);
                    NodeDir = nodeMod.NodeDir;
                    if (nodeMod.ListPageHtmlEx < 3)
                    {
                        CreateHTML.Visible = true;
                    }
                    else
                    {
                        CreateHTML.Visible = false;
                    }
                    nodeMod = nodeBll.GetNodeXML(NodeID);
                    if (nodeMod.Contribute != 1)
                    {
                        function.Script(this, "ShowSys();");
                    }
                    nodename.Value = nodeMod.NodeName;
                    M_ModelInfo model = modelBll.GetModelById(ModelID);
                    Label1.Text = "添加" + model.ItemName;
                    EBtnSubmit.Text = "添加" + model.ItemName;
                    Title_L.Text = "添加" + model.ItemName;

                    ModelHtml.Text = mfieldBll.InputallHtml(ModelID, NodeID, new ModelConfig()
                    {
                        Source = ModelConfig.SType.UserContent
                    });
                }
            }
            else
            { function.WriteErrMsg("参数错误!!"); }
        }
        protected void EBtnSubmit_Click(object sender, EventArgs e)//添加文章
        {
            M_UserInfo mu = buser.GetLogin();
            M_Node nodeMod = nodeBll.GetNodeXML(NodeID);
            IList<string> content = new List<string>();
            if (SiteConfig.SiteOption.FileRj == 1 && contentBll.SelHasTitle(txtTitle.Text.Trim()))
            { function.WriteErrMsg("该内容标题已存在!", "javascript:history.go(-1);"); }
            DataTable dt = mfieldBll.GetModelFieldAllListT(ModelID).Tables[0];
            Call commonCall = new Call();
            DataTable table = commonCall.GetDTFromPage(dt, Page, ViewState, content);
            M_CommonData CData = new M_CommonData();
            CData.NodeID = NodeID;
            CData.ModelID = ModelID;
            CData.TableName = modelBll.GetModelById(ModelID).TableName;
            CData.Title = txtTitle.Text.Trim();
            CData.Inputer = mu.UserName;
            CData.EliteLevel = 0;
            CData.InfoID = "";
            CData.UpDateType = 2;
            CData.TagKey = Request.Form["tabinput"];
            CData.Status = nodeMod.SiteContentAudit; 
            CData.DefaultSkins = 0;
            string parentTree = "";
            CData.FirstNodeID = nodeBll.SelFirstNodeID(NodeID, ref parentTree);
            CData.ParentTree = parentTree;
            CData.TitleStyle = ThreadStyle.Value;
            CData.TopImg = Request.Form["selectpic"];//首页图片
            CData.Subtitle = Subtitle.Text;
            CData.PYtitle = PYtitle.Text;
            CData.RelatedIDS = RelatedIDS_Hid.Value;
            int newID = contentBll.AddContent(table, CData);//插入信息给两个表，主表和从表:CData-主表的模型，table-从表
            #region  关键词
            B_KeyWord kll = new B_KeyWord();
            if (!string.IsNullOrEmpty(CData.TagKey))
            {
                string[] arrKey = CData.TagKey.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                for (int tt = 0; tt < arrKey.Length; tt++)
                {
                    if (kll.IsExist(arrKey[tt]))
                    {
                        M_KeyWord kinfo = kll.GetKeyByName(arrKey[tt]);
                        kinfo.QuoteTimes++;
                        kinfo.LastUseTime = DateTime.Now;
                        if (string.IsNullOrEmpty(kinfo.ArrGeneralID))
                            kinfo.ArrGeneralID = newID.ToString() + ",";
                        else
                            kinfo.ArrGeneralID = kinfo.ArrGeneralID + newID.ToString() + ",";
                        kll.Update(kinfo);
                    }
                    else
                    {
                        M_KeyWord kinfo1 = new M_KeyWord();
                        kinfo1.KeyWordID = 0;
                        kinfo1.KeywordText = arrKey[tt];
                        kinfo1.KeywordType = 1;
                        kinfo1.LastUseTime = DateTime.Now;
                        kinfo1.Hits = 0;
                        kinfo1.Priority = 10;
                        kinfo1.QuoteTimes = 1;
                        kinfo1.ArrGeneralID = "," + newID.ToString() + ",";
                        kll.Add(kinfo1);
                    }
                }
            }
            #endregion
            //积分
            if (SiteConfig.UserConfig.InfoRule > 0)
            {
                buser.ChangeVirtualMoney(mu.UserID, new M_UserExpHis()
                {
                    UserID = mu.UserID,
                    detail = "添加内容:" + txtTitle.Text + "增加积分",
                    score = SiteConfig.UserConfig.InfoRule,
                    ScoreType = (int)M_UserExpHis.SType.Point
                });
            }
            CreateHtmlDel createHtml = CreateHtmlFunc;
            createHtml.BeginInvoke(HttpContext.Current.Request, quickmake.Checked, CData, table, null, null);
            Response.Redirect("MyContent.aspx?NodeID=" + NodeID);
        }
        //草稿
        protected void DraftBtn_Click(object sender, EventArgs e)
        {
            M_UserInfo mu = buser.GetLogin();
            DataTable dt = mfieldBll.GetModelFieldList(ModelID).Tables[0];
            Call commonCall = new Call();
            DataTable table = commonCall.GetDTFromPage(dt, Page, ViewState);
            string adminname = HttpContext.Current.Request.Cookies["ManageState"]["LoginName"];
            adminname = StringHelper.Base64StringDecode(adminname);
            M_CommonData CData = new M_CommonData();
            CData.NodeID = NodeID;
            if (!string.IsNullOrEmpty(ModelID.ToString()))
            {
                CData.ModelID = ModelID;
                CData.TableName = modelBll.GetModelById(ModelID).TableName;
            }
            CData.Title = txtTitle.Text.Trim();
            CData.Status = -3;
            CData.Inputer = mu.UserName;
            CData.InfoID = "";
            CData.PdfLink = "";
            CData.TagKey = Request.Form["tabinput"];
            CData.Subtitle = Subtitle.Text;
            CData.PYtitle = PYtitle.Text;
            CData.TitleStyle = Request.Form["ThreadStyle"];
            string parentTree = "";
            CData.FirstNodeID = nodeBll.SelFirstNodeID(NodeID, ref parentTree);
            CData.ParentTree = parentTree;
            int newID = contentBll.AddContent(table, CData);
            Response.Redirect("MyContent.aspx?NodeID=" + NodeID);
        }
        public bool checknode(string bb, int nodeid)
        {
            string[] bbarray = bb.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < bbarray.Length; i++)
            {
                if (NodeID == DataConverter.CLng(bbarray[i]))
                    return true;
            }
            return false;
        }
        private void GetMethod(M_Node nodeinfo)
        {
            if (nodeinfo.Purview != null && nodeinfo.Purview != "")
            {
                string Purview = nodeinfo.Purview;
                Purview = "<Purview>" + Purview + "</Purview>";
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(Purview);
                string View_v = doc.SelectSingleNode("//View").InnerText;
                if (View_v != "" && View_v.ToLower() == "alluser")
                {
                    createnew = createnew && true;
                }
                else
                {
                    createnew = createnew && false;
                }
            }
        }
        //添加的同时,异步生成静态页
        public delegate void CreateHtmlDel(HttpRequest r, bool c, M_CommonData cdate, DataTable table);
        public void CreateHtmlFunc(HttpRequest r, bool c, M_CommonData cdate, DataTable table)
        {
            M_Node noinfo = nodeBll.GetNodeXML(NodeID);
            if (noinfo.ListPageHtmlEx < 3 && quickmake.Checked == true)
            {
                B_Create CreateBll = new B_Create(r);
                if (c)
                {
                    CreateBll.createann(cdate.GeneralID.ToString());//发布内容页
                    CreateBll.CreateColumnByID(cdate.NodeID.ToString());//发布栏目页
                }
                CreateBll.CreatePageIndex(); //发布首页
            }
            cdate = contentBll.SelReturnModel(cdate.GeneralID);
            string[] strArr = mfieldBll.GetIsChain(ModelID, 1).Split(',');//需要替换的字段
            for (int i = 0; i < strArr.Length; i++)
            {
                DataRow[] dr = table.Select("FieldName = '" + strArr[i] + "' ");
                if (dr != null && dr.Length > 0)
                    dr[0]["FieldValue"] = wordBll.RePlaceKeyWord(dr[0]["FieldValue"].ToString());
            }
            contentBll.UpdateContent(table, cdate);
        }
        //显示前台浏览按钮
        public string GetOpenView()
        {
            string outstr = "", strurl = string.Empty;
            strurl = "Class_" + NodeID + "/Default.aspx";
            outstr = " <a href='/" + strurl + "'  target='_blank' title='前台浏览'><span class='glyphicon glyphicon-eye-open'></span></a>";
            return outstr;
        }
        public string GetAlias(string field, DataTable dt)
        {
            DataRow[] drs = dt.Select("FieldName='" + field + "'");
            return drs.Length > 0 ? drs[0]["FieldAlias"].ToString() : "未定义";
        }
    }
}