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
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.Model;
using System.Reflection;
using System.Text.RegularExpressions;
using ZoomLa.BLL.FTP;

public partial class Manage_I_Content_AddModelField : CustomerPageAction
{
    protected B_ModelField bll = new B_ModelField();
    protected B_Model bModel = new B_Model();
    protected M_ModelInfo model = new M_ModelInfo();
    private M_ModelInfo m_ModelInfo = new M_ModelInfo();
    private B_User buser = new B_User();
    private B_UserBaseField ubfieldBll = new B_UserBaseField();
    public int FieldID { get { return DataConverter.CLng(Request.QueryString["FieldID"]); } }
    public int ModelID { get { return DataConverter.CLng(Request.QueryString["ModelID"]); } }
    public int ModelType { get { return DataConverter.CLng(Request.QueryString["ModelType"]); } }
    protected void Page_Load(object sender, EventArgs e)
    {
        B_Admin badmin = new B_Admin();
        if (!IsPostBack)
        {
            B_ARoleAuth.CheckEx(ZLEnum.Auth.model, "ModelEdit");
            if (ModelID == 0)
            {
                function.WriteErrMsg("没有指定要添加字段的模型ID!");
            }
            GradeOptionType_Cate.DataSource = B_GradeOption.GetCateList();
            GradeOptionType_Cate.DataTextField = "CateName";
            GradeOptionType_Cate.DataValueField = "CateID";
            GradeOptionType_Cate.DataBind();
            GradeOptionType_Cate.Items.Insert(0, new ListItem("选择多级选项分类", "0"));
            GradeOptionType_Cate.Items.Insert(1, new ListItem("省市县三级联动", "a"));
            GradeOptionType_Cate.Items.Insert(1,new ListItem("省市县镇级四级联动","b"));
            ShowList();
            switch (ModelType)
            {
                case 9:
                    if (FieldID > 0)
                    {
                        lblModel.Text = "修改[用户注册]模型字段";
                        Button1.Text = "修改字段";
                        M_UserBaseField modelfield = ubfieldBll.GetSelect(FieldID);
                        M_ModelField m_MF = new M_ModelField();
                        GetField(CopyModelField(modelfield,m_MF));
                    }
                    else
                    {
                        lblModel.Text = "添加[用户注册]模型字段";
                    }
                    HdfTableName.Value = "ZL_UserBaseField";
                    Label1.Text = "ZL_UserBaseField";
                    break;
                default:
                    model = bModel.GetModelById(ModelID);
                    Label1.Text = model.TableName;
                    HdfTableName.Value = model.TableName;
                    if (FieldID > 0)
                    {
                        lblModel.Text = "修改[" + model.ModelName + "]模型字段";
                        Button1.Text = "修改字段";
                        M_ModelField m_MF = bll.GetModelByID(ModelID.ToString(), FieldID);
                        GetField(m_MF);
                    }
                    else
                    {
                        lblModel.Text = "添加[" + model.ModelName + "]模型字段";
                    }
                    break;
            }
            Call.HideBread(Master);
        }
    }
    //字段列表
    private void ShowList()
    {
        m_ModelInfo = bModel.GetModelById(ModelID);            
        ListItem li1 = new ListItem("单行文本", "TextType");
        ListItem li2 = new ListItem("多行文本(不支持Html)", "MultipleTextType");
        ListItem li3 = new ListItem("多行文本(支持Html)", "MultipleHtmlType");
        ListItem li4 = new ListItem("图片", "PicType");
        ListItem li5 = new ListItem("图片入库", "SqlType");
        ListItem li7 = new ListItem("单选项", "OptionType");
        ListItem li8 = new ListItem("多选项", "ListBoxType");
        ListItem li9 = new ListItem("多级选项", "GradeOptionType");
        ListItem li10 = new ListItem("文件", "SmallFileType");
        ListItem li11 = new ListItem("下拉文件", "PullFileType");
        ListItem li12 = new ListItem("多文件", "FileType");
        ListItem li13 = new ListItem("日期时间", "DateType");
        ListItem li14 = new ListItem("数字", "NumType");
        ListItem li15 = new ListItem("运行平台", "OperatingType");
        ListItem li16 = new ListItem("超链接", "SuperLinkType");
        ListItem li17 = new ListItem("颜色代码", "ColorType");
        ListItem li19 = new ListItem("递增双时间", "DoubleDateType");
        ListItem li20 = new ListItem("在线浏览", "Upload");
        ListItem li21 = new ListItem("手机短信", "MobileSMS");
        ListItem li22 = new ListItem("Google地图", "GoogleMapType");
        ListItem li23 = new ListItem("远程文件", "RemoteFile");
        ListItem li24 = new ListItem("图表", "Charts");
        ListItem li25 = new ListItem("文件入库", "SqlFile");
        ListItem li26 = new ListItem("库选定段", "TableField");
        ListItem li27 = new ListItem("随机数", "Random");
        ListItem li28 = new ListItem("智能图组", "Images");
        ListItem li29 = new ListItem("拍照字段","CameraType");
        Type.Items.Add(li1);
        Type.Items.Add(li2);
        Type.Items.Add(li3);
        Type.Items.Add(li4);
        Type.Items.Add(li28);
        Type.Items.Add(li5);
        Type.Items.Add(li7);
        Type.Items.Add(li8);
        Type.Items.Add(li9);
        Type.Items.Add(li25);
        Type.Items.Add(li29);
        switch (m_ModelInfo.ModelType)
        {
            case 1://内容模型
                Type.Items.Add(li10);
                Type.Items.Add(li11);
                Type.Items.Add(li12);
                Type.Items.Add(li13);
                Type.Items.Add(li14);
                Type.Items.Add(li15);
                Type.Items.Add(li16);
                Type.Items.Add(li17);
                Type.Items.Add(li20);
                Type.Items.Add(li21);
                Type.Items.Add(li22);
                break;
            //商城模型
            case 2:
                Type.Items.Add(li10);
                Type.Items.Add(li11);
                Type.Items.Add(li12);
                Type.Items.Add(li13);
                Type.Items.Add(li14);
                Type.Items.Add(li15);
                Type.Items.Add(li19);
                Type.Items.Add(li21);
                break;
            //用户模型
            case 3:
                Type.Items.Add(li10);
                Type.Items.Add(li11);
                Type.Items.Add(li12);
                Type.Items.Add(li13);
                Type.Items.Add(li14);
                Type.Items.Add(li15);
                break;
            //黄页模型管理
            case 4:
                Type.Items.Add(li10);
                Type.Items.Add(li11);
                Type.Items.Add(li12);
                Type.Items.Add(li13);
                Type.Items.Add(li14);
                Type.Items.Add(li15);
                break;
            //店铺模型
            case 5:
                Type.Items.Add(li10);
                Type.Items.Add(li11);
                Type.Items.Add(li12);
                Type.Items.Add(li13);
                Type.Items.Add(li14);
                Type.Items.Add(li15);
                Type.Items.Add(li21);
                break;
            //店铺申请设置
            case 6:
                Type.Items.Add(li11);
                Type.Items.Add(li12);
                Type.Items.Add(li13);
                Type.Items.Add(li14);
                Type.Items.Add(li15);
                break;
            //互动模型管理
            case 7:
                Type.Items.Add(li10);
                Type.Items.Add(li11);
                Type.Items.Add(li12);
                Type.Items.Add(li13);
                Type.Items.Add(li14);
                Type.Items.Add(li15);
                break;
            //功能模型
            case 8:
                Type.Items.Add(li10);
                Type.Items.Add(li11);
                Type.Items.Add(li12);
                Type.Items.Add(li13);
                Type.Items.Add(li14);
                Type.Items.Add(li15);
                break;
            default://9:用户注册字段
                Type.Items.Add(li10);
                Type.Items.Add(li11);
                Type.Items.Add(li12);
                Type.Items.Add(li13);
                Type.Items.Add(li14);
                Type.Items.Add(li15);
                Type.Items.Add(li16);
                Type.Items.Add(li17);
                Type.Items.Add(li20);
                Type.Items.Add(li21);
                Type.Items.Add(li22);
                break;
        }
        Type.Items.Add(li26);
        Type.Items.Add(li27);
        if (FieldID > 0)
        {
            M_ModelField m_MF = bll.GetModelByID(ModelID.ToString(), FieldID);
        }
        else
        {
            li1.Selected = true;
        }
    }

