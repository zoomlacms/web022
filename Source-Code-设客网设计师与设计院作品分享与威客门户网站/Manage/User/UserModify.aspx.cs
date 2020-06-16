namespace ZoomLa.WebSite.Manage.User
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
    using ZoomLa.Common;
    using ZoomLa.Model;
    using ZoomLa.BLL;
    using ZoomLa.BLL.User;
    using ZoomLa.BLL.Plat;
    using ZoomLa.Model.Plat;
    using ZoomLa.API;
    using ucApi;
    using System.Text;
    using System.Xml;
    using System.Data.SqlClient;
    using ZoomLa.SQLDAL;

    public partial class UserPassModify : CustomerPageAction
    {
        B_User bll = new B_User();
        B_UserBaseField bub = new B_UserBaseField();
        B_Sensitivity sll = new B_Sensitivity();
        B_Model bm = new B_Model();
        B_ModelField bmf = new B_ModelField();
        B_User_Plat PlatBll = new B_User_Plat();
        B_Permission perBll = new B_Permission();
        public string tabTitles = "";
        public string tabs = "";
        protected void Page_Init() 
        {
            Mobile_R.ValidationExpression = RegexHelper.S_Mobile;
            RegularExpressionValidator2.ValidationExpression = RegexHelper.S_Mobile;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            B_Admin badmin = new B_Admin();
            string UserID = base.Request.QueryString["UserID"];
            if (!this.Page.IsPostBack)
            {
                ShowPlatInfo(Convert.ToInt32(UserID));
                #region 绑定地区数据
                bind();
                if (Request["action"] == "area")
                {
                    bind1();
                    Response.Write("");
                    Response.Flush();
                    Response.Close();
                }
                if (Request["action"] == "area2")
                {
                    bind2();
                    Response.Write("");
                    Response.Flush();
                    Response.Close();
                }
                #endregion
                ViewState["PageUrl"] = customPath2 + "User/Userinfo.aspx?id=" + UserID;
                ViewState["url"] = "/Manage/User/UserManage.aspx";
                if (Request.QueryString["type"] == "x")
                {
                    ViewState["PageUrl"] = System.Web.HttpContext.Current.Request.UrlReferrer.ToString();
                    ViewState["url"] = System.Web.HttpContext.Current.Request.UrlReferrer.ToString();
                }
                if (string.IsNullOrEmpty(UserID))
                    function.WriteErrMsg("请指定会员ID", ViewState["PageUrl"].ToString());
                M_UserInfo uinfo = bll.SeachByID(DataConverter.CLng(UserID));
                if (uinfo.IsNull)
                {
                    function.WriteErrMsg("指定ID：" + UserID + "的用户不存在！可能已被删除！", ViewState["url"].ToString());
                }
                else
                {
                    B_Group bgr = new B_Group();
                    this.DDLGroup.DataSource = bgr.GetGroupList();
                    this.DDLGroup.DataTextField = "GroupName";
                    this.DDLGroup.DataValueField = "GroupID";
                    this.DDLGroup.DataBind();

                    this.HdnUserID.Value = UserID;
                    this.LblUserName.Text = uinfo.UserName;
                    this.lblUser.Text = uinfo.UserName;
                    this.tbEmail.Text = uinfo.Email;
                    txtPurm.Text = uinfo.DummyPurse.ToString();
                    this.tbQuestion.Text = uinfo.Question;
                    this.tbAnswer.Text = uinfo.Answer;
                    M_Uinfo binfo = bll.GetUserBaseByuserid(DataConverter.CLng(UserID));
                    this.tbTrueName.Text = uinfo.TrueName;
                    this.tbUserSex.SelectedValue = binfo.UserSex ? "1" : "0";
                    this.tbBirthday.Text = binfo.BirthDay;
                    this.tbOfficePhone.Text = binfo.OfficePhone;
                    this.tbHomePhone.Text = binfo.HomePhone;
                    this.tbMobile.Text = binfo.Mobile;
                    this.tbPHS.Text = binfo.PHS;
                    this.tbFax.Text = binfo.Fax;
                    this.tbAddress.Text = binfo.Address;
                    this.tbZipCode.Text = binfo.ZipCode;
                    this.txtHoneyName.Text = uinfo.HoneyName;
                    this.tbIDCard.Text = binfo.IDCard;
                    this.tbQQ.Text = binfo.QQ;
                    this.tbHomepage.Text = binfo.HomePage;
                    this.tbICQ.Text = binfo.ICQ;
                    this.tbMSN.Text = binfo.MSN;
                    this.tbYahoo.Text = binfo.Yahoo;
                    this.tbUC.Text = binfo.UC;
                    this.tbUserFace.Text = uinfo.UserFace;
                    this.tbFaceWidth.Text = binfo.FaceWidth.ToString();
                    this.tbFaceHeight.Text = binfo.FaceHeight.ToString();
                    this.tbSign.Text = binfo.Sign;
                    this.tbPrivacy.SelectedValue = binfo.Privating.ToString();
                    this.DDLGroup.SelectedValue = uinfo.GroupID.ToString();
                    txtUserCrite.Text = uinfo.UserCreit.ToString();
                    this.txtMoney.Text = uinfo.Purse.ToString();
                    this.txtPoint.Text = uinfo.UserExp.ToString();
                    this.txtSilverCoin.Text = uinfo.SilverCoin.ToString();
                    this.txtUserPoint.Text = uinfo.UserPoint.ToString();//点券
                    this.txtboffExp.Text = uinfo.boffExp.ToString();//卖家积分
                    this.txtConsumeExp.Text = uinfo.ConsumeExp.ToString();//消费积分
                    this.txtDeadLine.Text = uinfo.DeadLine.ToString();//有效期截止时间
                    this.txtCerificateDeadLine.Text = uinfo.CerificateDeadLine.ToString();
                    this.VIPUser.SelectedValue = binfo.VIPUser.ToString();
                    Adress_Hid.Value = binfo.Province + "," + binfo.City + "," + binfo.County;
                    this.tbParentUserID.Text = uinfo.ParentUserID.ToString();
                    this.CompanyNameT.Text = uinfo.CompanyName;
                    this.CompanyDescribeT.Text = uinfo.CompanyDescribe;
                    this.WorkNum_T.Text = uinfo.WorkNum;
                    DataTable dtuser = bll.GetUserBaseByuserid(UserID);
                    
                    lblHtml.Text = bub.GetUpdateHtml(dtuser);
                    
                    //lblHtml.Text = bub.GetHtml();//用这个获取的不会显示图片
                }
                BindUserRole(uinfo);
                Call.SetBreadCrumb(Master, "<li><a href='" + CustomerPageAction.customPath2 + "Main.aspx'>工作台</a></li><li><a href='" + customPath2 + "User/UserManage.aspx'>会员管理</a></li><li class='active'>修改会员信息</li>");

            }
            //增加模型选项卡
            DataTable dtModelUser = bm.GetListUser();
            string labstr = "";
            int tabnum = 3;
            for (int i = 0; i < dtModelUser.Rows.Count; i++)
            {
                string tablename = dtModelUser.Rows[i]["TableName"].ToString();
                DataTable info = bmf.SelectTableName(tablename, "userid=" + UserID);
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
                    ltlTab.Text += " <table class=\"tblModelFiled\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\">";

                    ltlTab.Text += this.bmf.GetUpdateHtmlUser(modelid, 0, info);
                    //for (int k = 0; k < modelfiled.Rows.Count; k++)
                    //{
                    //    if (k % 2 == 0)
                    //    {
                    //        ltlTab.Text += "<tr class=\"tdbg\" onmouseover=\"this.className='tdbgmouseover'\" onmouseout=\"this.className='tdbg'\">\r";
                    //    }
                    //    ltlTab.Text += "<td class=\"tdbgleft\" style=\"width: 15%; height: 22px\" align=\"right\">\r";
                    //    ltlTab.Text += modelfiled.Rows[k]["FieldAlias"].ToString() + "\r";
                    //    ltlTab.Text += "</td>\r";
                    //    ltlTab.Text += "<td style=\"width: 35%; height: 22px\" align=\"left\">\r";
                    //    //ltlTab.Text += "<input type=\"text\" value=\"" + info.Rows[0][modelfiled.Rows[k]["FieldName"].ToString()].ToString() + "\"class=\"l_input\" />" + "\r";
                    //    ltlTab.Text += "</td>\r";
                    //    if (k % 2 != 0)
                    //    {
                    //        ltlTab.Text += "</tr>\r";
                    //    }
                    //}
                    ltlTab.Text += " </table>";
                    ltlTab.Text += " </td>";
                    ltlTab.Text += " </tr>";
                    ltlTab.Text += "</tbody>";
                    tabnum++;
                }
            }
            models.Text = labstr.ToString();
           
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
                cblRoleList.Items.Add(li);
            }
        }
        void ShowPlatInfo(int id)
        {
            M_User_Plat platModel = PlatBll.SelReturnModel(id);
            if (platModel != null)
            {
                platInfo_A.Visible = true;
                tbTrueName_T.Text = platModel.TrueName;

                DataTable dt = new B_Plat_Comp().Sel();
                tbCompName_D.DataSource = dt;
                tbCompName_D.DataBind();
                tbPost_T.Text = platModel.Post;
                tbPhone_T.Text = platModel.Mobile;
            }
        }
        string GetUserRole()
        {
            string values = "";
            foreach (ListItem item in cblRoleList.Items)
            {
                if(item.Selected)
                    values+=","+item.Value+",";
            }
            return values;
        }
        //保存
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                if (tbConPwd.Text.Trim().Equals(tbNewPwd.Text.Trim()))
                {
                    if (!string.IsNullOrEmpty(WorkNum_T.Text) && !bll.CheckWorkNumIsOnly(WorkNum_T.Text, Convert.ToInt32(HdnUserID.Value)))
                        function.WriteErrMsg("工号重复请重新输入！！");
                    DataTable dt = bub.Select_All();//获取你额外添加的字段。
                    Call commonCall = new Call();
                    DataTable table = commonCall.GetDTFromPage(dt, this.Page, ViewState);
                    
                    int UserID = DataConverter.CLng(this.HdnUserID.Value);
                    M_UserInfo info = bll.SeachByID(UserID);
                    if (!string.IsNullOrEmpty(this.tbNewPwd.Text.Trim()))
                    {
                        info.UserPwd = this.tbNewPwd.Text.Trim();
                    }
                    info.Email = this.tbEmail.Text.Trim();
                    info.GroupID = DataConverter.CLng(this.DDLGroup.SelectedValue);
                    info.UserExp = DataConverter.CLng(this.txtPoint.Text);
                    info.SilverCoin = DataConverter.CLng(this.txtSilverCoin.Text);
                    info.Purse = DataConverter.CDouble(this.txtMoney.Text);
                    info.UserPoint = DataConverter.CLng(this.txtUserPoint.Text);//点券
                    info.boffExp = DataConverter.CLng(this.txtboffExp.Text);//卖家积分
                    info.ConsumeExp = DataConverter.CLng(this.txtConsumeExp.Text);//消费积分
                    info.DeadLine = DataConverter.CDate(this.txtDeadLine.Text);//有效期截止时间
                    info.CerificateDeadLine = DataConverter.CDate(this.txtCerificateDeadLine.Text);
                    info.UserCreit = DataConverter.CLng(txtUserCrite.Text);
                    info.DummyPurse = DataConverter.CDouble(txtPurm.Text);
                    info.ParentUserID = this.tbParentUserID.Text;
                    info.CompanyName = this.CompanyNameT.Text;
                    info.CompanyDescribe = this.CompanyDescribeT.Text;
                    info.WorkNum = WorkNum_T.Text.Trim().ToString();
                    info.UserFace = this.tbUserFace.Text.Trim();
                    info.HoneyName = txtHoneyName.Text.Trim();
                    info.UserRole = GetUserRole();
                    info.Question = tbQuestion.Text;
                    info.Answer = tbAnswer.Text.Trim();
                    M_Uinfo binfo = bll.GetUserBaseByuserid(UserID);
                    info.TrueName = this.tbTrueName.Text.Trim();
                    binfo.UserSex = DataConverter.CBool(this.tbUserSex.SelectedValue);
                    binfo.BirthDay = this.tbBirthday.Text.Trim();
                    binfo.OfficePhone = this.tbOfficePhone.Text.Trim();
                    binfo.HomePhone = this.tbHomePhone.Text.Trim();
                    binfo.Mobile = this.tbMobile.Text.Trim();
                    binfo.PHS = this.tbPHS.Text.Trim();
                    binfo.Fax = this.tbFax.Text.Trim();
                    binfo.Address = this.tbAddress.Text.Trim();
                    binfo.ZipCode = this.tbZipCode.Text.Trim();
                    binfo.IDCard = this.tbIDCard.Text.Trim();
                    binfo.HomePage = this.tbHomepage.Text.Trim();
                    binfo.QQ = this.tbQQ.Text.Trim();
                    binfo.ICQ = this.tbICQ.Text.Trim();
                    binfo.MSN = this.tbMSN.Text.Trim();
                    binfo.Yahoo = this.tbYahoo.Text.Trim();
                    //binfo.HoneyName = txtHoneyName.Text.Trim();
                    binfo.UC = this.tbUC.Text.Trim();
                    binfo.UserFace = info.UserFace;
                    binfo.FaceHeight = DataConverter.CLng(this.tbFaceHeight.Text.Trim());
                    binfo.FaceWidth = DataConverter.CLng(this.tbFaceWidth.Text.Trim());
                    binfo.Sign = this.tbSign.Text.Trim();
                    binfo.Province = Request.Form["selprovince"];
                    binfo.City = Request.Form["selcity"];
                    binfo.County = Request.Form["selcoutry"];

                    binfo.Privating = this.tbPrivacy.SelectedIndex;
                    binfo.VIPUser = DataConverter.CLng(this.VIPUser.SelectedValue);

                    ApiAction api = new ApiAction();
                    if (!string.IsNullOrEmpty(this.tbNewPwd.Text.Trim()))
                    {
                        if (DataConverter.CBool(api.data.config.Discuz))//启用DZ整合
                        {
                            int regstr = ucApi.Func.uc_user_checkname(info.UserName);// Func.uc_user_register(username, this.tbPwd.Text.Trim(), this.tbEmail.Text.Trim()).ToString();
                            if (regstr == -3)//已存在
                            {
                                ucApi.Func.uc_user_edit(info.UserName, "", this.tbNewPwd.Text.Trim(), this.tbEmail.Text.Trim(), true);
                            }
                        }
                    }

                    #region
                    DataTable dtModelUser = bm.GetListUser();
                    for (int i = 0; i < dtModelUser.Rows.Count; i++)
                    {
                        string tablename = dtModelUser.Rows[i]["TableName"].ToString();
                        DataTable modelinfo = bmf.SelectTableName(tablename, "userid=" + UserID);
                        if (modelinfo != null && modelinfo.Rows.Count > 0)
                        {

                            int modelid = Convert.ToInt32(dtModelUser.Rows[i]["ModelId"].ToString());
                            DataTable groupset = bmf.GetModelFieldListall(modelid).Tables[0];
                            DataTable tablereg = new DataTable();
                            tablereg.Columns.Add(new DataColumn("FieldName", typeof(string)));
                            tablereg.Columns.Add(new DataColumn("FieldType", typeof(string)));
                            tablereg.Columns.Add(new DataColumn("FieldValue", typeof(string)));
                            if (groupset != null && groupset.Rows.Count > 0)
                            {
                                foreach (DataRow dr in groupset.Rows)
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
                                    }
                                    row[2] = fvalue;
                                    tablereg.Rows.Add(row);
                                }
                            }
                            bll.UpdateModelInfo(tablereg, tablename, DataConverter.CLng(modelinfo.Rows[0]["id"]));
                        }
                    }

                    #endregion

                    if (!string.IsNullOrEmpty(this.tbNewPwd.Text.Trim()))
                        info.UserPwd = StringHelper.MD5(this.tbNewPwd.Text.Trim());
                    bll.UpDateUser(info);
                    bll.UpdateBase(binfo);
                    if (table.Rows.Count > 0)
                    {
                        bll.UpdateUserFile(binfo.UserId, table);
                    }
                    EditPlatInfo(UserID);
                    function.WriteSuccessMsg("修改成功！", ViewState["PageUrl"].ToString());
                }

            }
        }
        private void EditPlatInfo(int UserID)
        {
            M_User_Plat platmodel = PlatBll.SelReturnModel(UserID);
            if (platmodel!=null)
            {
                platmodel.TrueName = tbTrueName_T.Text;
                platmodel.CompID = Convert.ToInt32(tbCompName_D.SelectedValue);
                platmodel.Post = tbPost_T.Text;
                platmodel.Mobile = tbPhone_T.Text;
                platmodel.Status = 1;
                PlatBll.UpdateByID(platmodel);
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect(ViewState["PageUrl"].ToString());
        }

        #region 地区选项
        protected void bind()
        {
        }
        protected void bind1()
        {
            
        }
        protected void bind2()
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("/Common/Area.xml"));
            foreach (XmlNode node in xmlDoc.ChildNodes)
            {
                if (node.Name == "address")
                {
                    foreach (XmlNode province in node)
                    {
                        if (province.Attributes["name"].Value == Request["pro"])
                        {
                            foreach (XmlNode city in province.ChildNodes)
                            {
                                if (city.Attributes["name"].Value == Request["city"])
                                {
                                    foreach (XmlNode country in city.ChildNodes)
                                    {
                                        Response.Write(country.Attributes["name"].Value + "|");
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        #endregion
    }
}