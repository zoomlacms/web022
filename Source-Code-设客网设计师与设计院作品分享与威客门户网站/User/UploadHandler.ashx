<%@ WebHandler Language="C#" Class="UploadHandler" %>
using System;
using System.Web;
using System.IO;
using ZoomLa.BLL;
using ZoomLa.BLL.FTP;
using ZoomLa.Model.FTP;
using System.Text;
using ZoomLa.Components;
using ZoomLa.Common;
/*
 * 用于用户中心--云盘
 */ 
public class UploadHandler : IHttpHandler
{
    private B_FTP bf = new B_FTP();
    private M_FtpConfig mf = new M_FtpConfig();
    protected B_User ull = new B_User();
    protected ZoomLa.Model.M_UserInfo uinfo;
    private string publicFolder = "/UploadFiles/";
    
    public void ProcessRequest(HttpContext context)
    {
        ull.CheckIsLogin();
        this.uinfo = ull.GetLogin();
        HttpPostedFile file = context.Request.Files["Filedata"];
        string vPath = "",PhPath="";
        
        string dir = context.Request["Dir"].Split(':')[0];
        string type = "";
        if (context.Request["Dir"].Split(':').Length > 1)
        {
            type = context.Request["Dir"].Split(':')[1];
        }
        
        //确定Path
        if (!string.IsNullOrEmpty(type)&&type.Equals("PF"))//公文文件夹
        {
            if (!SiteConfig.SiteOption.Cloud_Auth.Contains("up")) return;
            vPath = SafeSC.PathDeal(publicFolder + context.Server.UrlDecode(dir) + "\\");
        }
        else
        {
            vPath = SafeSC.PathDeal("\\" + SiteConfig.SiteOption.UploadDir + "\\" + uinfo.UserName + "\\" + context.Server.UrlDecode(dir) + "\\"); 
        }
        if (context.Request["content"] != null || context.Request["content"] != "0")
        {
            context.Response.ContentType = "text/plain";
            context.Response.Charset = "utf-8";
            context.Response.Write(context.Server.UrlDecode(dir));

            PhPath = HttpContext.Current.Server.MapPath(vPath); 
            if (file != null)
            {
                SafeSC.SaveFile(vPath,file);
                //上传成功后让上传队列的显示自动消失
                context.Response.Write(function.VToP(vPath).Replace(PhPath, "").Replace('\\', '/'));
            }
            else
            {
                context.Response.Write("0");
            }
        }
    }

    public bool IsReusable
    {
        get { return false; }
    }
}