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
using ThoughtWorks.QRCode.Codec;
using System.Drawing;
using System.IO;

public partial class User_Info_UserBase : CustomerPageAction
{
        
    private B_User buser = new B_User();
    private B_Group bgp = new B_Group();
    B_UserBaseField ubfbll = new B_UserBaseField();
    protected B_Sensitivity sll = new B_Sensitivity();
    B_Admin badmin = new B_Admin();
    private int scale = 4, version = 7;
    protected City city = new City();
    B_PointGrounp pointBll = new B_PointGrounp();

    protected void Page_Load(object sender, EventArgs e)
    { 
        if (!this.Page.IsPostBack)
        {
            switchID.Value = HttpUtility.HtmlEncode(Request.QueryString["sel"]);
            if (!buser.CheckLogin())
            {
                function.WriteErrMsg("请先<a href=/User/Login.aspx>登录</a>！", "/User/Login.aspx");
            }
            else
            {
                M_UserInfo uinfo = buser.GetLogin();
                //CompanyGroup是否为企业用户组0-否 1-是
                if (bgp.GetByID(Convert.ToInt32(uinfo.GroupID)).CompanyGroup == 1)
                {
                    this.DivCompany.Visible = true;
                    this.txtCompanyName.Text = uinfo.CompanyName;
                    this.txtCompanyDescribe.Text = uinfo.CompanyDescribe;
                }
                string modellist = bgp.GetGroupModel(uinfo.GroupID);
                M_Uinfo binfo = buser.GetUserBaseByuserid(uinfo.UserID); 
                if (!binfo.IsNull)
                {
                    tbTrueName.Text = uinfo.TrueName;
                    txtHonName.Text = uinfo.HoneyName;
                    tbUserSex.SelectedValue = binfo.UserSex ? "1" : "0";
                    address.Value = binfo.Province+","+binfo.City+","+binfo.County;
                    tbAddress.Text = binfo.Address;
                    tbBirthday.Text = binfo.BirthDay;
                    tbFaceWidth.Text = binfo.FaceWidth.ToString();
                    tbFaceHeight.Text = binfo.FaceHeight.ToString();
                    tbFax.Text = binfo.Fax;
                    tbHomepage.Text = binfo.HomePage;
                    tbHomePhone.Text = binfo.HomePhone;
                    //tbICQ.Text = binfo.ICQ;
                    tbIDCard.Text = binfo.IDCard;
                    tbMobile.Text = binfo.Mobile;
                    tbMSN.Text = binfo.MSN;
                    tbOfficePhone.Text = binfo.OfficePhone;
                    //tbPHS.Text = binfo.PHS;
                    tbPrivacy.SelectedValue = binfo.Privating.ToString();

                    tbQQ.Text = binfo.QQ;
                    tbSign.Text = binfo.Sign;
                    tbUC.Text = binfo.UC;
                    UserFace_Hid.Value = Path.GetFileName(uinfo.UserFace);
                    tbUserFace.Text = uinfo.UserFace;
                    face.ImageUrl = uinfo.UserFace;
                    //tbYahoo.Text = binfo.Yahoo;
                    tbZipCode.Text = binfo.ZipCode;
                    //公司信息与职务
                    this.Position.Text = binfo.Position;
                    this.CompanyName.Text = binfo.CompanyName;
                    this.face.ImageUrl = string.IsNullOrEmpty(binfo.UserFace) ? "/Images/userface/noface.gif" : binfo.UserFace;
                }
                lblHtml.Text = ubfbll.GetUpdateHtml(uinfo.UserID);
                //lblHtml.Text = lblHtml.Text.Replace("tdbg", "");
 
            }
            //-----权限块
            if (SiteConfig.UserConfig.UserMobilAuth.Equals("0"))
            {
                tbMobile.Enabled = false;
            }

        }//IsPostBack
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
            ;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!buser.CheckLogin())
        {
            function.WriteErrMsg("请先登录！", "/User/Login.aspx");
        }
        else
        {
            DataTable dt = ubfbll.Select_All();
            Call commonCall = new Call();
            DataTable table = commonCall.GetDTFromPage(dt, this.Page, ViewState);
            //DataTable dt = ubfbll.Select_All();//用户添加的字段。
            //DataTable table = new DataTable();
            //table.Columns.Add(new DataColumn("FieldName", typeof(string)));
            //table.Columns.Add(new DataColumn("FieldType", typeof(string)));
            //table.Columns.Add(new DataColumn("FieldValue", typeof(string)));
            //foreach (DataRow dr in dt.Rows)
            //{
            //    if (DataConverter.CBool(dr["IsNotNull"].ToString()))
            //    {
            //        if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + dr["FieldName"].ToString()]))
            //        {
            //            function.WriteErrMsg(dr["FieldAlias"].ToString() + "不能为空!");
            //        }
            //    }
            //    if (dr["FieldType"].ToString() == "FileType")
            //    {
            //        string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
            //        bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
            //        string sizefield = Sett[1].Split(new char[] { '=' })[1];
            //        if (chksize && sizefield != "")
            //        {
            //            DataRow row2 = table.NewRow();
            //            row2[0] = sizefield;
            //            row2[1] = "FileSize";
            //            row2[2] = this.Page.Request.Form["txt_" + sizefield];
            //            table.Rows.Add(row2);
            //        }
            //    }
            //    if (dr["FieldType"].ToString() == "MultiPicType")
            //    {
            //        string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
            //        bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
            //        string sizefield = Sett[1].Split(new char[] { '=' })[1];
            //        if (chksize && sizefield != "")
            //        {
            //            if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + sizefield]))
            //            {
            //                function.WriteErrMsg(dr["FieldAlias"].ToString() + "的缩略图不能为空!");
            //            }
            //            DataRow row1 = table.NewRow();
            //            row1[0] = sizefield;
            //            row1[1] = "ThumbField";
            //            row1[2] = this.Page.Request.Form["txt_" + sizefield];
            //            table.Rows.Add(row1);
            //        }
            //    }
            //    DataRow row = table.NewRow();
            //    row[0] = dr["FieldName"].ToString();
            //    string ftype = dr["FieldType"].ToString();
            //    row[1] = ftype;
            //    string fvalue = this.Page.Request.Form["txt_" + dr["FieldName"].ToString()];

            //    if (ftype == "TextType" || ftype == "MultipleTextType" || ftype == "MultipleHtmlType")
            //    {
            //        fvalue = sll.ProcessSen(fvalue);
            //    }
            //    row[2] = fvalue;
            //    table.Rows.Add(row);
            //}
            M_UserInfo uinfo = buser.GetLogin();
            uinfo.UserFace = this.tbUserFace.Text.Trim();
            uinfo.HoneyName = Server.HtmlEncode(txtHonName.Text.Trim());
            M_Uinfo binfo = buser.GetUserBaseByuserid(uinfo.UserID);
            binfo.Address = Server.HtmlEncode(this.tbAddress.Text.Trim());
            binfo.BirthDay = Server.HtmlEncode(this.tbBirthday.Text.Trim());
            binfo.FaceHeight = DataConverter.CLng(this.tbFaceHeight.Text.Trim());
            binfo.FaceWidth = DataConverter.CLng(this.tbFaceWidth.Text.Trim());
            binfo.UserFace = uinfo.UserFace;
            binfo.Fax = this.tbFax.Text.Trim();
            binfo.HomePage = Server.HtmlEncode(this.tbHomepage.Text.Trim());
            //binfo.ICQ = Server.HtmlEncode(this.tbICQ.Text.Trim());
            binfo.HomePhone = Server.HtmlEncode(this.tbHomePhone.Text.Trim());
            binfo.IDCard = Server.HtmlEncode(this.tbIDCard.Text.Trim());
            binfo.Mobile = Server.HtmlEncode(this.tbMobile.Text.Trim());
            binfo.MSN = Server.HtmlEncode(this.tbMSN.Text.Trim());
            binfo.OfficePhone = Server.HtmlEncode(this.tbOfficePhone.Text.Trim());
            binfo.Privating = this.tbPrivacy.SelectedIndex;
            //binfo.PHS = Server.HtmlEncode(this.tbPHS.Text.Trim());
            binfo.QQ = Server.HtmlEncode(this.tbQQ.Text.Trim());
            binfo.Sign = Server.HtmlEncode(this.tbSign.Text.Trim());
            uinfo.TrueName = Server.HtmlEncode(this.tbTrueName.Text.Trim());
            binfo.UC = Server.HtmlEncode(this.tbUC.Text.Trim());
            binfo.UserSex = DataConverter.CBool(this.tbUserSex.SelectedValue);
            //binfo.Yahoo = Server.HtmlEncode(this.tbYahoo.Text.Trim());
            binfo.ZipCode = Server.HtmlEncode(this.tbZipCode.Text.Trim());
            binfo.HoneyName = uinfo.HoneyName;
            string[] adrestr=address.Value.Split(new char[]{','},StringSplitOptions.RemoveEmptyEntries);
            binfo.Province = adrestr[0];
            binfo.City = adrestr[1];
            binfo.County = adrestr[2];
            binfo.Position = Server.HtmlEncode(this.Position.Text.Trim());
            binfo.CompanyName = Server.HtmlEncode(this.CompanyName.Text.Trim());
            if (binfo.IsNull)
            {
                binfo.UserId = uinfo.UserID;
                buser.UpDateUser(uinfo);
                buser.AddBase(binfo);
            }
            else
            {
                uinfo.CompanyName = Server.HtmlEncode(this.txtCompanyName.Text);
                uinfo.CompanyDescribe = Server.HtmlEncode(this.txtCompanyDescribe.Text);
                buser.UpDateUser(uinfo);
                buser.UpdateBase(binfo);//更新用户信息 
            }
            if (table.Rows.Count > 0)
            {
                buser.UpdateUserFile(binfo.UserId, table);
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('恭喜，保存成功！');location.href='/User/Content/MyWorks.aspx?NodeID=2';", true);
        }
    }

