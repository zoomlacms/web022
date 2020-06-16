namespace ZoomLa.WebSite
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
    using ZoomLa.SQLDAL;
    using System.IO;
    using System.Data.SqlClient;
    using System.Text.RegularExpressions;
    using ZoomLa.BLL.Helper;

    public partial class SearchList : System.Web.UI.Page
    {
        private B_Node bnode = new B_Node();
        public int NodeID { get { return DataConvert.CLng(Request.QueryString["node"]); } }
        public int Order { get { return DataConvert.CLng(Request.QueryString["order"]); } }
        public string KeyWord { get { return HttpUtility.UrlDecode(Request.QueryString["KeyWord"] ?? ""); } }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind_DP();
                TxtKeyword.Text = KeyWord;
            }
        }
        protected void Bind_DP()
        {
            this.DDLNode.DataSource = this.bnode.GetNodeListContainXML(0);
            this.DDLNode.DataTextField = "NodeName";
            this.DDLNode.DataValueField = "NodeID";
            this.DDLNode.DataBind();
            ListItem item = new ListItem("所有栏目", "0");
            this.DDLNode.Items.Insert(0, item);
            this.DDLNode.SelectedValue = NodeID.ToString();
            DataTable dt1 = Sql.Sel("ZL_Node", "ParentID", 0);
            dt1.DefaultView.RowFilter = "NodeID in (1,2) or ParentID in (1,2)";
            dt1 = dt1.DefaultView.ToTable();
            this.nodeList.DataSource = dt1;
            this.nodeList.DataBind();
        }
        // 顶部的搜索功能
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (this.TxtKeyword.Text.Trim() != "" && this.TxtKeyword.Text.Trim() != "请输入关键字")
            {
                string searchurl = "SearchList.aspx";

                string nodeid = this.DDLNode.SelectedValue;
                string keyword = this.TxtKeyword.Text.Trim();

                searchurl = searchurl + "?node=" + nodeid + "&keyword=" + Server.UrlEncode(keyword);
                Response.Redirect(searchurl);
            }
            else
            {
                Response.Redirect("SearchList.aspx");
            }
        }
        // 头部的搜索功能
        protected void DDLNode_SelectedIndexChanged(object sender, EventArgs e)
        {
            string searchurl = "SearchList.aspx";
            string nodeid = this.DDLNode.SelectedValue;

            string keyword = this.TxtKeyword.Text.Trim();
            searchurl = searchurl + "?node=" + nodeid + "&keyword=" + Server.UrlEncode(keyword);
            Response.Write(" <script>window.parent.window.location.href = '" + searchurl + "' </script>");
        }
    }
}