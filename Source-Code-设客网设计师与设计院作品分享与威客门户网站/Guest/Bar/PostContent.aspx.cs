using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.BLL.Helper;
using ZoomLa.BLL.Message;
using ZoomLa.Common;
using ZoomLa.Model;
using ZoomLa.Model.Message;
using ZoomLa.SQLDAL;
using ZoomLa.BLL.User;
using ZoomLa.Components;

public partial class Guest_Bar_PostContent : CustomerPageAction
{
    M_Guest_Bar barMod = new M_Guest_Bar();
    B_Guest_Bar barBll = new B_Guest_Bar();
    B_Guest_BarAuth authBll = new B_Guest_BarAuth();
    B_User buser = new B_User();
    RegexHelper regHelper = new RegexHelper();
    B_Group bgp = new B_Group();
    M_Uinfo users = new M_Uinfo();
    M_UserInfo userinfo = new M_UserInfo();
    public int replyPageSize = 5;
    public int curPageSize = 10;
    B_User ubll = new B_User();
    B_User_Friend ufbll = new B_User_Friend();
    B_TempUser tpuserBll = new B_TempUser();
    B_GuestBook bookBll = new B_GuestBook();
    public string Filter
    {
        get { return string.IsNullOrEmpty(Request.QueryString["Filter"]) ? "" : Request.QueryString["Filter"]; }
    }
    //贴子ID
    public int Pid { get { return DataConvert.CLng(Request.QueryString["id"]); } }
    public int Cid { get { return ViewState["cid"] == null ? 0 : Convert.ToInt32(ViewState["cid"]); } set { ViewState["cid"] = value; } }
    //未登录用户则隐藏贴子
    public bool HidePost
    {
        get
        {
            if (ViewState["HidePost"] == null)
                ViewState["HidePost"] = false;
            return (bool)ViewState["HidePost"];
        }
        set { ViewState["HidePost"] = value; }
    }
    private string HideTlp = "";
    private string AlertTlp = "<div class='alert alert-danger' role='alert'><span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span><span class='sr-only'>提示:</span>该贴子内容已被屏蔽！您拥有管理权限，以下是贴子内容</div>";
    private string UserAlertTlp = "<div class='alert alert-danger' role='alert'><span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span><span class='sr-only'>提示:</span>该贴子内容已被屏蔽！</div>";
    private bool IsBarOwner = false;
    public int UserID
    {
        get
        {
            if (ViewState["UserID"] == null)
            {
                ViewState["UserID"] = tpuserBll.GetLogin().UserID;
            }
            return Convert.ToInt32(ViewState["UserID"]);
        }
    }
    public int CPage
    {
        get
        {
            return PageCommon.GetCPage();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (function.isAjax())
        {
            string action = Request.Form["action"];
            string value = Request.Form["value"];
            string msg = ""; int pid = 0, id = 0;
            string result = "1" + ":" + Pid;
            M_UserInfo user = buser.GetLogin();
            switch (action)
            {
                case "DeleteMsg"://删除
                    id = Convert.ToInt32(value);
                    result = barBll.UpdateStatus(barBll.SelReturnModel(id).CateID,id.ToString(),(int)ZLEnum.ConStatus.Recycle) ? "ok" :"failed";
                    break;
                case "AddReply"://回复
                    pid = Convert.ToInt32(value.Split(':')[0]);
                    msg = value.Split(':')[1];
                    barBll.Insert(FillMsg(msg, pid, Pid));
                    break;
                case "AddReply2"://回复用户,需要切换为Json
                    pid = Convert.ToInt32(value.Split('$')[0]);
                    msg = value.Split('$')[1];
                    barBll.Insert(FillMsg(msg, pid, Pid));
                    break;
                case "AddColl":
                    if (user!=null&&user.UserID>0)
                        result=barBll.LikeTie(DataConvert.CLng(value), user.UserID, 1)?"1":"0";
                    else
                        result = "-1";
                    break;
                case "ReColl":
                    if (user != null && user.UserID > 0)
                        result = barBll.LikeTie(DataConvert.CLng(value), user.UserID, 2) ? "1" : "0";
                    break;
            }
            Response.Write(result); Response.Flush(); Response.End();
        }
        HideTlp = "你当前没有登录,请<a href='/User/Login.aspx?returnUrl=/" + CreateUrl(2,Pid) + "'>登录</a>后查看该贴";
        if (!IsPostBack)
        {
            MyBind();
        }
    }
    public void MyBind()
    {
        int pageCount = 0;
        DataTable dt = new DataTable();
        barMod = barBll.SelReturnModel(Pid);
        if (barMod == null) function.WriteErrMsg("该贴子不存在!!");
        M_GuestBookCate cateMod = bookBll.GetCate(barMod.CateID);
        M_UserInfo mu = tpuserBll.GetLogin();//barBll.GetUser();
        if (barMod.Status!=(int)ZLEnum.ConStatus.Audited&&cateMod.Status!=1)
        {
            function.WriteErrMsg("该贴子需要审核通过才能浏览！");
        }
        if (cateMod.IsBarOwner(mu.UserID))//吧主
        {
            barowner_div.Visible = true;
            IsBarOwner = true;
        }
        else
        {
            if (!authBll.AuthCheck(cateMod, mu))
            {
                function.WriteErrMsg("你没有访问权限或未登录,请<a href='/User/Login.aspx?Returnurl=/" + B_Guest_Bar.CreateUrl(2, Pid, CPage) + "'>登录</a>后查看");
                //if (cateMod.NeedLog == 1 && mu.UserID == 0) function.WriteErrMsg("该栏目必须<a href='/User/Login.aspx?returnUrl=/Post" + Pid + "/Default_1.aspx'>登录</a>后才能访问");
            }
            if ((!authBll.AuthCheck(cateMod, mu, "send")))
            {
                send_div.Visible = false;
                noauth_div.Visible = true;
            }
        }
        dt = barBll.SelByID(Pid);
        barBll.AddHitCount(Pid);
        hitcount_span.InnerText = (barMod.HitCount+1).ToString();
        dt.Columns.Add("Layer", typeof(int));
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dt.Rows[i]["Layer"] = (i + 1);
        }
        if (Filter.Contains("OnlyLayer"))
        {
            dt.DefaultView.RowFilter = "CUser = " + barMod.CUser;
            dt = dt.DefaultView.ToTable();
        }
        //---------
        MsgRepeater.DataSource = PageCommon.GetPageDT(curPageSize, CPage, dt, out pageCount);
        MsgRepeater.DataBind();
        MsgPage_L.Text = PageCommon.CreatePageHtml(pageCount, CPage);
        replynum_span1.InnerText = (dt.Rows.Count - 1).ToString();
        pagenum_span1.InnerText = pageCount.ToString();
        Span1.InnerText = (dt.Rows.Count - 1).ToString();
        Span2.InnerText = pageCount.ToString();
        Title_L.Text = barMod.Title;
        PostName_L.Text = barMod.Title;
        Cid = barMod.CateID;
        if (barMod.Status < 0 && barMod.Status == (int)ZLEnum.ConStatus.Recycle) function.WriteErrMsg("该帖子已删除!!", "/" + B_Guest_Bar.CreateUrl(1, Cid));
        function.Script(this, "SetImg('" + cateMod.BarImage + "');");
        ReturnBar_a.Text = "<i class='fa fa-arrow-circle-left'></i>返回" + cateMod.CateName;
        ReturnBar_a.NavigateUrl = "/"+CreateUrl(1,Cid);
        int mcount = 0, rcount = 0;
        barBll.GetCount(Cid, out mcount, out rcount);
        if (!barMod.LikeIDS.Contains("," + mu.UserID + ","))
            LikeBtn_Li.Text = string.Format("<input type='button' value='收藏' id='liketie' onclick='LikeTie(this,{0})'class='btn btn-xs btn-primary' />",Pid);
        else
            LikeBtn_Li.Text = "<input type='button' value='取消收藏' id='liketie' onclick='LikeTie(this," + Pid + ")'class='btn btn-xs btn-primary liked' />";
        //判断是否显示编辑按钮
        if (UserID == barMod.CUser)
            EditBtn_DIV.Visible = true;
    }
    protected void MsgRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            if (HidePost) return;
            //加载用户回复列表
            DataRowView dr = e.Item.DataItem as DataRowView;
            if (Convert.ToInt32(dr["Pid"]) > 0)
            {
                int pid = Convert.ToInt32(dr["ID"]);
                Literal replyList = e.Item.FindControl("ReplyList_L") as Literal;
                StringWriter sw = new StringWriter();
                Server.Execute("/Guest/Bar/ReplyList.aspx?pid=" + pid + "&PageSize=" + replyPageSize + "&PageIndex=1", sw);
                replyList.Text = Regex.Match(sw.ToString(), "(?<=(start>))[.\\s\\S]*?(?=(</start))", RegexOptions.IgnoreCase).Value;
            }
        }
    }
    //添加一条分享
    public M_Guest_Bar FillMsg(string msg, int pid,int rid=0)
    {
        string base64 = StrHelper.CompressString(msg);
        if (base64.Length > 40000) function.WriteErrMsg("发贴失败,原因:内容过长,请减少内容文字");
        M_UserInfo mu = tpuserBll.GetLogin("匿名用户");//barBll.GetUser();
        M_Guest_Bar parent=barBll.SelReturnModel(pid);
        M_Guest_Bar model = new M_Guest_Bar();
        model.MsgType = 1;
        model.Status = (int)ZLEnum.ConStatus.Audited;
        model.CUser = mu.UserID;
        model.CUName = mu.HoneyName;
        model.R_CUName = mu.HoneyName;
        model.IDCode = mu.UserID <= 0 ? mu.WorkNum : mu.UserID.ToString();
        model.MsgContent = base64;
        model.Pid = pid;
        model.ReplyID = rid;
        model.CateID = parent.CateID;
        model.IP = EnviorHelper.GetUserIP();
        string ipadd = IPScaner.IPLocation(model.IP);
        ipadd = ipadd.IndexOf("本地") > 0 ? "未知地址" : ipadd;
        model.IP = model.IP + "|" + ipadd; 
        model.ColledIDS = "";
        AddUserExp(mu, parent.CateID, parent.Title);
        return model;
    }
    protected void PostMsg_Btn_Click(object sender, EventArgs e)
    {
        M_UserInfo mu = tpuserBll.GetLogin();//barBll.GetUser();
        if (mu.Status != 0)
            function.WriteErrMsg("您的账户已被锁定，无法进行发帖、回复等操作！");
        M_Guest_Bar lastMod = barBll.SelLastModByUid(mu, false);
        M_GuestBookCate catemod = bookBll.GetCate(Cid);
        BarOption baroption = GuestConfig.GuestOption.BarOption.Find(v => v.CateID == Cid);
        int usertime = baroption == null ? 120 : baroption.UserTime;
        int sendtime = baroption == null ? 5 : baroption.SendTime;
        if (!ZoomlaSecurityCenter.VCodeCheck(Request.Form["VCode_hid"], VCode.Text.Trim()))
        {
            function.WriteErrMsg("验证码不正确", "/" + CreateUrl(2, Pid, CPage));
        }
        else if (catemod.IsBarOwner(mu.UserID))
        {

        }
        else if (mu.UserID > 0 && (DateTime.Now - mu.RegTime).TotalMinutes < usertime)//匿名用户不受此限
        {
            int minute = usertime - (int)(DateTime.Now - mu.RegTime).TotalMinutes;
            function.WriteErrMsg("新注册用户" + usertime + "分钟内不能发贴,你还需要" + minute + "分钟", "javascript:history.go(-1);");
        }
        else if (lastMod != null && ((int)(DateTime.Now - lastMod.CDate).TotalMinutes) < sendtime)
        {
            int second = sendtime - (int)(DateTime.Now - lastMod.CDate).TotalMinutes;
            function.WriteErrMsg("你回复太快了," + second + "分钟后才能再次回复", "javascript:history.go(-1);");
        }
        barMod = FillMsg(MsgContent_T.Text, Pid);
        barBll.Insert(barMod);
        Response.Redirect(CreateUrl(2, Pid, CPage));
    }
    //回复加积分操作
    private void AddUserExp(M_UserInfo mu, int cateid,string title)
    {
        if (mu.UserID != 0)//是否匿名
        {
            M_GuestBookCate catemod = new B_GuestBook().SelReturnModel(cateid);
            buser.ChangeVirtualMoney(mu.UserID, new M_UserExpHis() 
            { 
                score=catemod.ReplyScore,
                detail=string.Format("{0} {1}在版面:{2}回复主题:{3},赠送{4}分", DateTime.Now, mu.UserName, catemod.CateName, title, catemod.ReplyScore),
                ScoreType=(int)M_UserExpHis.SType.Point
            });
        }
    }
    //------------
    public string GetDel(int type=0)
    {
        int uid = DataConvert.CLng(Eval("CUser"));
        int isfirst = Convert.ToInt32(Eval("Pid")) == 0 ? 1 : 2;
        if (((UserID == uid&&uid!=0) || IsBarOwner)&&type==0)
        {
            return "<a href='/EditContent?ID=" + Eval("ID") + "' title='编辑' style='margin-right:5px;'><span class='glyphicon glyphicon-pencil'></span></a> <a href='javascript:;' onclick='PostDelMsg(" + Eval("ID") + "," + isfirst + ")' title='删除'><span class='glyphicon glyphicon-trash'></span> </a>"+(IsBarOwner?"<input type='checkbox' name='idchk' value='" + Eval("ID") + "'/>":"");
        }
        if (((UserID == uid && uid != 0) || IsBarOwner) && type == 1)
            return "<a href='/EditContent?ID=" + Eval("ID") + "'>编辑</a><a href='javascript:;' onclick='PostDelMsg(" + Eval("ID") + "," + isfirst + ")'>删除</a>";
        return "";
    }
    public string GetReply()
    {
        return Convert.ToInt32(Eval("Pid")) > 0 ? "<a id='msg_toggle_a_" + Eval("ID") + "' onclick='DisReply(" + Eval("ID") + ");' style='cursor:pointer;'>收起回复</a>" : "";
    }
    public string GetUrl(string url)
    {
        return url+"&Pid="+Pid;
    }
    public string GetMsg()
    {
        string result = "";
        if (HidePost)
        {
            result = HideTlp;
        }
        else if (DataConvert.CLng(Eval("Status")) == -2)
        {
            if (IsBarOwner)
            {
                result = AlertTlp + StrHelper.DecompressString(Eval("MsgContent").ToString());
            }
            else
            {
                result = UserAlertTlp;
            }
        }
        else
        {
            result =StrHelper.DecompressString(Eval("MsgContent").ToString());
        }
        return result;
    }
    public string GetUserInfo(string str)
    {
        int id = DataConvert.CLng(Eval("CUser"));
        if (str.Equals("groupName"))
        {
            userinfo = buser.GetUserByUserID(id); 
            return bgp.GetByID(DataConverter.CLng(userinfo.GroupID)).GroupName;
        }
        else if (str.Equals("count"))
        {
            DataTable dt = new DataTable();
            dt = barBll.SelByCateID(id.ToString(), 2);
            return dt.Rows.Count + "";
        }
        else if (str.Equals("userBirth"))
        {
            users = buser.GetUserBaseByuserid(id);
            return users.BirthDay;
        }
        else if (str.Equals("userExp"))
        {
            userinfo = buser.GetUserByUserID(id);
            return userinfo.UserExp+"";             
        }
        else if (str.Equals("userSex"))
        {
            users = buser.GetUserBaseByuserid(id);
            if ((users.UserSex + "") == "False")
            {
                return "女";
            }
            else
            {
                return "男";
            }

        }
        else if (str.Equals("regTime"))
        {
            DateTime datetime =tpuserBll.GetLogin().RegTime;
            return datetime.Year + "-" + datetime.Month + "-" + datetime.Day;
        }
        else
        {
            return "";
        }

    }
    public string GetUserFace() 
    {
        return Eval("UserFace") == DBNull.Value ? "" : Eval("UserFace").ToString();
    }
    public string GetHref() 
    {
        int uid = Convert.ToInt32(Eval("CUser") == DBNull.Value ? 0 : Eval("CUser"));
        string result="";
        if (uid > 0)
            result = "href='"+CreateUrl(1,"0")+"?uid="+uid+"'";
        return result;
    }
    public string CreateUrl(int type, object id, int page = 1)
    {
        if (id != DBNull.Value)
        {
            return B_Guest_Bar.CreateUrl(type, Convert.ToInt32(id), page);
        }
        return "";
    }
    public string GetUName()
    {
        return barBll.GetUName(Eval("HoneyName"), Eval("CUName"));
    }
    protected void Bar_Btn_Click(object sender, EventArgs e)
    {
        M_GuestBookCate cateMod = bookBll.GetCate(Cid);
        int uid = buser.GetLogin().UserID;
        string ids = Request.Form["idchk"];
        if (cateMod.IsBarOwner(uid) && !string.IsNullOrWhiteSpace(ids))
        {
            switch ((sender as Button).CommandArgument)
            {
                case "Del":
                    barBll.UpdateStatus(Cid, ids, (int)ZLEnum.ConStatus.Recycle);
                    if (ids.Contains(Pid.ToString())) Response.Redirect("/" + CreateUrl(1, Cid));
                    break;
                case "AddTop":
                    barBll.UpdateTop(ids, true);
                    break;
                case "RemoveTop":
                    barBll.UpdateTop(ids, false);
                    break;
                case "AddRecom":
                    barBll.UpdateRecommend(ids, true);
                    break;
                case "RemoveRecom":
                    barBll.UpdateRecommend(ids, false);
                    break;
                case "AddBottom":
                    barBll.UpdateDown(ids, true);
                    break;
                case "RemoveBottom":
                    barBll.UpdateDown(ids, false);
                    break;
                case "Hidden":
                    barBll.UpdateStatus(Cid, ids, -2);
                    break;
                case "CancelHidden":
                    barBll.UpdateStatus(Cid, ids, (int)ZLEnum.ConStatus.Audited);
                    break;
                 
            }
        }
        MyBind();
    }
    
}