using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.BLL.Shop;
using ZoomLa.BLL.WxPayAPI;
using ZoomLa.Model;

public partial class PayOnline_WxPayReturn : System.Web.UI.Page
{
    ZoomLa.BLL.WxPayAPI.Notify wxnotify = null;
    B_Payment payBll = new B_Payment();
    private B_Order_PayLog paylogBll = new B_Order_PayLog();//支付日志类,用于记录用户付款信息
    private B_OrderList orderBll = new B_OrderList();
    private OrderCommon orderCom = new OrderCommon();
    B_User buser = new B_User();
    //微信异步
    protected void Page_Load(object sender, EventArgs e)
    {
        ZLLog.L(ZLEnum.Log.pay, "进入微信支付页");
        wxnotify = new ZoomLa.BLL.WxPayAPI.Notify(this);
        ProcessNotify();
    }
    public void ProcessNotify()
    {
        WxPayData notifyData = wxnotify.GetNotifyData();
        //检查支付结果中transaction_id是否存在
        if (!notifyData.IsSet("out_trade_no"))
        {
            //若transaction_id不存在，则立即返回结果给微信支付后台
            WxPayData res = new WxPayData();
            res.SetValue("return_code", "FAIL");
            res.SetValue("return_msg", "支付结果中微信订单号不存在");
            ZLLog.L(ZLEnum.Log.pay, new M_Log()
            {
                Action = "支付平台异常",
                Message = "平台:微信,原因:支付结果中微信订单号不存在!"
            });
            Response.Write(res.ToXml());
            Response.End();
        }
        string transaction_id = notifyData.GetValue("out_trade_no").ToString();
        //查询订单，判断订单真实性
        if (!QueryOrder(transaction_id))
        {
            //若订单查询失败，则立即返回结果给微信支付后台
            WxPayData res = new WxPayData();
            res.SetValue("return_code", "FAIL");
            res.SetValue("return_msg", "订单查询失败");
            ZLLog.L(ZLEnum.Log.pay, new M_Log()
            {
                Action = "支付平台异常",
                Message="平台:微信,支付单:"+transaction_id+",原因:订单查询失败!"
            });
            Response.Write(res.ToXml());
            Response.End();
        }
        //查询订单成功
        else
        {
            WxPayData res = new WxPayData();
            res.SetValue("return_code", "SUCCESS");
            res.SetValue("return_msg", "OK");
            try
            {
                PayOrder_Success(notifyData);
            }
            catch (Exception ex)
            {
                ZLLog.L(ZLEnum.Log.pay, new M_Log() { Action = "微信支付报错,支付单:"+transaction_id, Message = ex.Message });
            }
            string result = res.ToXml();
            Response.Write(result);
            Response.End();
        }
    }
    //支付成功时执行的操作
    private void PayOrder_Success(WxPayData result)
    {
        try
        {
            M_Order_PayLog paylogMod = new M_Order_PayLog();
            M_Payment pinfo = payBll.SelModelByPayNo(result.GetValue("out_trade_no").ToString());
            if (pinfo.Status != (int)M_Payment.PayStatus.NoPay) { ZLLog.L(ZLEnum.Log.pay, new M_Log() { Action = "异常微信支付回调", }); return; }
            pinfo.Status = (int)M_Payment.PayStatus.HasPayed;
            pinfo.PlatformInfo = "微信扫码支付";
            pinfo.SuccessTime = DateTime.Now;
            pinfo.PayTime = DateTime.Now;
            pinfo.CStatus = true;
            //1=100,
            decimal tradeAmt = Convert.ToDecimal(result.GetValue("total_fee")) / 100;
            pinfo.MoneyTrue = tradeAmt;
            payBll.Update(pinfo);
            DataTable orderDT = orderBll.GetOrderbyOrderNo(pinfo.PaymentNum);
            foreach (DataRow dr in orderDT.Rows)
            {
                M_OrderList orderMod = orderBll.SelModelByOrderNo(dr["OrderNo"].ToString());
                OrderHelper.FinalStep(pinfo, orderMod, paylogMod);
                orderCom.SendMessage(orderMod, paylogMod, "payed");
                //orderCom.SaveSnapShot(orderMod);
            }
            ZLLog.L(ZLEnum.Log.pay, "微信支付成功!支付单:" + result.GetValue("out_trade_no").ToString());
        }
        catch (Exception ex)
        {
            ZLLog.L(ZLEnum.Log.pay, new M_Log()
            {
                Action = "支付回调报错",
                Message = "平台:微信,支付单:" + result.GetValue("out_trade_no").ToString() + ",原因:" + ex.Message
            });
        }
    }
    //查询订单
    private bool QueryOrder(string transaction_id)
    {
        WxPayData req = new WxPayData();
        req.SetValue("out_trade_no", transaction_id);
        WxPayData res = WxPayApi.OrderQuery(req);
        if (res.GetValue("return_code").ToString() == "SUCCESS" &&
            res.GetValue("result_code").ToString() == "SUCCESS")
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}