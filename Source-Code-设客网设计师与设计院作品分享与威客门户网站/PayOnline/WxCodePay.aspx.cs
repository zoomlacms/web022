﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.Model;
using ZoomLa.BLL.WxPayAPI;
using ZoomLa.Common;

//微信二维码支付页
public partial class test_WxCodePay : System.Web.UI.Page
{
    B_Payment payBll = new B_Payment();
    public string PayNo { get { return Request.QueryString["payno"]; } }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (function.isAjax())
        {
            string action = Request.Form["action"];
            string result = "";
            switch (action)
            {
                case "getpay":
                    M_Payment paymod= payBll.SelModelByPayNo(PayNo);
                    if (paymod.Status == (int)M_Payment.PayStatus.HasPayed)
                        result = "1";
                    else
                        result = "0";
                    break;
                default:
                    break;
            }
            Response.Write(result); Response.Flush(); Response.End();
        }
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(PayNo)) { function.WriteErrMsg("未指定支付单号"); }
            if (string.IsNullOrEmpty(Request.QueryString["wxcode"])) { function.WriteErrMsg("未指定二维码"); }
            MyBind();
        }
    }
    public void MyBind()
    {
        M_Payment payMod = payBll.SelModelByPayNo(PayNo);
        if (payMod == null) { function.WriteErrMsg("支付单不存在"); }
        if (payMod.Status != (int)M_Payment.PayStatus.NoPay) { function.WriteErrMsg("该支付单已经付过款了"); }
        code_img.Src = "MakeCodeImg.aspx?data=" + Request.QueryString["wxcode"];
    }
}