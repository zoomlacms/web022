using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.Components;
using ZoomLa.Model;
using ZoomLa.SQLDAL;

public partial class User_Default : CustomerPageAction
{
    protected M_UserInfo info = new M_UserInfo();
    B_PointGrounp pointBll = new B_PointGrounp();
    B_User buser = new B_User();
    B_Admin badmin = new B_Admin();
    B_Search searchBll = new B_Search();
    public string siteUrl = "";
    protected void Page_Init(object sender, EventArgs e)
    {
        if (buser.CheckLogin())
        {
            M_UserInfo mu = buser.GetLogin();
            if (mu == null || mu.IsNull || mu.UserID < 1)
            {
                Response.Redirect("/User/Login.aspx");
            }
            else if (mu.Status != 0) { function.WriteErrMsg("你的帐户未通过验证或被锁定，请与网站管理员联系", "/User/Login.aspx"); }
        }
        else if (badmin.CheckLogin())
        {
            M_AdminInfo adminMod = badmin.GetAdminLogin();
            M_UserInfo mu = buser.GetUserByName(adminMod.UserName, adminMod.AdminPassword);
            if (mu == null || mu.IsNull || mu.UserID < 1)
            {
                Response.Redirect("/User/Login.aspx");
            }
            else if (mu.Status != 0) { function.WriteErrMsg("你的帐户未通过验证或被锁定，请与网站管理员联系", "/User/Login.aspx"); }
            else
            {
                buser.SetLoginState(mu);
            }
        }
        else
        {
            B_User.CheckIsLogged(Request.RawUrl);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        siteUrl = SiteConfig.SiteInfo.SiteUrl;
        if (siteUrl.Substring(siteUrl.Length - 1, 1) == "/")
        {
            siteUrl = siteUrl.Substring(0, siteUrl.Length - 1);
        }
        info = buser.GetLogin();
        UserNameLb.Text = info.UserName;
        uName.Text = info.UserName;
        double GradeVar = info.UserExp;
        M_PointGrounp pointmod = pointBll.SelectPintGroup((int)info.UserExp);
        if (string.IsNullOrEmpty(pointmod.GroupName))
        { UserLvLb.Text = ""; }
        else
        { UserLvLb.Text = "[" + pointmod.GroupName + "]"; }
        LvIcon_Span.Attributes["class"] = pointmod.ImgUrl;
        GroupPic gp = new GroupPic();
        M_Uinfo binfo = buser.GetUserBaseByuserid(info.UserID);
        UserAddressLb.Text = binfo.Address;
        UserSignLb.Text = binfo.Sign;
        UserRegTimeLb.Text = info.RegTime.ToString();
        UserYeLb.Text = info.Purse.ToString();
        UserJfLb.Text = info.UserExp.ToString();
        UserJbLb.Text = info.SilverCoin.ToString();
        imgUserPic.ImageUrl = getproimg(binfo.UserFace);
        MyBind();
        MyDataBind();

    }
    //用户链接模板
    string userapptlp = "<div class='col-lg-2 col-md-3 col-sm-4 col-xs-6'><div class='user_menu'><a target='@target' href='@fileUrl'><i class='@ico'></i><br/>@name</a></div></div>";
    string onthertlp = "<li><a target='@target' href='@fileUrl'><i class='@ico' ></i><span>@name</span></a></li>";
    public void MyDataBind()
    {
        string str = "select GeneralID,Title,CreateTime,NodeID,Inputer,xmdd,xmlx,sjfg,xmgm,sjfy,jffs,jyyq,sjryszd,sjsxb from ZL_CommonModel left join ZL_C_faxmmx on ItemID=ID where ModelID=50 And Status=99 UNION select GeneralID,Title,CreateTime,NodeID,Inputer,xmdd,xmlx,sjfg,xmgm,sjfy,jffs,jyyq,sjryszd,sjsxb from ZL_CommonModel left join ZL_C_sgtxmmx on ItemID=ID where ModelID=51 And Status=99 Union select GeneralID,Title,CreateTime,NodeID,Inputer,xmdd,xmlx,sjfg,xmgm,sjfy,jffs,jyyq,sjryszd,sjsxb from ZL_CommonModel left join ZL_C_sgfwxm on ItemID=ID where ModelID=54 And Status=99 order By CreateTime DESC";
        DataTable dt = SqlHelper.ExecuteTable(str, null);
        RPT.DataSource = dt;
        RPT.DataBind();

        DataTable dts = SqlHelper.ExecuteTable("select top 1 * from ZL_CommonModel left join ZL_C_Designer on ItemID=ID where ModelID=48 And inputer='" + buser.GetLogin().UserName + "' And Status=99", null);
        string szdq = "", gzjy = "", sex = "";
        if(dts.Rows.Count>0)
        {
            szdq = dts.Rows[0]["szdq"].ToString().Split('|')[0];
            gzjy = dts.Rows[0]["gzjy"].ToString();
            sex = dts.Rows[0]["sex"].ToString();
         }
        DataTable dt1 = dt;
        dt1.DefaultView.RowFilter = "jyyq<='" + gzjy + "'";
        dt1 = dt1.DefaultView.ToTable();
        dt1.DefaultView.RowFilter = "sjsxb='" + sex + "'";
        dt1 = dt1.DefaultView.ToTable();
        dt1.DefaultView.RowFilter = "sjryszd like '%" + szdq + "%'";
        dt1 = dt1.DefaultView.ToTable();
        RPT1.DataSource = dt1;
        RPT1.DataBind();
    }
    public void MyBind()
    {
        
        M_UserInfo mu = buser.GetLogin();
        DataTable dt = searchBll.SelByUserGroup(mu.GroupID);
        string userhtml = "";
        string ontherhtml = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string targetlink = GetLinkTarget(dt.Rows[i]["OpenType"].ToString());
            if (DataConverter.CLng(dt.Rows[i]["EliteLevel"]) == 1)//抽出推荐应用
            {
                userhtml += ReplaceData(userapptlp, dt.Rows[i]).Replace("@target",targetlink);
                continue;
            }
            else
                ontherhtml += ReplaceData(onthertlp, dt.Rows[i]).Replace("@target",targetlink);
        }
        UserApp_Li.Text = userhtml;
        onther_lit.Text = ontherhtml;
    }
    //替换userapp字符串
    public string ReplaceData(string value,DataRow dr)
    {
        string[] replce = "ico,fileUrl,name".Split(',');
        foreach (string item in replce)
        {
            value = value.Replace("@" + item, dr[item].ToString());
        }
        return value;
    }
    public string GetLinkTarget(string target)
    {
        switch (target)
        {
            case "1":
                return "_blank";
            default:
                return "_self";
        }
    }
    public string getproimg(string type)
    {
        string restring = "";
        if (!string.IsNullOrEmpty(type))
        {
            type = type.ToLower();
        }
        if (!string.IsNullOrEmpty(type) && (type.IndexOf(".gif") > -1 || type.IndexOf(".jpg") > -1 || type.IndexOf(".png") > -1))
        {

            string delpath = SiteConfig.SiteOption.UploadDir.Replace("/", "") + "/";

            if (type.IndexOf("uploadfiles") > -1)
            {
                restring = type;
            }
            else if (type.StartsWith("http://", true, CultureInfo.CurrentCulture) || type.StartsWith("/", true, CultureInfo.CurrentCulture) || type.StartsWith(delpath, true, CultureInfo.CurrentCulture) || type.StartsWith("~", true, CultureInfo.CurrentCulture))
                restring = type;
            else
            {
                restring = SiteConfig.SiteOption.UploadDir + "/" + type;
            }
        }
        else
        {
            restring = "/Images/userface/noface.gif";
        }
        return restring;
    }
    public string GetUserFace()
    {
        info = buser.GetUserByName(Eval("Inputer").ToString());
        if (info != null)
            return info.UserFace;
        else
            return "";
    }
    public string GetTuoGuan()
    {
        DataTable dt = SqlHelper.ExecuteTable("select ID from ZL_Orderinfo where ISNUMERIC(Ordermessage)>0 And Paymentstatus=1 And Ordermessage='" + Eval("GeneralID") + "'", null);
        return dt.Rows.Count.ToString();
    }
}