    private void GetField(M_ModelField m_MF)
    {
        Name.Text = m_MF.FieldName;
        Alias.Text = m_MF.FieldAlias;
        Description.Text = m_MF.Description;
        Tips.Text = m_MF.FieldTips;
        IsNotNull.Checked = m_MF.IsNotNull;
        IsSearchForm.Checked = m_MF.IsSearchForm;
        IsShow.Checked = m_MF.IsShow;
        rblCopy.Checked = m_MF.IsCopy != -1 ? true : false;
        SetDownFiled.Checked = m_MF.IsDownField==1?true:false;
        Islotsize.Checked = m_MF.Islotsize;
        IsChain.Checked = m_MF.IsChain;
        //if (SetDownFiled.Checked)
        //{
        //    downserver.Visible = true;
        //    Serverlist();
        //    serverlist.SelectedValue = m_MF.DownServerID.ToString();
        //}
        //else
        //{
        //    downserver.Visible = false;
        //}
        FieldModel fieldMod = new FieldModel(m_MF.Content);
        IsSwfFileUpload.Enabled = false;
        Name.Enabled = false;
        string content = m_MF.Content;
        string type = m_MF.FieldType;
        //EditAuth_Hid.Value = fieldMod.GetValue("EditAuth");
        //EditAuth_T.Text = buser.GetUserNameByIDS(EditAuth_Hid.Value);
        if (type == "SwfFileUpload")
        {
            Type.SelectedValue = "FileType";

            type = "FileType";
            IsSwfFileUpload.Checked = true;
        }
        else
        {
            IsSwfFileUpload.Checked = false;
            Type.SelectedValue = type.Trim();
        }
        Type.Enabled = false;
        #region
        switch (type)
        {
            //单行文本
            case "TextType":
                TitleSize.Text = fieldMod.GetValue("TitleSize");
                IsPassword.Checked = fieldMod.GetValue("IsPassword").Equals("password");
                TextType_DefaultValue.Text =fieldMod.GetValue("DefaultValue");
                Text_SelVideo_Chk.Checked = DataConverter.CBool(fieldMod.GetValue("SelVideo"));
                Text_SelIcon_Chk.Checked = fieldMod.GetValBool("SelIcon");
                DivTextType.Style["display"] = "";
                break;
            //多行文本(不支持Html)
            case "MultipleTextType":
                MultipleTextType_Width.Text = fieldMod.GetValue("width");
                MultipleTextType_Height.Text = fieldMod.GetValue("height");
                MText_SelUser_Chk.Checked = DataConverter.CBool(fieldMod.GetValue("SelUser"));
                MText_Down_Chk.Checked = fieldMod.GetValBool("Down");
                DivTextType.Style["display"] = "none";
                DivMultipleTextType.Style["display"] = "";
                break;
            //多行文本(支持Html)
            case "MultipleHtmlType":
                //Width=715,Height=400,IsEditor=3,AllowWord_Chk=true
                MultipleHtmlType_Width.Text = fieldMod.GetValue("Width");
                MultipleHtmlType_Height.Text = fieldMod.GetValue("Height");
                IsEditor.SelectedValue = fieldMod.GetValue("IsEditor");
                Topimg_Chk.Checked = fieldMod.GetValBool("Topimg");
                AllowWord_Chk.Checked = fieldMod.GetValBool("AllowWord_Chk");
                DivTextType.Style["display"] = "none";
                DivMultipleHtmlType.Style["display"] = "";
                break;
            //单选项
            case "OptionType":
                RadioType_Content.Text = SortStr(bll.GetFieldContent(content, 0, 1)).Replace("||", "\r\n");
                RadioType_Type.SelectedValue = bll.GetFieldContent(content, 0, 0);
                RadioType_Property.Checked = bll.GetFieldContent(content, 1, 1).Equals("True") ? true : false;
                RadioType_Default.Text = bll.GetFieldContent(content, 2, 1).ToString();
                DivTextType.Style["display"] = "none";
                DivOptionType.Style["display"] = "";
                break;
            //多选项
            case "ListBoxType":
                ListBoxType_Content.Text = SortStr(bll.GetFieldContent(content, 0, 1)).Replace("||", "\r\n");
                ListBoxType_Type.SelectedValue = bll.GetFieldContent(content, 0, 0);
                DivTextType.Style["display"] = "none";
                DivListBoxType.Style["display"] = "";
                break;
            //数字
            case "NumType":
                NumberType_TitleSize.Text = bll.GetFieldContent(content, 0, 1);
                NumberType_Style.SelectedValue = bll.GetFieldContent(content, 1, 1);
                NumberType_Style.Enabled = false;
                NumberType_DefaultValue.Text = bll.GetFieldContent(content, 2, 1);
                ClientScript.RegisterStartupScript(GetType(), "", "<script>window.onload=function(){document.getElementById('showdec').style.display = '';}</script>");
                try
                {
                    if (bll.GetFieldContent(content, 6, 1) != "")
                    {
                        txtdecimal.Text = bll.GetFieldContent(content, 6, 1);
                    }
                    else
                    {
                        txtdecimal.Text = "0";
                    }
                }
                catch (Exception)
                {
                    txtdecimal.Text = "0";
                }
                DivTextType.Style["display"] = "none";
                DivNumType.Style["display"] = "";
                break;
            //日期时间
            case "DateType":
                DateSearchType.SelectedValue = fieldMod.GetValue("Type");
                DivTextType.Style["display"] = "none";
                DivDateType.Style["display"] = "";
                break;
            //图片
            case "PicType":
                RBLPicWaterMark.Checked = bll.GetFieldContent(content, 0, 1).Equals("True") ? true : false;
                TxtSPicSize.Text = bll.GetFieldContent(content, 1, 1);
                TxtPicExt.Text = bll.GetFieldContent(content, 2, 1);
                rblSelUpfile.SelectedValue = bll.GetFieldContent(content, 3, 1);
                DivPicType.Style["display"] = "";
                DivTextType.Style["display"] = "none";
                break;
            //入库图片
            case "SqlType":
                TxtMaxPicSize.Text = bll.GetFieldContent(content, 0, 1);
                    DivSqlType.Style["display"] = "";
                DivTextType.Style["display"] = "none"; 
                    DivTextType.Visible =false;
                TxtPicSqlType.Text = bll.GetFieldContent(content, 1, 1);
                break;
            //入库数据
            case "SqlFile":
                TxtMSqlFileSize.Text = bll.GetFieldContent(content, 0, 1);
                DivSqlFile.Style["display"] = "";
                DivTextType.Style["display"] = "none"; 
                TxtSqlFiletext.Text = bll.GetFieldContent(content, 1, 1);
                DivTextType.Visible = false;  
                break;
            //多图片
            case "MultiPicType":
                if (DataConverter.CBool(bll.GetFieldContent(content, 0, 1)))
                {
                    ChkThumb.Checked = true;
                    TxtThumb.Text = bll.GetFieldContent(content, 1, 1);
                }
                else
                {
                    ChkThumb.Checked = false;
                    TxtThumb.Text = "";
                }
                ChkThumb.Enabled = false;
                TxtThumb.Enabled = false;
                RBLWaterMark.Checked = bll.GetFieldContent(content, 2, 1).Equals("True") ? true : false;
                TxtPicSize.Text = bll.GetFieldContent(content, 3, 1);
                TextImageType.Text = bll.GetFieldContent(content, 4, 1);
                DivMultiPicType.Style["display"] = "";
                DivTextType.Style["display"] = "none";
                     
                break;
            //文件
            case "SmallFileType":
                ChkFileSize.Enabled = false;
                TxtFileSizeField.Enabled = false;
                TxtMaxFileSizes.Text = bll.GetFieldContent(content, 0, 1);
                TxtUploadFileTypes.Text = bll.GetFieldContent(content, 1, 1);
                rblSelUploadFile.Checked = bll.GetFieldContent(content, 2, 1).Equals("1"); 
                DivSmallFileType.Style["display"] = "";
                DivTextType.Style["display"] = "none";
                break;
            //下拉文件
            case "PullFileType":
                PullFileText.Text = bll.GetFieldContent(content,0, 0);
                DivPullFileType.Style["display"] = "";
                    DivTextType.Style["display"] = "none";
                break;
            //多文件
            case "FileType":
                if (DataConverter.CBool(bll.GetFieldContent(content, 0, 1)))
                {
                    ChkFileSize.Checked = true;
                    TxtFileSizeField.Text = bll.GetFieldContent(content, 1, 1);
                }
                else
                {
                    ChkFileSize.Checked = false;
                    TxtFileSizeField.Text = "";
                }
                ChkFileSize.Enabled = false;
                TxtFileSizeField.Enabled = false;
                if (IsSwfFileUpload.Checked)
                {
                    TxtMaxFileSize.Text = bll.GetFieldContent(content, 0, 1);
                    TxtUploadFileType.Text = bll.GetFieldContent(content, 1, 1);
                }
                else
                {
                    TxtMaxFileSize.Text = bll.GetFieldContent(content, 2, 1);
                    TxtUploadFileType.Text = bll.GetFieldContent(content, 3, 1);
                }
                DivFileType.Style["display"] = "";
                DivTextType.Style["display"] = "none";
                break;
            //运行平台
            case "OperatingType":
                TxtOperatingOption.Text = bll.GetFieldContent(content, 1, 1).Replace("|", "\r\n");
                OperatingType_TitleSize.Text = bll.GetFieldContent(content, 0, 1);
                OperatingType_DefaultValue.Text = bll.GetFieldContent(content, 2, 1);
                DivOperatingType.Style["display"] = "";
                DivTextType.Style["display"] = "none";
                break;
            //超链接
            case "SuperLinkType":
                SuperLinkType_TitleSize.Text = bll.GetFieldContent(content, 0, 1);
                SuperLinkType_DefaultValue.Text = bll.GetFieldContent(content, 1, 1);
                DivSuperLinkType.Style["display"] = "";
                DivTextType.Style["display"] = "none";
                break;
            //多级选项
            case "GradeOptionType":
                GradeOptionType_Cate.SelectedValue = bll.GetFieldContent(content, 0, 1);
                GradeOptionType_Direction.SelectedValue = bll.GetFieldContent(content, 1, 1);
                DivTextType.Style["display"] = "none";
                DivGradeOptionType.Style["display"] = "";
                break;
            //颜色字段
            case "ColorType":
                ColorDefault.Text = bll.GetFieldContent(content, 1, 1);
                DivColorType.Style["display"] = "";
                DivTextType.Style["display"] = "none";
                break;
            //offece转换为flash
            case "Upload":
                TextBox2.Text = bll.GetFieldContent(content, 1, 1);
                TextBox3.Text = bll.GetFieldContent(content, 2, 1);
                DivUpload.Style["display"] = ""; 
                DivTextType.Style["display"] = "none";
                break;
            case "GoogleMapType":
                string widths = content.Split(',')[0].Replace("Width=", "");
                string heigths = "";// content.Split(',')[1].Replace("Height=", "");
                WidthTxt.Text = widths;
                HeigthTxt.Text = heigths;
                DivTextType.Style["display"] = "none";
                DivGoogleMapType.Style["display"] = "";
                break;
            case "SwfFileUpload":
                TxtMaxFileSize1.Text = bll.GetFieldContent(content, 0, 1);
                TxtUploadFileType1.Text = bll.GetFieldContent(content, 1, 1);
                DivTextType.Style["display"] = "none";
                DivSwfFileUpload.Style["display"] = "";
                break;
            case "RemoteFile":
                Ftplist();
                DropDownList1.SelectedValue = m_MF.Content.Split(',')[0].Split('=')[1].ToString();
                TxtMaxFileSize2.Text = bll.GetFieldContent(content, 1, 1);
                TxtUploadFileType2.Text = bll.GetFieldContent(content, 2, 1);
                DivTextType.Style["display"] = "none";
                DivRemoteFile.Style["display"] = "";
                break;
            case "TableField":
                TableField_Text.Text = m_MF.Content.Split(',')[0];
                if (m_MF.Content.Split(',').Length > 1)
                TableField_Value.Text = m_MF.Content.Split(',')[1];
                if(m_MF.Content.Split(',').Length>2)
                Where_Text.Text = m_MF.Content.Split(',')[2];
                Page.ClientScript.RegisterStartupScript(GetType(), "DisDiv", "SelectModelType();", true);
                break;
            case "Random":
                Random_Len_T.Text = fieldMod.GetValue("len");
                Random_Type_Rad.SelectedValue = fieldMod.GetValue("type");
                function.Script(this, "SelectModelType();");
                break;
            case "Images"://组图
                IsWater_Images.Checked=fieldMod.GetValue("IsWater").Equals("1");
                function.Script(this, "SelectModelType();");
                break;
            default:
                CameraWidth_T.Text = fieldMod.GetValue("cameraWidth");
                CameraHeight_T.Text = fieldMod.GetValue("cameraHeight");
                CameraImgWidth_T.Text = fieldMod.GetValue("imgWidth");
                CameraImgHeight_T.Text = fieldMod.GetValue("imgHeight");
                function.Script(this, "SelectModelType();");
                break;
        #endregion
        }
    }

