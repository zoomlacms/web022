using System;
using System.IO;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml;
using ZoomLa.Common;
using ZoomLa.Components;
using ZoomLa.Model;
using ZoomLa.SQLDAL;

using ZoomLa.BLL;
using ZoomLa.BLL.Content;
using ZoomLa.BLL.Helper;

public partial class Manage_I_Content_ContentManage : CustomerPageAction
{
    protected B_Admin badmin = new B_Admin();
    protected B_Content bll = new B_Content();
    protected B_Create CreateBll = new B_Create();
    protected B_ModelField bfield = new B_ModelField();
    protected B_Model bmodel = new B_Model();
    protected B_Node bNode = new B_Node();
    protected B_User buser = new B_User();
    protected B_NodeBindDroit droBll = new B_NodeBindDroit();
    protected ContentHelper conHelper = new ContentHelper();
    protected string status;
    //与当前导入相关类
    protected ExcelImport import = new ExcelImport();//位于ZoomLa.Components
    //--------------
    private IList<M_AuditingState> StatusCodeList
    {
        get
        {
            if (ViewState["StatusCodeDT"] == null)
            {
                B_AuditingState stateBll = new B_AuditingState();
                ViewState["StatusCodeDT"] = stateBll.GetAuditingStateAll();
            }
            return ViewState["StatusCodeDT"] as IList<M_AuditingState>;
        }
        set
        {
            ViewState["StatusCodeDT"] = value;
        }
    }
    private int CNodeID//地址栏NodeID,默认为0
    {
        get
        {
            return DataConvert.CLng(ViewState["CNodeID"]);
        }
        set
        {
            ViewState["CNodeID"] = value;
        }
    }
    private int CModelID
    {
        get
        {
            return DataConvert.CLng(ViewState["ModelID"]);
        }
        set { ViewState["ModelID"] = value; }
    }
    private string KeyWord //关键词搜索
    {
        get
        {
            string result = "";
            if (ViewState["KeyWord"] != null)
            {
                result = ViewState["KeyWord"].ToString();
            }
            return HttpUtility.HtmlDecode(result);
        }
        set
        {
            ViewState["KeyWord"] = value;
        }
    }
    //前端Type选择
    public int SelType
    {
        get
        {
            int result = 0;
            if (ViewState["type"] != null)
            {
                Int32.TryParse(ViewState["type"].ToString(), out result);
            }
            return result;
        }
        set { ViewState["type"] = value; }
    }
    //0:按标题,Gid,1:按作者
    private int KeyType { get { return DataConvert.CLng(Request.QueryString["KeyType"]); } }
    //--------------
    //-----工作流
    protected void Page_Load(object sender, EventArgs e)
    {
        RPT.SPage = SelPage;
        if (function.isAjax())
        {
            #region AJAX
            string result = "";
            switch (Request.Form["action"])
            {
                case "Move":
                    string[] oids = Request.Form["oid"].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    string[] nids = Request.Form["nid"].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    M_CommonData ocomodel = bll.GetCommonData(DataConvert.CLng(oids[0]));
                    ocomodel.OrderID = DataConvert.CLng(nids[1]);
                    M_CommonData ncomodel = bll.GetCommonData(DataConvert.CLng(nids[0]));
                    ncomodel.OrderID = DataConvert.CLng(oids[1]);
                    bll.UpdateByID(ocomodel);
                    bll.UpdateByID(ncomodel);
                    result = "true";
                    break;
                default:
                    break;
            }
            Response.Write(result); Response.Flush(); Response.End();
            #endregion
        }
        if (!IsPostBack)
        {
            //ViewState["flag"] = Request.QueryString["flag"];
            ViewState["type"] = Request.QueryString["type"];
            CModelID = DataConvert.CLng(Request.QueryString["ModelID"]);
            CNodeID = DataConvert.CLng(Request.QueryString["NodeID"]);
            M_Node nod = this.bNode.GetNodeXML(CNodeID);
            if (CNodeID != 0) //生成添加文章链接
            {
                //商城节点
                if (nod.NodeListType == 2) { Response.Redirect("../Shop/ProductManage.aspx?NodeID=" + CNodeID); }
                string ModeIDList = nod.ContentModel;
                string[] ModelID = ModeIDList.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                M_ModelInfo modelInfo = new M_ModelInfo();
                string temp = "<div class=\"btn-group\"><button type=\"button\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\">{0}管理<span class=\"caret\"></span></button><ul class=\"dropdown-menu\" role=\"menu\"><li><a href=\"AddContent.aspx?ModelID={1}&NodeID={2}\">添加{0}</a></li><li><a href=\"ContentManage.aspx?ModelID={1}&NodeID={2}\">导入{0}</a></li><li><a href=\"ContentManage.aspx?NodeID={2}\">{0}列表</a></li></ul></div>";
                for (int i = 0; i < ModelID.Length; i++)
                {
                    modelInfo = bmodel.GetModelById(DataConvert.CLng(ModelID[i]));
                    lblAddContent.Text += String.Format(temp, modelInfo.ItemName, modelInfo.ModelID, CNodeID);
                }
                //if (nod.NodeListType == 2)
                //{
                //    Response.Write("<script language=javascript:location.href='" + customPath2 + "Shop/ProductManage.aspx?NodeID=" + CNodeID + "';</script>");
                //}
            }
            KeyWord = Request.QueryString["KeyWord"];
            RPT.DataBind();
            string link = "<li><a href='" + customPath2 + "Main.aspx'>工作台</a></li><li><a href='ContentManage.aspx'>内容管理</a></li>";
            link += "<li><a href='"+ Request.RawUrl+"'>按栏目管理</a></li>";
            link += "<li class='active'><a href='" + Request.RawUrl + "' title='" + nod.NodeName + "'>" + nod.NodeName + "</a></li>";
            link += "<div class='pull-right hidden-xs'>";
            link += "<span><a href='" + customPath2 + "Content/SchedTask.aspx' title='查看计划任务'><span class='glyphicon glyphicon-time' style='color:#28b462;'></span></a>";
            link += GetOpenView() + "<span onclick=\"opentitle('EditNode.aspx?NodeID=" + CNodeID + "','配置本节点');\" class='glyphicon glyphicon-cog' title='配置本节点' style='cursor:pointer;margin-left:5px;'></span></span>";
            link += "</div>";
            Call.SetBreadCrumb(Master, link);
        }//IsPostBack End;
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        clearCache();
    }
    //超级管理员显示审核按钮,其他管理员走工作流审批流程
    public DataTable SelPage(int pageSize,int pageIndex)
    {
        string title = KeyWord;
        //string byfilde = ViewState["byfilde"] == null ? "" : ViewState["byfilde"].ToString();
        //string byOrder = ViewState["byOrder"] == null ? "" : ViewState["byOrder"].ToString();
        M_AdminInfo ad = badmin.GetAdminLogin();
        DataTable dts = new DataTable();
        switch (SelType)//文章已审,未审等筛选
        {
            case 1:
                status = "-3";
                this.btnEsc.Enabled = false;
                this.btnEsc.CssClass = "btn btn-primary";
                break;
            case 2:
                btnAudit.Visible = true;
                status = ((int)ZLEnum.ConStatus.UnAudit).ToString();
                break;
            case 3:
                status = ((int)ZLEnum.ConStatus.Audited).ToString();
                break;
            case 4:
                status = ((int)ZLEnum.ConStatus.Reject).ToString();
                this.btnEsc.Attributes.Add("disabled", "disabled");
                break;
            default:
                break;
        }
        //----------------工作流,其与角色绑定，不分是否超管(需将其改为视图)
        if (SelType==5)//工作流审批
        {
            if (!string.IsNullOrEmpty(Request.QueryString["NodeID"]))
            {
                dts = bll.GetDTByAuth(badmin.GetAdminLogin().RoleList, CNodeID);
            }
            else//获取全部
            {
                dts = bll.GetDTByAuth(badmin.GetAdminLogin().RoleList);
            }
            btnUnAudit.Visible = false;
            audit_Div.Visible = true;
            return dts;
        }
        if (!badmin.GetAdminLogin().IsSuperAdmin())//非超级管理员(用视图,组合权限表)
        {
            //筛选数据,如何筛选
            DataTable authDT = badmin.GetNodeAuthList();
            if (authDT == null || authDT.Rows.Count < 1) return new DataTable();//没有分配角色,或权限为空
            string nodes = "";
            foreach (DataRow dr in authDT.Rows)
            {
                nodes += dr["NID"].ToString() + ",";
            }
            if (CNodeID == 0 && !string.IsNullOrEmpty(nodes))//如果是全部文章,则筛选后输出
            {
                //function.WriteErrMsg(status);
                dts = bll.SelPage(pageIndex, pageSize, CNodeID, status, KeyType, title, nodes);
            }
            else//如果是节点,判断用户权限,避免其直接通过URL地址进入
            {
                if (("," + nodes).Contains("," + CNodeID + ","))
                {
                    dts = bll.SelPage(pageIndex, pageSize, CNodeID, status, KeyType, title, nodes);
                }
                else
                {
                    function.WriteErrMsg("你没有该节点的访问权限，请联系[系统管理员]!!!");
                }
            }
        }
        else //超级管理员
        {
            dts = bll.SelPage(pageIndex, pageSize, CNodeID, status, KeyType, title);
        }
        if (!IsPostBack)
        {
            DataRow dr = bll.SelPageCount(bll.SelWhere);
            RPT.ItemCount = DataConvert.CLng(dr["Total"]);
            WZS.Text = RPT.ItemCount.ToString();
            DJS.Text = dr["Hits"].ToString();
        }
        return dts;
    }
    protected void btnAudit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request.Form["idchk"])) return;
        string[] idArr = Request.Form["idchk"].Split(',');
        M_AdminInfo ad = badmin.GetAdminLogin();
        string unAud = "";
        for (int i = 0; i < idArr.Length; i++)
        {
            if (!ad.IsSuperAdmin() && !GetRole(bll.GetCommonData(Convert.ToInt32(idArr[i])).NodeID, "State"))
            {
                unAud += idArr[i] + ",";
            }
            else
            {
                this.Auditing();
            }
        }
        if (!string.IsNullOrEmpty(unAud)) Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert(" + unAud + "无权限审核);location=location;", true);
        else Page.ClientScript.RegisterStartupScript(this.GetType(), "", "location=location;", true);
    }
    //取消审核
    protected void btnUnAudit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request.Form["idchk"])) return;
        string[] idArr = Request.Form["idchk"].Split(',');
        M_AdminInfo ad = badmin.GetAdminLogin();
        string unAud = "";
        for (int i = 0; i < idArr.Length; i++)
        {
            M_CommonData mcom = bll.GetCommonData(Convert.ToInt32(idArr[i]));
            M_UserInfo userinfo = buser.GetUserIDByUserName(mcom.Inputer);
            if (!ad.IsSuperAdmin() && !GetRole(mcom.NodeID, "State"))
            {
                unAud += idArr[i] + ",";
            }
            else
            {
                if (mcom.Status != 0)
                {
                    //判断是否会员添加、添加会员积分
                    if (SiteConfig.UserConfig.InfoRule > 0)
                    {
                        buser.ChangeVirtualMoney(userinfo.UserID, new M_UserExpHis()
                        {
                            score = SiteConfig.UserConfig.InfoRule,
                            detail = mcom.Title,
                            ScoreType = (int)M_UserExpHis.SType.Point
                        });
                    }
                    this.bll.Reset(Convert.ToInt32(idArr[i]));
                }

            }
        }
        DataBind();
    }
    //退稿
    protected void btnEsc_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request.Form["idchk"])) return;
        string[] idArr = Request.Form["idchk"].Split(',');
        M_AdminInfo ad = badmin.GetAdminLogin();
        //string unAud = "";
        for (int i = 0; i < idArr.Length; i++)
        {
            M_CommonData mcom = bll.GetCommonData(Convert.ToInt32(idArr[i]));
            string username = mcom.Inputer;
            M_UserInfo userinfo = buser.GetUserIDByUserName(username);
            if (!ad.IsSuperAdmin() && !GetRole(mcom.NodeID, "State"))
            {
                //unAud += idArr[i] + ",";
            }
            else
            {
                this.bll.SetAudit(Convert.ToInt32(idArr[i]), -1);
            }
        }
        DataBind();
    }
    //非前台使用
    public bool GetRole(int nid, string authType)
    {
        bool result = false;
        M_AdminInfo ad = badmin.GetAdminLogin();
        if (ad.IsSuperAdmin())
        {
            result = true;
        }
        else
        {
            DataTable dt = badmin.GetNodeAuthList();
            dt.DefaultView.RowFilter = "NID=" + nid + " And " + authType + " = 1";
            if (dt.DefaultView.ToTable().Rows.Count > 0) result = true;
        }
        return result;
    }
    //中标信息,obj=ID
    protected bool getBid(object obj)
    {
        DataTable dt = new DataTable();
        bool b = false;
        if (ViewState["BinderDT"] == null)
        {
            B_Bider bidBll = new B_Bider();
            ViewState["BinderDT"] = bidBll.Sel();
        }
        dt = ViewState["BinderDT"] as DataTable;
        if (dt.Rows.Count > 1)
        {
            int bid = DataConvert.CLng(dt.Select("GeneralID='" + obj.ToString() + "'")[0]["ID"]);
            if (bid > 0)
            {
                b = true;
            }
        }
        return b;
    }
    //审核
    protected void Auditing()
    {
        //查询该用户所拥有的角色
        string roleList = badmin.GetAdminLogin().RoleList;
        string[] chkArr = GetChecked();
        if (chkArr != null)
        {
            for (int i = 0; i < chkArr.Length; i++)
            {
                int itemID = Convert.ToInt32(chkArr[i]);
                int status = 99;
                if (!string.IsNullOrEmpty(roleList))
                {
                    string[] strs = roleList.Split(new char[] { ',' });
                    foreach (string str in strs)
                    {
                        if (str == "0")
                        {
                            status = 99;
                            break;
                        }
                    }
                }
                #region  判断审核通过是否添加积分
                M_CommonData mcom = bll.GetCommonData(itemID);
                if (mcom != null && mcom.GeneralID > 0)
                {
                    if (mcom.Status == 99)
                    {
                        continue;
                    }
                    int userexp = 0;
                    M_Node node = bNode.GetNodeXML(mcom.NodeID);
                    string username = mcom.Inputer;
                    M_UserInfo userinfo = buser.GetUserIDByUserName(username);
                    if (node != null && node.NodeID > 0)
                    {
                        userexp = node.AddUserExp;
                    }
                    if (userexp > 0) //大于0则添加积分
                    {
                        if (userinfo != null && userinfo.UserID > 0)
                        {
                            buser.UpdateUserExp((int)(userinfo.UserExp + userexp), userinfo.UserID, userinfo.GroupID);
                        }
                    }

                    //判断是否会员添加、添加会员积分
                    if (SiteConfig.UserConfig.InfoRule > 0)
                    {
                        buser.ChangeVirtualMoney(userinfo.UserID, new M_UserExpHis()
                        {
                            score = SiteConfig.UserConfig.InfoRule,
                            detail = mcom.Title,
                            ScoreType = (int)M_UserExpHis.SType.Point,
                            Operator=userinfo.UserID,
                            OperatorIP=Request.UserHostAddress
                        });
                    }
                }
                #endregion
                this.bll.SetAudit(itemID, status);

            }
        }//For end;
        DataBind();
    }
    //批量删除
    protected void btnDeleteAll_Click(object sender, EventArgs e)
    {
        M_AdminInfo ad = badmin.GetAdminLogin();
        if (!ad.IsSuperAdmin() && !GetRole(CNodeID, "Modify"))
        {
            function.Script(this, "alert('你无权限删除信息');");
        }
        else
        {
            string title = "";
            string ids = "";
            string[] chkArr = GetChecked();
            if (chkArr != null)
            {
                for (int i = 0; i < chkArr.Length; i++)
                {
                    int itemID = Convert.ToInt32(chkArr[i]);
                    M_CommonData commoninfo = this.bll.GetCommonData(itemID);
                    if (commoninfo.HtmlLink != "")
                    {
                        SafeSC.DelFile(commoninfo.HtmlLink);
                    }
                    title = title + commoninfo.Title + "<br />";
                    if (string.IsNullOrEmpty(ids))
                        ids = itemID.ToString();
                    else
                        ids = ids + "," + itemID.ToString();
                    this.bll.SetDel(itemID);
                }
            }
            Response.Redirect(Request.RawUrl);
        }
    }
    public bool checknode(string bb, int nodeid)
    {
        string[] bbarray = bb.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
        for (int i = 0; i < bbarray.Length; i++)
        {
            if (CNodeID == DataConverter.CLng(bbarray[i]))
                return true;
        }
        return false;
    }
    public string GetElite(string elite)
    {
        return conHelper.GetElite(elite);
    }
    //显示标题
    public string GetTitle(string ItemID, string NID, string Title, string modeid,string style)
    {
        Title = Title.Length > 55 ? Title.Substring(0, 55) + "..." : Title;
        string n = "";
        if (DataConverter.CLng(NID) == CNodeID)
            n = "<a style='" + style + "' href='ShowContent.aspx?GID=" + ItemID + "&modeid=" + modeid + "'>" + Title + "</a>";
        else
        {
            n = "<strong>[<a href='ContentManage.aspx?NodeID=" + NID + "'>" + bNode.GetNodeXML(DataConverter.CLng(NID)).NodeName + "</a>]</strong><a style=\"" + style + "\" href=\"ShowContent.aspx?GID=" + ItemID + "&modeid=" + modeid + "\">" + Title + "</a>";
        }
        return n;
    }
    //小屏幕上显示
    public string GetTitle(string title) 
    {
        if (title.Length > 6)
            return title.Substring(0, 5) + "...";
        return title;
    }
    public string GetStatus(string status)
    {
        try
        {
            return StatusCodeList.First(p => p.StateCode == Convert.ToInt32(status)).StateName;
        }
        catch {return "未知"; }
    }
    //删除
    public bool getenabled(string gid)
    {
        return B_ARoleAuth.Check(ZLEnum.Auth.content, "ContentRecycle");
    }
    //显示图片
    public string GetPic(object modeid)
    {
        return conHelper.GetPic(modeid);
    }
    //移动
    protected void btnMove_Click(object sender, EventArgs e)
    {
        M_AdminInfo ad = badmin.GetAdminLogin();
        if (!("," + ad.RoleList + ",").Contains(",1,") && !GetRole(CNodeID, "Modify"))
        {
            function.WriteErrMsg("你无权限移动信息", "ContentManage.aspx?NodeID=" + CNodeID);
        }
        else
        {
            StringBuilder sb = new StringBuilder();
            string[] chkArr = GetChecked();
            if (chkArr != null)
            {
                for (int i = 0; i < chkArr.Length; i++)
                {
                    if (sb.Length == 0)
                        sb.Append(chkArr[i]);
                    else
                        sb.Append("," + chkArr[i]);
                }
                Response.Redirect("ContentMove.aspx?id=" + sb.ToString());
            }
        }
    }
    //添加到专题
    protected void btnAddToSpecial_Click(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder();
        string[] chkArr = GetChecked();
        if (chkArr != null)
        {
            for (int i = 0; i < chkArr.Length; i++)
            {
                if (sb.Length == 0)
                    sb.Append(chkArr[i]);
                else
                    sb.Append("," + chkArr[i]);
            }
            Response.Redirect("AddToSpecial.aspx?id=" + sb.ToString());
        }
    }
    //批量修改
    protected void Button1_Click(object sender, EventArgs e)
    {
        string itemID = "";
        M_Node nnn = bNode.GetNodeXML(CNodeID);
        IList<int> contentlist = new List<int>();
        string[] chkArr = GetChecked();
        if (chkArr != null)
        {
            for (int i = 0; i < chkArr.Length; i++)
            {
                int gid = DataConverter.CLng(chkArr[i]);
                M_CommonData cmdinfo = bll.GetCommonData(gid);
                if (contentlist.Count > 0)
                {
                    if (contentlist.IndexOf(cmdinfo.ModelID) == -1)
                    {
                        function.WriteErrMsg("操作失败！只允许相同模型的批量修改");
                    }
                }
                contentlist.Add(cmdinfo.ModelID);
                itemID += chkArr[i] + "|";
            }
        }
        if (contentlist.Count == 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('请选择要修改的内容');", true);
        }
        else
        {
            Response.Redirect("editListContent.aspx?ModelID=" + contentlist[0] + "&NodeID=" + CNodeID + "&ID=" + itemID + "&ModelName=" + CNodeID);
        }
    }
    //推荐
    protected void Button2_Click(object sender, EventArgs e)
    {
        M_AdminInfo ad = badmin.GetAdminLogin();
        if (!("," + ad.RoleList + ",").Contains(",1,") && !GetRole(CNodeID, "State"))
        {
            function.WriteErrMsg("你无权推荐信息", "ContentManage.aspx?NodeID=" + CNodeID);
        }
        else
        {
            string[] chkArr = GetChecked();
            if (chkArr != null)
            {
                for (int i = 0; i < chkArr.Length; i++)
                {
                    int itemID = Convert.ToInt32(chkArr[i]);
                    M_CommonData mcom = bll.GetCommonData(itemID);
                    mcom.EliteLevel = 1;
                    bll.Update(mcom);
                    if (mcom.EliteLevel != 1)
                    {
                        if (string.IsNullOrEmpty(mcom.Inputer)) continue;
                        M_UserInfo mu = buser.GetUserIDByUserName(mcom.Inputer);
                        if (mu.IsNull || mu == null || mu.UserID < 1 || SiteConfig.UserConfig.InfoRule < 1) { continue; }
                        else
                        {
                            buser.ChangeVirtualMoney(mu.UserID, new M_UserExpHis()
                            {
                                score = SiteConfig.UserConfig.RecommandRule,
                                detail = mcom.Title,
                                ScoreType = (int)M_UserExpHis.SType.Point,
                                Operator = mu.UserID,
                                OperatorIP = EnviorHelper.GetUserIP()
                            });
                        }
                    }
                }
                Response.Redirect("ContentManage.aspx");
            }
        }
    }
    //取消推荐
    protected void Button3_Click(object sender, EventArgs e)
    {
        M_AdminInfo ad = badmin.GetAdminLogin();
        if (!("," + ad.RoleList + ",").Contains(",1,") && !GetRole(CNodeID, "State"))
        {
            function.WriteErrMsg("你无权限取消推荐信息", "ContentManage.aspx?NodeID=" + CNodeID);
        }
        else
        {
            string[] chkArr = GetChecked();
            if (chkArr != null)
            {
                for (int i = 0; i < chkArr.Length; i++)
                {
                    int itemID = Convert.ToInt32(chkArr[i]);
                    M_CommonData contentinfo = bll.GetCommonData(itemID);
                    contentinfo.EliteLevel = 0;
                    bll.Update(contentinfo);
                }
                Response.Redirect("ContentManage.aspx");
            }
        }
    }
    //过滤重复行
    public DataTable SelectDistinctByField(DataTable dt, string FieldName)
    {
        DataTable returnDt = new DataTable();
        returnDt = dt.Copy();//将原DataTable复制一个新的
        DataRow[] drs = returnDt.Select("", FieldName);//将DataTable按指定的字段排序
        object LastValue = null;
        for (int i = 0; i < drs.Length; i++)
        {
            if ((LastValue == null) || (!(ColumnEqual(LastValue, drs[i][FieldName]))))
            {
                LastValue = drs[i][FieldName];
                continue;
            }

            drs[i].Delete();
        }

        return returnDt;
    }
    //整合两张表
    private bool ColumnEqual(object A, object B)
    {
        if (A == DBNull.Value && B == DBNull.Value) //  both are DBNull.Value
            return true;
        if (A == DBNull.Value || B == DBNull.Value) //  only one is DBNull.Value
            return false;
        return (A.Equals(B));  // value type standard comparison
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
    //计划任务
    protected void timeReConfBtn_Click(object sender, EventArgs e)
    {
        string ids = Request.Form["idchk"];
        DateTime executeTime = DataConvert.CDate(Request.Form["timeReBTime"]);
        if (executeTime <= DateTime.Now)
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('日期必须大于当前时间');", true);
        }
        else if (string.IsNullOrEmpty(ids))
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('未选择文章');", true);
        }
        else
        {
            B_Content_ScheTask scheBll = new B_Content_ScheTask();
            M_Content_ScheTask scheModel = new M_Content_ScheTask();
            scheModel.TaskName = "定时发布";
            scheModel.TaskContent = ids;//ID
            scheModel.TaskType = 1;//根据这个调用不同的方法处理TaskContent
            scheModel.ExecuteType = 1;
            scheModel.Status = 0;
            scheModel.ExecuteTime = executeTime.ToString();
            scheModel.LastTime = executeTime;
            scheBll.Add(scheModel);
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('添加成功');", true);
        }
    }
    private void clearCache()
    {
        //ViewState["CommonDataDT"] = null;
        ViewState["BinderDT"]=null;
        ViewState["NodeRoleDT0"] = null;
        ViewState["NodeRoleDT1"] = null;
        StatusCodeList = null;
    }
    public string GetOpenView()
    {
        string d = "";
        if (string.IsNullOrEmpty(Request.QueryString["NodeID"]))
            d = "1";
        else
            d = Convert.ToString(CNodeID);
        string IndexTemplate = "", outstr = "", strurl = string.Empty;
        strurl = "Class_" + d + "/Default.aspx";
        DataTable dt = Sql.Select("ZL_Node", "NodeID=" + CNodeID, "IndexTemplate");
        if (dt.Rows.Count > 0)
            IndexTemplate = dt.Rows[0][0].ToString();
        if (IndexTemplate != "")
        {
            outstr = " <a href='/" + strurl + "'  target='_blank' title='前台浏览'><span class='glyphicon glyphicon-eye-open'></span></a>";
        }
        else
        {
            outstr = " <a href='javascript:void(0)' onclick='editnode(" + d + ")' title='前台浏览'><span class='glyphicon glyphicon-eye-open'></span></a>";
        }
        return outstr;
    }

    //----------------工作流相关(需移入BLL)
    //工作流审批，将其改为下一状态码
    protected void NextStep_Btn_Click(object sender, EventArgs e)
    {

        if (!string.IsNullOrEmpty(Request.Form["idchk"])) 
        {
            string[] gidArr = Request.Form["idchk"].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            bll.UpdateStatus(gidArr,badmin.GetAdminLogin().RoleList,DataConvert.CLng(Request.QueryString["NodeID"]),"PPassCode");
        }
        Response.Redirect(Request.RawUrl);
    }
    //工作流拒绝审批，将其改为拒绝状态码
    protected void StepReject_Btn_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.Form["idchk"]))
        {
            string[] gidArr = Request.Form["idchk"].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            bll.UpdateStatus(gidArr, badmin.GetAdminLogin().RoleList, DataConvert.CLng(Request.QueryString["NodeID"]), "PNoPassCode");
        }
        Response.Redirect(Request.RawUrl);
    }
    //----------------工作流相关(End)
    //int GeneralID = DataConverter.CLng(Request.QueryString["GeneralID"]);//传入GeneralID删除对应HTML?
    //删除文件
    //if (GeneralID > 0)
    //{
    //    M_CommonData cdatainfo = bll.GetCommonData(GeneralID);
    //    string htmllink = cdatainfo.HtmlLink;
    //    if (htmllink != "")
    //    {
    //        string dz = "";
    //        string bj = Server.MapPath("/");
    //        htmllink = htmllink.Substring(1);
    //        dz = bj + htmllink;
    //        File.Delete(dz);
    //        bll.UpdateCreate1(GeneralID);
    //        CreateBll.createann(cdatainfo.NodeID.ToString());//发布内容页
    //        CreateBll.CreateColumnByID(cdatainfo.NodeID.ToString());//发布栏目页
    //        CreateBll.CreatePageIndex(); //发布首页
    //        function.WriteErrMsg(cdatainfo.Title + "的静态文件删除成功！");
    //    }
    //}
    public string GetContent()
    {
        //优点为AJAX加载
        string result = "";
        DataTable dt = this.bfield.GetModelFieldListAll(Convert.ToInt32(Eval("ModelID"))).Tables[0];
        DataTable contentDT = bll.GetContentByItems(Eval("TableName").ToString(), Convert.ToInt32(Eval("GeneralID")));
        foreach (DataRow dr in dt.Rows)
        {
            if (dr["FieldName"].ToString() == "content")
            {
                result = contentDT.Rows[0][dr["FieldName"].ToString()].ToString();
                break;
            }
        }
        result = StringHelper.StripHtml(result, 0);
        if (result.Length > 200)
            result = result.Substring(0, 200) + "...";
        return result;
    }
    protected void RPT_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item != null && e.Item.ItemType != ListItemType.Footer)
        {
            DataRowView dr = e.Item.DataItem as DataRowView;
            int generalId = DataConverter.CLng(dr["GeneralID"]);
            int isCreate, status;
            isCreate = DataConvert.CLng(dr["IsCreate"]);
            status = DataConvert.CLng(dr["Status"]);

            LinkButton lbHtml = e.Item.FindControl("lbHtml") as LinkButton;//删除||生成Html
            LinkButton lbCheck = e.Item.FindControl("lbCheck") as LinkButton;//浏览
            LinkButton lbDelete = e.Item.FindControl("lbDelete") as LinkButton;//删除内容

            HiddenField hfstatus = e.Item.FindControl("hfstatus") as HiddenField;
            //if (true)//getenabled(generalId.ToString())
            //{
                if (isCreate == 1) //判断是否已生成,1.为已生成
                {
                    lbHtml.CommandName = "DelHtml";
                    lbHtml.CommandArgument = generalId.ToString();
                    lbHtml.Text = "删除HTML";
                    //if (status != -2)  //未删除
                    //{
                    //    lbUpdate.Enabled = true;
                    //}
                    //else
                    //{
                    //    lbUpdate.Enabled = false;
                    //}
                }
                else if (isCreate == 0) //判断是否已生成,0.为未生成
                {
                    lbHtml.CommandName = "CreateHtml";
                    lbHtml.CommandArgument = generalId.ToString();
                    lbHtml.Text = "<i class='fa fa-play'></i>生成HTML";
                }
            //}
            //else
            //{
            //    //lbUpdate.Enabled = false;
            //}
        }

    }
    protected void RPT_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Purview")
        { Page.Response.Redirect("/Content.aspx?ItemID=" + e.CommandArgument.ToString()); return; }
        if (e.CommandName == "Edit")
        {
            Response.Redirect("EditContent.aspx?GeneralID=" + e.CommandArgument); return;
        }
        if (e.CommandName == "Del")
        {
            M_AdminInfo ad = badmin.GetAdminLogin();
            if (!ad.IsSuperAdmin() && !GetRole(CNodeID, "Modify"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('你无权限删除该内容!!');", true);
            }
            else
            {
                string Id = e.CommandArgument.ToString();
                M_CommonData cmdinfo = this.bll.GetCommonData(DataConverter.CLng(Id));
                string title = cmdinfo.Title;
                string htmllink = cmdinfo.HtmlLink;
                if (htmllink != "")
                {
                    SafeSC.DelFile(htmllink);
                }
                this.bll.SetDel(DataConverter.CLng(Id));
                CreateBll.createann(cmdinfo.NodeID.ToString());//生成内容页静态文件
                CreateBll.CreateColumnByID(cmdinfo.NodeID.ToString());//生成栏目页静态文件
                CreateBll.CreatePageIndex(); //发布首页
                DataBind();
            }
        }
        if (e.CommandName == "DelHtml")
        {
            int gid = DataConverter.CLng(e.CommandArgument.ToString());
            M_CommonData comdt = bll.GetCommonData(gid);
            if (string.IsNullOrEmpty(comdt.HtmlLink) && comdt.HtmlLink.Contains("."))
            {
                string fleex = "." + comdt.HtmlLink.Split('.')[1];
                FileSystemObject.Delete(Server.MapPath(comdt.HtmlLink), FsoMethod.File);
                string HtmlLinkurl = comdt.HtmlLink.Replace(gid + fleex, "");
                DirectoryInfo di = new DirectoryInfo(Server.MapPath(HtmlLinkurl));
                FileInfo[] ff = di.GetFiles(gid + "_" + "*");
                if (ff.Length != 0)
                {
                    foreach (FileInfo fi in ff)
                    {
                        fi.Delete();
                    }
                }
            }
            comdt.HtmlLink = "";
            comdt.IsCreate = 0;
            bll.Update(comdt);
            CreateBll.CreatePageIndex(); //发布首页
            DataBind();
        }
        if (e.CommandName == "CreateHtml")//注：如节点设置为不生成,则不成内容页与首页,但状态会变更
        {
            int gid = DataConverter.CLng(e.CommandArgument.ToString());
            M_CommonData comdt = bll.GetCommonData(gid);
            comdt.IsCreate = 1;
            bll.Update(comdt);
            CreateBll.CreateInfo(DataConverter.CLng(gid), DataConverter.CLng(comdt.NodeID), DataConverter.CLng(comdt.ModelID));
            CreateBll.CreatePageIndex(); //发布首页
            DataBind();
        }
        //if (e.CommandName == "check")  //前台浏览
        //{
        //    Response.Write("<script>window.open('/Content.aspx?ItemID=" + e.CommandArgument + "')</script>");
        //}
        string titles = "";
        int type = -1;
        if (e.CommandName == "UpMove")
        {
                int Id = DataConverter.CLng(e.CommandArgument);
                M_CommonData content = bll.GetCommonData(Id);
                if (content.OrderID != this.bll.GetOrder(CNodeID, status.ToString(), titles, type, 0))
                {
                    M_CommonData contentPre = this.bll.GetPreID(CNodeID, status.ToString(), titles, type, content.OrderID, 0);
                    int CurrOrder = content.OrderID;
                    content.OrderID = contentPre.OrderID;
                    contentPre.OrderID = CurrOrder;
                     this.bll.UpdateOrder(content);
                     this.bll.UpdateOrder(contentPre);
                    
                }
                DataBind();
        }
        if (e.CommandName == "DownMove")
        {
                int Id = DataConverter.CLng(e.CommandArgument);
                M_CommonData content = bll.GetCommonData(Id);
                if (content.OrderID != this.bll.GetOrder(CNodeID, status.ToString(), titles, type, 1))
                {
                    M_CommonData contentPre = this.bll.GetPreID(CNodeID, status.ToString(), titles, type, content.OrderID, 1);
                    int CurrOrder = content.OrderID;
                    content.OrderID = contentPre.OrderID;
                    contentPre.OrderID = CurrOrder;
                    this.bll.UpdateOrder(content);
                    this.bll.UpdateOrder(content);
                    this.bll.UpdateOrder(contentPre);

                }
                DataBind();
        }
        if (e.CommandName == "bider")  //查看中标
        {
            int Id = DataConverter.CLng(e.CommandArgument);
            Response.Redirect("BidManage.aspx?GeneralID=" + Id + "&NodeID=" + CNodeID);
        }
    }
    public string getNodeName()
    {
        M_Node nod = this.bNode.GetNodeXML(DataConverter.CLng(base.Request.QueryString["NodeID"]));
        return nod != null ? nod.NodeName : "";
    }
    #region 生成Excel模板
    protected void lbtnSaveTempter_Click(object sender, EventArgs e)
    {
        //根据模型号查询字段
        DataTable dt = this.bfield.GetModelFieldList(CModelID).Tables[0];
        if (dt != null && dt.Rows.Count >= 1)
        {
            {
                DataRow dr = dt.NewRow();
                dr["FieldAlias"] = "添加时间";
                dt.Rows.Add(dr);
            }
            {
                DataRow dr = dt.NewRow();
                dr["FieldAlias"] = "更新时间";
                dt.Rows.Add(dr);
            }
            Educe(dt);
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "",
            "<script>alert('该模型存在相关未设置好的项，请核对后再下载！')</script>");
        }

    }
    #endregion
    #region 生成Excel模板表头
    private void Educe(DataTable dt)
    {
        string str = "标题,";
        int i = 0;
        str += "审核状态,";
        foreach (DataRow dr in dt.Rows)
        {
            str += dr["FieldAlias"].ToString();
            i = i + 1;
            if (i < dt.Rows.Count)
            {
                str += ",";
            }
        }
        DataGrid dg = new DataGrid();
        dg.DataSource = dt.DefaultView;
        dg.DataBind();
        string filesname = DateTime.Now.ToString("yyyyMMdd") + this.bmodel.GetModelById(DataConverter.CLng(int.Parse(this.Request.QueryString["ModelID"]))).ItemName + "导入模板";
        Encoding gb = System.Text.Encoding.GetEncoding("GB2312");
        StringWriter sw = new StringWriter();
        sw.WriteLine(str);
        Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(filesname) + ".csv");
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        Response.Write(sw.ToString());
        Response.End();
    }
    #endregion
    protected void btnCurrentImport_Click(object sender, EventArgs e)
    {
        string fileName = this.fileImp.FileName;
        string exName = Path.GetExtension(fileName).ToLower();
        if (!exName.Equals(".csv") && !exName.Equals(".xls") && !exName.Equals(".xlsx"))//判断扩展名
        {
            function.Script(this, "alert('上传的文件不是符合扩展名csv,请重新选择!');");
            return;
        }
        string path = Server.MapPath("~/xls/");
        if (!FileSystemObject.IsExist(path, FsoMethod.Folder))
        {
            FileSystemObject.CreateFileFolder(path);
        }
         SafeSC.SaveFile("/xls/", fileImp, fileName);
        //导入文件到数据集对象                   
        DataSet oldDs = new DataSet();
        if (exName.Equals(".csv"))
        {
            CsvToDataSet(oldDs, path + fileName);
        }
        else
        {
            ExcelToDataSet(oldDs, path + fileName);
        }
        File.Delete(path + fileName);
        //if (!this.CheckColCount(oldDs.Tables[0]))
        //    return;
        DataSet newDs = this.CreateTable(oldDs);
        //string s = "";
        //foreach (DataColumn dc in newDs.Tables[1].Columns)
        //{
        //    s += dc.ColumnName + ",";
        //}
        //function.WriteErrMsg(s);
        //保存到数据库                          
        this.SaveDb(newDs);
    }
    /// <summary>
    /// 将CSV文件的数据读取到DataTable中
    /// </summary>
    /// <param name="fileName">CSV文件路径</param>
    /// <returns>返回读取了CSV数据的DataTable</returns>
    public void CsvToDataSet(DataSet ds, string csvPath)
    {
        string fileFullName = Path.GetFileName(csvPath);
        string folderPath = csvPath.Substring(0, csvPath.LastIndexOf('\\') + 1);

        string connStr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='text;HDR=Yes;IMEX=1'", folderPath);
        string sql = string.Format(@"SELECT * FROM [{0}]", fileFullName);
        OleDbDataAdapter da = new OleDbDataAdapter(sql, connStr);

        da.Fill(ds);

        DataColumn dcTemp = new DataColumn("No", typeof(string));
        DataColumn dcTemp1 = new DataColumn("Up", typeof(string));

        ds.Tables[0].Columns.Add(dcTemp);
        ds.Tables[0].Columns["No"].SetOrdinal(0);
        ds.Tables[0].Columns.Add(dcTemp1);
        ds.Tables[0].Columns["Up"].SetOrdinal(2);

        int row = ds.Tables[0].Rows.Count;
        for (int j = 0; j < row; j++)
        {
            ds.Tables[0].Rows[j]["No"] = j + 1;
            ds.Tables[0].Rows[j]["Up"] = 0;
        }
    }
    /// <summary>
    /// 将Excel文件的数据读取到DataTable中
    /// </summary>
    /// <param name="fileName">Excel文件路径</param>
    /// <returns>返回读取了Excel数据的DataTable</returns>
    public void ExcelToDataSet(DataSet ds, string excelPath)
    {
        string fileFullName = Path.GetFileName(excelPath);
        string folderPath = excelPath.Substring(0, excelPath.LastIndexOf('\\') + 1);
        string connStr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 12.0;", folderPath + fileFullName);

        ds.Tables.Add(OleDB.Select(excelPath, "select * from" + OleDB.SelectTables(excelPath).Rows[0]["Table_Name"]));//读取第一张表中的数据;
        DataColumn dcTemp = new DataColumn("No", typeof(string));
        DataColumn dcTemp1 = new DataColumn("Up", typeof(string));

        ds.Tables[0].Columns.Add(dcTemp);
        ds.Tables[0].Columns["No"].SetOrdinal(0);
        ds.Tables[0].Columns.Add(dcTemp1);
        ds.Tables[0].Columns["Up"].SetOrdinal(2);

        int row = ds.Tables[0].Rows.Count;
        for (int j = 0; j < row; j++)
        {
            ds.Tables[0].Rows[j]["No"] = j + 1;
            ds.Tables[0].Rows[j]["Up"] = 0;
        }
    }
    #region 校验列数是否一致
    private bool CheckColCount(DataTable impxls)
    {
        //根据模型号查询字段 查询现有模型列
        DataTable dt = this.bfield.GetModelFieldList(CModelID).Tables[0];
        int rowCount = 0;
        if (dt != null && dt.Rows.Count >= 1)
            rowCount = dt.Rows.Count;
        {
            if (impxls.Columns.Count - 4 != rowCount)
            {
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "",
                   "<script>alert('上传的文件与现有模型不匹配，请重新选择！');</script>");
                return false;
            }
            else
                return true;
        }
    }
    #endregion
    #region 生成新的主从表
    public DataSet CreateTable(DataSet oldDs)
    {
        int index = 3;
        int sp_no = 2;
        DataTable oldTable = oldDs.Tables[0];

        DataTable t1 = new DataTable();
        DataColumn c1 = oldTable.Columns[0];
        t1.Columns.Add(new DataColumn(c1.ColumnName, c1.DataType));
        for (int i = 1; i < index; i++)
        {
            DataColumn col = oldTable.Columns[i];
            t1.Columns.Add(new DataColumn(col.ColumnName, col.DataType));
        }

        DataTable t2 = new DataTable();
        DataColumn c2 = oldTable.Columns[0];
        t2.Columns.Add(new DataColumn(c2.ColumnName, c2.DataType));
        for (int i = index; i < oldTable.Columns.Count; i++)
        {
            DataColumn col = oldTable.Columns[i];
            t2.Columns.Add(new DataColumn(col.ColumnName, col.DataType));
        }

        for (int i = 0; i < oldTable.Rows.Count; i++)
        {
            DataRow r = t1.NewRow();
            r[0] = oldTable.Rows[i][0];
            for (int j = 1; j < index; j++)
            {
                r[j] = oldTable.Rows[i][j];
            }
            //t1.ImportRow(r);
            t1.Rows.Add(r);
        }
        for (int i = 0; i < oldTable.Rows.Count; i++)
        {
            DataRow r = t2.NewRow();
            r[0] = oldTable.Rows[i][0];
            for (int j = index; j < oldTable.Columns.Count; j++)
            {
                // r[j - 2] = oldTable.Rows[i][j];
                r[j - sp_no] = oldTable.Rows[i][j];
            }
            //t2.ImportRow(r);
            t2.Rows.Add(r);
        }

        DataSet newDs = new DataSet();
        newDs.Tables.Add(t1);
        newDs.Tables.Add(t2);
        return newDs;
    }
    #endregion
    #region 导入excel数据到数据库
    public void SaveDb(DataSet ds)
    {
        //根据模型号查询字段
        DataTable dt = this.bfield.GetModelFieldList(CModelID).Tables[0];

        DataTable table = new DataTable();
        table.Columns.Add(new DataColumn("FieldName", typeof(string)));
        table.Columns.Add(new DataColumn("FieldType", typeof(string)));
        table.Columns.Add(new DataColumn("FieldValue", typeof(string)));
        int colCount = ds.Tables[1].Columns.Count;
        string adminname = badmin.GetAdminLogin().AdminName;
        foreach (DataRow childRow in ds.Tables[1].Rows)
        {
            #region 构建从表内容表
            int colNo = 2;
            foreach (DataRow dr in dt.Rows)
            {
                DataRow row = table.NewRow();
                row[0] = dr["FieldName"].ToString();
                string ftype = dr["FieldType"].ToString();
                row[1] = ftype;
                string fvalue = childRow[colNo].ToString();
                row[2] = fvalue;
                table.Rows.Add(row);
                colNo++;
                if (colNo == colCount)
                    break;
            }
            #endregion
            #region 构建主表
            ds.Tables[0].DefaultView.RowFilter = "No=" + childRow["No"].ToString();
            ds.Tables[1].DefaultView.RowFilter = "No=" + childRow["No"].ToString();
            DataRow mainRow = ds.Tables[0].DefaultView[0].Row;
            DataRow mainRow2 = ds.Tables[1].DefaultView[0].Row;
            M_CommonData CData = new M_CommonData();
            CData.NodeID = CNodeID;
            CData.ModelID = CModelID;
            CData.TableName = this.bmodel.GetModelById(CModelID).TableName;
            //标题	推荐	
            //标题
            CData.Title = mainRow[1].ToString();
            CData.Inputer = adminname;
            //推荐 
            CData.EliteLevel = 0;
            CData.InfoID = "";
            CData.SpecialID = "";
            //点击数 已生成
            CData.Hits = 0;
            CData.IsCreate = 0;
            //更新时间/时间类型
            CData.UpDateType = 1;
            CData.CreateTime = DataConvert.CDate(mainRow2["添加时间"].ToString());
            CData.UpDateTime = DataConvert.CDate(mainRow2["更新时间"].ToString());
            //关键字 string Keyword = this.TxtTagKey.Text.Trim().Replace(" ", "|"); ;
            CData.TagKey = "";
            //状态 数字 
            CData.Status = DataConverter.CLng(mainRow2[1].ToString());
            //模板
            CData.Template = "";
            #endregion
            //主从表数据保存到数据库
            int newID = this.bll.AddContent(table, CData);//插入信息给两个表，主表和从表:CData-主表的模型，table-从表
            table.Rows.Clear();
        }
        function.WriteSuccessMsg("导入成功");
    }
    #endregion
    //推送
    protected void PushCon_Btn_Click(object sender, EventArgs e)
    {
        string nodes = Request.Form["pushcon_hid"].Trim(',');
        string ids = Request.Form["idchk"];
        if (!string.IsNullOrEmpty(nodes)&& !string.IsNullOrEmpty(ids))
        {
            string[] idsArr = ids.Split(',');
            for (int i = 0; i < idsArr.Length; i++)
            {
                M_CommonData cdata = null;
                DataTable dt = null;
                bll.GetContent(Convert.ToInt32(idsArr[i]),ref cdata,ref dt);
                if (cdata != null && dt != null)
                {
                    PushConToNodes(nodes, cdata, dt);
                }
            }
            function.WriteSuccessMsg("推送完成");
        }
        else { function.Script(this, "未选择需推送的文章或目标节点"); }
    }
    private void PushConToNodes(string nodes, M_CommonData cdata, DataTable dt)
    {
        nodes = nodes.Trim(',').Replace(" ", "");
        //if (string.IsNullOrEmpty(nodes)) { return; }
        string[] nodeArr = nodes.Split(',');
        for (int i = 0; i < nodeArr.Length; i++)
        {
            cdata.NodeID = Convert.ToInt32(nodeArr[i]);
            if (CNodeID == cdata.NodeID) { continue; }//不能将文章推送到自己节点
            cdata.FirstNodeID = 0;
            PushAddCon(dt, cdata);
        }
    }
    private void PushAddCon(DataTable dt, M_CommonData cdata)
    {
        //nsert into 库B.dbo.AA select * from 库A.dbo.AA where 库A.dbo.AA.C = ’‘
        DataRow dr = dt.Rows[0];
        string sql = "INSERT INTO {1} SELECT {0} FROM {1} WHERE [ID] = " + dr["ID"] + ";SELECT @@identity;";
        string columns = "";
        foreach (DataColumn dc in dt.Columns)
        {
            if (dc.ColumnName.ToLower().Equals("id")) { continue; }
            columns += dc.ColumnName + ",";
        }
        columns = columns.Trim(',');
        cdata.ItemID = Convert.ToInt32(SqlHelper.ExecuteScalar(CommandType.Text, string.Format(sql,columns, cdata.TableName)));
        bll.insert(cdata);
    }
}