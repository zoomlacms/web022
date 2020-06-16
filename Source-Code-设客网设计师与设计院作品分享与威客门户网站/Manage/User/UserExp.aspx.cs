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
    using System.Text;
    using System.Collections.Generic;
    public partial class UserExp : CustomerPageAction
    {
        private B_User bll = new B_User();
        B_Admin badmin = new B_Admin();
        protected B_History hisBll = new B_History();
        protected M_UserExpHis expMod = new M_UserExpHis();
        public int ExpType { get { return DataConverter.CLng(Request.QueryString["type"]); } }
        protected void Page_Load(object sender, EventArgs e)
        {
            B_Admin.CheckIsLogged();
            M_UserInfo mui = new M_UserInfo();
            int GuestScore = 0;
            if (!this.Page.IsPostBack)
            {
                
                if (string.IsNullOrEmpty(base.Request.QueryString["UserID"]))
                {
                    function.WriteErrMsg("缺少会员ID", "../User/UserManage.aspx");
                }
                else
                {
                    Lbl_t.Text = "会员"+GetTypeName()+"操作";
                    string userIds = base.Request.QueryString["UserID"].ToString();
                    if (!string.IsNullOrEmpty(userIds))
                    {
                        if (userIds.IndexOf(",") > -1)
                        {
                            string[] arrs = userIds.Split(',');
                            StringBuilder strName = new StringBuilder();
                            StringBuilder strpurse = new StringBuilder();

                            foreach (string s in arrs)
                            {
                                mui = this.bll.SeachByID(int.Parse(s));
                                strName.Append("<a href='" + CustomerPageAction.customPath2 + "User/Userinfo.aspx?id=");
                                strName.Append(mui.UserID);
                                strName.Append("'>");
                                strName.Append(mui.UserName);
                                strName.Append("</a>&nbsp&nbsp;&nbsp;");
                                GuestScore = mui.GuestScore;
                                strpurse.Append(mui.UserExp);
                                strpurse.Append("&nbsp;&nbsp;");
                            }
                            lbUserName.Text = strName.ToString();
                            this.HdnUserID.Value = userIds;
                            this.lblExp.Text = strpurse.ToString();
                        }
                        else
                        {
                            int UserID = DataConverter.CLng(base.Request.QueryString["UserID"]);
                            mui = this.bll.SeachByID(UserID);
                            this.HdnUserID.Value = UserID.ToString();
                            mui = this.bll.SeachByID(UserID);
                            lbUserName.Text = mui.UserName;
                            this.lblExp.Text = GetExp(mui).ToString();
                        }
                    }
                }
                DataBind();
            }
            Call.SetBreadCrumb(Master, "<li><a href='" + CustomerPageAction.customPath2 + "Main.aspx'>工作台</a></li><li><a href='" + customPath2 + "User/UserManage.aspx'>会员管理</a></li><li><a href='UserInfo.aspx?ID=" + Request.QueryString["UserID"] + "'>会员信息</a></li><li class='active'>会员"+GetTypeName()+"操作</li>");
        }
        public void DataBind(string key = "")
        {
            DataTable dt = hisBll.SelByType_U(ExpType, Convert.ToInt32(Request.QueryString["UserID"]));
            Egv.DataSource = dt;
            Egv.DataBind();
        }
        protected void Egv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Egv.PageIndex = e.NewPageIndex;
            DataBind();
        }
        protected void Egv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName.ToLower())
            {
                case "edit1":
                    UserPDiv.Visible = false;
                    EditMoney.Visible = true;
                    expMod = B_History.GetExpHis(Convert.ToInt32(e.CommandArgument.ToString()));
                    UserExpDomPID.Text = expMod.ExpHisID.ToString();
                    HisTime.Text = expMod.HisTime.ToString();
                    Score.Text = expMod.score.ToString();
                    Detail.Text = expMod.detail;
                    UserPH.Value = expMod.ExpHisID.ToString();
                    break;
                default:
                    break;
            }
        }
        public string GetUserName(string adminid)
        {
            M_AdminInfo info = B_Admin.GetAdminByAdminId(DataConverter.CLng(adminid));
            if (info != null)
            {
                return info.AdminName;
            }
            else
            {
                return "";
            }
        }
        //根据类型获取币种值
        public double GetExp(M_UserInfo mu)
        {
            switch (ExpType)
            {
                case 1:
                    return mu.Purse;
                case 2:
                    return mu.SilverCoin;
                case 3:
                    return mu.UserExp;
                case 4:
                    return mu.UserPoint;
                case 5:
                    return mu.DummyPurse;
                case 6:
                    return mu.UserCreit;
                default:
                    return 0;
            }
        }
        //获取币种类型名称
        public string GetTypeName()
        {
            switch (ExpType)
            {
                case 1:
                    return "余额";
                case 2:
                    return "银币";
                case 3:
                    return "积分";
                case 4:
                    return "点卷";
                case 5:
                    return "虚拟币";
                case 6:
                    return "信誉值";
                default:
                    return "";
            }
        }
        protected void EBtnSubmit_Click(object sender, EventArgs e)
        {
            if (isOK())
            {
                double score = DataConverter.CDouble(TxtScore.Text.Trim());
                string option = "增加";
                if (rblExp.SelectedValue.Equals("2"))
                {
                    option = "扣减";
                    score = DataConverter.CDouble("-" + TxtScore.Text.Trim());
                }
                bll.ChangeVirtualMoney(Convert.ToInt32(Request.QueryString["UserID"]), new M_UserExpHis()
                {
                    score = score,
                    ScoreType = ExpType,
                    detail = "管理员" + option + "用户" + GetTypeName() + ":" + DataConverter.CLng(TxtScore.Text.Trim())
                });
                function.WriteSuccessMsg(option + GetTypeName() + "成功!");
            }
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Userinfo.aspx?id=" + this.HdnUserID.Value);
        }
        public bool isOK()
        {
            bool flag = true;
            M_UserInfo him = bll.GetUserByName(SourceMem.Text.Trim());
            M_UserInfo me = bll.GetUserByName(lbUserName.Text);
            if (him.UserID == me.UserID)
                function.WriteErrMsg("账户名不能相同");
            double score = DataConverter.CDouble(TxtScore.Text.Trim());
            if (score < 0) { function.WriteErrMsg("分值必须为正整数"); }
            if (rblExp.SelectedValue.Equals("2"))
            {
                bool meflag = false;//该用户判断状态
                bool himflag = false;//陪同用户判断状态
                double me_exp = 0;//该用户分值
                double him_exp = 0;//陪同用户分值
                switch (ExpType)
                {
                    case 1://余额
                        meflag = me.Purse < score;
                        me_exp = me.Purse;
                        himflag = him.Purse < score;
                        him_exp = him.Purse;
                        break;
                    case 2://银币
                        meflag = me.SilverCoin < score;
                        me_exp = me.SilverCoin;
                        himflag = him.SilverCoin < score;
                        him_exp = him.SilverCoin;
                        break;
                    case 3://积分
                        meflag = me.UserExp < score;
                        me_exp = me.UserExp;
                        himflag = him.SilverCoin < score;
                        him_exp = him.UserExp;
                        break;
                    case 4://点卷
                        meflag = me.UserPoint < score;
                        me_exp = me.UserPoint;
                        himflag = him.UserPoint < score;
                        him_exp = him.UserPoint;
                        break;
                    case 5://虚拟币
                        meflag = me.DummyPurse < score;
                        me_exp = me.DummyPurse;
                        himflag = him.DummyPurse < score;
                        him_exp = him.DummyPurse;
                        break;
                    case 6://信誉值
                        meflag = me.UserCreit < score;
                        me_exp = me.UserCreit;
                        himflag = him.UserCreit < score;
                        him_exp = him.UserCreit;
                        break;
                }
                if (meflag)
                    function.WriteErrMsg("会员" + me.UserName + "仅有"+GetTypeName()+":" + me_exp + "不够扣减");
                if (himflag && !him.IsNull)
                    function.WriteErrMsg("会员" + him.UserName + "仅有" + GetTypeName() + ":" + him_exp + "不够扣减");
            }
            return flag;
        }
        protected void EditBtn_Click(object sender, EventArgs e)
        {
            expMod.HisTime = DateTime.Parse(HisTime.Text);
            expMod.Operator = badmin.GetAdminLogin().AdminId;
            expMod.score = Convert.ToDouble(Score.Text);
            //修改日志
            if (expMod.score >= 0)
            {
                if (expMod.ScoreType == 2)
                    expMod.detail = "管理员添加问答积分:" + expMod.score;
                else
                    expMod.detail = "管理员添加系统积分:" + expMod.score;
            }
            else
            {
                if (expMod.ScoreType == 2)
                    expMod.detail = "管理员扣减问答积分:" + (Convert.ToInt32(-expMod.score));
                else
                    expMod.detail = "管理员扣减系统积分:" + (Convert.ToInt32(-expMod.score));
            }
            B_History.UpdateByID(expMod);
            Response.Redirect(Request.RawUrl);
        }
    }
}