    private string SortStr(string str)
    {
        string context = "";
        string[] strx = str.Split(new string[] { "||" }, StringSplitOptions.RemoveEmptyEntries);

        foreach (string s in strx)
        {
            if (s.IndexOf("|") > 0)
            {
                string[] ss = s.Split(new char[] { '|' });

                if (ss.Length > 2)
                {
                    context += SortStr(s.Replace("|", "||"));
                }
                else
                {
                    if (s.IndexOf('$') == -1)
                    {
                        context += s + "$0";
                    }
                    else
                    {
                        context += s;
                    }
                }
            }
            else
            {
                if (s.IndexOf('$') == -1)
                {
                    context += s + "|" + s + "$0";
                }
                else
                {
                    context += s + "|" + s;
                }
            }
            context += "||";
        }
        if (context.EndsWith("||"))
        {
            context = context.Remove(context.Length - 2);
        }
        return context;
    }

    private void Serverlist()
    {
        if (SetDownFiled.Checked)
        {
            downserver.Visible = true;
            B_DownServer downdll = new B_DownServer();
            DataTable downlist = downdll.GetDownServerAll();
            downlist.DefaultView.Sort = "ServerID";
            serverlist.DataSource = downlist;
            serverlist.DataTextField = "ServerName";
            serverlist.DataValueField = "ServerID";
            serverlist.DataBind();
            serverlist.Items.Insert(0, new ListItem("请选择服务器", ""));
            for (int i = 0; i < Type.Items.Count; i++)
            {
                if (Type.Items[i].Value != "SmallFileType")
                {
                    Type.Items[i].Enabled = false;
                }
                else
                {
                    M_ModelField field = bll.GetModelByID(ModelID.ToString(), FieldID);
                    string content = field.Content;
                    ChkFileSize.Enabled = false;
                    TxtFileSizeField.Enabled = false;
                    TxtMaxFileSizes.Text = bll.GetFieldContent(content, 0, 1);
                    TxtUploadFileTypes.Text = bll.GetFieldContent(content, 1, 1);
                    DivSmallFileType.Style["display"] = ""; 
                    DivTextType.Style["display"] = "none";
                    Type.Items[i].Selected = true;
                }
            }
        }
    }

