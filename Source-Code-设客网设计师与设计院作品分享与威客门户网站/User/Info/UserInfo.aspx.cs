using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
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
namespace ZoomLa.WebSite.User
{
    public partial class UserInfo : BasePage
    {
        private B_User buser = new B_User();
        private B_Group bgp = new B_Group();
        B_Model bmodel = new B_Model();
        protected B_ModelField Fll = new B_ModelField();
        private B_PointGrounp pointBll=new B_PointGrounp();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                M_UserInfo uinfo = buser.GetLogin(false);
                this.LblUser.Text = uinfo.UserName;
                this.LblEmail.Text = uinfo.Email;
                this.LblGroup.Text = bgp.GetByID(uinfo.GroupID).GroupName;
                this.LblJoinTime.Text = uinfo.JoinTime.ToString();
                this.LblRegTime.Text = uinfo.RegTime.ToString();
                this.LblLoginTimes.Text = uinfo.LoginTimes.ToString();
                this.LblLastLogin.Text = uinfo.LastLoginTimes.ToString();
                this.LblLastIP.Text = uinfo.LastLoginIP;
                this.LblLastModify.Text = (uinfo.LastPwdChangeTime == uinfo.RegTime) ? "" : uinfo.LastPwdChangeTime.ToString();
                this.LblLastLock.Text = (uinfo.LastLockTime == uinfo.RegTime) ? "" : uinfo.LastLockTime.ToString();
                this.Purse_L.Text = uinfo.Purse.ToString();
                this.Point_L.Text = uinfo.UserExp.ToString();
                Sicon_L.Text = uinfo.SilverCoin.ToString();
                UserPoint_L.Text = uinfo.UserPoint.ToString();
                this.LblboffExp.Text = uinfo.boffExp.ToString();
                this.LblConsumeExp.Text = uinfo.ConsumeExp.ToString();
                this.DummyPurse_L.Text = uinfo.DummyPurse.ToString();
                M_PointGrounp pointmod = pointBll.SelectPintGroup(uinfo.UserExp);
                gradeTxt.Text = "";
                if (pointmod != null)
                {
                    gradeTxt.Text = pointmod.GroupName;
                    LvIcon_Span.Attributes["class"] = pointmod.ImgUrl;
                }
                if (DataConvert.CLng(uinfo.ParentUserID) > 0)
                {
                    M_UserInfo usinfo = buser.GetSelect(Convert.ToInt32(uinfo.ParentUserID));
                    LblParentUserID.Text = string.IsNullOrEmpty(uinfo.UserName) ? "" : uinfo.UserName;
                }
                int UserModelID = DataConverter.CLng(bgp.GetGroupModel(uinfo.GroupID));
                if(UserModelID>0)
                    GroupModelField_Li.Text = Fll.GetUpdateHtmlUser(UserModelID, 0, bmodel.SelUserModelField(UserModelID, uinfo.UserID));
                
                 
            }
        }

        protected void sure_Click(object sender, EventArgs e)
        {
            M_UserInfo info = buser.GetLogin();
            string PWD = Second.Text;

            if (StringHelper.MD5(PWD) == info.PayPassWord)
            {
                DV_show.Visible = true;
                Login.Visible = false;
            }
            else
            {
                Response.Write("<script>alert('密码错误,请重新输入！');</script>");
                DV_show.Visible = false;
                Login.Visible = true; 
            }
        }
    }
}