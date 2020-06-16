using System;
using System.Data;
using System.Collections;
using System.Web;
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.Model;
using System.Text;
using ZoomLa.Components;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Xml;
using System.IO;
using ZoomLa.SQLDAL;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using log4net;

public partial class V_Content_AddContent : CustomerPageAction
{
    protected M_AdminInfo adminMod = new M_AdminInfo();
    protected M_Node nodeMod = new M_Node();
    protected B_Admin adminBll = new B_Admin();
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
            hits_txt.Text = GetAlias("Hits", ds.Tables[0]);
            gjz_txt.Text = GetAlias("Tagkey", ds.Tables[0]);
            tj_txt.Text = GetAlias("EliteLevel", ds.Tables[0]);
            zht_txt.Text = GetAlias("Status", ds.Tables[0]);
            gx_time.Text = GetAlias("UpDateTime", ds.Tables[0]);
            Label4.Text = GetAlias("Subtitle", ds.Tables[0]);
            py.Text = GetAlias("PYtitle", ds.Tables[0]);
            if (spbll.GetSpecList().Rows.Count > 0)
            { SpecInfo_Li.Text = "<button type='button' class='btn btn-primary' onclick='ShowSpDiag()'>添加至专题</button>"; }
            else
            { SpecInfo_Li.Text = "<div style='margin:5px;' class='btn btn-default disabled'><span class='glyphicon glyphicon-info-sign'></span> 尚未定义专题</div>"; }
            if (!IsPostBack)
            {
                B_ARoleAuth.CheckEx(ZLEnum.Auth.content, "ContentMange");
                if (!string.IsNullOrEmpty(Request.QueryString["Source"]))
                { function.Script(this, "SetContent();"); }
                //-----工作流,检测该节点是否绑定工作流，如无绑定，则直接通过,未绑定,则以第一步为准
                contentsk.Visible = B_ARoleAuth.Check(ZLEnum.Auth.content, "ContentMange");
                DataTable ddlDT = proBll.SelByNodeID2(NodeID);
                ddlFlow.DataSource = ddlDT;
                ddlFlow.DataTextField = "PName";
                ddlFlow.DataValueField = "PPassCode";
                ddlFlow.DataBind();
                B_Admin AdminBll = new B_Admin();
                M_AdminInfo adminMod = adminBll.GetAdminLogin();
                ddlFlow.SelectedValue = adminMod.DefaultStart.ToString();
                //if (ddlDT.TableName.Equals("Default"))
                //{
                //    ddlFlow.SelectedValue = "99";
                //}
                //else
                //{
                //    ddlFlow.Items[0].Selected = true;
                //}
                //-----
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
                #region 节点权限
                adminMod = adminBll.GetAdminLogin();
                if (!("," + adminMod.RoleList + ",").Contains(",1,") && adminMod.NodeRole != 0)
                {
                    DataTable dt = roleBll.SelectNodeRoleName(adminMod.NodeRole);
                    if (dt.Rows.Count > 0)
                    {
                        IList<string[]> liss = new List<string[]>();
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            string[] nodeM = new string[2];
                            nodeM[0] = dt.Rows[i]["nodeid"].ToString();
                            nodeM[1] = dt.Rows[i]["Columns"].ToString();
                            liss.Add(nodeM);
                        }
                        string bb = nodeBll.stringTreeNodeRole(0, "", liss);
                        if (checknode(bb, NodeID))
                        {
                            if (!GetRole("addTo"))
                                function.WriteErrMsg("你无权限添加信息", "ContentManage.aspx?NodeID=" + NodeID.ToString());
                        }
                        else
                        {
                            function.WriteErrMsg("你无权限添加信息", "ContentManage.aspx?NodeID=" + NodeID.ToString());
                        }
                    }
                }
                #endregion
                nodeMod = nodeBll.GetNodeXML(NodeID);
                //CheckNode(nodeMod);
                if (nodeMod.Contribute != 1)
                {
                    function.Script(this, "ShowSys();");
                }
                Call.SetBreadCrumb(Master, "<li><a href='" + CustomerPageAction.customPath2 + "I/Main.aspx'>工作台</a></li><li><a href='ContentManage.aspx'>内容管理</a></li><li><a href='ContentManage.aspx?NodeID=" + nodeMod.NodeID + "'>" + nodeMod.NodeName + "</a></li><li class='active'>添加内容</li><div class='pull-right hidden-xs'><span><a href='" + customPath2 + "Content/SchedTask.aspx' title='查看计划任务'><span class='glyphicon glyphicon-time' style='color:#28b462;'></span></a>" + GetOpenView() + "<span onclick=\"ShowDiag('EditNode.aspx?NodeID=" + NodeID + "','配置本节点');\" class='glyphicon glyphicon-cog' title='配置本节点' style='cursor:pointer;margin-left:5px;'></span></span></div>");
                //Label2.Text = "<a href='ContentManage.aspx?Nodeid=" + nodeMod.NodeID + "'>" + nodeMod.NodeName + "</a>";
                nodename.Value = nodeMod.NodeName;
                //txtNode.Text = nodeMod.NodeName;
                //hfNode.Value = NodeID + ",";
                M_ModelInfo model = modelBll.GetModelById(ModelID);
                Label1.Text = "添加" + model.ItemName;
                EBtnSubmit.Text = "添加" + model.ItemName;
                Title_L.Text = "添加" + model.ItemName;
                ModelHtml.Text = mfieldBll.GetInputallHtml(ModelID, NodeID);
                txtAddTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                txtdate.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                BindTempList();
            }
        }
        else
        { function.WriteErrMsg("参数错误!!"); }
    }
    //节点权限操作
    void CheckNode(M_Node nodemod)
    {
        //string Purview = nodemod.Purview;
        //Purview = "<Purview>" + Purview + "</Purview>";
        //XmlDocument doc = new XmlDocument();
        //doc.LoadXml(Purview);
        //string forumstr= doc.SelectSingleNode("//forum").InnerText;
        //if (forumstr.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries)[0].Equals("1"))
        //    IsComm_Radio.SelectedValue = "1";
        //else
        //    IsComm_Radio.SelectedValue = "0";
    }
    protected void EBtnSubmit_Click(object sender, EventArgs e)//添加文章
    {
        IList<string> content = new List<string>();
        string adminname = HttpContext.Current.Request.Cookies["ManageState"]["LoginName"];adminname = StringHelper.Base64StringDecode(adminname);
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
        CData.Inputer = string.IsNullOrEmpty(txtInputer.Text) ? adminname : txtInputer.Text;
        CData.EliteLevel = ChkAudit.Checked ? 1 : 0;
        CData.InfoID = "";
        CData.Hits = string.IsNullOrEmpty(txtNum.Text) ? 0 : DataConverter.CLng(txtNum.Text);
        CData.UpDateType = 2;
        CData.UpDateTime = DataConverter.CDate(txtdate.Text);
        CData.TagKey = Request.Form["tabinput"];
        string status = ddlFlow.SelectedValue.Trim();
        if (!string.IsNullOrEmpty(status))
        {
            CData.Status = Convert.ToInt32(status);
        }
        // CData.Titlecolor = Titlecolor.Text;
        CData.Template = TxtTemplate_hid.Value;
        CData.CreateTime = DataConverter.CDate(txtAddTime.Text);
        CData.ProWeek = DataConverter.CLng(proweek.Text);
        CData.SpecialID = "," + string.Join(",", Spec_Hid.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries)) + ",";
        CData.Pronum = DataConverter.CLng(pronum.Text);
        CData.BidType = DataConverter.CLng(BidType.SelectedValue);
        CData.IsBid = (CData.BidType > 0) ? 1 : 0;
        CData.BidMoney = DataConverter.CDouble(bidmoney.Text);
        CData.DefaultSkins = 0;
        CData.FirstNodeID = GetFriestNode(NodeID);
        CData.TitleStyle = ThreadStyle.Value;
        CData.ParentTree = GetParentTree(NodeID);//父级别树
        CData.TopImg = Request.Form["selectpic"];//首页图片
        CData.PdfLink = Makepdf.Checked ? "pdf_" + DateTime.Now.ToString("yyyyMMddHHmmssfffffff") + ".pdf" : "";
        CData.Subtitle = Subtitle.Text;
        CData.PYtitle = PYtitle.Text;
        CData.RelatedIDS = RelatedIDS_Hid.Value;
        CData.IsComm = Convert.ToInt32(IsComm_Radio.SelectedValue);
        int newID = contentBll.AddContent(table, CData);//插入信息给两个表，主表和从表:CData-主表的模型，table-从表
        //推送
        if (!string.IsNullOrEmpty(pushcon_hid.Value))
        {
            string[] nodeArr = pushcon_hid.Value.Trim(',').Split(',');
            for (int i = 0; i < nodeArr.Length; i++)
            {
                CData.NodeID = Convert.ToInt32(nodeArr[i]);
                contentBll.AddContent(table, CData);
            }
        }
        #region 生成PDF
        //if (Makepdf.Checked)
        //{
        //    M_CommonData m_CommonData = contentBll.SelReturnModel(newID);
        //    string strSql = "select source from " + CData.TableName + " where id=" + m_CommonData.ItemID;
        //    string source = "";
        //    SqlDataReader dr = SqlHelper.ExecuteReader(System.Data.CommandType.Text, strSql);
        //    if (dr.Read())
        //    {
        //        source = dr["source"].ToString();
        //    }
        //    dr.Close();
        //}
        #endregion
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
        ZLLog.ToDB(ZLEnum.Log.content, new M_Log()
        {
            UName = adminname,
            Source = Request.RawUrl,
            Action = "添加内容",
            Message = "标题:" + CData.Title + ",Gid:" + newID,
            Level = "add"
        });
        //添加计划任务(审核时间),如果自动审核时间小于当前时间则忽略
        if (!string.IsNullOrEmpty(CheckDate_T.Text) && Convert.ToDateTime(CheckDate_T.Text) > DateTime.Now)
        {
            AddSched(newID, CheckDate_T.Text, M_Content_ScheTask.TaskTypeEnum.AuditArt);
            contentBll.UpdateStatus(newID, (int)ZLEnum.ConStatus.UnAudit);
        }
        if (!string.IsNullOrEmpty(TimeDate_T.Text))
        {
            AddSched(newID, TimeDate_T.Text, M_Content_ScheTask.TaskTypeEnum.UnAuditArt);
        }
        //积分
        if (SiteConfig.UserConfig.InfoRule > 0)
        {
            B_User buser = new B_User();
            M_UserInfo muser = buser.GetUserByName(adminname);
            if (!muser.IsNull)
            {
                buser.ChangeVirtualMoney(muser.UserID, new M_UserExpHis()
                {
                    UserID = muser.UserID,
                    detail = "添加内容:" + txtTitle.Text + "增加积分",
                    score = SiteConfig.UserConfig.InfoRule,
                    ScoreType = (int)M_UserExpHis.SType.Point
                });
            }
        }
        M_Node noinfo = nodeBll.GetNodeXML(NodeID);
        CreateHtmlDel createHtml = CreateHtmlFunc;
        createHtml.BeginInvoke(HttpContext.Current.Request, quickmake.Checked, CData, table, null, null);
        Response.Redirect("ContentShow.aspx?gid=" + newID + "&nodename=" + Server.UrlEncode(nodename.Value) + "&type=add");
    }
    public void AddSched(int gid, string datetext, M_Content_ScheTask.TaskTypeEnum type)
    {
        M_Content_ScheTask taskmod = new M_Content_ScheTask();
        taskmod.TaskType = (int)type;
        taskmod.TaskContent = gid.ToString();
        taskmod.ExecuteTime = datetext;
        taskmod.LastTime = DateTime.Parse(datetext);
        taskBll.Add(taskmod);
    }
    //草稿
    protected void DraftBtn_Click(object sender, EventArgs e)
    {
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
        CData.Inputer = adminname;
        CData.Inputer = string.IsNullOrEmpty(txtInputer.Text) ? adminname : txtInputer.Text;
        CData.EliteLevel = ChkAudit.Checked ? 1 : 0;
        CData.InfoID = "";
        CData.PdfLink = "";
        CData.Hits = string.IsNullOrEmpty(txtNum.Text) ? 0 : DataConverter.CLng(txtNum.Text);
        CData.CreateTime = DataConverter.CDate(txtAddTime.Text);
        CData.UpDateType = 2;
        CData.UpDateTime = DataConverter.CDate(txtdate.Text);
        CData.TagKey = Request.Form["tabinput"];
        CData.Template = TxtTemplate_hid.Value;
        CData.IsBid = (Request.Form["IsBid"] == "1") ? 1 : 0;
        CData.Subtitle = Subtitle.Text;
        CData.PYtitle = PYtitle.Text;
        CData.TitleStyle = Request.Form["ThreadStyle"];
        CData.ParentTree = GetParentTree(NodeID);//父级别树
        int newID = contentBll.AddContent(table, CData);
        Response.Redirect("ContentShow.aspx?gid=" + newID + "&nodename=" + Server.UrlEncode(nodename.Value) + "&type=add");
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
    //权限判断
    private bool GetRole(string type)
    {
        adminMod = adminBll.GetAdminLogin();
        if (!adminMod.IsSuperAdmin())
        {
            DataTable dt = new DataTable();
            if (adminMod.NodeRole == 0)
            {
                dt = roleBll.SelectNodeRoleName();
            }
            else
            {
                dt = roleBll.SelectNodeRoleName(adminMod.NodeRole);
            }
            if (dt.Rows.Count > 0)
            {
                IList<string[]> liss = new List<string[]>();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string[] nodeM = new string[2];
                    nodeM[0] = dt.Rows[i]["nodeid"].ToString();
                    nodeM[1] = dt.Rows[i]["Columns"].ToString();
                    liss.Add(nodeM);
                }
                string bb = nodeBll.stringTreeNodeRole(0, "", liss);
                if (checknode(bb, NodeID))
                {
                    DataTable nn = nodeRBll.GetSelectNodeANDRid(NodeID, adminMod.RoleList);
                    for (int i = 0; i < nn.Rows.Count; i++)
                    {
                        if (nn.Rows[i][type] + "" == "1")
                        {
                            return true;
                        }
                    }
                }
                return false;
            }
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
    public int GetFriestNode(int NodeID)
    {
        GetNo(NodeID);
        return FNodeID;
    }
    protected int FNodeID = 0;
    public void GetNo(int NodeID)
    {
        nodeMod = nodeBll.GetNodeXML(NodeID);
        int ParentID = nodeMod.ParentID;
        if (DataConverter.CLng(nodeMod.ParentID) > 0)
        {
            GetNo(nodeMod.ParentID);
        }
        else
        {
            FNodeID = nodeMod.NodeID;
        }
    }
    // 获得父级树
    public string returnnodelist = "";
    public string GetParentTree(int NodeID)
    {
        M_Node nodelist = nodeBll.GetNodeXML(NodeID);
        returnnodelist = NodeID + "," + returnnodelist;
        if (nodelist.NodeID > 0 && nodelist.ParentID > 0)
        {
            GetParentTree(nodelist.ParentID);
        }
        if (returnnodelist != "")
        {
            if (BaseClass.Left(returnnodelist, 1) != ",")
            {
                returnnodelist = "," + returnnodelist;
            }
            if (BaseClass.Right(returnnodelist, 1) != ",")
            {
                returnnodelist = returnnodelist + ",";
            }
        }
        return returnnodelist;
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
            if(dr!=null&&dr.Length>0)
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
    public void BindTempList()
    {
        string pathdir = (AppDomain.CurrentDomain.BaseDirectory + ZoomLa.Components.SiteConfig.SiteOption.TemplateDir.Replace("/", @"\")).Replace(@"\\", @"\");
        DataTable tables = FileSystemObject.GetDirectoryAllInfos(pathdir + "/内容页/", FsoMethod.File);
        tables.Columns.Add("TemplatePic");//添加模板图片url
        tables.Columns.Add("TemplateID");
        tables.Columns.Add("TemplateUrl");
        for (int i = 0; i < tables.Rows.Count; i++)
        {
            tables.Rows[i]["rname"] = tables.Rows[i]["rname"].ToString().Replace(pathdir, "").Replace(@"\", "/").Substring(1);
            string filename = "内容页_" + Path.GetFileNameWithoutExtension(tables.Rows[i]["name"].ToString()) + ".jpg";
            tables.Rows[i]["TemplatePic"] = ZoomLa.Components.SiteConfig.SiteOption.TemplateDir + "/thumbnail/" + filename;
            tables.Rows[i]["TemplateID"] = tables.Rows[i]["rname"];
            tables.Rows[i]["TemplateUrl"] = tables.Rows[i]["rname"];
            if (!File.Exists(function.VToP(pathdir + "/thumbnail/" + filename)))
            {
                tables.Rows.Remove(tables.Rows[i]);
                i--;
            }
        }
        tables.DefaultView.RowFilter = "type=1 OR name LIKE '%.html'";
        TlpView_Tlp.DataSource = tables;
        TlpView_Tlp.DataBind();
    }
    
}