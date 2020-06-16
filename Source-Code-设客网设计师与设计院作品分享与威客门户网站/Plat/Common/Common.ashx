<%@ WebHandler Language="C#" Class="Common" %>

using System;
using System.Web;
using System.Data;
using ZoomLa.BLL;
using ZoomLa.Model;
using System.Collections.Generic;

public class Common : IHttpHandler,System.Web.SessionState.IRequiresSessionState {
    B_User_Plat upBll = new B_User_Plat();
    //统一状态码  -1:失败,99:成功
    //以下都限制为只能获取用户所在的公司
    public void ProcessRequest(HttpContext context)
    {
        string action = context.Request.Form["action"];
        string value = context.Request.Form["value"];
        string result = "";
        switch (action)
        {
            case "Plat_CompUser"://获取公司中成员,用于@功能
                {
                    M_User_Plat upMod = B_User_Plat.GetLogin();
                    DataTable dt = upBll.SelByCompWithAT(upMod.CompID);
                    string json = JsonHelper.JsonSerialDataTable(dt);
                    context.Response.Write(json); context.Response.Flush(); context.Response.End();
                }
                break;
            case "getuinfo"://获取单个用户信息(只允许获取本公司),返回的信息存入Json,避免重复检测,后期将服务端也缓存化
                {
                    M_User_Plat upMod = B_User_Plat.GetLogin();
                    int uid = Convert.ToInt32(value);
                    M_User_Plat model = upBll.SelReturnModel(uid, upMod.CompID);
                    if (model != null)
                        result = "{\"id\":\"" + model.UserID + "\",\"UserID\":\"" + model.UserID + "\",\"UserName\":\"" + model.TrueName + "\",\"Mobile\":\"" + model.Mobile + "\",\"GroupName\":\"" + model.GroupName + "\",\"UserFace\":\"" + model.UserFace + "\"}";
                    context.Response.Write(result); context.Response.Flush(); context.Response.End();
                }
                break;
            case "getnotify"://获取提醒
                {
                    if (B_Notify.NotifyList.Count < 1) break;
                    B_Notify notBll = new B_Notify();
                    notBll.RemoveExpire();//去除超时的
                    M_UserInfo mu = new B_User().GetLogin();
                    List<M_Notify> list = notBll.GetNotfiyByUid(mu.UserID);
                    if (list.Count > 0)
                    {
                        foreach (M_Notify model in list)//有多个就发多条
                        {
                            notBll.AddReader(model, mu.UserID);
                            result += "{\"title\":\"" + model.Title + "\",\"content\":\"" + model.Content + "\",\"cuname\":\"" + model.CUName + "\"},";
                        }
                        result = result.TrimEnd(',');
                        result = "[" + result + "]";
                        context.Response.Write(result); context.Response.Flush(); context.Response.End();
                    }
                }
                break;
            case "privatesend"://私信功能,走邮件模块
                {
                    M_User_Plat upMod = B_User_Plat.GetLogin();
                    string msg = context.Request.Form["msg"];
                    string receuser = context.Request.Form["receuser"];
                    if (!string.IsNullOrWhiteSpace(msg) && !string.IsNullOrWhiteSpace(receuser) && SafeSC.CheckIDS(receuser))
                    {
                        //过滤非用户公司的同事,后期处理
                        M_Message msgMod = new M_Message();
                        B_Message msgBll = new B_Message();
                        msgMod.Incept = receuser;
                        msgMod.Sender = upMod.UserID.ToString();
                        msgMod.Title = upMod.TrueName + "的私信";
                        msgMod.PostDate = DateTime.Now;
                        msgMod.Content = msg;
                        msgMod.Savedata = 0;
                        msgMod.Receipt = "";
                        msgMod.CCUser = "";
                        msgMod.Attachment = "";
                        msgBll.GetInsert(msgMod);
                        result = "99";
                        //添加一条新提醒
                        B_Notify.AddNotify(upMod.UserName,"你收到一封私信",msgMod.Title,msgMod.Incept);
                    }
                    else result = "-1";
                    context.Response.Write(result); context.Response.Flush(); context.Response.End();
                }
                break;
            case "GetQrCode":
                {
                    
                }
                break;
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}