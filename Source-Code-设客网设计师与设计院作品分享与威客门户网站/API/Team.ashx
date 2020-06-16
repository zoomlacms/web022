<%@ WebHandler Language="C#" Class="Team" %>

using System;
using System.Web;
using ZoomLa.SQLDAL;
using ZoomLa.Model;
using ZoomLa.BLL;
using ZoomLa.Common;
using System.IO;
/*
 * 用于Team360,提供手机API
 */ 

public class Team : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
{
    B_User buser = new B_User();
    public void ProcessRequest(HttpContext context)
    {
        return;
        HttpRequest request = context.Request;
        HttpResponse response = context.Response;
        string action = string.IsNullOrEmpty(request["action"]) ? "login" : request["action"];
        string result = "";
        switch (action)
        {
            case "login"://http://Cloud.zoomla.cn/api/team.ashx?N=test&p=test&os=2t&mac=1&action=upfile
                {
                    //string uname = request["n"];
                    //string passwd = request["p"];//已经MD5后的密码
                    //int os = DataConvert.CLng(request["os"]);//设备号
                    //string mac = request["mac"];
                    //if (string.IsNullOrEmpty(uname) || string.IsNullOrEmpty(passwd))
                    //{
                    //    result = "{\"retstatus\":\"-1\",\"retmsg\":\"登录失败,用户名或密码不能为空\"}";
                    //}
                    //else
                    //{
                    //    M_UserInfo mu = buser.AuthenticateUser(uname, passwd, true);
                    //    if (mu.IsNull)
                    //    {
                    //        result = "{\"retstatus\":\"-1\",\"retmsg\":\"登录失败,用户名或密码错误\"}";
                    //    }
                    //    else
                    //    {
                    //        buser.SetLoginState(mu, "Day");
                    //        M_Uinfo basemod = buser.GetUserBaseByuserid(mu.UserID);
                    //        string authStamp = EncryptHelper.AESEncrypt(mu.UserName + "|" + mu.UserPwd + "|" + DateTime.Now);
                    //        result = "{\"retstatus\":\"99\",\"retmsg\":\"\",\"UserID\":\"" + mu.UserID + "\",\"UserName\":\"" + mu.UserName + "\",\"UserFace\":\"" + mu.UserFace + "\",\"TrueName\":\"" + mu.HoneyName + "\",\"CompName\":\"逐浪软件\",\"Url\":\"http://Cloud.zoomla.cn/\",\"AuthStamp\":\"" + authStamp + "\"}";
                    //        //\"TUrl\":\"http://Cloud.zoomla.cn/User/Default.aspx\",
                    //    }
                    //}
                }
                break;
            case "upfile":
                //if (buser.CheckLogin() && request.Files["TeamFile"]!=null)
                //{                //}
                try
                {
                    //StreamReader sr = new StreamReader(request.InputStream);
                    //string s = sr.ReadToEnd();
                    //HttpPostedFile file = request.Files[0];
                    //string vpath = SafeSC.SaveFile("/UploadFiles/Test/", file, file.FileName);
                    //result = "{\"retstatus\":\"99\",\"retmsg\":\"上传成功,文件路径" + vpath + "\"}";
                }
                catch (Exception ex) { result = "{\"retstatus\":\"-1\",\"retmsg\":\"上传失败,原因:" + ex.Message + "\"}"; }
                break;
        }
        response.Clear(); response.Write(result); response.Flush(); response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}