    private void Ftplist()
    {
        B_FTP bf = new B_FTP();
        DataTable dt = bf.SelectFtp_All();
        //throw new Exception(dt.Rows.Count.ToString());
        dt.DefaultView.Sort = "ID";
        DropDownList1.DataSource = dt;
        DropDownList1.DataTextField = "Alias";
        DropDownList1.DataValueField = "ID";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, new ListItem("请选择服务器", "0"));
    }
    //添加
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FieldID==0)
        {
            GetIsOk_Add();
        }
        else
        {
            GetIsOk_Updata();
        }
        bool flag2 = IsSearchForm.Checked;
        string defaultValue = "",strContent = "",tempFieldName = "",tempFieldType = "",fieldType = "nvarchar";
        string editstr = "";//预留 "EditAuth="+EditAuth_Hid.Value+",";
        switch (Type.SelectedValue)
        {
            //单行文本
            case "TextType":
                strContent = editstr + "TitleSize=" + TitleSize.Text + ",IsPassword=" + (IsPassword.Checked ? "password" : "text") +
                    ",DefaultValue=" + TextType_DefaultValue.Text + ",SelVideo=" + Text_SelVideo_Chk.Checked + ",SelIcon=" + Text_SelIcon_Chk.Checked;
                fieldType = "nvarchar";
                break;
            //多行文本(不支持Html)
            case "MultipleTextType":
                strContent = editstr + "Width=" + MultipleTextType_Width.Text + ",Height=" +MultipleTextType_Height.Text + ",SelUser=" + MText_SelUser_Chk.Checked+",Down="+MText_Down_Chk.Checked;
                fieldType = "ntext";
                break;
            //多行文本(支持Html)
            case "MultipleHtmlType":
                strContent = "Width=" + MultipleHtmlType_Width.Text + ",Height=" + MultipleHtmlType_Height.Text + ",IsEditor=" + IsEditor.SelectedValue + ",AllowWord_Chk=" + AllowWord_Chk.Checked + ",Topimg=" + Topimg_Chk.Checked;
                fieldType = "ntext";
                break;
            //单选项
            case "OptionType":
                strContent = "" + RadioType_Type.SelectedValue + "=" + RadioType_Content.Text.Trim().Replace(" ", "").Replace("\r\n", "||") + ",Property=" + RadioType_Property.Checked + ",Default=" + RadioType_Default.Text + "";
                fieldType = "nvarchar";
                defaultValue = RadioType_Default.Text;
                break;
            //多选项
            case "ListBoxType":
                if (ListBoxType_Type.SelectedValue == "3")
                {
                    string r = @"^*\|*\$0$";
                    strContent = Regex.Replace(ListBoxType_Content.Text, "(\\r\\n)+", "^");
                    string[] s = strContent.Split(new string[] { "^" }, StringSplitOptions.RemoveEmptyEntries);
                    strContent = "" + ListBoxType_Type.SelectedValue + "=";
                    for (int i = 0; i < s.Length; i++)
                    {
                        if (!(Regex.IsMatch(s[i], r)))
                        {
                            //throw new Exception(s.Length.ToString());
                            strContent += s[i].Trim() + "|" + s[i].Trim() + "$0";
                            if (i < s.Length - 1)
                                strContent += "||";
                        }
                        else
                        {
                            strContent += s[i];
                            if (i < s.Length - 1)
                                strContent += "||";
                        }
                    }

                }
                else
                {
                    strContent = ListBoxType_Type.SelectedValue + "=" + ListBoxType_Content.Text.Trim().Replace("\r\n", "||") + "";
                }
                fieldType = "ntext";
                break;
            //数字
            case "NumType":
                strContent = "TitleSize=" + NumberType_TitleSize.Text + ",NumberType=" + NumberType_Style.SelectedValue + ",DefaultValue=" + NumberType_DefaultValue.Text;
                strContent = strContent + ",NumSearchType=,NumRangType=,NumSearchRang=,NumLenght=" + txtdecimal.Text;
                int numstyle = DataConverter.CLng(NumberType_Style.SelectedValue);
                if (numstyle == 1)
                    fieldType = "int";
                if (numstyle == 2)
                    fieldType = "float";
                if (numstyle == 3)
                    fieldType = "money";
                break;
            //日期时间
            case "DateType":
                strContent = editstr + "Type="+DateSearchType.SelectedValue;
                fieldType = "datetime";
                break;
            //图片
            case "PicType":
                strContent = "Warter=" + RBLPicWaterMark.Checked + ",MaxPicSize=" + TxtSPicSize.Text + ",PicFileExt=" + TxtPicExt.Text + ",SelUpfile=" + rblSelUpfile.SelectedValue;
                    fieldType = "nvarchar";             
                flag2 = false;
                break;
            //入库图片
            case "SqlType":
                strContent = "MaxPicSize=" + TxtMaxPicSize.Text + ",FileExtArr=" + TxtPicSqlType.Text;
                fieldType = "image";
                tempFieldName = "FIT_" + Name.Text;
                tempFieldType = "nvarchar";
                flag2 = false;
                break;
            //入库文件
            case "SqlFile":
                strContent = "MaxPicSize=" + TxtMSqlFileSize.Text + ",FileExtArr=" + TxtSqlFiletext.Text;
                fieldType = "image";
                tempFieldName = "FIT_" + Name.Text;
                tempFieldType = "nvarchar";
                flag2 = false;
                break;
            //多图片
            case "MultiPicType":
                strContent = "ChkThumb=" + (ChkThumb.Checked ? "1" : "0") + ",ThumbField=" + TxtThumb.Text + ",Warter=" + RBLPicWaterMark.Checked + ",MaxPicSize=" + TxtPicSize.Text + ",PicFileExt=" + TextImageType.Text;
                if (ChkThumb.Checked)
                {
                    tempFieldName = TxtThumb.Text;
                    tempFieldType = "nvarchar";
                }
                fieldType = "ntext";
                flag2 = false;
                break;
            //文件
            case "SmallFileType":
                strContent = "MaxFileSize=" + TxtMaxFileSizes.Text + ",UploadFileExt=" + TxtUploadFileTypes.Text + ",SelUpfile=" + (rblSelUploadFile.Checked?"1":"0")+",isbigfile="+(isBigFile.Checked?"1":"0");
                fieldType = "nvarchar";
                flag2 = false;
                break;
            //下拉文件
            case "PullFileType":
                strContent = PullFileText.Text;
                fieldType = "nvarchar";
                flag2 = false;
                break;
            //多文件
            case "FileType":
                if (IsSwfFileUpload.Checked)
                {
                    strContent = "MaxFileSize=" + TxtMaxFileSize.Text + ",UploadFileExt=" + TxtUploadFileType.Text;
                }
                else
                {
                    strContent = "ChkFileSize=" + (ChkFileSize.Checked ? "1" : "0") + ",FileSizeField=" + TxtFileSizeField.Text + ",MaxFileSize=" + TxtMaxFileSize.Text + ",UploadFileExt=" + TxtUploadFileType.Text;
                }
                if (ChkFileSize.Checked)
                {
                    tempFieldName = TxtFileSizeField.Text;
                    tempFieldType = "nvarchar";
                }
                fieldType = "ntext";
                flag2 = false;
                break;
            //运行平台
            case "OperatingType":
                strContent = "TitleSize=" + OperatingType_TitleSize.Text + ",OperatingList=" + TxtOperatingOption.Text.Trim().Replace(" ", "").Replace("\r\n", "|") + ",DefaultValue=" + OperatingType_DefaultValue.Text;
                fieldType = "nvarchar";
                break;
            //超链接
            case "SuperLinkType":
                strContent = "TitleSize=" + SuperLinkType_TitleSize.Text + ",DefaultValue=" + SuperLinkType_DefaultValue.Text;
                fieldType = "nvarchar";
                flag2 = false;
                break;
            case "GradeOptionType":
                strContent = "GradeCate=" + GradeOptionType_Cate.SelectedValue + ",Direction=" + GradeOptionType_Direction.SelectedValue;
                fieldType = "nvarchar";
                break;
            //颜色字段
            case "ColorType":
                strContent = "TitleSize=" + SuperLinkType_TitleSize.Text + ",DefaultValue=" + ColorDefault.Text;
                fieldType = "nvarchar";
                flag2 = false;
                break;
            //双时间字段
            case "DoubleDateType":
                strContent = "DateSearchType=" + DateSearchType.SelectedValue + ",DateSearchRang=" + DateSearchRang.Text.Trim().Replace(" ", "").Replace("\r\n", "$");
                strContent = strContent + ",DateSearchUnit=" + DateSearchUnit.SelectedValue;
                fieldType = "ntext";
                break;
            // 在线浏览
            case "Upload":
                strContent = "Warter=" + RBLPicWaterMark.Checked + ",MaxPicSize=" + TextBox2.Text + ",PicFileExt=" + TextBox3.Text;
                fieldType = "nvarchar";
                break;
            //多行文本(不支持Html)
            case "GoogleMapType":
                fieldType = "int";
                break;
            //智能多文件上传
            case "SwfFileUpload":
                strContent = "MaxFileSize=" + TxtMaxFileSize1.Text + ",UploadFileExt=" + TxtUploadFileType1.Text;
                fieldType = "ntext";
                break;
            //远程文件
            case "RemoteFile":
                strContent = "FtpID=" + DropDownList1.SelectedItem.Value + ",MaxFileSize=" + TxtMaxFileSize2.Text + ",UploadFileExt=" + TxtUploadFileType2.Text;
                fieldType = "ntext";
                break;
            //手机短信
            case "MobileSMS":
                strContent = "Width=" + MobileSMSType_Width.Text + ",Height=" + MobileSMSType_Height.Text + "";
                fieldType = "ntext";
                break;
            case "Charts":
                fieldType = "int";
                break;
            case "TableField"://库选字段
                strContent = TableField_Text.Text.Trim()+","+TableField_Value.Text.Trim()+","+Where_Text.Text.Trim();
                fieldType = "nvarchar";
                break;
            case "Random"://随机数
                {
                    string len = DataConverter.CLng(Random_Len_T.Text) == 0 ? "6" : Random_Len_T.Text;
                    strContent = "Type=" + Random_Type_Rad.SelectedValue + ",Len=" + len;
                    fieldType = "nvarchar";
                }
                break;
            case "Images"://组图
                {
                    strContent = "IsWater=" + (IsWater_Images.Checked ? "1" : "0");
                    fieldType = "ntext";
                }
                break;
            case "CameraType"://拍照
                {
                    strContent = "cameraWidth="+DataConverter.CLng(CameraWidth_T.Text)+","+ "cameraHeight="+DataConverter.CLng(CameraHeight_T.Text)
                                + ",imgWidth="+DataConverter.CLng(CameraImgWidth_T.Text)+","+ "imgHeight="+DataConverter.CLng(CameraImgHeight_T.Text);
                    fieldType = "nvarchar";
                }
                break;
            default:
                function.WriteErrMsg("保存异常，选定字段类型不匹配!!!");
                break;
        }
        M_ModelField modelfield = new M_ModelField();
        if (FieldID != 0)
        {
            modelfield = bll.GetModelByID(ModelID.ToString(), FieldID);
        }
        else
        {
            modelfield.ModelID = ModelID;
            modelfield.FieldID = 0;
        }
        modelfield.FieldName = Name.Text.Trim();
        modelfield.FieldAlias = Alias.Text.Trim();
        modelfield.FieldTips = Tips.Text.Trim();
        modelfield.Description = Description.Text;
        modelfield.IsNotNull = IsNotNull.Checked;
        modelfield.IsSearchForm = flag2;
        if (Type.SelectedValue == "FileType" && IsSwfFileUpload.Checked)
        {
            modelfield.FieldType = "SwfFileUpload";
        }
        else
        {
            modelfield.FieldType = Type.SelectedValue;
        }
        modelfield.Content = strContent;
        //modelfield.OrderID = bll.GetMaxOrder(ModelID)+1;
        modelfield.ShowList = true;
        modelfield.ShowWidth = 0;
        modelfield.IsShow = IsShow.Checked;
        modelfield.IsView = true;
        modelfield.IsDownField = SetDownFiled.Checked ? 1 : 0;
        modelfield.DownServerID = DataConverter.CLng(serverlist.SelectedValue);
        modelfield.IsCopy = rblCopy.Checked ? 0 : -1;
        modelfield.Islotsize = Islotsize.Checked;
        modelfield.IsChain = IsChain.Checked;
        switch (ModelType)
        {
            case 9:
                UBFieldAddORUpdate(fieldType, strContent, defaultValue, tempFieldName, tempFieldType);
                break;
            default:
                if (FieldID == 0)
                {
                    bll.Add(modelfield);//加入XML
                    if (!string.IsNullOrEmpty(tempFieldName) && !string.IsNullOrEmpty(tempFieldType))//如果需要添加字段,则加字段
                    {
                        bll.AddField(HdfTableName.Value, tempFieldName, tempFieldType, "");
                    }
                    bll.AddField(HdfTableName.Value, modelfield.FieldName, fieldType, defaultValue);//加入子表
                }
                else
                {
                    bll.Update(modelfield);
                }
                function.WriteSuccessMsg("操作成功", "ModelField.aspx?ModelID=" + ModelID + "&ModelType=" + ModelType);
                break;
        }
    }

    private void GetIsOk_Add()
    {
        string text = Name.Text;
        string str2 = Alias.Text;
        string selectedValue = Type.SelectedValue;
        if (text == "")
        {
            function.WriteErrMsg(string.Concat(new object[] { "<li>字段名不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
        }
        if (!DataValidator.IsValidUserName(text))
        {
            function.WriteErrMsg(string.Concat(new object[] { "<li>字段名必须由字母、数字、下划线组成</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
        }
        if (bll.IsExists(ModelID, text))
        {
            function.WriteErrMsg(string.Concat(new object[] { "<li>该模型已有相同字段名的字段</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
        }
        if (str2 == "")
        {
            function.WriteErrMsg(string.Concat(new object[] { "<li>字段别名不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
        }

        if (SetDownFiled.Checked)
        {
            if (serverlist.SelectedValue == "")
            {
                function.WriteErrMsg(string.Concat(new object[] { "<li>关联下载服务器不能为空!</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
            }
        }

        switch (selectedValue)
        {
            case "TextType":
                if (TitleSize.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框长度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(TitleSize.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框长度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "MultipleTextType":
                if (MultipleTextType_Width.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的宽度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(MultipleTextType_Width.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的宽度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (MultipleTextType_Height.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的高度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(MultipleTextType_Height.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的高度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "MultipleHtmlType":
                if (MultipleHtmlType_Width.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的宽度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(MultipleHtmlType_Width.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的宽度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (MultipleHtmlType_Height.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的高度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(MultipleHtmlType_Height.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的高度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "OptionType":
                if (RadioType_Content.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>单选项的选项不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "ListBoxType":
                if (ListBoxType_Content.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>多选项的选项不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "NumType":
                if (NumberType_TitleSize.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>输入数字的文本框长度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(NumberType_TitleSize.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>输入数字的文本框长度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "PicType":
                if (TxtSPicSize.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>图片文件大小限制不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (TxtPicExt.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>允许上传的图片类型不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;

            case "SqlType":
                if (TxtMaxPicSize.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>图片文件大小限制不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (TxtPicSqlType.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>允许上传的图片类型不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;

            case "SqlFile":
                if (TxtMSqlFileSize.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文件文件大小限制不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (TxtSqlFiletext.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>允许上传的文件类型不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;

            case "MultiPicType":
                if (ChkThumb.Checked && TxtThumb.Text.Trim() == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>选择保存缩略图时，图片缩略图保存字段名不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (TxtPicSize.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>图片文件大小限制不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (TextImageType.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>允许上传的图片类型不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "SmallFileType":
                if (TxtMaxFileSizes.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>允许上传的文件大小限制不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (TxtUploadFileTypes.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>允许上传的文件类型不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "FileType":
                if (ChkFileSize.Checked && TxtFileSizeField.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>选择保存文件大小时，文件大小保存字段名不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (TxtMaxFileSize.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>允许上传的文件大小限制不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (IsSwfFileUpload.Checked == true)
                {


                }
                if (TxtUploadFileType.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>允许上传的文件类型不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "OperatingType":
                if (OperatingType_TitleSize.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>输入运行平台的文本框长度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (TxtOperatingOption.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>运行平台选项不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "SuperLinkType":
                if (SuperLinkType_TitleSize.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>输入超链接的文本框长度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "MobileSMS":
                if (MobileSMSType_Width.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的宽度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Shop/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(MobileSMSType_Width.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的宽度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Shop/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (MobileSMSType_Height.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的高度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Shop/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(MobileSMSType_Height.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的高度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Shop/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "Upload":
                if (TextBox2.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文件大小限制不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (TextBox3.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文件类型不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "GoogleMapType":
                if (WidthTxt.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的宽度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(WidthTxt.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的宽度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (HeigthTxt.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的高度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(HeigthTxt.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的高度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "SwfFileUpload":
                if (TxtMaxFileSize1.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>允许上传的文件大小限制不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (TxtUploadFileType1.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>允许上传的文件类型不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
            case "RemoteFile":
                if (TxtMaxFileSize2.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>允许上传的文件大小限制不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (TxtUploadFileType2.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>允许上传的文件类型不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
        }
    }

    private void GetIsOk_Updata()
    {
        string text = Name.Text;
        string str2 = Alias.Text;
        //throw new Exception(text.ToString());
        string selectedValue = Type.SelectedValue;

        if (text == "")
        {
            function.WriteErrMsg(string.Concat(new object[] { "<li>字段名不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
        }
        if (!DataValidator.IsValidUserName(text))
        {
            function.WriteErrMsg(string.Concat(new object[] { "<li>字段名必须由字母、数字、下划线组成</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
        }
        if (str2 == "")
        {
            function.WriteErrMsg(string.Concat(new object[] { "<li>字段别名不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
        }

        if (SetDownFiled.Checked)
        {
            if (serverlist.SelectedValue == "")
            {
                function.WriteErrMsg(string.Concat(new object[] { "<li>关联下载服务器不能为空!</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
            }
        }

        switch (selectedValue)
        {
            case "TextType":
                if (TitleSize.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框长度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(TitleSize.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框长度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;

            case "MultipleTextType":
                if (MultipleTextType_Width.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的宽度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(MultipleTextType_Width.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的宽度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (MultipleTextType_Height.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的高度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(MultipleTextType_Height.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的高度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;

            case "MultipleHtmlType":
                if (MultipleHtmlType_Width.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的宽度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(MultipleHtmlType_Width.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的宽度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (MultipleHtmlType_Height.Text == "")
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的高度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                if (!DataValidator.IsNumber(MultipleHtmlType_Height.Text))
                {
                    function.WriteErrMsg(string.Concat(new object[] { "<li>文本框显示的高度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
                }
                break;
        }
        if ((selectedValue == "OptionType") && (RadioType_Content.Text == ""))
        {
            function.WriteErrMsg(string.Concat(new object[] { "<li>单选项的选项不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
        }
        if ((selectedValue == "ListBoxType") && (ListBoxType_Content.Text == ""))
        {
            function.WriteErrMsg(string.Concat(new object[] { "<li>多选项的选项不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
        }
        if (selectedValue == "NumType")
        {
            if (NumberType_TitleSize.Text == "")
            {
                function.WriteErrMsg(string.Concat(new object[] { "<li>输入数字的文本框长度不能为空</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
            }
            if (!DataValidator.IsNumber(NumberType_TitleSize.Text))
            {
                function.WriteErrMsg(string.Concat(new object[] { "<li>输入数字的文本框长度必须是整形数字</li><li><a href='javascript:window.history.back(-1)'>返回</a></li><li><a href='../Content/AddModelField.aspx?ModelID=", ModelID, "'>重新添加字段</a> <a href='../Content/ModelField.aspx?ModelID=", ModelID, "'>返回字段列表</a> <a href='../Content/ModelManage.aspx'>模型管理</a></li>" }));
            }
        }
        if (selectedValue == "SwfFileUpload")
        {

        }
        if (selectedValue == "RemoteFile")
        {
        }
    }
    //-----------------------ZL_UserBaseField
    private void UBFieldAddORUpdate(string fieldType,string content,string defaultValue,string tempFieldName,string tempFieldType) 
    {
        M_UserBaseField modelfield = new M_UserBaseField();
        if (FieldID > 0) { modelfield = ubfieldBll.GetSelect(FieldID); }
        modelfield.FieldName = Name.Text;
        modelfield.FieldAlias = Alias.Text;
        modelfield.Description = Description.Text;
        modelfield.FieldTips = Tips.Text.Trim();
        modelfield.FieldType = Type.SelectedValue;
        modelfield.Content = content;
        modelfield.IsNotNull = IsNotNull.Checked ? 1 : 0;
        modelfield.OrderId = ubfieldBll.GetMaxID();
        modelfield.ShowList = 1;//是否列表显示
        modelfield.ShowWidth = 10;//百分比
        modelfield.NoEdit = 0;
        if (FieldID > 0)
        {
            ubfieldBll.GetUpdate(modelfield);
        }
        else
        {
            if (!string.IsNullOrEmpty(tempFieldName) && !string.IsNullOrEmpty(tempFieldType))
            {
                this.bll.AddField("ZL_UserBase", tempFieldName, tempFieldType, "");
            }
            else
            {
                this.bll.AddField("ZL_UserBase", modelfield.FieldName, fieldType, defaultValue);
            }
            ubfieldBll.GetInsert(modelfield);
        }
        Response.Redirect("../User/SystemUserModel.aspx");
    }
    private M_ModelField CopyModelField(M_UserBaseField ubmodel, M_ModelField m_MF) 
    {
        m_MF.FieldName = ubmodel.FieldName;
        m_MF.FieldAlias = ubmodel.FieldAlias;
        m_MF.Content = ubmodel.Content;
        m_MF.FieldType = ubmodel.FieldType;
        m_MF.Description = ubmodel.Description;
        m_MF.FieldTips = ubmodel.FieldTips;
        m_MF.IsNotNull = ubmodel.IsNotNull==1;
        m_MF.IsSearchForm = false;
        m_MF.IsShow = true;
        m_MF.IsCopy = 1;
        m_MF.IsDownField = 0;
        m_MF.Islotsize = false;
        m_MF.IsChain = false;
        return m_MF;
    }
    protected void Return_Btn_Click(object sender, EventArgs e)
    {
        switch (ModelType)
        {
            case 9:
                Response.Redirect("../User/SystemUserModel.aspx");
                break;
            default:
                Response.Redirect("ModelField.aspx?ModelID=" + ModelID + "&ModelType=" + ModelType);
                break;
        }
    }
}