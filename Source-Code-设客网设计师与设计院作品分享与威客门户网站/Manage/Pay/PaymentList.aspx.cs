namespace ZoomLa.WebSite.Manage.I.Pay
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
    using ZoomLa.BLL;
    using ZoomLa.Model;
    using ZoomLa.Common;
    using System.Text;

    public partial class PaymentList : CustomerPageAction
    {
        B_Payment bll = new B_Payment();
        public int UserID { get { return DataConverter.CLng(Request.QueryString["UserID"]); } }
        public int Status { get { return DataConverter.CLng(Request.QueryString["Status"]); } }
        protected void Page_Load(object sender, EventArgs e)
        {
            B_Admin.IsSuperManage();
            if (!IsPostBack)
            {
                MyBind();
            }
        }
        public void MyBind(string orderwhere = "SuccessTime DESC")
        {
            if (Status == (int)M_OrderList.StatusEnum.Recycle)
            {
                SwitchUrl_A.HRef = customPath2 + "Pay/PayMentList.aspx";
                SwitchUrl_A.InnerText = "返回列表";
                normal_div.Visible = false;
                recycle_div.Visible = true;
            }
            else
            {
                SwitchUrl_A.HRef = customPath2 + "Pay/PayMentList.aspx?Status=-99";
                SwitchUrl_A.InnerText = "回收站";
                normal_div.Visible = true;
                recycle_div.Visible = false;
            }
            DataTable dt = SelByWhere();
            if (string.IsNullOrEmpty(orderwhere))//默认时间倒序
            {
                dt.DefaultView.Sort = "SuccessTime DESC";
                bool isasc = true;
                string str = ClearAscStr("glyphicon glyphicon-arrow-down", out isasc);
                DateAsc.Text += str;
            }
            this.RPT.DataSource = dt;
            this.RPT.DataBind();
        }
        public DataTable SelByWhere()
        {
            DataTable dt = bll.GetPayList(UserID, (int)M_OrderList.OrderEnum.Purse,
                DataConverter.CDouble(MinMoney_T.Text), DataConverter.CDouble(MaxMoney_T.Text),
                Search_Drop.SelectedValue, Search_T.Text, Status);
            return dt;
        }
        public string GetStatus(string status)
        {
            if (status == "3")
                return "<span style='color:green;' class='glyphicon glyphicon-ok'></span>";
            else
                return "<span style='color:red;' class='glyphicon glyphicon-remove'></span>";

        }
        public string GetCStatus(string cstatus)
        {
            if (DataConverter.CBool(cstatus))
                return "<span style='color:green;' class='glyphicon glyphicon-ok'></span>";
            else
                return "<span style='color:red;' class='glyphicon glyphicon-remove'></span>";

        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            MyBind();
        }
        private string ClearAscStr(string text, out bool isasc)
        {
            IDAsc.Text = "ID";
            PriceAsc.Text = "金额";
            DateAsc.Text = "完成时间";
            isasc = text.Contains("glyphicon glyphicon-arrow-down");
            return "<span class='" + (isasc ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down") + "'></span>";
        }
        protected void IDAsc_Click(object sender, EventArgs e)
        {
            bool isasc = true;
            string str = ClearAscStr(IDAsc.Text, out isasc);
            IDAsc.Text += str;
            MyBind("PaymentID " + (isasc ? "DESC" : "ASC"));
        }

        protected void DateAsc_Click(object sender, EventArgs e)
        {
            bool isasc = true;
            string str = ClearAscStr(DateAsc.Text, out isasc);
            DateAsc.Text += str;
            MyBind("SuccessTime " + (isasc ? "DESC" : "ASC"));
        }

        protected void PriceAsc_Click(object sender, EventArgs e)
        {
            bool isasc = true;
            string str = ClearAscStr(PriceAsc.Text, out isasc);
            PriceAsc.Text += str;
            MyBind("MoneyPay " + (isasc ? "DESC" : "ASC"));
        }

        protected void Serarch_Btn_Click(object sender, EventArgs e)
        {
            MyBind();
        }

        protected void SearchMoney_Btn_Click(object sender, EventArgs e)
        {
            MyBind();
        }
        protected void RPT_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("Del"))
            {
                bll.DelByIDS(e.CommandArgument.ToString(), M_OrderList.StatusEnum.Recycle);
            }
            MyBind();
        }
        protected void ExportExcel_Btn_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            OfficeHelper helper = new OfficeHelper();
            DataTable demodt = new DataTable();
            InitDataColums(demodt);
            DataTable dt = SelByWhere();
            foreach (DataRow dtrow in dt.Rows)
            {
                DataRow dr = demodt.NewRow();
                dr["PaymentID"] = dtrow["PaymentID"];
                dr["UserName"] = dtrow["UserName"];
                dr["PaymentNum"] = dtrow["PaymentNum"];
                dr["PayPlatName"] = dtrow["PayPlatName"];
                dr["MoneyPay"] = dtrow["MoneyPay"];
                dr["MoneyTrue"] = dtrow["MoneyTrue"];
                dr["StatusStr"] = dtrow["Status"];
                dr["CStatusStr"] = dtrow["CStatus"];
                dr["SuccessTime"] = dtrow["SuccessTime"];
                demodt.Rows.Add(dr);
            }
            string columnames = "ID,会员名,订单号,支付平台,金额,实际金额,交易状态,处理结果,完成时间";
            SafeSC.DownStr(helper.ExportExcel(demodt, columnames), DateTime.Now.ToString("yyyyMMdd") + "充值信息表.xls");
        }
        private void InitDataColums(DataTable dt)
        {
            dt.Columns.Add("PaymentID");
            dt.Columns.Add("UserName");
            dt.Columns.Add("PaymentNum");
            dt.Columns.Add("PayPlatName");
            dt.Columns.Add("MoneyPay");
            dt.Columns.Add("MoneyTrue");
            dt.Columns.Add("StatusStr");
            dt.Columns.Add("CStatusStr");
            dt.Columns.Add("SuccessTime");
        }
        protected void Dels_Btn_Click(object sender, EventArgs e)
        {
            string ids = Request.Form["idchk"];
            if (!string.IsNullOrEmpty(ids))
            {
                bll.UpdateByStatus(Request.Form["idchk"], (int)M_OrderList.StatusEnum.Recycle);
                bll.DelByIDS(ids, M_OrderList.StatusEnum.Recycle);
            }
            MyBind();
        }
        protected void Recover_Btn_Click(object sender, EventArgs e)
        {
            string ids = Request.Form["idchk"];
            if (!string.IsNullOrEmpty(ids))
            {
                bll.DelByIDS(ids, M_OrderList.StatusEnum.Normal);
                function.WriteSuccessMsg("还原成功");
            }
        }
        //彻底删除
        protected void RealDel_Btn_Click(object sender, EventArgs e)
        {
            string ids = Request.Form["idchk"];
            if (!string.IsNullOrEmpty(ids))
            {
                bll.RealDelByIDS(ids);
                function.WriteSuccessMsg("删除成功");
            }
        }
        protected void ClearRecycle_Btn_Click(object sender, EventArgs e)
        {
            bll.ClearRecycle();
            function.WriteSuccessMsg("回收站已经清空");
        }
    }
}