    public void SwitchEditState(bool bSelected)
    {
        tbTrueName.Enabled = bSelected;
        txtHonName.Enabled = bSelected;
        tbUserSex.Enabled = bSelected;
        tbAddress.Enabled = bSelected;
        tbBirthday.Enabled = bSelected;
        tbFaceWidth.Enabled = bSelected;
        tbFaceHeight.Enabled = bSelected;
        tbFax.Enabled = bSelected;
        tbHomepage.Enabled = bSelected;
        tbHomePhone.Enabled = bSelected;
        //tbICQ.Enabled = bSelected;
        tbIDCard.Enabled = bSelected;
        tbMobile.Enabled = bSelected;
        tbMSN.Enabled = bSelected;
        tbOfficePhone.Enabled = bSelected;
        //tbPHS.Enabled = bSelected;
        tbPrivacy.Enabled = bSelected;
        tbQQ.Enabled = bSelected;
        tbSign.Enabled = bSelected;
        tbUC.Enabled = bSelected;
        tbUserFace.Enabled = bSelected;
        btnSave.Enabled = bSelected;
        //tbYahoo.Enabled = bSelected;
        tbZipCode.Enabled = bSelected;
        Response.Write("<script>document.getElementById('myface').disabled=" + bSelected + ";</script>");
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
   
        SwitchEditState(true);  //切换控件可编辑的状态
    }

