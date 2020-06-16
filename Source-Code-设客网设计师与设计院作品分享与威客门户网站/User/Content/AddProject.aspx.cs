namespace ZoomLa.WebSite.User.Content
{
    using System;
    using System.Data;
    using System.Configuration;
    using System.Collections;
    using System.Web;
    using System.Web.Security;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.WebControls.WebParts;
    using System.Web.UI.HtmlControls;
    using ZoomLa.BLL;
    using ZoomLa.Common;
    using ZoomLa.Model;
    using ZoomLa.Components;
    
    using System.Xml;
    using System.Collections.Generic;
    using System.Data.SqlClient;

    public partial class AddProject : System.Web.UI.Page
    {
        protected B_Node bnode = new B_Node();
        protected B_Model bmode = new B_Model();
        protected B_ContentField bshow = new B_ContentField();
        protected B_ModelField bfield = new B_ModelField();
        protected B_Content bll = new B_Content();
        protected int NodeID;
        protected int ModelID;
        public M_UserInfo UserInfo;
        private B_User buser = new B_User();
        private B_Group bg = new B_Group();
        protected B_Sensitivity sll = new B_Sensitivity();
        protected B_UserShopClass cll = new B_UserShopClass();
        protected B_User ull = new B_User();
        protected B_UserPromotions ups = new B_UserPromotions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.UserInfo = buser.GetLogin();
                DataTable table = cll.SelectByUserName(ull.GetLogin().UserName, this.UserInfo.GroupID);
                if (!bg.CheckNum(UserInfo.UserID))
                {
                    function.WriteErrMsg("您所在的用户组限制了您每天最多只能发布" + bg.GetByID(UserInfo.GroupID).CCountPerDay + "条信息！");
                }
                if (string.IsNullOrEmpty(base.Request.QueryString["ModelID"]))
                {
                    function.WriteErrMsg("没有指定要添加内容的模型ID!");
                }
                else
                {
                    this.ModelID = DataConverter.CLng(base.Request.QueryString["ModelID"]);
                }
                if (string.IsNullOrEmpty(base.Request.QueryString["NodeID"]))
                {
                    function.WriteErrMsg("没有指定要添加内容的栏目节点ID!");
                }
                else
                {
                    this.NodeID = DataConverter.CLng(base.Request.QueryString["NodeID"]);
                }
                if (bmode.GetModelById(this.ModelID).ModelType == 2)
                {
                    Response.Redirect("addproduct.aspx?ModelID=" + this.ModelID + "&NodeID=" + this.NodeID);//跳转到商城
                }
                if (bmode.GetModelById(this.ModelID).ModelType == 5)
                {
                    Response.Redirect("../UserShop/ProductAdd.aspx?ModelID=" + this.ModelID + "&NodeID=" + this.NodeID);//跳转到店铺
                }
                this.Label1.Text = "向" + this.bnode.GetNodeXML(this.NodeID).NodeName + "节点添加" + this.bmode.GetModelById(this.ModelID).ItemName;
                this.Label2.Text = this.bnode.GetNodeXML(this.NodeID).NodeName;
                this.HdnModel.Value = this.ModelID.ToString();
                string ModelName = this.bmode.GetModelById(this.ModelID).ModelName;
                this.EBtnSubmit.Text = "添加" + this.bmode.GetModelById(this.ModelID).ItemName;
                this.HdnNode.Value = this.NodeID.ToString();
                this.ModelHtml.Text = this.bfield.GetInputHtmlUser(this.ModelID, this.NodeID);
                DataSet ds = bfield.GetProModelFieldS(this.ModelID.ToString());
                this.Title_L.Text = GetAlias("Title", ds.Tables[0]);
            }
            #region 权限
            GetNodePreate(this.NodeID);
            #endregion
        }
        public string GetAlias(string field, DataTable dt)
        {
            DataRow[] drs = dt.Select("FieldName='" + field + "'");
            return drs.Length > 0 ? drs[0]["FieldAlias"].ToString() : "未定义";
        }
        private void GetNodePreate(int prentid)
        {
            M_Node nodes = bnode.GetNodeXML(prentid);
            GetMethod(nodes);
            if (nodes.ParentID > 0)
            {
                GetNodePreate(nodes.ParentID);
            }
        }
        private void GetMethod(M_Node nodeinfo)
        {
            if (nodeinfo.Purview != null && nodeinfo.Purview != "")
            {
                string Purview = nodeinfo.Purview;
                Purview = "<Purview>" + Purview + "</Purview>";
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(Purview);

                string input_v = doc.SelectSingleNode("//input").InnerText;

                if (input_v != null && input_v != "")
                {
                    string tmparr = "," + input_v + ",";

                    switch (this.UserInfo.Status)
                    {
                        case 0://已认证
                            if (tmparr.IndexOf("," + this.UserInfo.GroupID.ToString() + ",") == -1)
                            {
                                if (tmparr.IndexOf(",-1,") == -1)
                                {
                                    function.WriteErrMsg("很抱歉！您没有权限在该栏目下发布信息！");
                                }
                            }
                            break;
                        default://未认证
                            if (tmparr.IndexOf(",-2,") == -1)
                            {
                                function.WriteErrMsg("很抱歉！您没有权限在该栏目下发布信息！");
                            }
                            break;
                    }
                }
                else
                {
                    //为空
                    function.WriteErrMsg("很抱歉！您没有权限在该栏目下发布信息！");
                }
            }
        }
        private void GetMethodShow(M_Node nodeinfo)
        {
            if (nodeinfo.Purview != null && nodeinfo.Purview != "")
            {
                string Purview = nodeinfo.Purview;
                Purview = "<Purview>" + Purview + "</Purview>";
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(Purview);

                string View_v = doc.SelectSingleNode("//View").InnerText;
                string ViewGroup_v = doc.SelectSingleNode("//ViewGroup").InnerText;
                string ViewSunGroup_v = doc.SelectSingleNode("//ViewSunGroup").InnerText;
                string input_v = doc.SelectSingleNode("//input").InnerText;
                string forum_v = doc.SelectSingleNode("//forum").InnerText;

                switch (View_v)
                {
                    case "allUser"://开放栏目

                        break;
                    case "moreUser"://半开放栏目
                        if (input_v != null && input_v != "")
                        {
                            string tmparr = "," + input_v + ",";
                            switch (this.UserInfo.Status)
                            {
                                case 0://已认证
                                    if (tmparr.IndexOf("," + this.UserInfo.GroupID.ToString() + ",") == -1)
                                    {
                                        if (tmparr.IndexOf(",-1,") == -1)
                                        {
                                            function.WriteErrMsg("很抱歉！您没有权限在该栏目下发布信息！");
                                        }
                                    }
                                    break;
                                default://未认证
                                    if (tmparr.IndexOf(",-2,") == -1)
                                    {
                                        function.WriteErrMsg("很抱歉！您没有权限在该栏目下发布信息！");
                                    }
                                    break;
                            }
                        }
                        else
                        {
                            //为空
                            function.WriteErrMsg("很抱歉！您没有权限在该栏目下发布信息！");
                        }
                        break;
                    case "onlyUser"://认证栏目
                        if (input_v != null && input_v != "")
                        {
                            string tmparr = "," + input_v + ",";
                            switch (this.UserInfo.Status)
                            {
                                case 0://已认证
                                    if (tmparr.IndexOf("," + this.UserInfo.GroupID.ToString() + ",") == -1)
                                    {
                                        if (tmparr.IndexOf(",-1,") == -1)
                                        {
                                            function.WriteErrMsg("很抱歉！您没有权限在该栏目下发布信息！");
                                        }
                                    }
                                    break;
                                default://未认证
                                    if (tmparr.IndexOf(",-2,") == -1)
                                    {
                                        function.WriteErrMsg("很抱歉！您没有权限在该栏目下发布信息！");
                                    }
                                    break;
                            }
                        }
                        else
                        {
                            //为空
                            function.WriteErrMsg("很抱歉！您没有权限在该栏目下发布信息！");
                        }
                        break;
                }
                
            }
        }
        protected void EBtnSubmit_Click(object sender, EventArgs e)
        {
            Call CommonCall = new Call();
            IList<string> content = new List<string>();
            if (this.Page.IsValid)
            {
                this.ModelID = DataConverter.CLng(this.HdnModel.Value);
                this.NodeID = DataConverter.CLng(this.HdnNode.Value);
                DataTable dt = this.bfield.GetModelFieldList(this.ModelID).Tables[0];
                this.UserInfo = buser.GetLogin();
                DataTable table = CommonCall.GetDTFromPage(dt, this.Page, ViewState);
                M_CommonData CData = new M_CommonData();
                M_Node nodeMod = bnode.GetNodeXML(this.NodeID);
                CData.NodeID = this.NodeID;
                CData.ModelID = this.ModelID;
                CData.TableName = this.bmode.GetModelById(this.ModelID).TableName;
                CData.Title = BaseClass.CheckInjection(this.txtTitle.Text);
                CData.Inputer = this.UserInfo.UserName;
                CData.EliteLevel = 0;
                CData.Status = nodeMod.SiteContentAudit;//读取节点中定义的状态
                CData.Template = "";
                CData.InfoID = "";
                CData.SpecialID = "";
                CData.PdfLink = "";
                CData.CreateTime = DateTime.Now;
                CData.FirstNodeID = GetFriestNode(this.NodeID);
                CData.ParentTree = GetParentTree(this.NodeID);
                CData.IsBid = (CData.BidType > 0) ? 1 : 0;
                CData.DefaultSkins = 0;
                string Keyword = this.TxtTagKey.Text.Trim();
                CData.TagKey = Keyword;
                CData.TopImg = "";//首页图片
                //if (allpromoney > this.UserInfo.UserPoint)
                //{
                //    function.WriteErrMsg("您的点卡不够发布此内容！请充值后再发布！");
                //}
                    
                //插入数据
                int newID = this.bll.AddContent(table, CData);
                
                B_KeyWord kll = new B_KeyWord();
                if (!string.IsNullOrEmpty(Keyword))
                {
                    string[] arrKey = Keyword.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
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
                //if (SiteConfig.UserConfig.InfoRule > 0)
                //{
                //    if (buser.AddExp(this.UserInfo.UserID, SiteConfig.UserConfig.InfoRule))
                //    {
                //        Response.Write(this.UserInfo.UserID);
                //        Response.End();
                //        M_UserExpHis hist = new M_UserExpHis();
                //        hist.UserID = this.UserInfo.UserID;
                //        hist.Operator = this.UserInfo.UserID;
                //        hist.detail = this.txtTitle.Text;
                //        hist.score = SiteConfig.UserConfig.InfoRule;
                //        hist.OperatorIP = Request.UserHostAddress;
                //        B_History.AddExpHis(hist);
                //    }
                //}
                
                int nodeid = this.NodeID;
                M_Node noinfo = bnode.GetNodeXML(nodeid);

                M_UserInfo uinfos = this.UserInfo;
                int AddPoint = DataConverter.CLng(noinfo.AddPoint);
                double AddMoney = DataConverter.CLng(noinfo.AddMoney);
                //uinfos.UserPoint = uinfos.UserPoint - allpromoney;
                uinfos.UserPoint = uinfos.UserPoint - AddPoint;
                uinfos.Purse = uinfos.Purse - AddMoney;
                buser.UpDateUser(uinfos);
                Response.Redirect("/Class_13/NodeNews.aspx?GID=" + newID);
            }
        }
        public string returnnodelist = "";
        // 获得父级树
        public string GetParentTree(int NodeID)
        {
            M_Node nodelist = bnode.GetNodeXML(NodeID);
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
        // 获得第一级节点ID
        public int GetFriestNode(int NodeID)
        {
            GetNo(NodeID);
            return FNodeID;
        }
        protected int FNodeID = 0;
        public void GetNo(int NodeID)
        {
            M_Node nodeinfo = bnode.GetNodeXML(NodeID);
            int ParentID = nodeinfo.ParentID;
            if (DataConverter.CLng(nodeinfo.ParentID) > 0)
            {
                GetNo(nodeinfo.ParentID);
            }
            else
            {
                FNodeID = nodeinfo.NodeID;
            }
        }
        public string getKey()
        {
            B_KeyWord bll = new B_KeyWord();
            DataTable temptable = bll.GetKeyWordAll();
            string keys = "";
            for (int i = 0; i < temptable.Rows.Count; i++)
            {
                if (i == 0)
                    keys = temptable.Rows[i]["KeywordText"].ToString();
                else
                    keys = keys + "," + temptable.Rows[i]["KeywordText"].ToString();
            }
            return keys;
        }
    }
}