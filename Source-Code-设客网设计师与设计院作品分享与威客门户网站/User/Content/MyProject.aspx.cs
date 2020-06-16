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
    using ZoomLa.SQLDAL;

    public partial class MyProject : System.Web.UI.Page
    {
        private B_Content bll = new B_Content();
        private B_Node bNode = new B_Node();
        private B_Model bmode = new B_Model();
        private B_User buser = new B_User();
        public string flag;
        public string KeyWord;
        public M_UserInfo UserInfo;
        private B_Pub bpbll = new B_Pub();
        protected B_UserPromotions ups = new B_UserPromotions();
        public string indelete = "true";
        public int NodeID { get { return DataConverter.CLng(Request.QueryString["NodeID"]); } }
        public string Status { get { return (Request.QueryString["Status"] ?? ""); } }
        protected void Page_Load(object sender, EventArgs e)
        {
            BindNode();
            if (!IsPostBack)
            {
                this.HiddenField3.Value = Status;
                this.UserInfo = buser.GetLogin();
                this.flag = base.Request.QueryString["type"];
                this.HiddenField2.Value = this.flag;
                this.HiddenField1.Value = this.NodeID.ToString();
                if (NodeID != 0)
                {
                    M_Node nod = this.bNode.GetNodeXML(this.NodeID);
                    if (nod.NodeListType == 2)
                    {
                        Response.Redirect("Myproduct.aspx?NodeID=" + this.NodeID);//跳转到商城
                    }
                    string ModeIDList = nod.ContentModel;
                    string[] ModelID = ModeIDList.Split(',');
                    string AddContentlink = "";

                    for (int i = 0; i < ModelID.Length; i++)
                    {
                        if (this.bmode.GetModelById(DataConverter.CLng(ModelID[i])).ItemName != null && this.bmode.GetModelById(DataConverter.CLng(ModelID[i])).ItemName != "")
                        {
                            M_ModelInfo infoMod=this.bmode.GetModelById(DataConverter.CLng(ModelID[i]));
                            if (infoMod.ModelType!=5)
                            {
                                AddContentlink = AddContentlink + "<input id=\"add" + i.ToString() + "\" name=\"btn" + i.ToString() + "\" class=\"btn btn-primary\" type=\"button\" value=\"添加" + infoMod.ItemName + "\" onclick=\"javascript:window.location.href='AddContent.aspx?ModelID=" + ModelID[i] + "&NodeID=" + this.NodeID + "';\" />&nbsp;&nbsp;";
                                AddContentlink = AddContentlink + "<input id=\"addall" + i.ToString() + "\" name=\"btn" + i.ToString() + "\" class=\"btn btn-primary\"  type=\"button\" value=\"批量添加" + infoMod.ItemName + "\" onclick=\"javascript:window.location.href='Release.aspx?ModelID=" + ModelID[i] + "&NodeID=" + this.NodeID + "';\" />&nbsp;&nbsp;";
                            }
                        }
                    }
                    this.lblAddContent.Text = AddContentlink;
                    this.HiddenField3.Value = Status;
                }
                else
                {
                    this.lblAddContent.Text = ""; 
                }
                if (!string.IsNullOrEmpty(Request["method"]))
                {
                    if (Request["method"] == "Del" && (!string.IsNullOrEmpty(Request["ID"])))
                    {
                        Del(Request["ID"]);
                        Response.Redirect("/User/Content/MyContent.aspx?NodeID=" + NodeID);
                    }
                    else if (Request["method"] == "Delete" && (!string.IsNullOrEmpty(Request["ID"])))
                    {
                        Delete(Request["ID"]);
                        Response.Redirect("/User/Content/MyContent.aspx?NodeID=" + NodeID);
                    }
                    else if (Request["method"] == "Reset" && (!string.IsNullOrEmpty(Request["ID"])))
                    {
                        Recl(Request["ID"]);
                        Response.Redirect("/User/Content/MyContent.aspx?NodeID=" + NodeID);
                    }
                }
                MyBind();
            }
            //权限
            GetNodePreate(this.NodeID);
        }

        private void GetNodePreate(int prentid)
        {
            M_Node nodes = bNode.GetNodeXML(prentid);
            if (nodes.ParentID > 0)
            {
                GetNodePreate(nodes.ParentID);
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
                        if (ViewGroup_v != null && ViewGroup_v != "")
                        {
                            string tmparr = "," + ViewGroup_v + ",";
                            switch (this.UserInfo.Status)
                            {
                                case 0://已认证
                                    if (tmparr.IndexOf("," + this.UserInfo.GroupID.ToString() + ",") == -1)
                                    {
                                        if (tmparr.IndexOf(",-1,") == -1)
                                        {
                                            function.WriteErrMsg("很抱歉！您没有权限浏览该栏目下信息！");
                                        }
                                    }
                                    break;
                                default://未认证
                                    if (tmparr.IndexOf(",-2,") == -1)
                                    {
                                        function.WriteErrMsg("很抱歉！您没有权限浏览该栏目下信息！");
                                    }
                                    break;
                            }
                        }
                        else
                        {
                            //为空
                            function.WriteErrMsg("很抱歉！您没有权限浏览该栏目下信息！");
                        }
                        break;
                    case "onlyUser":
                        if (ViewSunGroup_v != null && ViewSunGroup_v != "")
                        {
                            string tmparr = "," + ViewSunGroup_v + ",";
                            switch (this.UserInfo.Status)
                            {
                                case 0://已认证
                                    if (tmparr.IndexOf("," + this.UserInfo.GroupID.ToString() + ",") == -1)
                                    {
                                        if (tmparr.IndexOf(",-1,") == -1)
                                        {
                                            function.WriteErrMsg("很抱歉！您没有权限浏览该栏目下信息！");
                                        }
                                    }
                                    break;
                                default://未认证
                                    if (tmparr.IndexOf(",-2,") == -1)
                                    {
                                        function.WriteErrMsg("很抱歉！您没有权限浏览该栏目下信息！");
                                    }
                                    break;
                            }
                        }
                        else
                        {
                            //为空
                            function.WriteErrMsg("很抱歉！您没有权限浏览该栏目下信息！");
                        }
                        break;
                }
               
            }
        }

        //绑定数据源
        private void MyBind()
        {
            this.flag = this.HiddenField2.Value.ToString();
            string uname = buser.GetLogin().UserName;
            int type = DataConverter.CLng(this.DropDownList1.SelectedValue);
            string SearchTitle = this.TxtSearchTitle.Text.Trim();
            string status = this.HiddenField3.Value;
            this.EGV.DataSource = this.bll.ContentListUser(this.NodeID, this.flag, uname, SearchTitle, type, status);
            this.EGV.DataKeyNames = new string[] { "GeneralID" };
            this.EGV.DataBind();
        }
        protected void EGV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.EGV.PageIndex = e.NewPageIndex;
            this.MyBind();
        }
        protected void btnDeleteAll_Click(object sender, EventArgs e)
        {
            string ids = Request.Form["idchk"];
            for (int i = 0; i < ids.Split(',').Length; i++)
            {
                this.bll.SetDel(Convert.ToInt32(ids.Split(',')[i]));
            }
            MyBind();
        }
        protected void EGV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Page.Response.Redirect("EditProject.aspx?GeneralID=" + e.CommandArgument.ToString());
            }
            else if (e.CommandName == "View")
            { 
                Page.Response.Redirect("/Item/"+e.CommandArgument.ToString()+".aspx");
            }
            else
            {
                if (e.CommandName == "Del")
                {
                    Del(e.CommandArgument.ToString());
                }
                else if (e.CommandName == "Reset")
                {
                    Recl(e.CommandArgument.ToString());
                }
                else if (e.CommandName == "Delete")
                {
                    Delete(e.CommandArgument.ToString());
                }
                MyBind();
            }
        }
        protected void Delete(string ID)
        {
            string Id = ID;
            string title = this.bll.GetCommonData(DataConverter.CLng(Id)).Title;
            this.bll.DelContent(DataConverter.CLng(Id));
            MyBind();
        }
        protected void Recl(string ID)
        {
            string Id = ID;
            string title = this.bll.GetCommonData(DataConverter.CLng(Id)).Title;
            this.bll.Reset(DataConverter.CLng(Id));
        }
        protected void Del(string ID)
        {

            M_UserInfo infos = buser.GetLogin();
            M_UserPromotions upsinfo = ups.GetSelect(NodeID, infos.GroupID);

            if (upsinfo.pid != 0)
            {
                if (upsinfo.Deleted != 1)
                {
                    function.WriteErrMsg("您所在会员组无删除权限！");
                }
            }

            string Id =ID;
            string title = this.bll.GetCommonData(DataConverter.CLng(Id)).Title;
            bll.SetDel(DataConverter.CLng(Id));
            MyBind();
        }

        public string GetStatus(string type)
        {
            DataTable dt = SqlHelper.ExecuteTable("select * from ZL_Orderinfo where ISNUMERIC(Ordermessage)>0 And Paymentstatus=1 And Ordermessage='" + Eval("GeneralID") + "'", null);
            if (dt.Rows.Count > 0)
            {
                if (type == "1")
                    return "已付款";
                else
                    return "";
            }
            else
            {
                if (type == "1")
                    return "未付款";
                else
                    return "<a href='/Class_13/NodeNews.aspx?GID=" + Eval("GeneralID") + "' class='option_style'><i class='fa fa-money'></i> 付款</a>";
            }
            //int s = DataConverter.CLng(status);
            //if (s == 0)
            //    return "待审核";
            //if (s == 99)
            //    return "已审核";
            //if (s == -1)
            //    return "退档";
            //return "回收站";
        }
        public bool GetIsDe(string status)
        {
            int s = DataConverter.CLng(status);
            if (s != 99)
            {
                if (s == -2)
                {
                    return false;
                }
                return true;
            }
            else
            {
                return false;
            } 
        }

        public bool GetIsRe(string status)
        {
            int s = DataConverter.CLng(status);
                if (s == -2)
                {
                    return true;
                }
                else return false;
        }
        public bool GetIsNRe(string status,string action)
        { 
            int s = DataConverter.CLng(status);
            if (action.Equals("edit"))
            {
                if (s == -2)
                {
                    return false;
                }
                else return true;
            }
            else 
            {
                if (s == 99)
                {
                    return true;
                }
                else return false;
            }
            
        }
        public bool ChkStatus(string status)
        {
            int s = DataConverter.CLng(status);
            if (s == 99)
                return false;
            else
                return true;
        }
        public string GetUrl(string infoid)
        {
            int p = DataConverter.CLng(infoid);
            M_CommonData cinfo = this.bll.GetCommonData(p);
                if (cinfo != null && cinfo.IsCreate == 1)
                return SiteConfig.SiteInfo.SiteUrl + cinfo.HtmlLink;
            else
                return "/Content.aspx?ItemID=" + p;
        }
        public string GetCteate(string IsCreate)
        {
            int s = DataConverter.CLng(IsCreate);
            if (s != 1)
                return "<font color=red>×</font>";
            else
                return "<font color=green>√</font>";
        }
        protected void Btn_Search_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.TxtSearchTitle.Text.Trim()))
            {
                MyBind();
            }
        }
        // 双击进行查看或编辑
        protected override void Render(HtmlTextWriter writer)
        {
            foreach (GridViewRow row in this.EGV.Rows)
            {
                if (row.RowState == DataControlRowState.Edit)
                { 
                    row.Attributes.Remove("ondblclick");
                    row.Attributes.Remove("style");
                    row.Attributes["title"] = "编辑行";
                    continue;
                }
                if (row.RowType == DataControlRowType.DataRow)
                {
                    row.Attributes["ondblclick"] = String.Format("javascript:location.href='ShowPubList.aspx?ID={0}'", this.EGV.DataKeys[row.RowIndex].Value.ToString());
                    row.Attributes["style"] = "cursor:pointer";
                    row.Attributes["title"] = "双击查看";
                }
            }
            base.Render(writer);
        }
        
        protected void BindNode()
        {
            DataTable dt = bNode.GetNodeListXML();
            string nodeids = ups.GetNodeIDS(buser.GetLogin().GroupID);
            if (!string.IsNullOrEmpty(nodeids))
            {
                dt.DefaultView.RowFilter = "NodeID in(" + nodeids + ")";
            }
            else
            {
                dt.DefaultView.RowFilter = "1>2";//无权限，则去除所有
            }
            dt = dt.DefaultView.ToTable();
            dt.DefaultView.Sort="OrderID,NodeID ASC";
            MyTree.liAllTlp = "<a href='MyContent.aspx'>全部内容</a>";
            MyTree.LiContentTlp = "<a href='MyContent.aspx?NodeID=@NodeID'>@NodeName</a>";
            MyTree.SelectedNode = NodeID;//选中节点
            MyTree.DataSource = dt;
            MyTree.DataBind();
        }
    }
}