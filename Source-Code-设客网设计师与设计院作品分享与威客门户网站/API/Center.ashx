<%@ WebHandler Language="C#" Class="Center" %>
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.BLL.CreateJS;
using ZoomLa.BLL.Helper;
using ZoomLa.Model;
using ZoomLa.Model.CreateJS;
using ZoomLa.SQLDAL;
using Newtonsoft.Json;


public class Center : IHttpHandler {
    M_APIResult result = new M_APIResult();
    B_Content conBll = new B_Content();
    M_Ucenter ucMod = null;
    B_Ucenter ucBll = new B_Ucenter();
    B_Favorite favBll = new B_Favorite();
    private string Action { get { return HttpContext.Current.Request["Action"]; } }
    private string Key { get { return HttpContext.Current.Request["Key"]; } }
    private int PSize { get { return DataConvert.CLng(HttpContext.Current.Request["psize"]); } }
    private int CPage { get { return DataConvert.CLng(HttpContext.Current.Request["cpage"]); } }
    private string fields { get { return HttpContext.Current.Request["fields"] ?? ""; } }
    //如有传值,则为JsonP
    private string CallBackFunc { get { return HttpContext.Current.Request["callback"]; } }
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest req = context.Request; HttpResponse rep = context.Response;
        result.callback = CallBackFunc;
        try
        {
            switch (Action)
            {
                case "GetTops":
                    result = GetTops(DataConvert.CLng(req["nid"]), PSize, DataConvert.CBool(req["hasimg"]));
                    break;
                case "GetArticles":
                    result = GetArticles(DataConvert.CLng(req["nid"]), PSize, CPage, req["author"], DataConvert.CStr(req["order"]));
                    break;
                case "GetContent":
                    result = GetContent(Convert.ToInt32(req["gid"]));
                    break;
                case "GetCustom":
                    result = GetCustom(req["alias"],req);
                    break;
                case "AddFavour":
                    result = AddFavour(Key, Convert.ToInt32(req["gid"]), Convert.ToInt32(req["uid"]));
                    break;
                case "SelFavour":
                    result = SelFavour(Key, Convert.ToInt32(req["uid"]), PSize, CPage);
                    break;
                default:
                    result.retcode = -1;
                    result.retmsg = Action + "不是有效的参数";
                    break;
            }
        }
        catch (Exception ex) { result.retcode = -1; result.retmsg = ex.Message; }
        HttpContext.Current.Response.Write(result.ToString());
        HttpContext.Current.Response.Flush();
        HttpContext.Current.Response.End();
    }
    /// <summary>
    /// 获取指定节点的带图推荐文章(仅限ZL_C_Article,6篇)
    /// </summary>
    /// <param name="nid">0则抽全站</param>
    /// <param name="hasimg">True:必须带图,默认false</param>
    /// <returns></returns>
    public M_APIResult GetTops(int nid, int psize, bool hasimg)
    {
        int count = 0;
        string fields = "A.generalid,A.title,A.nodeid,A.itemid,A.inputer,A.createtime,B.pic AS topimg,B.author,B.synopsis";//全小写兼容Java
        string tbname = "ZL_C_Article";
        try
        {
            if (psize < 1) { psize = 6; }
            string where = "A.Status=99 AND EliteLevel=1 ";
            if (hasimg)
            {
                where += " AND (B.pic is not null AND B.pic!='') ";
            }
            if (nid > 0) { where += "AND A.NodeID=" + nid; }
            DataTable dt = PageHelper.SelPage(psize, 1, out count, "A.GeneralID", fields, "ZL_CommonModel", tbname, "A.ItemID=B.ID", where, "Order BY A.CreateTime DESC", null);
            dt.Columns.Add(new DataColumn("url", typeof(string)));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                dr["url"] = "/Class_2/NodeNews.aspx?id=" + dr["GeneralID"];
                dr["topimg"] = GetImgUrl(dr["topimg"]);
            }
            result.result = JsonConvert.SerializeObject(dt);
            result.addon = result.AddJson("count", count);
        }
        catch (Exception ex) { result.retcode = -1; result.retmsg = "数据读取错误,可能是节点有误或模型不正确,原因:" + ex.Message; }
        return result;
    }
    /// <summary>
    /// 获取节点文章,返回Json数据,目标节点最好只绑定一种模型,一张表
    /// </summary>
    /// <param name="nodeid">节点ID</param>
    /// <param name="psize">数量</param>
    /// <param name="cpage">页码</param>
    /// <param name="author">不为空,则按作者筛选</param>
    /// <example>http://m.hbncw.net/API/Center.ashx?Action=GetArticles&nid=1&psize=10&cpage=1</example>
    /// <returns>文章Json</returns>
    public M_APIResult GetArticles(int nid, int psize, int cpage,string author,string order)
    {
        //CheckKey(key);
        int count = 0;
        string fields = "A.generalid,A.title,A.nodeid,A.itemid,A.inputer,A.createtime,B.pic AS topimg,B.author,B.synopsis";//全小写兼容Java
        string tbname = nid == 0 ? "ZL_C_Article" : conBll.GetTbNameByNid(nid);
        if (string.IsNullOrEmpty(tbname))
        {
            result.retcode = -1;
            result.retmsg = "节点不存在,取值失败";
            return result;
        }
        try
        {
            SqlParameter[] sp = new SqlParameter[] { new SqlParameter("author", author) };
            string where = "A.Status=99 "; order = order.ToLower();
            if (!string.IsNullOrEmpty(author))
            {
                where += " AND A.Inputer=@author";
            }
            if (nid > 0)
            {
                where += " AND A.NodeID= " + nid;
            }
            switch (order)
            {
                case "asc":
                    order = "Order BY A.CreateTime ASC";
                    break;
                default:
                    order = "Order BY A.CreateTime DESC";
                    break;
            }
            DataTable dt = PageHelper.SelPage(psize, cpage, out count, "A.GeneralID", fields, "ZL_CommonModel", tbname, "A.ItemID=B.ID", where,order, sp);
            dt.Columns.Add(new DataColumn("url", typeof(string)));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                dr["url"] = "/Class_2/NodeNews.aspx?id=" + dr["GeneralID"];
                dr["topimg"] = GetImgUrl(dr["topimg"]);
            }
            result.result = JsonConvert.SerializeObject(dt);
            result.addon = result.AddJson("count", count);
        }
        catch (Exception) { result.retcode = -1; result.retmsg = "数据读取错误,可能是节点有误或模型不正确"; }
        return result;
    }
    public M_APIResult GetContent(int gid)
    {
        string fields = "A.generalid,A.title,A.nodeid,A.inputer,A.createtime,A.url='',B.pic AS topimg,B.content,B.synopsis";
        string tbname = conBll.SelReturnModel(gid).TableName;
        DataTable dt = SqlHelper.JoinQuery(fields, "ZL_CommonModel", tbname, "A.ItemID=B.ID", "A.GeneralID=" + gid);
        //for (int i = 0; i < dt.Rows.Count; i++)
        //{
        //    DataRow dr = dt.Rows[i];
        //    dr["url"] = "/Class_2/NodeNews.aspx?id="+dr["GeneralID"];
        //}
        result.result = JsonConvert.SerializeObject(dt);
        return result;
    }
    /// <summary>
    /// 根据管理员定义,开放指定表中的数据
    /// </summary>
    /// <param name="name">开放权限别名</param>
    public M_APIResult GetCustom(string alias, HttpRequest req)
    {
        B_API_JsonP apiBll = new B_API_JsonP();
        M_API_JsonP apiMod = apiBll.SelModelByAlias(alias);
        if (apiMod == null) { result.retcode = -1; result.retmsg = "接口:[" + alias + "]不存在,或已经关闭"; return result; }
        int itemcount = 0;
        List<SqlParameter> splist = new List<SqlParameter>();
        if (!string.IsNullOrEmpty(apiMod.Params))
        {
            List<M_API_Param> paramList = JsonConvert.DeserializeObject<List<M_API_Param>>(apiMod.Params);
            foreach (M_API_Param param in paramList)
            {
                string value = req[param.name] ?? "";
                //如为空,且设定了默认值,填充默认值
                if (string.IsNullOrEmpty(value) && !string.IsNullOrEmpty(param.defval))
                {
                    value = param.defval;
                }
                switch (param.type)
                {
                    case "int":
                        splist.Add(new SqlParameter(param.name, DataConvert.CLng(value)));
                        break;
                    case "string":
                        splist.Add(new SqlParameter(param.name, value));
                        break;
                    case "like":
                        splist.Add(new SqlParameter(param.name, "%" + value + "%"));
                        break;
                }
            }
        }
        SqlParameter[] sp = splist.ToArray();
        DataTable dt = new DataTable();
        if (string.IsNullOrEmpty(apiMod.T2))
        {
            dt = PageHelper.SelPage(PSize, CPage, out itemcount, apiMod.MyPK, apiMod.Fields, apiMod.T1, apiMod.WhereStr, "ORDER BY " +apiMod.OrderStr, sp);
        }
        else
        {
            dt = PageHelper.SelPage(PSize, CPage, out itemcount, apiMod.MyPK, apiMod.Fields, apiMod.T1, apiMod.T2, apiMod.ONStr, apiMod.WhereStr, "ORDER BY " + apiMod.OrderStr, sp);
        }
        result.result = JsonConvert.SerializeObject(dt);
        result.addon = result.AddJson("count", itemcount);
        return result;
    }
    //添加收藏
    public M_APIResult AddFavour(string key, int gid, int uid)
    {
        CheckKey(key);
        M_Favorite favMod = new M_Favorite();
        M_CommonData model = conBll.SelReturnModel(gid);
        favMod.InfoID = gid;
        //favMod.FavItemID = gid;
        favMod.Title = model.Title;
        favMod.Owner = uid;
        favMod.FavUrl = "";
        favMod.FavoriType = 1;//需检测是否重复
        favMod.AddDate = DateTime.Now;
        if (SqlHelper.ExecuteTable(CommandType.Text, "SELECT Top 1 FavoriteID From ZL_Favorite WHERE InfoID=" + gid + " AND Owner=" + uid + " AND FavoriType=1", null).Rows.Count>0)
        {
            result.retcode = -1;
            result.retmsg = "你已收藏过该文章";
        }
        else { favBll.insert(favMod); }
        return result;
    }
    //获取收藏
    public M_APIResult SelFavour(string key, int uid, int psize, int cpage)
    {
        CheckKey(key);
        M_Favorite favMod = new M_Favorite();
        int count = 0;
        DataTable dt = PageHelper.SelPage(psize, cpage, out count, favMod.PK, "*", favMod.TbName, "Owner=" + uid);
        result.result = JsonConvert.SerializeObject(dt);
        result.addon = result.AddJson("count", count);
        return result;
    }
    private string GetImgUrl(object topimg)
    {
        string imgurl = topimg == DBNull.Value ? "" : topimg.ToString().ToLower();
        if (imgurl.StartsWith("/uploadfiles/")) { imgurl = imgurl.Replace("/uploadfiles/", ""); }
        imgurl = string.IsNullOrEmpty(imgurl) ? "" : ("/UploadFiles/" + imgurl).Replace("//", "/");
        return imgurl;
    }
    //稍后转入
    private M_Ucenter CheckKey(string key)
    {
        ucMod = ucBll.SelByKey(key);
        if (ucMod == null)
        {
            result = new M_APIResult() { retcode = -1, retmsg = "Key验证失败" };
            HttpContext.Current.Response.Write(result.ToString()); HttpContext.Current.Response.Flush(); HttpContext.Current.Response.End();
        }
        return ucMod;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}