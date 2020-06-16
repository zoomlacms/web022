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
using ZoomLa.Web;
using ZoomLa.Model;
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.API;
using ZoomLa.Components;
using ZoomLa.DZNT;
using ucApi;
using System.Net.Mail;


namespace User
{
    public partial class AddUser : CustomerPageAction
    {
        B_UserBaseField ubfbll = new B_UserBaseField();
        B_Sensitivity sll = new B_Sensitivity();
        B_User buser = new B_User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                B_Admin badmin = new B_Admin();
                if (!B_ARoleAuth.Check(ZLEnum.Auth.user, "UserManage"))
                {
                    function.WriteErrMsg("没有权限进行此项操作");
                }
                int userNameLimit = 3;
                int userNameMax = 20;
                if (SiteConfig.UserConfig.UserNameLimit > 0)
                {
                    userNameLimit = SiteConfig.UserConfig.UserNameLimit;
                }
                if (SiteConfig.UserConfig.UserNameMax >= userNameLimit)
                {
                    userNameMax = SiteConfig.UserConfig.UserNameMax;
                }
                B_Group bgr = new B_Group();

                this.DDLGroup.DataSource = bgr.GetGroupList();
                this.DDLGroup.DataTextField = "GroupName";
                this.DDLGroup.DataValueField = "GroupID";
                this.DDLGroup.DataBind();
                lblHtml.Text = ubfbll.GetHtml();
            }
            Call.SetBreadCrumb(Master, "<li><a href='" + CustomerPageAction.customPath2 + "Main.aspx'>工作台</a></li><li><a href='AdminManage.aspx'>用户管理</a></li><li><a href='UserManage.aspx'>会员管理</a></li><li class='active'>添加会员</li>");
        }
        // 提交会员信息
        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Response.Write("<script>alert('btnSubmit')</script>");
            if (buser.IsExit(tbUserName.Text))
            {
                function.WriteErrMsg("用户名已存在,请重新写.");
                return;
            }
            string username = this.tbUserName.Text.Trim();
            if (StringHelper.FoundInArr(SiteConfig.UserConfig.UserNameRegDisabled, username, "|"))
            {
                function.WriteErrMsg("输入的用户名被禁止！", "../User/AddUser.aspx");
            }
            DataTable dt = ubfbll.Select_All();
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("FieldName", typeof(string)));
            table.Columns.Add(new DataColumn("FieldType", typeof(string)));
            table.Columns.Add(new DataColumn("FieldValue", typeof(string)));
            foreach (DataRow dr in dt.Rows)
            {
                if (DataConverter.CBool(dr["IsNotNull"].ToString()))
                {
                    if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + dr["FieldName"].ToString()]))
                    {
                        function.WriteErrMsg(dr["FieldAlias"].ToString() + "不能为空!");
                    }
                }
                if (dr["FieldType"].ToString() == "FileType")
                {
                    string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
                    bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
                    string sizefield = Sett[1].Split(new char[] { '=' })[1];
                    if (chksize && sizefield != "")
                    {
                        DataRow row2 = table.NewRow();
                        row2[0] = sizefield;
                        row2[1] = "FileSize";
                        row2[2] = this.Page.Request.Form["txt_" + sizefield];
                        table.Rows.Add(row2);
                    }
                }
                if (dr["FieldType"].ToString() == "MultiPicType")
                {
                    string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
                    bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
                    string sizefield = Sett[1].Split(new char[] { '=' })[1];
                    if (chksize && sizefield != "")
                    {
                        if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + sizefield]))
                        {
                            function.WriteErrMsg(dr["FieldAlias"].ToString() + "的缩略图不能为空!");
                        }
                        DataRow row1 = table.NewRow();
                        row1[0] = sizefield;
                        row1[1] = "ThumbField";
                        row1[2] = this.Page.Request.Form["txt_" + sizefield];   
                        table.Rows.Add(row1);
                    }
                }
                DataRow row = table.NewRow();
                row[0] = dr["FieldName"].ToString();
                string ftype = dr["FieldType"].ToString();
                row[1] = ftype;
                string fvalue = this.Page.Request.Form["txt_" + dr["FieldName"].ToString()];
              
                if (ftype == "TextType" || ftype == "MultipleTextType" || ftype == "MultipleHtmlType")
                {
                    fvalue = sll.ProcessSen(fvalue);
                }
               
                row[2] = fvalue;
                //row[2] = @"/jpg/2013/5/201305301815280955.jpg";
                table.Rows.Add(row);
            }
            M_UserInfo uinfo = new M_UserInfo();
            string checkNum = "";//验证码
            string pass = "";
            if (!string.IsNullOrEmpty(this.txtpassword.Text)) //生成密码
            {
                checkNum = DataSecurity.MakeRandomString("abcdefghijklmnopqrstuvwxyz0123456789_", 10);
                uinfo.CheckNum = checkNum;
                uinfo.Status = 0;
                pass = this.txtpassword.Text;
            }
            uinfo.UserName = username;
            uinfo.UserPwd = pass.Trim();
            uinfo.Question = this.tbQuestion.Text.Trim();
            uinfo.Answer = this.tbAnswer.Text.Trim();
            uinfo.Email = this.tbEmail.Text.Trim();
            uinfo.GroupID = DataConverter.CLng(this.DDLGroup.SelectedValue);
            uinfo.LastLoginIP = HttpContext.Current.Request.UserHostAddress;
            uinfo.LastLockTime = DateTime.Now;
            uinfo.LastLoginTimes = DateTime.Now;
            uinfo.LastPwdChangeTime = DateTime.Now;
            uinfo.LoginTimes = 0;
            uinfo.RegTime = DateTime.Now;
            if (!string.IsNullOrEmpty(WorkNum_T.Text))
            {
                if (buser.CheckWorkNumIsOnly(WorkNum_T.Text, 0))
                    uinfo.WorkNum = WorkNum_T.Text.Trim();
                else function.WriteErrMsg("工号重复");
            }
            uinfo.Purse = 0;
            uinfo.UserExp = 0;
            uinfo.ConsumeExp = 0;
            uinfo.IsConfirm = 0;
            uinfo.VIP = 0;
            uinfo.HoneyName = txtHoneyName.Text.Trim();
            uinfo.UserFace = this.tbUserFace.Text.Trim();
            M_Uinfo binfo = new M_Uinfo();
            binfo.Address = this.tbAddress.Text.Trim();
            binfo.BirthDay = this.tbBirthday.Text.Trim();
            binfo.FaceHeight = DataConverter.CLng(this.tbFaceHeight.Text.Trim());
            binfo.FaceWidth = DataConverter.CLng(this.tbFaceWidth.Text.Trim());
            binfo.UserFace = uinfo.UserFace;
            binfo.Fax = this.tbFax.Text.Trim();
            binfo.HomePage = this.tbHomepage.Text.Trim();
            binfo.ICQ = this.tbICQ.Text.Trim();
            binfo.HomePhone = this.tbHomePhone.Text.Trim();
            binfo.IDCard = this.tbIDCard.Text.Trim();
            binfo.Mobile = this.tbMobile.Text.Trim();
            binfo.MSN = this.tbMSN.Text.Trim();
            binfo.OfficePhone = this.tbOfficePhone.Text.Trim();
            binfo.Privating = this.tbPrivacy.SelectedIndex;
            binfo.PHS = this.tbPHS.Text.Trim();
            binfo.QQ = this.tbQQ.Text.Trim();
            binfo.Sign = this.tbSign.Text.Trim();
            uinfo.TrueName = this.tbTrueName.Text.Trim();
            binfo.UC = this.tbUC.Text.Trim();
            binfo.UserSex = DataConverter.CBool(this.tbUserSex.SelectedValue);
            binfo.Yahoo = this.tbYahoo.Text.Trim();
            binfo.ZipCode = this.tbZipCode.Text.Trim();
            binfo.VIPUser = this.VIPUser.Checked ? 1 : 0;
            uinfo.UserPwd = StringHelper.MD5(uinfo.UserPwd);
            int UserID = buser.AddModel(uinfo);
            binfo.UserId = UserID;
            buser.AddBase(binfo);//添加部分内容
            if (table != null)
            {
                // 对UserBase没有的内容进行添加
                if (table.Rows.Count > 0)
                {
                    if (buser.UpdateUserFile(binfo.UserId, table))
                        function.WriteSuccessMsg("操作成功", "UserManage.aspx");

                }
            }
            function.WriteSuccessMsg("操作成功", "UserManage.aspx");
        }
    }
    
}