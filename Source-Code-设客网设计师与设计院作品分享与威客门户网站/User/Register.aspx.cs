using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.Components;
using ZoomLa.Model;

using ZoomLa.SQLDAL;
using System.Text.RegularExpressions;
using ZoomLa.Model.Plat;
using ZoomLa.BLL.Plat;

namespace ZoomLa.WebSite.User
{
    public partial class User_Register : System.Web.UI.Page
    {
        protected string result;
        protected bool isok = false;
        protected B_User buser = new B_User();
        protected B_UserBaseField bmf = new B_UserBaseField();
        protected B_ModelField Fll = new B_ModelField();
        protected B_Model b_Model = new B_Model();
        protected B_Group bgroup = new B_Group();
        protected B_Sensitivity sll = new B_Sensitivity();
        protected B_InviteRecord binv = new B_InviteRecord();
        protected B_Redindulgence bred = new B_Redindulgence();
        protected B_User_Plat upBll = new B_User_Plat();
        protected B_Plat_Comp compBll = new B_Plat_Comp();
        protected B_User_Temp utBll = new B_User_Temp();

        protected override void OnPreInit(EventArgs e)
        {
            if (SiteConfig.UserConfig.Agreement.Equals("4")) Response.Redirect("/User/RegPlat.aspx");
            base.OnPreInit(e);
            if (IsPostBack)
            {
                ViewState["SendID"] = base.Request.QueryString["SendID"];
                string mbinv = Request.QueryString["inv"];
                if (!string.IsNullOrEmpty(mbinv))
                {
                    M_Redindulgence mredind = bred.SelectByUrl(mbinv);
                    if (mredind != null && mredind.id > 0 && mredind.isUse == 0)
                    {
                        ViewState["MbInv"] = mbinv;
                        ViewState["SendID"] = mredind.UserId;
                    }
                    else
                    {
                        Response.Write("<script>alert('此邀请函已失效,换一个试试?');location.href='Register.aspx'</script>");
                    }
                }
                string str = base.Request.Form["ControlTreeInfo"];
                if (!string.IsNullOrEmpty(str))
                {
                    string[] strArray = str.Split(new string[] { "$$$$$" }, StringSplitOptions.None);
                    if ((strArray[0] != SiteConfig.UserConfig.RegFieldsMustFill) || (strArray[1] != SiteConfig.UserConfig.RegFieldsSelectFill))
                    {
                        base.Response.Redirect(base.Request.RawUrl);
                    }
                }
            }
            //用户配置中心选择的必填项目
            string[] strArray2 = string.IsNullOrEmpty(SiteConfig.UserConfig.RegFieldsMustFill) ? new string[0] : SiteConfig.UserConfig.RegFieldsMustFill.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            //用户配置中心选择的选填项目
            string[] strArray3 = string.IsNullOrEmpty(SiteConfig.UserConfig.RegFieldsSelectFill) ? new string[0] : SiteConfig.UserConfig.RegFieldsSelectFill.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            //必填
            foreach (string str2 in strArray2)
            {
                HtmlTableRow row = this.FindControl("TR" + str2) as HtmlTableRow;
                if (row != null)
                {
                    row.Visible = true;
                    this.TableRegister.Rows.Remove(row);
                    Literal las = (Literal)this.FindControl("mustTR" + str2);
                    if (las != null)
                        las.Text = "<font color=red>*</font>";
                    this.TableRegisterMust.Rows.Add(row);
                    string dd = this.TableRegisterMust.ToString();// = this.TableRegisterMust.InnerHtml.Replace("{must/}", "<font color=red>*</font>");
                }
                else
                {
                    DataTable tbles = bmf.SelByFieldName(str2);
                    B_ModelField FLL = new B_ModelField();
                    if (tbles != null && tbles.Rows.Count > 0)
                    {
                        HtmlTableRow r1 = new HtmlTableRow();
                        HtmlTableCell c1 = new HtmlTableCell();
                        string htmls = Fll.GetShowStyleUser(tbles.Rows[0]["FieldID"].ToString(), tbles.Rows[0]["FieldAlias"].ToString(), tbles.Rows[0]["FieldName"].ToString(), DataConverter.CBool(tbles.Rows[0]["IsNotNull"].ToString()), tbles.Rows[0]["FieldType"].ToString(), tbles.Rows[0]["Content"].ToString(), tbles.Rows[0]["Description"].ToString(), 0, 0);
                        htmls = htmls.Replace(" class=\"tdbg\"", "");
                        htmls = htmls.Replace("align=\"right\" class=\"tdbgleft\"", " style=\"width: 15%\" class=\"tdbgleft\"");
                        htmls = htmls.Replace("class=\"tdbgleft\">" + tbles.Rows[0]["FieldAlias"].ToString(), "class=\"tdbgleft\">" + tbles.Rows[0]["FieldAlias"].ToString() + "：");
                        c1.InnerHtml = htmls;
                        r1.Controls.Add(c1);
                        this.TableRegisterMust.Rows.Add(r1);
                    }
                }
            }
            //选填
            foreach (string str3 in strArray3)
            {
                HtmlTableRow row2 = this.FindControl("TR" + str3) as HtmlTableRow;
                if (row2 != null)
                {
                    row2.Visible = true;
                    this.TableRegister.Rows.Remove(row2);
                    Literal las = (Literal)this.FindControl("mustTR" + str3);
                    if (las != null) las.Text = "";
                    this.TableRegisterSelect.Rows.Add(row2);
                    string dd = this.TableRegisterSelect.ToString();
                }
                else
                {
                    DataTable tbles = bmf.SelByFieldName(str3);
                    if (tbles != null && tbles.Rows.Count > 0)
                    {
                        HtmlTableRow r1 = new HtmlTableRow();
                        HtmlTableCell c1 = new HtmlTableCell();
                        string htmls = Fll.GetShowStyleUser(tbles.Rows[0]["FieldID"].ToString(), tbles.Rows[0]["FieldAlias"].ToString(), tbles.Rows[0]["FieldName"].ToString(), DataConverter.CBool(tbles.Rows[0]["IsNotNull"].ToString()), tbles.Rows[0]["FieldType"].ToString(), tbles.Rows[0]["Content"].ToString(), tbles.Rows[0]["Description"].ToString(), 0, 0);
                        htmls = htmls.Replace(" class=\"tdbg\"", "");
                        htmls = htmls.Replace("align=\"right\" class=\"tdbgleft\"", " style=\"width: 15%\" class=\"tdbgleft\"");
                        htmls = htmls.Replace("class=\"tdbgleft\">" + tbles.Rows[0]["FieldAlias"].ToString(), "class=\"tdbgleft\"><b>" + tbles.Rows[0]["FieldAlias"].ToString() + "</b>：");
                        //htmls = htmls.Replace("<a href=javascript:void(0) onclick=\"SelectValues(" + tbles.Rows[0]["ModelId"].ToString() + "," + tbles.Rows[0]["FieldID"].ToString() + ")\">管理选项</a>", "");
                        c1.InnerHtml = htmls;
                        r1.Controls.Add(c1);

                        this.TableRegisterSelect.Rows.Add(r1);
                    }
                }
            }
        }
        //用户组模型字段
        public string GetUserGorupModel(string value)
        {
            int gid = DataConverter.CLng(value);
            int UserModelID = DataConverter.CLng(bgroup.GetGroupModel(gid));
            ///UserModelID!=0说明绑定了户模型，用要从模型中读取字段，没有绑定就不需要读取字段
            if (UserModelID != 0)
            {
                return this.Fll.GetInputHtmlUser(UserModelID, 0, 1) + this.Fll.GetInputHtmlUser(UserModelID, 0, 0);
            }
            return "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (function.isAjax())
            {
                string action = Request.Form["action"];
                string value = Request.Form["value"];
                string result = "";
                switch (action)
                {
                    case "UserIsExist":
                        result = CheckUserData(value);
                        break;
                    case "ParentUser"://推荐人
                        result = CheckParentUser(value);
                        break;
                    case "ParentUserID":
                        result = buser.IsExit(DataConvert.CLng(value)) ? "1" : "0";
                        if (string.IsNullOrEmpty(value))
                            result ="-1";
                        break;
                    case "InvitCode":
                        result = CheckInvitCode(value);
                        break;
                    case "birthdate":
                        result = CheckBirthDay(value);
                        break;
                    case "GetModelFied":
                        result = GetUserGorupModel(value);
                        break;
                }
                Response.Write(result); Response.Flush(); Response.End();
            }
            if (!IsPostBack)
            {
                ViewState["ruid"] = Request.QueryString["ruid"];
                TxtPassword.Attributes.Add("value", TxtPassword.Text);
                TxtPwdConfirm.Attributes.Add("value", TxtPwdConfirm.Text);
                //------------传值处理区
                if (Request["SendID"] != null)
                {
                    Session["SendID"] = Request["SendID"];
                }
                if (DataConvert.CLng(Request.QueryString["ParentUserID"]) > 0)//推荐人
                {
                    int userID = DataConvert.CLng(Request.QueryString["ParentUserID"]);
                    TxtParentUserID.Text = buser.GetSelect(userID).UserName;
                }
                //------------
                if (SiteConfig.UserConfig.EnableCheckCodeOfReg)
                {
                    this.regVcodeRegister.Visible = true;
                }
                if (SiteConfig.UserConfig.EmailCheckReg)
                {
                    this.regEmail.Visible = true;
                }
                ViewState["Promotion"] = Request.Form["Promotion"];
                this.LitControlTreeInfo.Text = "<input name='ControlTreeInfo' type='hidden' value='" + SiteConfig.UserConfig.RegFieldsMustFill + "$$$$$" + SiteConfig.UserConfig.RegFieldsSelectFill + "'/>";

                if (!SiteConfig.UserConfig.EnableUserReg)
                {
                    this.PnlRegStep0.Visible = true;
                    this.PnlRegStep1.Visible = false;
                    this.PnlRegStep2.Visible = false;
                    this.PnlMRegStep1.Visible = false;
                    this.PnlStep3.Visible = false;
                }
                else
                {

                    this.PnlRegStep0.Visible = false;
                    this.PnlRegStep2.Visible = false;
                    this.PnlMRegStep1.Visible = false;
                    this.PnlStep3.Visible = false;
                    int userNameLimit = 2;
                    int userNameMax = 20;
                    if (SiteConfig.UserConfig.UserNameLimit > 0)
                    {
                        userNameLimit = SiteConfig.UserConfig.UserNameLimit;
                    }
                    if (SiteConfig.UserConfig.UserNameMax >= userNameLimit)
                    {
                        userNameMax = SiteConfig.UserConfig.UserNameMax;
                    }

                    Literal1.Text = userNameMax.ToString();
                    Literal2.Text = userNameLimit.ToString();
                    InitProtocol();
                    GropuRadListBind();
                    if (SiteConfig.UserConfig.MobileReg == true)
                    {
                        PnlMRegStep1.Visible = true;
                    }
                    else
                    {
                        PnlMRegStep1.Visible = false;
                        switch (SiteConfig.UserConfig.Agreement)
                        {
                            case "0":
                                BtnRegstep1();
                                this.CheckBox1.Visible = false;
                                this.PnlRegStep1.Visible = false;
                                this.PnlRegStep2.Visible = true;
                                break;
                            case "1":
                                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>endbtn();</script>");
                                this.PnlRegStep1.Visible = true;
                                BtnRegStep1.Text = "同 意";
                                BtnRegStep1NotApprove.Text = "不同意";
                                break;
                            case "2"://Checkbox,能力中心
                            case "4":
                                BtnRegstep1();
                                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>dispbtn();</script>");
                                this.CheckBox1.Visible = true;
                                this.PnlRegStep1.Visible = false;
                                this.PnlRegStep2.Visible = true;
                                BtnRegStep1.Text = "注册";
                                BtnRegStep1NotApprove.Text = "返 回";
                                break;
                            case "3":
                                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>regload();</script>");
                                this.CheckBox1.Visible = false;
                                this.PnlRegStep1.Visible = true;
                                BtnRegStep1.Text = "同意";
                                BtnRegStep1NotApprove.Text = "不同意";
                                break;
                        }
                    }
                }
            }
        }
        //用户协议,同意按钮
        protected void BtnRegStep1_Click(object sender, EventArgs e)
        {
            BtnRegstep1();
        }
        //用于组绑定
        public void GropuRadListBind()
        {
            DataTable ss = bgroup.GetSelGroup();
            this.UserGroup.DataSource = ss;
            this.UserGroup.DataValueField = "GroupID";
            this.UserGroup.DataTextField = "GroupName";
            this.UserGroup.DataBind();
            if (ss != null&&ss.Rows.Count>0)
            {
                if (ss.Rows.Count <= 1)
                    this.usergroupss.Visible = false;
                this.UserGroup.Items[0].Attributes.Add("onclick", "hidenbtn();");
                if (!string.IsNullOrWhiteSpace(Request["Gid"]))
                    UserGroup.SelectedValue = Request["Gid"];
                else UserGroup.SelectedIndex = 0;
            }
        }
        public void BtnRegstep1()
        {
            GropuRadListBind();
            this.ReqTxtAddress.Enabled = this.GetEnableValid("Address");
            this.ReqTxtBirthday.Enabled = this.GetEnableValid("Birthday");
            this.ReqTxtFaceHeight.Enabled = this.GetEnableValid("FaceHeight");
            this.ReqTxtFaceWidth.Enabled = this.GetEnableValid("FaceWidth");
            this.ReqTxtFax.Enabled = this.GetEnableValid("Fax");
            this.ReqTxtHomepage.Enabled = this.GetEnableValid("Homepage");
            this.ReqTxtIDCard.Enabled = this.GetEnableValid("IDCard");
            this.ReqTxtHomePhone.Enabled = this.GetEnableValid("HomePhone");
            this.ReqTxtICQ.Enabled = this.GetEnableValid("ICQ");
            this.ReqTxtMobile.Enabled = this.GetEnableValid("Mobile");
            this.ReqTxtMSN.Enabled = this.GetEnableValid("MSN");
            this.ReqTxtQQ.Enabled = this.GetEnableValid("QQ");
            this.ReqTxtSign.Enabled = this.GetEnableValid("Sign");
            this.ReqTxtTrueName.Enabled = this.GetEnableValid("TrueName");
            this.ReqTxtUC.Enabled = this.GetEnableValid("UC");
            this.ReqTxtUserFace.Enabled = this.GetEnableValid("UserFace");
            this.ReqTxtYahoo.Enabled = this.GetEnableValid("Yahoo");
            this.ReqTxtZipCode.Enabled = this.GetEnableValid("ZipCode");
            this.ReqTxtOfficePhone.Enabled = this.GetEnableValid("OfficePhone");
            this.ReqTxtPHS.Enabled = this.GetEnableValid("PHS");
            this.ReqTxtParentUserID.Enabled = this.GetEnableValid("ParentUserID");
            this.ReqTxtParentUser.Enabled = this.GetEnableValid("ParentUser");
            this.PnlRegStep1.Visible = false;
            this.PnlRegStep2.Visible = true;
            this.PnlStep3.Visible = false;
            this.PnlMRegStep1.Visible = false;
            this.CheckBox1.Visible = false;
            //ShowModelfield();
        }
        // 不同意按钮
        protected void BtnRegStep1NotApprove_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/default.aspx");
        }
        //提交注册
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            int pageid = DataConverter.CLng(Request.QueryString["pid"]);
            string siteurls = SiteConfig.SiteInfo.SiteUrl.TrimEnd('/');
            if (!SiteConfig.UserConfig.EnableUserReg)
            {
                return;
            }
            if (SiteConfig.UserConfig.UserNameLimit > TxtUserName.Text.Length || TxtUserName.Text.Length > SiteConfig.UserConfig.UserNameMax)
            {
                function.WriteErrMsg("用户名的长度必须小于" + SiteConfig.UserConfig.UserNameMax + "，并大于" + SiteConfig.UserConfig.UserNameLimit + "!");
            }
            if (ZoomlaSecurityCenter.CheckData(TxtUserName.Text))
            {
                function.WriteErrMsg("用户名不能包含特殊字段!");
            }
            else
            {
                if (!SafeSC.CheckUName(TxtUserName.Text))
                    function.WriteErrMsg("用户名不能包含特殊字符!");
            }
            if (CheckBirthDay(TxtBirthday.Text).Equals("false"))
            {
                function.WriteErrMsg("您的年龄超过了150岁！！");
            }
            #region  注册IP限制
            M_UserRegisterIP UserRegisterIP = B_UserRegisterIP.GetRegisterIPAll();
            if (UserRegisterIP.IsLimit == 0)
            {
                string RegIP = HttpContext.Current.Request.UserHostAddress;
                DateTime EndTime = DateTime.Now;
                double dhours = UserRegisterIP.LimitTime;
                DateTime BeginTime = DateTime.Now.AddHours(-dhours);
                if (UserRegisterIP.IsIPpart != 0 && UserRegisterIP.BeginIP != null && UserRegisterIP.EndIP != null)
                {
                    string beginIP = UserRegisterIP.BeginIP;
                    string endIP = UserRegisterIP.EndIP;
                    long LbeginIP = IpToInt(beginIP);
                    long LendIP = IpToInt(endIP);
                    long LRegIP = IpToInt(RegIP);
                    if (LRegIP > LbeginIP && LRegIP < LendIP)
                    {
                        if (!buser.GetRegisterIP(RegIP, BeginTime, EndTime))
                        {
                            function.WriteErrMsg("同一IP不能重复注册");
                            return;
                        }
                    }
                }
                else
                {
                    if (!buser.GetRegisterIP(RegIP, BeginTime, EndTime))
                    {
                        function.WriteErrMsg("同一IP不能重复注册");
                        return;
                    }
                }
            }
            #endregion
            this.CheckUserName();
            this.CheckEmail();
            this.CheckCode();
            this.Checkyes();
            this.CheckPUserName();
            if (string.IsNullOrEmpty(TxtAnswer.Text))
            {
                function.WriteErrMsg("问题答案不能为空！");
            }
            M_UserInfo info = new M_UserInfo();
            info.UserBase = new M_Uinfo();
            info.UserName = this.TxtUserName.Text;
            info.UserPwd = this.TxtPassword.Text;
            info.Question = this.DropDownList1.SelectedValue;
            info.Answer = this.TxtAnswer.Text.Trim();
            info.Email = this.TxtEmail.Text.Trim();
            info.CheckNum = function.GetRandomString(10);
            info.GroupID = DataConverter.CLng(UserGroup.SelectedValue);
            info.LastLoginIP = EnviorHelper.GetUserIP();
            info.LoginTimes = 0;
            info.Purse = SiteConfig.UserConfig.PresentMoney;//注册赠送的余额,积分等
            info.UserPoint = SiteConfig.UserConfig.PresentPoint;
            info.UserExp = DataConverter.CLng(SiteConfig.UserConfig.PresentExp);
            info.ConsumeExp = 0;
            info.IsConfirm = 0;
            info.VIP = 0;
            info.RegisterIP = EnviorHelper.GetUserIP();
            if (!string.IsNullOrEmpty(TxtParentUserID.Text) && CheckParentUser(TxtParentUserID.Text).Equals("1"))
            {
                info.ParentUserID = buser.GetUserIDByUserName(TxtParentUserID.Text.Trim()).UserID.ToString();
            }
            if (!string.IsNullOrEmpty(TxtParentUser.Text)&&string.IsNullOrEmpty(TxtParentUserID.Text))
            {
                if (!buser.IsExit(DataConvert.CLng(TxtParentUser.Text)))
                { function.WriteErrMsg("推荐人id不存在!"); }
                info.ParentUserID = TxtParentUser.Text;
            }
            //邀请码
            if (!string.IsNullOrEmpty(TxtInvitCode.Text))
            {
                M_User_Temp utMod = new M_User_Temp();
                utMod = utBll.Code_SelModel(TxtInvitCode.Text);
                if (utMod != null) { info.ParentUserID = utMod.UserID.ToString(); utBll.Code_Used(utMod.ID); }
            }
            if (SiteConfig.UserConfig.EmailCheckReg) //邮件认证
                info.Status = 4;
            else if (SiteConfig.UserConfig.AdminCheckReg) //管理员认证
                info.Status = 2;
            else if (SiteConfig.UserConfig.EmailCheckReg && SiteConfig.UserConfig.AdminCheckReg) //邮件认证及管理员认证
                info.Status = 3;
            else if (!SiteConfig.UserConfig.UserValidateType)
                info.Status = 5;
            else
                info.Status = 0;
            //会员基本信息
            info.UserBase.Address = this.TxtAddress.Text.Trim();
            info.UserBase.BirthDay = this.TxtBirthday.Text.Trim();
            info.UserBase.FaceHeight = DataConverter.CLng(this.TxtFaceHeight.Text.Trim());
            info.UserBase.FaceWidth = DataConverter.CLng(this.TxtFaceWidth.Text.Trim());
            info.UserFace = this.TxtUserFace.Text.Trim();;
            info.UserBase.Fax = this.TxtFax.Text.Trim();
            info.UserBase.HomePage = this.TxtHomepage.Text.Trim();
            info.UserBase.ICQ = this.TxtICQ.Text.Trim();
            info.UserBase.HomePhone = this.TxtHomePhone.Text.Trim();
            info.UserBase.IDCard = this.TxtIDCard.Text.Trim();
            info.UserBase.Mobile = this.TxtMobile.Text.Trim();
            info.UserBase.MSN = this.TxtMSN.Text.Trim();
            info.UserBase.OfficePhone = this.TxtOfficePhone.Text.Trim();
            info.UserBase.Privating = this.DropPrivacy.SelectedIndex;
            info.UserBase.PHS = this.TxtPHS.Text.Trim();
            info.UserBase.QQ = this.TxtQQ.Text.Trim();
            info.UserBase.Sign = this.TxtSign.Text.Trim();
            info.TrueName = this.TxtTrueName.Text.Trim();
            info.UserBase.UC = this.TxtUC.Text.Trim();
            info.UserBase.UserSex = DataConverter.CBool(this.DropSex.SelectedValue);
            info.UserBase.Yahoo = this.TxtYahoo.Text.Trim();
            info.UserBase.ZipCode = this.TxtZipCode.Text.Trim();
            info.UserBase.HoneyName = "";
            info.UserBase.CardType = "";
            info.UserBase.Province = Request["selprovince"];
            info.UserBase.City = Request["selcity"];
            info.UserBase.County = Request["selcoutry"];
            string RegMessage = "";
            //自定义字段信息
            DataTable table = new Call().GetDTFromPage(bmf.Select_All(), this.Page, ViewState);
            string[] strArray2 = string.IsNullOrEmpty(SiteConfig.UserConfig.RegFieldsMustFill) ? new string[0] : SiteConfig.UserConfig.RegFieldsMustFill.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            foreach (string str2 in strArray2)
            {
                if (Request.Form["txt_" + str2] == null || Request.Form["txt_" + str2] == "")
                {
                    DataTable tbles = bmf.SelByFieldName(str2);
                }
            }
            info.Answer = info.UserPwd;//用于二元
            info.UserPwd = StringHelper.MD5(info.UserPwd);
            info.UserID = buser.AddModel(info);
            buser.SetLoginState(info, "Day");
            if (info.UserID > 0)
            {
                info.UserBase.UserId = info.UserID;
                buser.AddBase(info.UserBase);
                if (table != null && table.Rows.Count > 0)
                {
                    buser.UpdateUserFile(info.UserID, table);
                }
                #region 自定义模型
                int groupid = DataConverter.CLng(this.UserGroup.SelectedValue);
                int ModelID = DataConverter.CLng(bgroup.GetGroupModel(groupid));
                string usertablename = b_Model.GetModelById(ModelID).TableName;


                if (ModelID > 0 && usertablename != "" && usertablename != null)
                {
                    DataTable groupset = Fll.GetModelFieldListall(ModelID).Tables[0];
                    DataTable tablereg = new DataTable();
                    tablereg.Columns.Add(new DataColumn("FieldName", typeof(string)));
                    tablereg.Columns.Add(new DataColumn("FieldType", typeof(string)));
                    tablereg.Columns.Add(new DataColumn("FieldValue", typeof(string)));
                    if (groupset != null && groupset.Rows.Count > 0)
                    {
                        foreach (DataRow dr in groupset.Rows)
                        {
                            if (dr["FieldType"].ToString() == "FileType")
                            {
                                string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
                                bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
                                string sizefield = Sett[1].Split(new char[] { '=' })[1];
                                if (chksize && sizefield != "")
                                {
                                    DataRow row2 = tablereg.NewRow();
                                    row2[0] = sizefield;
                                    row2[1] = "FileSize";
                                    row2[2] = this.Page.Request.Form["txt_" + sizefield];
                                    tablereg.Rows.Add(row2);
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
                                    DataRow row1 = tablereg.NewRow();
                                    row1[0] = sizefield;
                                    row1[1] = "ThumbField";
                                    row1[2] = this.Page.Request.Form["txt_" + sizefield];
                                    tablereg.Rows.Add(row1);
                                }
                            }

                            DataRow row = tablereg.NewRow();
                            row[0] = dr["FieldName"].ToString();
                            string ftype = dr["FieldType"].ToString();
                            row[1] = ftype;
                            string fvalue = this.Page.Request.Form["txt_" + dr["FieldName"].ToString()];
                            if (ftype == "TextType" || ftype == "MultipleTextType" || ftype == "MultipleHtmlType")
                            {
                                fvalue = sll.ProcessSen(fvalue);
                                if (dr["IsNotNull"].Equals("True") && string.IsNullOrEmpty(fvalue))
                                    function.WriteErrMsg(dr["FieldAlias"] + ":不能为空!");
                            }
                            row[2] = fvalue;
                            tablereg.Rows.Add(row);
                        }
                        try
                        {
                            if (tablereg.Select("FieldName='UserID'").Length == 0)
                            {
                                DataRow rowsd1 = tablereg.NewRow();
                                rowsd1[0] = "UserID";
                                rowsd1[1] = "int";
                                rowsd1[2] = info.UserID;
                                tablereg.Rows.Add(rowsd1);
                            }
                            else
                            {
                                tablereg.Rows[0]["UserID"] = info.UserID;
                            }
                        }
                        catch (Exception)
                        {

                        }

                        try
                        {
                            if (tablereg.Select("FieldName='UserName'").Length == 0)
                            {
                                DataRow rowsd2 = tablereg.NewRow();
                                rowsd2[0] = "UserName";
                                rowsd2[1] = "TextType";
                                rowsd2[2] = info.UserName;
                                tablereg.Rows.Add(rowsd2);
                            }
                            else
                            {
                                tablereg.Rows[0]["UserName"] = info.UserName;
                            }
                        }
                        catch (Exception) { }
                        try
                        {
                            if (tablereg.Select("FieldName='Styleid'").Length == 0)
                            {
                                DataRow rowsd3 = tablereg.NewRow();
                                rowsd3[0] = "Styleid";
                                rowsd3[1] = "int";
                                rowsd3[2] = 0;
                                tablereg.Rows.Add(rowsd3);
                            }
                            else
                            {
                                tablereg.Rows[0]["UserName"] = 0;
                            }
                        }
                        catch (Exception) { }
                        try
                        {
                            if (tablereg.Select("FieldName='Recycler'").Length == 0)
                            {
                                DataRow rowsd4 = tablereg.NewRow();
                                rowsd4[0] = "Recycler";
                                rowsd4[1] = "int";
                                rowsd4[2] = 0;
                                tablereg.Rows.Add(rowsd4);
                            }
                            else
                            {
                                tablereg.Rows[0]["Recycler"] = 0;
                            }
                        }
                        catch (Exception) { }
                        try
                        {
                            if (tablereg.Select("FieldName='IsCreate'").Length == 0)
                            {
                                DataRow rowsd5 = tablereg.NewRow();
                                rowsd5[0] = "IsCreate";
                                rowsd5[1] = "int";
                                rowsd5[2] = 0;
                                tablereg.Rows.Add(rowsd5);
                            }
                            else
                            {
                                tablereg.Rows[0]["IsCreate"] = 0;
                            }
                        }
                        catch (Exception) { }
                        try
                        {
                            if (tablereg.Select("FieldName='NewTime'").Length == 0)
                            {
                                DataRow rs6 = tablereg.NewRow();
                                rs6[0] = "NewTime";
                                rs6[1] = "DateType";
                                rs6[2] = DateTime.Now;
                                tablereg.Rows.Add(rs6);
                            }
                            else
                            {
                                tablereg.Rows[0]["NewTime"] = DateTime.Now;
                            }
                        }
                        catch (Exception) { }
                    }

                    if (tablereg != null && tablereg.Rows.Count > 0)
                    {
                        buser.InsertModel(tablereg, usertablename);
                    }
                }
                #endregion
                #region 好友分组
                B_UserFriend ufbll = new B_UserFriend();
                M_UserFriendTable uf = new M_UserFriendTable();
                M_UserFriendGroup ufg = new M_UserFriendGroup();
                ufg.userID = info.UserID;
                ufg.groupName = "黑名单";
                ufg.blackGroup = 1;
                ufg.orderID = 99;
                ufbll.InsertUserFriendGroup(ufg);
                ufg.userID = info.UserID;
                ufg.groupName = "默认分组";
                ufg.blackGroup = 2;
                ufg.orderID = 1;
                ufbll.InsertUserFriendGroup(ufg);
                if (ViewState["SendID"] != null) //站外邀请好友处理
                {
                    int FID = int.Parse(ViewState["SendID"].ToString());
                    int UGID = ufbll.GetFriendGroupMoByUserID(info.UserID).iD;
                    int FGID = ufbll.GetFriendGroupMoByUserID(FID).iD;
                    uf.UserID = info.UserID;
                    uf.FriendID = FID;
                    uf.GroupID = UGID;
                    ufbll.InsertUserFriend(uf);
                    uf.FriendID = info.UserID;
                    uf.UserID = FID;
                    uf.GroupID = FGID;
                    ufbll.InsertUserFriend(uf);
                }
                #endregion
                if (SiteConfig.UserConfig.EmailCheckReg&&!string.IsNullOrEmpty(info.Email))//发送认证邮件，当需要邮件认证时
                {
                    MailInfo mailInfo = new MailInfo();
                    mailInfo.IsBodyHtml = true;
                    mailInfo.FromName = SiteConfig.SiteInfo.SiteName;
                    MailAddress address = new MailAddress(info.Email);
                    mailInfo.ToAddress = address;
                    mailInfo.MailBody = SiteConfig.UserConfig.EmailOfRegCheck.Replace("{$CheckNum}", info.CheckNum).Replace("{$CheckUrl}", siteurls + "/User/RegisterCheck.aspx?UserName=" + HttpUtility.UrlEncode(info.UserName) + "&CheckNum=" + info.CheckNum);
                    mailInfo.MailBody = mailInfo.MailBody.Replace("{$UserName}", info.UserName).Replace("{$UserPwd}", this.TxtPassword.Text);
                    mailInfo.Subject = SiteConfig.SiteInfo.SiteName + "网站会员注册验证码";
                    if (SendMail.Send(mailInfo) == SendMail.MailState.Ok)
                    {
                        RegMessage = "注册验证码已成功发送到你的注册邮箱，请到邮箱查收并验证！";
                        RegMessage = RegMessage + "<a href=\"/\">返回首页</a>";
                    }
                    else
                    {
                        RegMessage = "注册成功，但发送验证邮件失败，请检查邮件地址是否正确，或与网站管理员联系！";
                        RegMessage = RegMessage + "<a href=\"/\">返回首页</a>";
                    }
                }
                if (info.Status == 0) //直接注册成功时
                {
                    if (!string.IsNullOrEmpty(info.Email) && SiteConfig.UserConfig.EmailTell)
                    {
                        MailInfo mailInfo = new MailInfo();
                        mailInfo.IsBodyHtml = true;
                        mailInfo.FromName = SiteConfig.SiteInfo.SiteName;
                        MailAddress address = new MailAddress(info.Email);
                        mailInfo.ToAddress = address;
                        mailInfo.MailBody = SiteConfig.UserConfig.EmailOfRegCheck.Replace("{$CheckNum}", info.CheckNum).Replace("{$CheckUrl}", siteurls + "/User/RegisterCheck.aspx?UserName=" + HttpUtility.UrlEncode(info.UserName) + "&CheckNum=" + info.CheckNum);
                        mailInfo.MailBody = mailInfo.MailBody.Replace("{$UserName}", info.UserName).Replace("{$UserPwd}", this.TxtPassword.Text);
                        mailInfo.Subject = SiteConfig.SiteInfo.SiteName + "_注册成功提醒";
                        if (SendMail.Send(mailInfo) == SendMail.MailState.Ok)
                        {
                            RegMessage = "注册基本信息已成功发送到你的注册邮箱，请到邮箱查收并验证！";
                            RegMessage = RegMessage + "<a href=\"/\">返回首页</a>";
                        }
                        else
                        {
                            RegMessage = "注册成功，但发送注册基本信息邮件失败，请检查邮件地址是否正确，或与网站管理员联系！";
                            RegMessage = RegMessage + "<a href=\"/\">返回首页</a>";
                        }
                    }
                    else
                    {
                        RegMessage = "注册成功！";
                        string returnurl = Request["ReturnUrl"];
                        if (string.IsNullOrEmpty(returnurl))
                        {
                            RegMessage = RegMessage + "<a href=\"/\">返回首页</a>&nbsp;&nbsp;<a href=\"default.aspx\">进入会员中心</a>,5秒后系统自动跳转到会员中心!";
                            hfReturnUrl.Value = "default.aspx";
                        }
                        else
                        {
                            RegMessage = RegMessage + "<a href=\"/\">返回首页</a>&nbsp;&nbsp;<a href=\"" + returnurl + "\">进入默认页面</a>,5秒后系统自动跳转到默认页面!";
                            hfReturnUrl.Value = returnurl;
                        }
                        isok = true;
                    }
                }
                if (info.Status == 2) //等待管理员认证
                {
                    RegMessage = "注册成功！新注册会员需管理员认证才能有效，请耐心等待！";
                    RegMessage = RegMessage + "若长期没有通过管理员认证,请及时和管理员联系！";
                    RegMessage = RegMessage + "<a href=\"/\">返回首页</a>";
                }
                else
                {
                    {
                        if (!SiteConfig.UserConfig.EmailCheckReg)//未开启邮箱验证，则可以登录
                        RegMessage = "注册成功！";
                        string returnurl = Request["ReturnUrl"];
                        if (string.IsNullOrEmpty(returnurl))
                        {
                            RegMessage = RegMessage + "<a href=\"/\">返回首页</a>&nbsp;&nbsp;<a href=\"default.aspx\">进入会员中心</a>,5秒后系统自动跳转到会员中心!";
                            hfReturnUrl.Value = "default.aspx";
                        }
                        else
                        {
                            RegMessage = RegMessage + "<a href=\"/\">返回首页</a>&nbsp;&nbsp;<a href=\"" + returnurl + "\">进入默认页面</a>,5秒后系统自动跳转到默认页面!";
                            hfReturnUrl.Value = returnurl;
                        }
                        isok = true;
                    }
                }
            }
            else
            {
                RegMessage = "注册失败！";
                RegMessage = RegMessage + "<a href=\"/\">返回首页</a>&nbsp;&nbsp;<a href=\"Register.aspx\">重新注册</a>";
            }
            #region 推广
            if (ViewState["Promotion"] != null || ViewState["SendID"] != null)
            {
                string UserPromotion = "";
                if (ViewState["Promotion"] != null)
                {
                    UserPromotion = ViewState["Promotion"].ToString();
                }
                if (ViewState["SendID"] != null)
                {
                    UserPromotion = ViewState["SendID"].ToString();
                }
                if (SiteConfig.UserConfig.PromotionType != 0 && !string.IsNullOrEmpty(UserPromotion))
                {
                    M_UserInfo muinfo = buser.GetUserByUserID(DataConverter.CLng(UserPromotion));

                    if (muinfo.UserID > 0)
                    {
                        switch (SiteConfig.UserConfig.PromotionType)
                        {
                            case 1://现金
                                muinfo.Purse = muinfo.Purse + SiteConfig.UserConfig.Promotion;
                                break;
                            case 2://点卷
                                muinfo.UserPoint = muinfo.UserPoint + SiteConfig.UserConfig.Promotion;
                                break;
                            case 3://积分
                                muinfo.UserExp = muinfo.UserExp + SiteConfig.UserConfig.Promotion;
                                break;
                            case 4://虚拟币
                                muinfo.DummyPurse = muinfo.DummyPurse + SiteConfig.UserConfig.Promotion;
                                break;
                        }
                        buser.UpDateUser(muinfo);
                    }
                }
            }
            #endregion
            if (SiteConfig.UserConfig.EmailCheckReg)
            {
                this.PnlRegStep2.Visible = false;
                this.LitRegResult.Text = "<div class='emptyDiv'><br/>注册成功! &nbsp;&nbsp;<a href='http://mail." + TxtEmail.Text.Substring(TxtEmail.Text.LastIndexOf('@') + 1) + "' target='_blank'>立即登录邮箱进行验证>></a><br/></div>";
                this.PnlMRegStep1.Visible = false;
                this.PnlStep3.Visible = true;
            }
            else
            {
                this.PnlRegStep2.Visible = false;
                this.PnlMRegStep1.Visible = false;
                this.LitRegResult.Text = RegMessage;
                this.PnlStep3.Visible = true;
                if (isok)
                {
                    function.Script(this, "window.onload=function(){gotouser();}");
                }
            }
        }
        private string GetPath()
        {
            string strPath = "http://" + Request.ServerVariables["HTTP_HOST"] + Request.ServerVariables["PATH_INFO"] + "?" + Request.ServerVariables["QUERY_STRING"];
            if (strPath.EndsWith("?"))
            {
                strPath = strPath.Substring(0, strPath.Length - 1);
            }
            return strPath;
        }
        // 推广注册添加信息
        private void Redindul(int userid)
        {
            if (Session["SendID"] != null)  //红包推广
            {
                B_Redindulgence bred = new B_Redindulgence();
                M_Redindulgence mre = bred.SelectByUrl(GetPath());
                //if (mre != null && mre.id > 0)
                {
                    int id = DataConverter.CLng(Session["SendID"]);
                    if (id > 0)
                    {
                        M_InviteRecord minv = binv.GetSelByRuid(userid);
                        if (minv != null && minv.id > 0)
                        {
                            return;
                        }
                        if (minv == null)
                        {
                            minv = new M_InviteRecord();
                        }
                        minv.userid = id;  //推荐用户
                        minv.RecommUserId = userid; //推荐注册用户
                        minv.RegData = DateTime.Now;
                        minv.isReset = 0;
                        minv.isValid = 1;
                        int mid = binv.GetInsert(minv);
                        if (mid > 0)
                        {
                            bred.DeleteByGroupID(mre.id);
                        }
                    }
                }
            }
            if (ViewState["SendID"] != null)
            {
                int id = DataConverter.CLng(ViewState["SendID"]);
                M_InviteRecord minv = binv.GetSelByRuid(userid);
                if (minv != null && minv.id > 0)
                {
                    return;
                }
                if (minv == null)
                {
                    minv = new M_InviteRecord();
                }
                minv.userid = id;  //推荐用户,发推广信息的用户
                minv.RecommUserId = userid; //推荐注册的用户
                minv.RegData = DateTime.Now;
                minv.isReset = 0;
                minv.isValid = 0;
                int bid = binv.GetInsert(minv);
            }
            if (HttpContext.Current.Request.Cookies["users"] != null && HttpContext.Current.Request.Cookies["users"]["u"] != null && !string.IsNullOrEmpty(HttpContext.Current.Request.Cookies["users"]["u"].ToString()))  //链接推广
            {
                M_InviteRecord minv = binv.GetSelByRuid(userid);
                if (minv != null && minv.id > 0)
                {
                    return;
                }
                if (minv == null)
                {
                    minv = new M_InviteRecord();
                }
                minv.userid = DataConverter.CLng(HttpContext.Current.Request.Cookies["users"]["u"]);  //推荐用户.发推广信息的用户
                minv.RecommUserId = userid; //推荐注册用户
                minv.RegData = DateTime.Now;
                minv.isReset = 0;
                minv.isValid = 0;
                int bid = binv.GetInsert(minv);
                if (bid > 0)
                {
                    HttpContext.Current.Response.Cookies["users"]["u"] = "";
                }
            }

            if (HttpContext.Current.Response.Cookies["users"] != null && HttpContext.Current.Response.Cookies["users"]["pageid"] != null && !string.IsNullOrEmpty(HttpContext.Current.Response.Cookies["users"]["pageid"]))
            {
                function.Script(this,"e_get();");
            }
        }
        // 读取用户协议
        private void InitProtocol()
        {
            try
            {
                this.LitProtocol.Text = FileSystemObject.ReadFile(base.Request.MapPath("~/User/Protocol.txt"));
            }
            catch (FileNotFoundException)
            {
                function.WriteErrMsg("Protocol.txt文件不存在", "../Index.aspx");
            }
            catch (UnauthorizedAccessException)
            {
                function.WriteErrMsg("没有权限读取Protocol.txt文件", "../Index.aspx");
            }
        }
        // 检验验证码
        private void CheckCode()
        {
            if (SiteConfig.UserConfig.EnableCheckCodeOfReg)
            {
                if (!ZoomlaSecurityCenter.VCodeCheck(Request.Form["VCode_hid"], VCode.Text.Trim()))
                {
                    function.WriteErrMsg("您输入的验证码和系统产生的不一致，请重新输入", "javascript:history.go(-1);");
                }
            }
        }
        // 检验邮件Email是否重复
        private void CheckEmail()
        {
            this.TxtEmail.Text = TxtEmail.Text.Trim();
            if (string.IsNullOrEmpty(TxtEmail.Text) || buser.IsExistMail(this.TxtEmail.Text))
            {
                function.WriteErrMsg("Email为空或已被他人注册，请输入不同的Email!");
            }
        }
        //检测会员名是否有效
        private void CheckUserName()
        {
            this.TxtUserName.Text = this.TxtUserName.Text.Replace(" ", "");
            if (StringHelper.FoundInArr(SiteConfig.UserConfig.UserNameRegDisabled, this.TxtUserName.Text, "|"))
            {
                function.WriteErrMsg("该用户名禁止注册，请输入不同的用户名!");
            }
            if (buser.IsExit(this.TxtUserName.Text))
            {
                function.WriteErrMsg("该用户名已被他人占用，请输入不同的用户名");
            }
            string userregrule = SiteConfig.UserConfig.RegRule;
            if (userregrule != null && userregrule != "")
            {
                if (userregrule.IndexOf(',') > -1)
                {
                    string[] rulearr = userregrule.Split(',');
                    for (int ii = 0; ii < rulearr.Length; ii++)
                    {
                        if (rulearr[ii].ToString() == "1")
                        {
                            string resultString = null;
                            try
                            {
                                resultString = Regex.Match(this.TxtUserName.Text, @"[0-9]*").Value;
                            }
                            catch (ArgumentException)
                            {
                            }
                            if (this.TxtUserName.Text.Trim() == resultString.Trim())
                            {
                                function.WriteErrMsg("用户名不允许纯数字");
                            }
                        }

                        if (rulearr[ii].ToString() == "2")
                        {
                            string resultString = null;
                            try
                            {
                                resultString = Regex.Match(this.TxtUserName.Text, @"[a-zA-Z]*").Value;
                            }
                            catch (ArgumentException)
                            {
                            }

                            if (this.TxtUserName.Text == resultString)
                            {
                                function.WriteErrMsg("用户名不允许纯英文");
                            }

                        }

                        if (rulearr[ii].ToString() == "3")
                        {
                            bool foundMatch = false;
                            try
                            {
                                foundMatch = Regex.IsMatch(this.TxtUserName.Text, @"[\u0391-\uFFE5]$");
                            }
                            catch (ArgumentException)
                            {
                            }

                            if (foundMatch)
                            {
                                function.WriteErrMsg("用户名不允许带有中文");
                            }
                        }
                    }
                }
                else
                {
                    if (userregrule.ToString() == "1")
                    {
                        string resultString = null;
                        try
                        {
                            resultString = Regex.Match(this.TxtUserName.Text, @"[0-9]*").Value;
                        }
                        catch (ArgumentException)
                        {
                        }


                        if (this.TxtUserName.Text.Trim() == resultString.Trim())
                        {
                            function.WriteErrMsg("用户名不允许纯数字");
                        }
                    }

                    if (userregrule.ToString() == "2")
                    {
                        string resultString = null;
                        try
                        {
                            resultString = Regex.Match(this.TxtUserName.Text, @"[a-zA-Z]*").Value;
                        }
                        catch (ArgumentException)
                        {
                        }

                        if (this.TxtUserName.Text == resultString)
                        {
                            function.WriteErrMsg("用户名不允许纯英文");
                        }

                    }

                    if (userregrule.ToString() == "3")
                    {
                        bool foundMatch = false;
                        try
                        {
                            foundMatch = Regex.IsMatch(this.TxtUserName.Text, @"[\u0391-\uFFE5]$");
                        }
                        catch (ArgumentException)
                        {
                        }

                        if (foundMatch)
                        {
                            function.WriteErrMsg("用户名不允许带有中文");
                        }
                    }
                }
            }
        }
        protected bool GetEnableValid(string field)
        {
            return StringHelper.FoundCharInArr(SiteConfig.UserConfig.RegFieldsMustFill, field, ",");
        }
        public string CheckUserData(string eventArgument)
        {
            eventArgument = eventArgument.Trim();
            if (string.IsNullOrEmpty(eventArgument))
            {
                this.result = "empty";
            }
            else
            {
                if (SiteConfig.SiteOption.ServerType == "Server")
                {

                    if (StringHelper.FoundInArr(SiteConfig.UserConfig.UserNameRegDisabled, eventArgument, "|"))
                    {
                        this.result = "disabled";
                    }
                    else if (buser.IsExit(eventArgument))
                    {
                        this.result = "true";
                    }
                    else
                    {
                        if (SiteConfig.UserConfig.UserNameLimit > eventArgument.Length || eventArgument.Length > SiteConfig.UserConfig.UserNameMax)
                        {
                            this.result = "error";
                        }
                        else
                        {
                            if (buser.IsExitcard(eventArgument))
                            {
                                this.result = "Fidtrue";//身份证存在
                            }
                            else
                            {
                                bool foundMatch = false;
                                try
                                {
                                    foundMatch = Regex.IsMatch(eventArgument, @"^\d{17}([0-9]|X)$");
                                    if (foundMatch)
                                    {
                                        string birth = eventArgument.Substring(6, 8).Insert(6, "-").Insert(4, "-");
                                        DateTime time = new DateTime();
                                        DateTime newDate = DateTime.Now.AddYears(-200);
                                        DateTime now = DateTime.Now;

                                        if (DateTime.TryParse(birth, out time) == false)
                                        {
                                            this.result = "Fyidtrue"; //false 生日验证
                                        }
                                        else
                                        {
                                            DateTime data1 = Convert.ToDateTime(birth);
                                            TimeSpan ts = newDate - data1;
                                            TimeSpan ts2 = data1 - now;
                                            if (ts.Days > 0)
                                                this.result = "Fcidtrue";//小于当前200年后
                                            else if (ts2.Days > 0)
                                                this.result = "Fxidtrue";//大于当前时间
                                            else
                                                this.result = "Fno";//身份证18位且不存在
                                        }
                                    }
                                    else
                                    {
                                        this.result = "Fidtrue2";//身份证格式不正确
                                    }
                                }
                                catch (ArgumentException)
                                {
                                    this.result = "false";
                                    // Syntax error in the regular expression
                                }
                            }
                        }
                        string chestring = null;
                        try
                        {
                            chestring = Regex.Match(eventArgument, @"[a-zA-Z0-9\u4e00-\u9fa5\@\.]*").Value;
                        }
                        catch (ArgumentException)
                        {
                            // Syntax error in the regular expression
                        }

                        if (chestring != eventArgument)
                        {
                            string[] chr = eventArgument.Split(new char[] { '|' });

                            try
                            {

                                if (chr.Length > 1)
                                {
                                    if (buser.IsExit(chr[1]))
                                    {
                                        this.result = "Ptrue";//用户存在
                                    }
                                    else
                                    {
                                        this.result = "Pno";
                                    }
                                }
                            }
                            catch
                            {
                                this.result = "error04";//用户名不允许纯数字
                            }
                        }


                        string userregrule = SiteConfig.UserConfig.RegRule;
                        if (userregrule != null && userregrule != "")
                        {

                            if (userregrule.IndexOf(',') > -1)
                            {

                                string[] rulearr = userregrule.Split(',');
                                for (int ii = 0; ii < rulearr.Length; ii++)
                                {
                                    if (rulearr[ii].ToString() == "1")
                                    {
                                        string resultString = null;
                                        try
                                        {
                                            resultString = Regex.Match(eventArgument, @"[0-9]*").Value;
                                        }
                                        catch (ArgumentException)
                                        {
                                            // Syntax error in the regular expression
                                        }


                                        if (resultString == eventArgument)
                                        {
                                            if (buser.IsExitcard(eventArgument))
                                            {
                                                this.result = "Nidtrue";//身份证存在
                                            }
                                            else
                                            {
                                                bool foundMatch = false;
                                                try
                                                {
                                                    foundMatch = Regex.IsMatch(eventArgument, @"^\d{18}$");
                                                    if (foundMatch)
                                                    {
                                                        string birth = eventArgument.Substring(6, 8).Insert(6, "-").Insert(4, "-");
                                                        DateTime time = new DateTime();
                                                        DateTime newDate = DateTime.Now.AddYears(-200);
                                                        DateTime now = DateTime.Now;

                                                        if (DateTime.TryParse(birth, out time) == false)
                                                        {
                                                            this.result = "Nyidtrue"; //false 生日验证
                                                        }
                                                        else
                                                        {
                                                            DateTime data1 = Convert.ToDateTime(birth);
                                                            TimeSpan ts = newDate - data1;
                                                            TimeSpan ts2 = data1 - now;
                                                            if (ts.Days > 0)
                                                                this.result = "Ncidtrue";
                                                            else if (ts2.Days > 0)
                                                                this.result = "Nxidtrue";
                                                            else
                                                                this.result = "Nno";//身份证18位且不存在
                                                        }
                                                    }
                                                    else
                                                    {
                                                        this.result = "Nidtrue2";//身份证格式不正确
                                                    }
                                                }
                                                catch (ArgumentException)
                                                {
                                                    this.result = "error01";  // Syntax error in the regular expression
                                                }
                                            }
                                        }
                                    }

                                    if (rulearr[ii].ToString() == "2")
                                    {
                                        string resultString = null;
                                        try
                                        {
                                            resultString = Regex.Match(eventArgument, @"[a-zA-Z]*").Value;
                                        }
                                        catch (ArgumentException)
                                        {
                                            // Syntax error in the regular expression
                                        }


                                        if (eventArgument == resultString)
                                        {
                                            this.result = "error02";//用户名不允许纯英文
                                        }

                                    }

                                    if (rulearr[ii].ToString() == "3")
                                    {
                                        bool foundMatch = false;
                                        try
                                        {
                                            foundMatch = Regex.IsMatch(eventArgument, @"[\u0391-\uFFE5]$");
                                        }
                                        catch (ArgumentException)
                                        {
                                            // Syntax error in the regular expression
                                        }
                                        if (foundMatch)
                                        {
                                            this.result = "error03";//用户名不允许带有中文
                                        }
                                    }
                                }
                            }
                            else
                            {
                                if (userregrule.ToString() == "1")
                                {
                                    string resultString = null;
                                    try
                                    {
                                        resultString = Regex.Match(eventArgument, @"[0-9]*").Value;
                                    }
                                    catch (ArgumentException)
                                    {
                                        // Syntax error in the regular expression
                                    }


                                    if (resultString == eventArgument)
                                    {
                                        this.result = "error01";//用户名不允许纯数字
                                        //this.result = resultString;
                                    }
                                }

                                if (userregrule.ToString() == "2")
                                {
                                    string resultString = null;
                                    try
                                    {
                                        resultString = Regex.Match(eventArgument, @"[a-zA-Z]*").Value;
                                    }
                                    catch (ArgumentException)
                                    {
                                        // Syntax error in the regular expression
                                    }


                                    if (eventArgument == resultString)
                                    {
                                        this.result = "error02";//用户名不允许纯英文
                                        //this.result = resultString;
                                    }

                                }

                                if (userregrule.ToString() == "3")
                                {
                                    bool foundMatch = false;
                                    try
                                    {
                                        foundMatch = Regex.IsMatch(eventArgument, @"[\u0391-\uFFE5]$");
                                    }
                                    catch (ArgumentException)
                                    {
                                        // Syntax error in the regular expression
                                    }
                                    if (foundMatch)
                                    {
                                        this.result = "error03";//用户名不允许带有中文
                                    }
                                }
                            }
                        }
                    }
                }
                else
                {
                    string userregrule = SiteConfig.UserConfig.RegRule;
                    if (userregrule != null && userregrule != "")
                    {
                        if (userregrule.IndexOf(',') > -1)
                        {
                            string[] rulearr = userregrule.Split(',');
                            for (int ii = 0; ii < rulearr.Length; ii++)
                            {
                                if (rulearr[ii].ToString() == "1")
                                {
                                    string resultString = null;
                                    try
                                    {
                                        resultString = Regex.Match(eventArgument, @"[0-9]*").Value;
                                    }
                                    catch (ArgumentException)
                                    {
                                        // Syntax error in the regular expression
                                    }

                                    if (this.TxtUserName.Text.Trim() == resultString.Trim())
                                    {
                                        this.result = "error01";//用户名不允许纯数字
                                        //this.result = resultString;
                                    }
                                }

                                if (rulearr[ii].ToString() == "2")
                                {
                                    string resultString = null;
                                    try
                                    {
                                        resultString = Regex.Match(eventArgument, @"[a-zA-Z]*").Value;
                                    }
                                    catch (ArgumentException)
                                    {
                                        // Syntax error in the regular expression
                                    }


                                    if (eventArgument == resultString)
                                    {
                                        this.result = "error02";//用户名不允许纯英文
                                    }

                                }
                                if (rulearr[ii].ToString() == "3")
                                {
                                    bool foundMatch = false;
                                    try
                                    {
                                        foundMatch = Regex.IsMatch(eventArgument, @"[\u0391-\uFFE5]$");
                                    }
                                    catch (ArgumentException)
                                    {
                                        // Syntax error in the regular expression
                                    }
                                    if (foundMatch)
                                    {
                                        this.result = "error03";//用户名不允许带有中文
                                    }
                                }
                            }
                        }
                        else
                        {
                            if (userregrule.ToString() == "1")
                            {
                                string resultString = null;
                                try
                                {
                                    resultString = Regex.Match(eventArgument, @"[0-9]*").Value;
                                }
                                catch (ArgumentException)
                                {
                                    // Syntax error in the regular expression
                                }

                                if (this.TxtUserName.Text.Trim() == resultString.Trim())
                                {
                                    this.result = "error01";//用户名不允许纯数字
                                    //this.result = resultString;
                                }
                            }

                            if (userregrule.ToString() == "2")
                            {
                                string resultString = null;
                                try
                                {
                                    resultString = Regex.Match(eventArgument, @"[a-zA-Z]*").Value;
                                }
                                catch (ArgumentException)
                                {
                                    // Syntax error in the regular expression
                                }

                                if (eventArgument == resultString)
                                {
                                    this.result = "error02";//用户名不允许纯英文
                                }
                            }

                            if (userregrule.ToString() == "3")
                            {
                                bool foundMatch = false;
                                try
                                {
                                    foundMatch = Regex.IsMatch(eventArgument, @"[\u0391-\uFFE5]$");
                                }
                                catch (ArgumentException)
                                {
                                    // Syntax error in the regular expression
                                }
                                if (foundMatch)
                                {
                                    this.result = "error03";//用户名不允许带有中文
                                }
                            }
                        }
                    }

                    if (buser.IsExitcard(eventArgument))
                    {
                        this.result = "idtrue";//身份证存在
                    }
                    else
                    {
                        bool foundMatch = false;
                        try
                        {
                            foundMatch = Regex.IsMatch(eventArgument, @"^\d{17}([0-9]|X)$");
                            if (foundMatch)
                            {
                                string birth = eventArgument.Substring(6, 8).Insert(6, "-").Insert(4, "-");
                                DateTime time = new DateTime();
                                DateTime newDate = DateTime.Now.AddYears(-200);
                                DateTime now = DateTime.Now;

                                if (DateTime.TryParse(birth, out time) == false)
                                {
                                    this.result = "yidtrue"; //false 生日验证
                                }
                                else
                                {
                                    DateTime data1 = Convert.ToDateTime(birth);
                                    TimeSpan ts = newDate - data1;
                                    TimeSpan ts2 = data1 - now;
                                    if (ts.Days > 0)
                                        this.result = "cidtrue";
                                    else if (ts2.Days > 0)
                                    {
                                        this.result = "xidtrue";
                                    }
                                    else
                                    {
                                        this.result = "no";//身份证18位且不存在
                                    }
                                }
                            }
                            else
                            {
                                this.result = "idtrue2";//身份证格式不正确
                            }
                        }
                        catch (ArgumentException)
                        {
                            // Syntax error in the regular expression
                        }

                    }

                }
            }
            return result;
        }
        //检测出生日期是否合逻辑
        string CheckBirthDay(string value)
        {
            if (string.IsNullOrEmpty(value))
                return "2";
            if (DateTime.Parse(value) < DateTime.Now.AddYears(-150))
            {
                return "1";
            }
            return "0";
        }
        //推荐人校验
        public string CheckParentUser(string uname)
        {
            string result = "0";//用户不存在
            if (string.IsNullOrEmpty(uname))
                result = "-1";
            else if (buser.IsExistUName(uname.Trim()))
                result = "1";
            return result;
        }
        //邀请码校验
        public string CheckInvitCode(string code)
        {
            string result = "";
            if (string.IsNullOrEmpty(code))
            {
                result = "-1";
            }
            else if (utBll.Code_IsExist(code))
            {
                result = "1";
            }
            else { result = "0"; }
            return result;
        }
        // 用户组选择事件
        protected void UserGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            B_Model sm = new B_Model();
            //  1-企业用户组    0-个人用户
            ShowModelfield();
            //ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "script", "hidenbtn();", true);
        }
        //用户模型字段
        private void ShowModelfield()
        {
            int gid = DataConverter.CLng(UserGroup.SelectedValue);

            int UserModelID = DataConverter.CLng(bgroup.GetGroupModel(gid));
            ///UserModelID!=0说明绑定了户模型，用要从模型中读取字段，没有绑定就不需要读取字段
            if (UserModelID != 0)
            {
                string reghtmltxt = this.Fll.GetInputHtmlUser(UserModelID, 0, 0);
                reghtmltxt = reghtmltxt.Replace("align=\"right\" class=\"tdbgleft\"", "align=\"left\" class=\"tdbgleft\" style=\"width: 15%;font-weight: bold;\"");
                modelhtml.Text = reghtmltxt;
                reghtmltxt = this.Fll.GetInputHtmlUser(UserModelID, 0, 0);
                reghtmltxt = reghtmltxt.Replace("align=\"right\" class=\"tdbgleft\"", "align=\"left\" class=\"tdbgleft\" style=\"width: 15%;font-weight: bold;\"");
                this.reghtml.Text = reghtmltxt;
                //ScriptManager.RegisterStartupScript(UpdatePanel3, UpdatePanel3.GetType(), "", "document.getElementById('checkSelectFill').checked=false;document.getElementById('" + TableRegisterSelect.ClientID + "').style.display='none';", true);
            }
        }
        // IP地址转换成Int数据
        private long IpToInt(string ip)
        {
            char[] dot = new char[] { '.' };
            string[] ipArr = ip.Split(dot);
            if (ipArr.Length == 3)
                ip = ip + ".0";
            ipArr = ip.Split(dot);

            long ip_Int = 0;
            if (ipArr.Length > 3)
            {
                long p1 = long.Parse(ipArr[0]) * 256 * 256 * 256;
                long p2 = long.Parse(ipArr[1]) * 256 * 256;
                long p3 = long.Parse(ipArr[2]) * 256;
                long p4 = long.Parse(ipArr[3]);
                ip_Int = p1 + p2 + p3 + p4;
            }
            return ip_Int;
        }
        //用户信息验证,身份证号,生日等
        public void Checkyes()
        {
            if (this.TxtIDCard.Text.Length != 0)
            {
                string eventArgument = this.TxtIDCard.Text;
                if (buser.IsExitcard(eventArgument))
                {
                    function.WriteErrMsg("该身份证号已被注册，请输入不同的身份证号！");//身份证存在
                }
                else
                {
                    bool foundMatch = false;
                    try
                    {
                        foundMatch = Regex.IsMatch(eventArgument, @"^\d{17}([0-9]|X)$");
                        if (foundMatch)
                        {
                            string birth = eventArgument.Substring(6, 8).Insert(6, "-").Insert(4, "-");
                            DateTime time = new DateTime();
                            DateTime newDate = DateTime.Now.AddYears(-120);
                            DateTime now = DateTime.Now;

                            if (DateTime.TryParse(birth, out time) == false)
                            {
                                function.WriteErrMsg("该身份证生日不正确！");
                                //this.result = "yidtrue"; //false 生日验证
                            }
                            else
                            {
                                DateTime data1 = Convert.ToDateTime(birth);
                                TimeSpan ts = newDate - data1;
                                TimeSpan ts2 = data1 - now;
                                if (ts.Days > 0)
                                    function.WriteErrMsg("您超过了120岁？请核对身份证号。");
                                else if (ts2.Days > 0)
                                {
                                    function.WriteErrMsg("您还没出生吧？请核对身份证号。");
                                }
                                else
                                {
                                    // this.result = "no";//身份证18位且不存在
                                }
                            }
                        }
                        else
                        {
                            function.WriteErrMsg("该身份证格式不正确！");//身份证格式不正确
                        }
                    }
                    catch (ArgumentException)
                    {
                        // Syntax error in the regular expression
                    }

                }
            }
        }
        //推荐人是否存在
        protected void CheckPUserName()
        {
            if (this.TxtParentUserID.Text.Length != 0)
            {
                if ((buser.IsExit(DataConvert.CLng(this.TxtParentUserID.Text))) || buser.IsExit(this.TxtParentUserID.Text))
                {
                }
                else
                {
                    function.WriteErrMsg("该推荐人不存在！");
                }

            }

        }
        // 发送短信调用接口
        private string SendMsg(string uid, string pwd, string mob, string msg)
        {
            //return "000";
            string Send_URL = "http://service.winic.org/sys_port/gateway/?id=" + uid + "&pwd=" + pwd + "&to=" + mob + "&content=" + msg + "&time=";
            MSXML2.XMLHTTP xmlhttp = new MSXML2.XMLHTTP();
            xmlhttp.open("GET", Send_URL, false, null, null);
            xmlhttp.send("");
            Byte[] b = (Byte[])xmlhttp.responseBody;
            string andy = System.Text.Encoding.GetEncoding("GB2312").GetString(b).Trim();
            return andy;
        }
        protected string Islimited()
        {
            string str = "";
            if (HttpContext.Current.Request.Cookies["postTime"] == null)
            {
                HttpContext.Current.Response.Cookies["postTime"].Expires = DateTime.Now.AddMinutes(1);
            }
            else
            {
                str = "一分钟内只能发送一条信息，请稍后！";
            }
            return str;
        }
        //发送短信
        protected void SendMob_Click(object sender, EventArgs e)
        {
            ViewState["mcode"] = function.GetRandomString(6);
            if (Page.IsValid)
            {
                string str = Islimited();
                if (str == "")
                {
                    string mob = this.TxtMobile1.Text.Trim();
                    if (string.IsNullOrEmpty(mob))
                    {
                        function.WriteErrMsg("请输入手机号码");
                    }
                    string msg = SiteConfig.UserConfig.MobileRegInfo.Replace("{$CheckNum}", ViewState["mcode"].ToString()).Replace("{$SiteName}", SiteConfig.SiteInfo.SiteName).Replace("{$SiteUrl}", SiteConfig.SiteInfo.SiteUrl);
                    if (string.IsNullOrEmpty(msg))
                    {
                        function.WriteErrMsg("短信内容不能为空");
                    }
                    if (DataSecurity.Len(msg) > 70)
                    {
                        function.WriteErrMsg("短信内容不能超过70个字");
                    }
                    string[] mobarr = mob.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    if (mobarr.Length == 0)
                    {
                        function.WriteErrMsg("请输入手机号码");
                    }
                    else
                    {
                        //if (mobarr.Length > 100)
                        //{
                        //    function.WriteErrMsg("每次只能发送100条短信");
                        //}
                        if (mobarr.Length > 1)
                        {
                            function.WriteErrMsg("每次只能发送一条短信");
                        }
                        else
                        {
                            string req = this.SendMsg(SiteConfig.SiteOption.MssUser, SiteConfig.SiteOption.MssPsw, mob, msg);
                            string[] reqs = req.Split(new char[] { '/' });
                            string res = "";
                            switch (reqs[0])
                            {
                                case "000":
                                    res = "发送成功！";
                                    addMessage();
                                    //res += "发送条数:" + reqs[1].Split(new char[] { ':' })[1] + "<br/>";
                                    //res += "当次消费金额" + reqs[2].Split(new char[] { ':' })[1] + "<br/>";
                                    //res += "总体余额:" + reqs[3].Split(new char[] { ':' })[1] + "<br/>";
                                    //res += "短信编号:" + reqs[4];
                                    break;
                                case "-01":
                                    res = "当前短信接口账号余额不足！";
                                    break;
                                case "-02":
                                    res = "当前短信接口用户ID错误！";
                                    break;
                                case "-03":
                                    res = "当前短信接口密码错误！";
                                    break;
                                case "-04":
                                    res = "参数不够或参数内容的类型错误！";
                                    break;
                                case "-05":
                                    res = "手机号码格式不对！";
                                    break;
                                case "-06":
                                    res = "短信内容编码不对！";
                                    break;
                                case "-07":
                                    res = "短信内容含有敏感字符！";
                                    break;
                                case "-8":
                                    res = "无接收数据";
                                    break;
                                case "-09":
                                    res = "系统维护中..";
                                    break;
                                case "-10":
                                    res = "手机号码数量超长！（100个/次 超100个请自行做循环）";
                                    break;
                                case "-11":
                                    res = "短信内容超长！（70个字符）";
                                    break;
                                case "-12":
                                    res = "其它错误！";
                                    break;
                            }
                            ClientScript.RegisterStartupScript(typeof(string), "script", "<script>alert('" + res + "');window.onload = TimeClose;</script>");
                        }
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(typeof(string), "script", "<script>alert('" + str + "');</script>");
                }
            }
        }
        //添加一条信息
        protected void addMessage()
        {
            M_Message messInfo = new M_Message();
            messInfo.Sender = SiteConfig.SiteInfo.SiteName;
            messInfo.Title = "注册验证手机短信";
            messInfo.PostDate = DataConverter.CDate(DateTime.Now.ToShortDateString());
            messInfo.Content = SiteConfig.UserConfig.MobileRegInfo.Replace("{$CheckNum}", ViewState["mcode"].ToString()).Replace("{$SiteName}", SiteConfig.SiteInfo.SiteName).Replace("{$SiteUrl}", SiteConfig.SiteInfo.SiteUrl);
            messInfo.Receipt = "";
            messInfo.MsgType = 2;
            messInfo.Incept = this.TxtMobile1.Text.Trim();
            B_Message.Add(messInfo);
        }
        protected void BtnMRegStep1_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox1.Text == ViewState["mcode"].ToString())
                {
                    TxtMobile.Text = TxtMobile1.Text;
                    TxtUserName.Text = TxtMobile1.Text;
                    BtnRegStep1.Visible = false;
                    BtnRegStep1.Visible = false;
                    PnlMRegStep1.Visible = false;
                    BtnRegstep1();
                }
                else
                {
                    function.Script(this, "alert('短信验证码错误!');");
                }
            }
            catch
            {
                function.Script(this, "alert('请重新发送短信验证码!');");
            }
        }
        //返回用户名,Email,或密码
        public string Get(int a)
        {
            switch (a)
            {
                case 0:
                    return this.TxtUserName.Text;
                case 1:
                    return this.TxtEmail.Text;
                case 2:
                    {
                        string password = this.TxtPassword.Text.Substring(0, 3);
                        for (int i = 0; i < this.TxtPassword.Text.Length - 3; i++)
                        {
                            password += "*";
                        }
                        return password;
                    }
                default:
                    return null;
            }
        }
    }
}