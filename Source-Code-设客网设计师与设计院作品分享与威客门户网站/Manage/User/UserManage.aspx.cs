using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using ZoomLa.API;
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.Components;
using ZoomLa.DZNT;
using ZoomLa.Model;

public partial class Manage_User_UserManage : CustomerPageAction
{
    private B_Admin badmin = new B_Admin();
    private B_User buser = new B_User();
    private B_Group groupBll = new B_Group();
    #region Get获取
    public string GetStatus(string Status)
    {
        switch (Status)
        {
            case "0":
                return "正常";
            case "1":
                return "锁定";
            case "2":
                return "待认证";
            case "3":
                return "双认证";
            case "4":
                return "邮件认证";
            case "5":
                return "待认证";
        }
        return "正常";
    }
    public string GetState(string State)
    {
        switch (State)
        {
            case "0":
                return "<font color=red>×</font>";
            case "1":
                return "<font color=red>×</font>";
            case "2":
                return "<font color=blue>√</font>";
        }
        return "<font color=red>×</font>";
    }
    protected string GetConfirm(string GroupID)
    {
        string isConfirm = "";
        int groupID = Convert.ToInt32(GroupID);
        if (groupID == 2)//店铺会员
        {
            isConfirm = "印证";
        }
        else
        {
            isConfirm = "";
        }
        return isConfirm;
    }
    public string GetGroupName(string GroupID)
    {
        B_Group bgp = new B_Group();
        return bgp.GetByID(DataConverter.CLng(GroupID)).GroupName;
    }
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        RPT.SPage = MyBind;
        if (!B_ARoleAuth.Check(ZLEnum.Auth.user, "UserManage"))
            function.WriteErrMsg("没有权限进行此项操作");    
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["lblkey"]))
            {
                preAction=DropDownList2.SelectedValue;
                preValue=Request.QueryString["lblkey"];
            }
            else if (!string.IsNullOrEmpty(Request.QueryString["keyWord"]))
            {
                preAction = "keyword";
                preValue=Request.QueryString["keyWord"];
            }
            else if (!string.IsNullOrEmpty(Request.QueryString["GroupID"]))
            {
                preAction = "groupid";
                preValue=Request.QueryString["GroupID"];
            }
            RPT.DataBind();
            function.Script(this, "ShowOrderIcon('ID_A')");
            DPBind();
            BindProvince();
        }
    }
    private DataTable MyBind(int pageSize, int pageIndex)
    {
        int itemCount=0;
        DataTable dt = buser.SelPage(pageSize, pageIndex, out itemCount, preAction, preValue, orderType);
        RPT.ItemCount = itemCount;
        return dt;
    }
    private void ReBind()
    {
        RPT.CPage = 1;
        RPT.DataBind();
    }
    private string preAction
    {
        get { return ViewState["preAction"] as string; }
        set { ViewState["preAction"] = value; }
    }
    public string preValue
    {
        get { return ViewState["preValue"] as string; }
        set { ViewState["preValue"] = value; }
    }
    public string orderType
    {
        get { return ViewState["orderType"] as string; }
        set{ViewState["orderType"]=value;}
    }
    //会员组等下拉框绑定
    private void DPBind() 
    {
        DataTable dt=groupBll.GetGroupList();
        UserGroup_DP.DataSource = dt;
        UserGroup_DP.DataBind();
        SelectGroup.DataSource = dt;//数据绑定
        SelectGroup.DataBind();
        this.SelectGroup.Items.Insert(0, new ListItem("选择等级", "0"));
        ddlGroup.DataSource = dt;
        ddlGroup.DataBind();
    }
    //绑定省份
    private void BindProvince()
    {
        City city = new City();
        ProvinceDP.DataSource = city.readProvince();
        ProvinceDP.DataTextField = "name";
        ProvinceDP.DataValueField = "name";
        ProvinceDP.DataBind();
        ProvinceDP.Items.Insert(0, new ListItem("全部城市", "0"));
    }
    protected void GroupMove_Click(object sender, EventArgs e)
    {
        string[] chkArr = GetChecked();
        if (chkArr != null)
        {
            for (int i = 0; i < chkArr.Length; i++)
            {
                M_UserInfo dd = buser.GetUserByUserID(Convert.ToInt32(chkArr[i]));
                dd.GroupID = DataConverter.CLng(UserGroup_DP.SelectedValue);
                buser.UpDateUser(dd);
            }
        }
        ReBind();
    }
    // 认证店铺
    protected void Approve_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.Form["idchk"]))
        {
            buser.BatAudit(Request.Form["idchk"],2);
        }
        ReBind();
    }
    //批量锁定
    protected void btnLock_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.Form["idchk"]))
        {
            buser.BatAudit(Request.Form["idchk"], 1);
        }
        ReBind();
    }
    //批量解锁
    protected void btnNormal_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.Form["idchk"]))
        {
            buser.BatAudit(Request.Form["idchk"], 0);
        }
        ReBind();
    }
    // 店铺刷新
    protected void RenoVate_Click(object sender, EventArgs e)
    {
        B_Content content = new B_Content();
        string[] chkArr = GetChecked();
        if (chkArr != null)
        {
            for (int i = 0; i < chkArr.Length; i++)
            {
                string username = buser.SeachByID(Convert.ToInt32(chkArr[i])).UserName;
                M_UserInfo dd = buser.GetUserByUserID(Convert.ToInt32(chkArr[i]));
                if (dd.CerificateDeadLine < DateTime.Now)
                {
                    int UserId = Convert.ToInt32(chkArr[i]);
                    content.DeCommonModel(username);
                    buser.UpdateUserState(UserId, 0, DateTime.Now);
                }
            }
        }
        RPT.DataBind();
    }

    // 认证店铺失败
    protected void ApproveFailure_Click(object sender, EventArgs e)
    {
        string[] chkArr = GetChecked();
        if (chkArr != null)
        {
            for (int i = 0; i < chkArr.Length; i++)
            {
                int UserId = Convert.ToInt32(chkArr[i]);
                buser.UpdateUserState(UserId, 0, DateTime.Now);
            }
        }
        RPT.DataBind();
    }
    //批量删除
    protected void btnDel_Click(object sender, EventArgs e)
    {
        ApiAction api = new ApiAction();
        string[] chkArr = GetChecked();
        if (chkArr != null)
        {
            for (int i = 0; i < chkArr.Length; i++)
            {
                string username = buser.SeachByID(Convert.ToInt32(chkArr[i])).UserName;
                if (DataConverter.CBool(api.data.config.DisCuzz))
                {
                    UserInfo uinfo = UserBll.GetUserByName(username);//DZ
                    if (!uinfo.IsNull)
                    {
                        UserBll.DelUser(uinfo);
                        buser.DelUserById(Convert.ToInt32(chkArr[i]));
                    }
                }
                if (DataConverter.CBool(api.data.config.ApiEnable))
                {
                    api.DeleteUsers(username);
                    if (api.data.Status == "0")
                    {
                        buser.DelUserById(Convert.ToInt32(chkArr[i]));
                    }
                }
                else
                {
                    buser.DelUserById(Convert.ToInt32(chkArr[i]));
                }
            }
        }
        RPT.DataBind();
    }
    //Excel导出
    protected void Export_Click(object sender, EventArgs e)
    {
        //if (ViewState["tableinfo"] != null)
        //{
        StringBuilder sb = new StringBuilder();
        string titles = "会员名,Email,会员积分,真实姓名,生日,联系地址,办公电话,家庭电话,传真号码,邮编,手机号,性别,QQ号码,MSN号码,身份证号码,个人主页,籍省,户籍县市,工作所在省,工作所在县市";
        string fildname = "UserName,Email,UserExp,TrueName,BirthDay,Address,OfficePhone,HomePhone,Fax,ZipCode,Mobile,UserSex,QQ,MSN,IDCard,HomePage,Province,County,workProvince,workCity";
        string[] usertit = titles.Split(',');
        string[] userfild = fildname.Split(',');
        DataTable viewtable = buser.SelAll();
        sb.Append(titles.Replace(",", "\t"));
        sb.Append("\n");
        for (int ii = 0; ii < viewtable.Rows.Count; ii++)
        {
            int UserID = DataConverter.CLng(viewtable.Rows[ii]["UserID"].ToString());
            M_Uinfo ustino = buser.GetUserBaseByuserid(UserID);
            if (ustino.UserId == 0)
            {
                ustino.UserId = UserID;
                buser.AddBase(ustino);
            }
            DataTable uinfo = buser.GetUserBaseByuserid(UserID.ToString());
            if (uinfo != null && uinfo.Rows.Count > 0)
            {
                for (int i = 0; i < userfild.Length; i++)
                {
                    if (i == 11)
                    {
                        if (Convert.ToBoolean(uinfo.Rows[0][userfild[i]]))
                        {
                            sb.Append("男\t");
                        }
                        else
                        {
                            sb.Append("女\t");
                        }
                    }
                    else
                    {
                        sb.Append(uinfo.Rows[0][userfild[i]] + "\t");
                    }
                }
            }
            sb.Append("\n");
        }
        Response.Clear();
        Response.Buffer = true;
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=UserInfo(" + DateTime.Now.ToString() + ").xls");
        Response.Charset = "UTF-8";
        Response.ContentEncoding = Encoding.Default;
        Response.Write(sb.ToString());
        Response.End();
        //}
    }
    //设置等级
    protected void Rank_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(SelectGroup.SelectedValue))
        {
            if (SelectGroup.SelectedValue.ToString() != "0")
            {
                string[] chkArr = GetChecked();
                if (chkArr != null)
                {
                    for (int i = 0; i < chkArr.Length; i++)
                    {
                        M_UserInfo dd = buser.GetUserByUserID(Convert.ToInt32(chkArr[i]));
                        dd.GroupID = DataConverter.CLng(SelectGroup.SelectedValue);
                        buser.UpDateUser(dd);
                    }
                }
                RPT.DataBind();
            }
        }
    }
    //查找用户
    protected void Button1_Click1(object sender, EventArgs e)
    {
        //switch (OrderType_DP.SelectedValue)
        //{
        //    case "1":
        //        preAction = "groupid";
        //        preValue = ddlGroup.SelectedValue;
        //        ReBind();
        //        break;
        //    case "2"://按时间
        //        sTime_T.Text = sTime_T.Text.Trim();
        //        eTime_T.Text = eTime_T.Text.Trim();
        //        if (string.IsNullOrEmpty(sTime_T.Text) || string.IsNullOrEmpty(eTime_T.Text))
        //        {
        //            Page.ClientScript.RegisterStartupScript(this.GetType(), "asdasd", "alert('开始与结束时间不能为空!!');", true);
        //        }
        //        else if(DataConverter.CDate(sTime_T.Text)>=DataConverter.CDate(eTime_T.Text))
        //        {
        //            ClientScript.RegisterStartupScript(this.GetType(), "search", "alert('开始时间不能小于等于结束时间!!');", true);
        //        }
        //        else
        //        {
        //            preAction = "time";
        //            preValue = sTime_T.Text + "|" + eTime_T.Text;
        //            ReBind();
        //        }
        //        break;
        //}
    }
    //用户名，ID，Email搜索
    protected void Button2_Click(object sender, EventArgs e)
    {
        preAction = DropDownList2.SelectedValue;
        preValue = IDName.Text.Trim();
        ReBind();
    }
    protected void OrderType_DP_SelectedIndexChanged(object sender, EventArgs e)
    {
        orderType = OrderType_DP.SelectedValue;
        ReBind();
    }
    //获取选中的checkbox
    private string[] GetChecked()
    {
        if (!string.IsNullOrEmpty(Request.Form["idchk"]))
        {
            string[] chkArr = Request.Form["idchk"].Split(',');
            return chkArr;
        }
        else
            return null;
    }
    protected void OrderBtn_Click(object sender, EventArgs e)
    {
        LinkButton linkbt = ((LinkButton)sender);
        orderType = linkbt.CommandArgument;
        RPT.DataBind();
        if (orderType.IndexOf("Asc") > -1)//判断是否倒序
        {
            linkbt.CommandArgument = orderType.Replace("Asc", "");
            linkbt.Text=linkbt.Text.Replace("glyphicon-arrow-up", "glyphicon-arrow-down");
        }
        else
        {
            linkbt.CommandArgument = "Asc" + orderType;
            linkbt.Text= linkbt.Text.Replace("glyphicon-arrow-down", "glyphicon-arrow-up");
        }
        function.Script(this, "ShowOrderIcon('" + linkbt.ID + "')");
    }
}