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
    public partial class AddToFav : System.Web.UI.Page
    {
        protected M_UserInfo muser = new M_UserInfo();
        protected B_User buser = new B_User();
        protected M_Favorite mfave = new M_Favorite();
        protected B_Favorite bfave = new B_Favorite();
        protected DataTable dt = new DataTable();
        B_Content bll = new B_Content();
        B_Node nll = new B_Node();
        protected void Page_Load(object sender, EventArgs e)
        {
            buser.CheckIsLogin();
            if (!this.Page.IsPostBack)
            {
                if (!IsPostBack)
                {
                    M_CommonData CData = this.bll.GetCommonData(DataConverter.CLng(Request.QueryString["gid"]));
                    CData.Status = 13;
                    if (bll.UpdateByID(CData))
                        function.WriteSuccessMsg("操作成功！", Request.QueryString["url"]);
                    else
                        function.WriteErrMsg("操作失败！");
                }
            }
        }
    }
}