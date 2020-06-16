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
using ZoomLa.Model;
using ZoomLa.Components;
using ZoomLa.Common;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using ZoomLa.API;
using ZoomLa.SQLDAL;
using System.IO;
using ZoomLa.BLL.Plat;
using ZoomLa.Model.Plat;

public partial class manage_User_Userinfo : CustomerPageAction
{
    private B_ClientRequire bll = new B_ClientRequire();
    private B_Client_Basic bcb = new B_Client_Basic();
    private B_Client_Enterprise bce = new B_Client_Enterprise();
    private B_Client_Penson bcp = new B_Client_Penson();
    private B_User ull = new B_User();
    protected ApiAction api = new ApiAction();
    private B_Model bm = new B_Model();
    private B_ModelField bmf = new B_ModelField();
    public string tabTitles = "";
    public string tabs = "";

    protected B_User Uinfo = new B_User();
    protected B_UserBaseField bubbll = new B_UserBaseField();
    protected M_UserInfo userinfo = new M_UserInfo();
    protected M_Uinfo users = new M_Uinfo();
    B_Permission perBll = new B_Permission();

    //----------
    protected B_User bll2 = new B_User();
    protected B_UserBaseField bub = new B_UserBaseField();

    private B_User_Plat PlatBll = new B_User_Plat();
    protected void Page_Load(object sender, EventArgs e)
    {
        B_Admin.CheckIsLogged();
        ViewState["PageUrl"] = "UserManage.aspx";
        if (!IsPostBack)
        {
            int id = DataConverter.CLng(Request.QueryString["id"]);
            if (!string.IsNullOrEmpty(Request.QueryString["action"]) && !string.IsNullOrEmpty(Request.QueryString["ID"]))//升级为作者
            {
                UpdateToAuthor(id);
                Response.Redirect("UserInfo.aspx?ID=" + id);
                Response.End();
            }
            if (Request.QueryString["type"] != null)
            {
                ViewState["PageUrl"] = System.Web.HttpContext.Current.Request.UrlReferrer.ToString();
                Button2.Visible = false;
            }
            List<M_UserInfo> Dinfo = new List<M_UserInfo>();
            List<M_Uinfo> Iinfo = new List<M_Uinfo>();
            ShowPlatInfo(id);
            userinfo = Uinfo.GetUserByUserID(id);
            users = Uinfo.GetUserBaseByuserid(id);
            UserName_L.Text = userinfo.UserName;
            Dinfo.Add(userinfo);
            Iinfo.Add(users);
            Repeater1.DataSource = Dinfo;
            Repeater1.DataBind();
            if (userinfo.PayPassWord == "")
            {
                HtmlContainerControl spReset = (HtmlContainerControl)Repeater1.Items[0].FindControl("spReset");
                spReset.InnerHtml = "<font color='red'>无二级密码</font>";
            }
            Repeater2.DataSource = Iinfo;
            Repeater2.DataBind();

            //增加模型选项卡
            DataTable dtModelUser = bm.GetListUser();
            string labstr = "";
            int tabnum = 3;
            for (int i = 0; i < dtModelUser.Rows.Count; i++)
            {

                string tablename = dtModelUser.Rows[i]["TableName"].ToString();
                DataTable info = bmf.SelectTableName(tablename, "userid=" + id);
                if (info != null && info.Rows.Count > 0)
                {
                    int modelid = Convert.ToInt32(dtModelUser.Rows[i]["ModelId"].ToString());
                    DataTable modelfiled = bmf.GetModelFieldAllList(modelid).Tables[0];
                    labstr += "<td id=\"TabTitle" + (tabnum) + ("\" class=\"tabtitle\" onclick=\"ShowTabss(" + (tabnum)) + ")\">\r";
                    labstr += dtModelUser.Rows[i]["ModelName"].ToString() + "\r";
                    labstr += ("</td>\r");
                    tabTitles += ", \"TabTitle" + (tabnum) + "\"";
                    tabs += ", \"Tabs" + (tabnum) + "\"";
                    ltlTab.Text += "<tbody id=\"Tabs" + (tabnum) + "\" style=\"display: none\">";
                    ltlTab.Text += "<tr>";
                    ltlTab.Text += "<td colspan=\"4\">";
                    ltlTab.Text += " <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\">";

                    //Response.Write(info.Rows[j]);

                    for (int k = 0; k < modelfiled.Rows.Count; k++)
                    {
                        if (k % 2 == 0)
                        {
                            ltlTab.Text += "<tr class=\"tdbg\">\r";
                        }
                        ltlTab.Text += "<td class=\"tdbgleft\" style=\"width: 15%; height: 22px\" align=\"right\">\r";
                        ltlTab.Text += modelfiled.Rows[k]["FieldAlias"].ToString() + "\r";
                        ltlTab.Text += "</td>\r";
                        ltlTab.Text += "<td style=\"width: 35%; height: 22px\" align=\"left\">\r";
                        ltlTab.Text += info.Rows[0][modelfiled.Rows[k]["FieldName"].ToString()].ToString() + "\r";
                        ltlTab.Text += "</td>\r";

                        if (k % 2 != 0)
                        {
                            ltlTab.Text += "</tr>\r";
                        }
                    }

                    ltlTab.Text += " </table>";
                    ltlTab.Text += " </td>";
                    ltlTab.Text += " </tr>";
                    ltlTab.Text += "</tbody>";

                    tabnum++;
                }
            }
            models.Text = labstr.ToString();
            M_Uinfo binfo = bll2.GetUserBaseByuserid(DataConverter.CLng(id.ToString()));
            M_UserInfo uinfo = bll2.SeachByID(DataConverter.CLng(id.ToString()));
            this.tbSign.Text = binfo.Sign;
            //this.tbPrivacy.SelectedValue = binfo.Privating.ToString();
            //txtUserCrite.Text = uinfo.UserCreit.ToString();
            //this.txtMoney.Text = uinfo.Purse.ToString();
            //this.txtPoint.Text = uinfo.UserExp.ToString();
            //this.txtSilverCoin.Text = uinfo.SilverCoin.ToString();
            //this.txtUserPoint.Text = uinfo.UserPoint.ToString();//点券
            //this.txtboffExp.Text = uinfo.boffExp.ToString();//卖家积分
            //this.txtConsumeExp.Text = uinfo.ConsumeExp.ToString();//消费积分
            this.txtDeadLine.Text = uinfo.DeadLine.ToString();//有效期截止时间
            this.txtCerificateDeadLine.Text = uinfo.CerificateDeadLine.ToString();
            this.Privancy.Text = tbPrivacy.SelectedValue.ToString();
            Privancy.Text = tbPrivacy.Items[binfo.Privating].Text;
            DataTable dtuser2 = bll2.GetUserBaseByuserid(id.ToString());
            B_ShowField.banEdit = 1;
            lblHtml.Text = bub.GetUpdateHtml(dtuser2);
            B_ShowField.banEdit = 0;
            BindUserRole(uinfo);
            AuthorDT = null;
        }
        Call.SetBreadCrumb(Master, "<li><a href='" + CustomerPageAction.customPath2 + "Main.aspx'>工作台</a></li><li><a href='AdminManage.aspx'>用户管理</a></li><li><a href='UserManage.aspx'>会员管理</a></li><li class='active'>会员信息</li>");
    }
    //绑定用户角色
    void BindUserRole(M_UserInfo mu)
    {
        DataTable dt = perBll.Sel();
        foreach (DataRow item in dt.Rows)
        {
            ListItem li = new ListItem(item["RoleName"].ToString(), item["ID"].ToString());
            if (mu.UserRole.Contains("," + item["ID"] + ","))
                li.Selected = true;
            li.Enabled = false;
            cblRoleList.Items.Add(li);
        }
    }
    void ShowPlatInfo(int id)
    {
        try
        {
            M_User_Plat platModel = PlatBll.SelReturnModel(id);
            if (platModel != null)
            {
                platInfo_A.Visible = true;
                UpPlat_B.Visible = false;
                tbTrueName_L.Text = platModel.TrueName;
                tbCompName_L.Text = platModel.CompName;
                tbPost_L.Text = platModel.Post;
                tbPhone_L.Text = platModel.Mobile;
            }
        }
        catch 
        {
            UpPlat_B.Visible = false;
        }
    }