    private System.Drawing.Image SaveCode(QRCodeEncoder qrCodeEncoder, String data, System.Drawing.Image image, int Type)
    {
        image = qrCodeEncoder.Encode(data, System.Text.Encoding.Default);
        string upclass, newtimename, filenames, filesname, indexname, tempfilename;
        upclass = Server.HtmlEncode(Request.QueryString["menu"]);
        using (Bitmap bp = new Bitmap(image))
        {
            using (MemoryStream stream = new MemoryStream())
            {
                //bp.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                filenames = "QrCode.jpg";
                if (filenames.Length > 0)
                {
                    if (filenames.IndexOf(".") > 0)
                    {
                        filesname = filenames.Substring(filenames.LastIndexOf(".")).ToLower();
                        Random indexcc = new Random();
                        indexname = Convert.ToString(indexcc.Next(9999));//取出一个随机数

                        //如目录不存在则创建目录
                        if (!Directory.Exists(Server.MapPath(SiteConfig.SiteOption.UploadDir + "/QrCode")))
                        {
                            Directory.CreateDirectory(Server.MapPath(SiteConfig.SiteOption.UploadDir + "/QrCode"));
                        }

                        newtimename = Convert.ToString(DateTime.Now.Year) + Convert.ToString(DateTime.Now.Month) + Convert.ToString(DateTime.Now.Day) + Convert.ToString(DateTime.Now.Hour) + Convert.ToString(DateTime.Now.Minute) + Convert.ToString(DateTime.Now.Second) + Convert.ToString(DateTime.Now.Millisecond);

                        tempfilename = SiteConfig.SiteOption.UploadDir + "/QrCode/" + newtimename + indexname + filesname;
                        try
                        {
                            image.Save(Server.MapPath(tempfilename));
                        }
                        catch (Exception err)
                        {
                            Response.Write(err);
                        }
                        ImgCode.ImageUrl = tempfilename;
                        //Mcode.ImageUrl = "QrCode/" + newtimename + indexname + filesname;

                        //Mcode.CreateTime = DateTime.Now;
                        if (!string.IsNullOrEmpty(Request["ID"]))
                        {
                            //Mcode.ID = DataConverter.CLng(Request["ID"]);
                            //if (Bcode.UpdateByID(Mcode))
                            //{
                            //    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改成功');</script>");
                            //}
                            //else
                            //{
                            //    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改失败');</script>");
                            //}
                        }
                        else
                        {
                            //    if (Bcode.insert(Mcode) > 0)
                            //    {
                            //        //成功
                            //    }
                            //    else
                            //    {
                            //        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('创建失败');</script>");
                            //    }
                            //}
                        }
                    }
                }
            }
            return image;
        }
    }//生成二维码
    protected void CreateTDC()
    {
        M_UserInfo uinfo = buser.GetLogin();
        M_Uinfo binfo = buser.GetUserBaseByuserid(uinfo.UserID);
           
        ImgCode.ImageUrl = null;
        QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();
        //二维码颜色
        //qrCodeEncoder.QRCodeBackgroundColor = System.Drawing.Color.WhiteSmoke;
        //qrCodeEncoder.QRCodeForegroundColor = System.Drawing.Color.YellowGreen;
        qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE;

        qrCodeEncoder.QRCodeScale = scale;//大小
        qrCodeEncoder.QRCodeVersion = version;//版本
        qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.L;//纠错级别

        //FN:姓名,URL个人主页, 下面这些是要从数据库中获取的。
        string data = "";
        data = data + " FN:" + uinfo.TrueName + ";";
        data = data + " TEL:" + binfo.Mobile+ ";";
        data = data + " X-MSN:" + binfo.MSN + ";";
        data = data + " X-QQ:" + binfo.QQ + ";";
        string URL = binfo.HomePage;

        if (URL.IndexOf("http://") >= 0)
        {
            data = data + " URL:" + URL + ";";
        }
        else
        {
            data = data + " URL:http://" + URL + ";";
        }
        if (data.Length > 154)
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('总长度不能超过154个字符');</script>");
            data = data.Substring(0, 154);
        }
        System.Drawing.Image image = qrCodeEncoder.Encode(Server.HtmlEncode(data), System.Text.Encoding.UTF8);
        try
        {
            //Mcode.CodeType = "名片";
            //Mcode.CodeLevel = QRCodeEncoder.ERROR_CORRECTION.L.ToString();
            //Mcode.CodeVersion = version.ToString();
            ////Mcode.UserName = badmin.GetAdminLogin().AdminName;
            //Mcode.CodeContents = data;
            //Mcode.Type = 1;
            //image = SaveCode(qrCodeEncoder, Server.HtmlEncode(data), image, 1);
        }
        catch (Exception e1)
        {
            Response.Write(e1);
            return;
        }
        finally
        {
            if (image != null)
            {
                image.Dispose();
                image = null;
            }
        }
        // BtnSave.Visible = true;//下载到本地，这里不需要
    }
    //string path = @"~/User/Command/SystemData.xml";
   
    protected void BtUpImage_Click(object sender, EventArgs e)
    {
        M_UserInfo mu=buser.GetLogin();
        string vpath = SiteConfig.SiteOption.UploadDir + "User/" + mu.UserName + mu.UserID + "/";
        SFile_Up.SaveUrl = vpath;
        string imgurl= SFile_Up.SaveFile();
        face.ImageUrl = imgurl;
        UserFace_Hid.Value = Path.GetFileName(imgurl);
        tbUserFace.Text = imgurl;
        //if (HeaderUpImage.PostedFile.ContentLength > 0)
        //{
        //    string fname = function.GetRandomString(8)+ Path.GetExtension(HeaderUpImage.PostedFile.FileName);

        //    SafeSC.SaveFile(vpath, HeaderUpImage.PostedFile, fname);
        //    face.ImageUrl = vpath + fname;
        //    tbUserFace.Text = vpath + fname;
        //}
    }
}