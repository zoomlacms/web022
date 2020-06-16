<%@ WebHandler Language="C#" Class="Common" %>

using System;
using System.Web;
using ZoomLa.Common;
using ZoomLa.BLL;
using ZoomLa.Model;
/*
 * 仅允许Form提交
 * 用于价格计算,增减商品
 * -1:失败,1:成功或直接返回值
 */
public class Common : IHttpHandler, System.Web.SessionState.IRequiresSessionState{
    B_Cart cartBll = new B_Cart();
    M_Cart cartMod = new M_Cart();
    B_User buser = new B_User();
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest request = context.Request;
        string action = context.Request.Form["action"];
        string cartCookID = GetCartCookID(context);
        string result = "";
        switch (action)
        {
            case "setnum"://ID,数量,Cookies,可不登录,数量不能小于1
                {
                    int id = DataConverter.CLng(request.Form["mid"]);
                    int pronum = DataConverter.CLng(request.Form["pronum"]);
                    if (id < 1 || pronum < 1 || string.IsNullOrEmpty(cartCookID))
                    {
                        result = "-1";
                    }
                    else
                    {
                        cartBll.UpdateProNum(cartCookID, id, pronum);
                        result = "1";
                    }
                }
                break;
            case "getprice":
                break;
            case "deladdress":
                {
                    B_UserRecei receBll = new B_UserRecei();
                    M_UserInfo mu = buser.GetLogin();
                    int id = DataConverter.CLng(request.Form["id"]);
                    if (mu == null || mu.UserID == 0 || id < 1) { result = "-1"; }
                    else
                    {
                        receBll.U_DelByID(id, mu.UserID);
                    }
                }
                break;
            case "arrive"://优惠券
                {
                    string code = request.Form["code"];
                    string pwd = request.Form["pwd"];
                    double money = double.Parse(request.Form["money"]);
                    string remind = "";
                    B_Arrive arriveBll = new B_Arrive();
                    var amount = arriveBll.GetArriveByaa(code, pwd, money, out remind);
                    result = "{\"amount\":\"" + amount + "\",\"remind\":\"" + remind + "\"}";
                }
                break;
        }
        context.Response.Write(result); context.Response.Flush(); context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    public string GetCartCookID(HttpContext context)
    {
        if (context.Request.Cookies["Shopby"] == null || context.Request.Cookies["Shopby"]["OrderNo"] == null)
        {
            return "";
        }
        else
            return context.Request.Cookies["Shopby"]["OrderNo"];
    }
}