    public string GetGroupName(string GroupID)
    {
        B_Group bgp = new B_Group();
        return bgp.GetByID(DataConverter.CLng(GroupID)).GroupName;
    }
    public string GetHoneyName()
    {
        return userinfo.HoneyName;
    }
    public string GetPrivat(string ss)
    {
        int sss = DataConverter.CLng(ss);
        switch (sss)
        {
            case 0:
                return "公开信息";
            case 1:
                return "只对好友公开";
            case 2:
                return "完全保密";
            default:
                return "";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        B_Guest_Bar barBll = new B_Guest_Bar();
        int count = barBll.DelByUID(DataConverter.CLng(Request.QueryString["id"]));
        function.WriteSuccessMsg("删除成功,共移除" + count + "个贴子");
    }

    protected string Getbir(string str)
    {
        try
        {
            return DateTime.Parse(str).ToShortDateString();
        }
        catch (Exception)
        {
            return "";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Write("<script>location.href=\"UserModify.aspx?UserID=" + Request.QueryString["id"] + "\"</script>");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        int id = DataConverter.CLng(Request.QueryString["id"]);
        M_UserInfo userinfo = Uinfo.GetUserByUserID(id);
        M_Uinfo users = Uinfo.GetUserBaseByuserid(id);
        B_Client_Basic bsc = new B_Client_Basic();
        M_Client_Basic client = new M_Client_Basic();
        //通过客户姓名获取客户信息
        DataTable dt = new DataTable();
        dt = bsc.SelByName(userinfo.UserName.Trim());
        if (dt == null || dt.Rows.Count <= 0) //如果找不到客户则升级
        {
            client.Flow = 0;
            client.Client_Source = "在线注册";
            client.Client_Area = users.Province;
            client.P_name = userinfo.UserName;
            client.Add_Date = DateTime.Now;
            client.Code = DataSecurity.MakeFileRndName();
            client.Add_Name = userinfo.TrueName;
            client.Title = "在线注册";
            M_Client_Penson person = new M_Client_Penson();
            B_Client_Penson bperson = new B_Client_Penson();
            person.Flow = 0;
            person.Code = client.Code;
            person.Birthday = DataConverter.CDate(users.BirthDay);
            person.city = users.County;
            person.country = users.Country;
            person.Fax_phone = users.Fax;
            person.Home_Phone = users.HomePhone;
            person.Homepage = users.HomePage;
            person.ICQ_Code = users.ICQ;
            person.Id_Code = users.IDCard;
            person.MSN_Code = users.MSN;
            person.Native = users.Province;
            person.province = users.County;
            person.QQ_Code = users.QQ;
            person.Telephone = users.Mobile;
            person.UC_Code = users.UC;
            person.Work_Phone = users.OfficePhone;
            person.YaoHu_Code = users.Yahoo;
            person.ZipCodeW = users.ZipCode;
            bsc.GetInsert(client);
            bperson.GetInsert(person);
            function.WriteSuccessMsg("升级成功,请进入客户管理系统管理客户信息!");
        }
        else  //否则就提示
        {
            Response.Redirect("EditCus.aspx?id=" + id);
        }
        if (dt != null)
        {
            dt.Dispose();
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserExp.aspx?UserID=" + Request.QueryString["id"]+"&type="+(int)M_UserExpHis.SType.Point);
    }
    protected void btnmo_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserExp.aspx?UserID=" + Request.QueryString["id"] + "&type="+(int)M_UserExpHis.SType.Purse);
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "useLogin")
        {
            //根据用户名和密码验证会员身份，并取得会员信息
            int userid = DataConverter.CLng(e.CommandArgument);
            userlogin(userid);
            Response.Write("<script>window.open('/user/Default.aspx')</script>");
        }
    }

    private void userlogin(int useid)
    {
        M_UserInfo muserinfo = ull.GetUserByUserID(useid);
        string AdminName = muserinfo.UserName;
        string AdminPass = muserinfo.UserPwd;
        M_UserInfo info = new M_UserInfo();
        //int regID = 0;
        info = ull.AuthenticateUser(AdminName, AdminPass, true);
        //如果用户Model是空对象则表明登录失败
        if (info.IsNull)
        {
            function.WriteErrMsg("您的帐号或密码错误！");
        }
        else
        {
            if (info.Status != 0)
            {
                function.WriteErrMsg("你的帐户未通过验证或被锁定，请与网站管理员联系");
            }
            api.Login(info.UserName, AdminPass, 1);
            ull.SetLoginState(info, "Day");
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserExp.aspx?UserID=" + Request.QueryString["id"] + "&type=" + (int)M_UserExpHis.SType.Credit);
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserExp.aspx?UserID=" + Request.QueryString["id"]+"&type="+(int)M_UserExpHis.SType.DummyPoint);
    }

    //点劵
    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserExp.aspx?UserID=" + Request.QueryString["id"]+"&type="+(int)M_UserExpHis.SType.UserPoint);
    }

    //银币
    protected void Button9_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserExp.aspx?UserID=" + Request.QueryString["id"]+"&type="+(int)M_UserExpHis.SType.SIcon);
    }
    //已发布文章数
    protected string GetCount()
    {
        M_UserInfo userinfo = Uinfo.GetUserByUserID(DataConverter.CLng(Request.QueryString["id"]));
        B_Content sd_CommonModel = new B_Content();
        string count = sd_CommonModel.CountDatas("Inputer", userinfo.UserName).Rows[0]["countNum"].ToString();
        return count;
    }
    //计算云盘空间
    protected string GetCloud()
    {
        string path = base.Request.PhysicalApplicationPath + SiteConfig.SiteOption.UploadDir + "/" + userinfo.UserName;
        if (Directory.Exists(path))
        {
            long len = GetDirectoryLength(path);
            string dirLen = Math.Round((double)len / 1024 / 1024, 2) + " MB";
            return "已用了 " + dirLen;
        }
        else
        {
            return "未开通云盘";
        }
    }
    public long GetDirectoryLength(string dirPath)
    {
        if (!Directory.Exists(dirPath))
            return 0;
        long len = 0;
        DirectoryInfo di = new DirectoryInfo(dirPath);
        foreach (FileInfo fi in di.GetFiles())
        {
            len += fi.Length;
        }
        DirectoryInfo[] dis = di.GetDirectories();
        if (dis.Length > 0)
        {
            for (int i = 0; i < dis.Length; i++)
            {
                len += GetDirectoryLength(dis[i].FullName);
            }
        }
        return len;
    }

