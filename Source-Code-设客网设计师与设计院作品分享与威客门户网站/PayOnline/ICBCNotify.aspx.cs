using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using ZoomLa.BLL;
using ZoomLa.BLL.Shop;
using ZoomLa.Common;
using ZoomLa.Model;
public partial class PayOnline_ICBCNotify : System.Web.UI.Page
{
    B_Payment payBll = new B_Payment();
    B_PayPlat platBll = new B_PayPlat();
    B_OrderList orderBll = new B_OrderList();
    OrderCommon orderCom = new OrderCommon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Stream sr = Request.InputStream;
            //byte[] bytestr = new byte[sr.Length];
            //sr.Read(bytestr, 0, bytestr.Length);
            //string def = Encoding.Default.GetString(bytestr);
            //string utf8 = Encoding.UTF8.GetString(bytestr);



            M_PayPlat platMod = platBll.SelModelByClass(M_PayPlat.Plat.ICBC_NC);
            //infosecapiLib.infosecClass obj = new infosecapiLib.infosecClass();
            ////其返回包含不正确的base64码,必须先替换再解码
            //string tranData = Request["notifydata"];
            //tranData = obj.base64dec(tranData.Replace("%2B", "+").Replace("%3D", "="));
            //string sign = Request["sign"];
            //sign = sign.Replace("%2B", "+").Replace("%3D", "=").Replace("%2F", "/");
            //int ret = obj.verifySign(tranData, function.VToP(platMod.Other), sign);
            //string payno = XMLHelper.GetNode("orderid").Text;
            //if (ret != 0||!GetValue(tranData,"tranStat").Equest("1"))
            //{
            //    //签名错误
            //    Response.Write("failed"); Response.End();
            //}
            //try
            //{
            //    M_Payment pinfo = payBll.SelModelByPayNo(payno);
            //    if (pinfo.Status != (int)M_Payment.PayStatus.NoPay) return;
            //    pinfo.Status = (int)M_Payment.PayStatus.HasPayed;
            //    pinfo.PlatformInfo = "支付宝在线付款";    //平台反馈信息
            //    pinfo.SuccessTime = DateTime.Now;//交易成功时间
            //    pinfo.CStatus = true; //处理状态
            //    pinfo.MoneyTrue = (Convert.ToDecimal(XMLHelper.GetNode("amount").Text) / 100);
            //    payBll.Update(pinfo);
            //    DataTable orderDT = orderBll.GetOrderbyOrderNo(pinfo.PaymentNum);
            //    foreach (DataRow dr in orderDT.Rows)
            //    {
            //        M_Order_PayLog paylogMod = new M_Order_PayLog();
            //        M_OrderList orderMod = orderBll.SelModelByOrderNo(dr["OrderNo"].ToString());
            //        OrderHelper.FinalStep(pinfo, orderMod, paylogMod);
            //        orderCom.SendMessage(orderMod, paylogMod, "payed");
            //        //orderCom.SaveSnapShot(orderMod);
            //    }
            //    Response.Write("OK");
            //}
            //catch (Exception ex)
            //{
            //    ZLLog.L(ZLEnum.Log.safe, new M_Log()
            //    {
            //        Action = "支付回调报错",
            //        Message = "平台:南昌工行,支付单:" + payno + ",原因:" + ex.Message
            //    });
            //}
        }
    }
    public string GetValue(string xml,string nodename)
    {
        XmlDocument doc = new XmlDocument();
        doc.LoadXml(xml);
        XmlNode node = doc.SelectSingleNode("//"+ nodename);
        if (node == null) { return "没有找到该节点!"; }
        return node.InnerText;
    }
}