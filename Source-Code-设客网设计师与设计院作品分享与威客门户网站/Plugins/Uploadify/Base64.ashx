<%@ WebHandler Language="C#" Class="Base64" %>

using System;
using System.Web;
using ZoomLa.BLL;
using ZoomLa.Model;
using ZoomLa.Components;
using ZoomLa.BLL.Helper;
using ZoomLa.Common;
using System.Web.SessionState;

//仅用于Base64上传
public class Base64 :IHttpHandler, IRequiresSessionState
{
    B_Admin badmin = new B_Admin();
    B_User buser = new B_User();
    M_UserInfo mu = new M_UserInfo();

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        context.Request.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-8");
        context.Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-8");
        if (!buser.CheckLogin() && !badmin.CheckLogin()) { throw new Exception("未登录"); }
        mu = buser.GetLogin();
        string base64str = context.Request.Form["base64"];//上传的base64字符串
        string action = context.Request.Form["action"];
        string uploadPath = SiteConfig.SiteOption.UploadDir;
        string saveName = function.GetRandomString(6) + ".jpg";
        string result = "";
        try
        {
            switch (action)
            {
                default:
                    if (buser.CheckLogin())
                    {
                        uploadPath = context.Server.UrlDecode(SiteConfig.SiteOption.UploadDir + "User/" + mu.UserName + mu.UserID + "/");
                    }
                    else if (badmin.CheckLogin())
                    {
                        M_AdminInfo adminMod = badmin.GetAdminLogin();
                        uploadPath = context.Server.UrlDecode(SiteConfig.SiteOption.UploadDir + "Admin/" + adminMod.AdminName + adminMod.AdminId + "/");
                    }
                    else { throw new Exception("当前用户未登录"); }
                    break;
            }
            ImgHelper imghelper = new ImgHelper();
            imghelper.Base64ToImg(uploadPath + saveName, base64str);
            result = uploadPath + saveName;
            context.Response.Write(result); context.Response.End();
        }
        catch (Exception ex)
        {
            ZLLog.L(ZLEnum.Log.fileup, new M_Log()
            {
                UName = mu.UserName,
                Source = context.Request.RawUrl,
                Message = "上传失败|文件名:" + saveName + "|" + "原因:" + ex.Message
            });
        }

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}