    protected void CloudManage_Click(object sender, EventArgs e)
    {
        userinfo = Uinfo.GetUserByUserID(DataConverter.CLng(Request["id"]));
        if (userinfo.IsCloud.ToString() == "1")
        {
            FileSystemObject.Delete(base.Request.PhysicalApplicationPath + SiteConfig.SiteOption.UploadDir + "/" + userinfo.UserName, FsoMethod.Folder);
            if (ull.UpdateIsCloud(userinfo.UserID, 0))
                function.WriteSuccessMsg("云盘关闭成功", CustomerPageAction.customPath + "user/UserInfo.aspx?id=" + Request["id"]);
        }
        else
        {

            string path = base.Request.PhysicalApplicationPath + SiteConfig.SiteOption.UploadDir + "/" + userinfo.UserName;
            Directory.CreateDirectory(path);
            string pathfile = base.Request.PhysicalApplicationPath + SiteConfig.SiteOption.UploadDir + "/" + userinfo.UserName + "/我的文档";
            string pathphoto = base.Request.PhysicalApplicationPath + SiteConfig.SiteOption.UploadDir + "/" + userinfo.UserName + "/我的相册";
            string pathmusic = base.Request.PhysicalApplicationPath + SiteConfig.SiteOption.UploadDir + "/" + userinfo.UserName + "/我的音乐";
            string pathvideo = base.Request.PhysicalApplicationPath + SiteConfig.SiteOption.UploadDir + "/" + userinfo.UserName + "/我的视频";
            Directory.CreateDirectory(pathfile);
            Directory.CreateDirectory(pathphoto);
            Directory.CreateDirectory(pathmusic);
            Directory.CreateDirectory(pathvideo);
            if (ull.UpdateIsCloud(userinfo.UserID, 1))
                function.WriteSuccessMsg("云盘开通成功", CustomerPageAction.customPath + "user/UserInfo.aspx?id=" + Request["id"]);
        }
    }

    protected string cloud()
    {
        if (userinfo.IsCloud.ToString() == "1")
            return "关闭云盘";
        else
            return "开通云盘";
    }

    protected void ResetSpwd_Click(object sender, EventArgs e)
    {
        if (ull.UpByWhere("ZL_User", "PayPassWord='7fef6171469e80d32c0559f88b377245'", "UserID=" + Request.QueryString["id"]))
        {
            function.WriteSuccessMsg("恭喜，二级密码成功重设为初始值admin888", CustomerPageAction.customPath + "user/UserInfo.aspx?id=" + Request["id"]);
        }
    }
    // 推荐人
    protected string GetParentUser()
    {
        userinfo = Uinfo.GetUserByUserID(DataConverter.CLng(Request["id"]));
        if (userinfo.ParentUserID != "")
        {
            try
            {
                M_UserInfo usinfo = Uinfo.GetUserByUserID(Convert.ToInt32(userinfo.ParentUserID));
                if (usinfo.UserName != "")
                {
                    return usinfo.UserName;
                }
                else
                {
                    return usinfo.ParentUserID;
                }
            }
            catch
            {
                return userinfo.ParentUserID;
            }
        }
        return "";
    }
    //-------作者
    protected B_Author authorBll = new B_Author();
    protected M_Author authorMod = new M_Author();
    public string GetIsAuthor(object o)
    {
        string result = "<span><a onclick=\"author('" + Request.RawUrl + "&action=Author');\" style='color:green;cursor:pointer;' title='升级为作者'>[+]</a></span>";
        int flag = authorBll.IsAuthor(DataConvert.CLng(o.ToString()), AuthorDT);
        if (flag != -1)
        {
            result = "<span><a href='../AddOn/Author.aspx?Action=Modify&AUId=" + flag + "' style='color:green;' title='查看详情'>[本站作者]</a></span>";
        }
        return result;
    }
    public void UpdateToAuthor(int userID)
    {
        M_UserInfo uinfo = ull.GetUserByUserID(userID);
        if (authorBll.IsBindAuthor(userID)) function.WriteErrMsg("用户已经是升级,无法重复绑定!!");
        authorMod.AuthorName = uinfo.UserName;
        authorMod.AuthorID = userID;
        authorMod.AuthorEmail = userinfo.Email;
        authorMod.AuthorLastUseTime = DateTime.Now;
        authorMod.AuthorBirthDay = DateTime.Now;
        authorBll.insert(authorMod);
    }
    public DataTable AuthorDT
    {
        get
        {
            if (Session["AuthorDT"] == null)
                Session["AuthorDT"] = authorBll.GetSourceAll();
            return Session["AuthorDT"] as DataTable;
        }
        set
        {
            Session["AuthorDT"] = null;
        }
    }
    public string GetCompanyName(string userID)
    {
        userinfo = Uinfo.GetUserByUserID(DataConverter.CLng(userID));
        return userinfo.CompanyName;
    }
    public string GetCompanyDesc(string userID)
    {
        userinfo = Uinfo.GetUserByUserID(DataConverter.CLng(userID));
        return userinfo.CompanyDescribe;
    }
    protected void UpPlat_B_Click(object sender, EventArgs e)
    {
        M_User_Plat platModel = new M_User_Plat();
        platModel.UserID = Convert.ToInt32(Request.QueryString["id"]);
        platModel.TrueName = "初始用户";
        platModel.Post = "初始部门";
        platModel.CompID = 1;
        platModel.Status = 1;
        PlatBll.Insert(platModel);
        ShowPlatInfo(platModel.UserID);
    }
    protected void LockUser_Click(object sender, EventArgs e)
    {
        M_UserInfo userMod = ull.GetUserByUserID(DataConvert.CLng(Request.QueryString["id"]));
        if (userMod != null && userMod.State == 0)
        {
            ull.BatAudit(userMod.UserID.ToString());
            function.WriteSuccessMsg("操作成功！");
        }
    }
    protected void ClearCode_B_Click(object sender, EventArgs e)
    {
        M_UserInfo userMod = ull.GetUserByUserID(DataConvert.CLng(Request.QueryString["id"]));
        userMod.ZnPassword = "";
        ull.UpDateUser(userMod);
        function.WriteSuccessMsg("操作成功!");
    }
}