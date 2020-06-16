namespace ZoomLa.WebSite
{
    using System;
    using System.IO;
    using System.Data;
    using System.Configuration;
    using System.Collections;
    using System.Collections.Generic;
    using System.Web;
    using System.Web.Security;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.WebControls.WebParts;
    using System.Web.UI.HtmlControls;
    using System.Text.RegularExpressions;
    using System.Xml;
    using ZoomLa.BLL;
    using ZoomLa.BLL.User;
    using ZoomLa.Common;
    using ZoomLa.Components;
    using ZoomLa.Model;

    public partial class Content : System.Web.UI.Page
    {
        protected B_User ull = new B_User();
        protected B_CreateHtml bll = new B_CreateHtml();
        protected B_CreateShopHtml sll = new B_CreateShopHtml();
        protected B_Sensitivity sell = new B_Sensitivity();
        protected B_Node bnode = new B_Node();
        protected B_Content bcontent = new B_Content();
        protected B_Model bmode = new B_Model();
        protected B_User buser = new B_User();
        public int ItemID
        {
            get
            {
                return DataConverter.CLng(B_Route.GetParam("ID", Page));
            }
        }
        public int Cpage
        {
            get
            {
                //0=显示全部
                int page = DataConverter.CLng(B_Route.GetParam("CPage", Page));
                page = page < 0 ? 0 : page;
                return page;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ItemID < 1)
            { function.WriteErrMsg("[产生错误的可能原因：内容信息不存在或未开放！调用方法：Content.aspx?ID=内容ID]"); }
                M_CommonData ItemInfo = bcontent.GetCommonData(ItemID);
                M_Node nodeinfo =bnode.GetNode(ItemInfo.NodeID);
                if (ItemInfo.IsNull)
                {
                    function.WriteErrMsg("[产生错误的可能原因：内容信息不存在或未开放！]");
                }
                else if (ItemInfo.Status == -2)
                {
                    function.WriteErrMsg("[对不起，当前信息已删除，您无法浏览！]");
                }
                else if (ItemInfo.Status == 0&&ItemInfo.NodeID!=37)
                {
                    function.WriteErrMsg("[对不起，当前信息待审核状态，您无法浏览！]");
                }
                else if (ItemInfo.Status < 0)
                {
                    function.WriteErrMsg("[对不起，当前信息未通过审核，您无法浏览！]");
                }
                if (nodeinfo.PurviewType)
                {
                    if (!buser.CheckLogin())
                    {
                        function.WriteErrMsg("该信息所属栏目需登录验证，请先<a href='/User/login.aspx' target='_top'>登录</a>再进行此操作！", "/User/login.aspx");
                    }
                    else
                    {
                        //此处以后可以加上用户组权限检测
                    }
                }
                if (nodeinfo.ConsumePoint > 0)
                {
                    M_UserInfo userinfo = buser.GetUserByUserID(buser.GetLogin().UserID);
                    int groupID = 0; //会员级别id
                    int groupNum = 0; //浏览文章的次数

                    if (nodeinfo.Viewinglimit != "" || nodeinfo.Viewinglimit != null)
                    {
                        #region 查找当前登录会员浏览该文章规定的次数
                        string Viewinglimits = nodeinfo.Viewinglimit;
                        string[] ViewinglimitArray = Viewinglimits.Split(new char[] { '|' });
                        if (ViewinglimitArray.Length > 1)
                        {
                            for (int i = 0; i < ViewinglimitArray.Length; i++)
                            {
                                if (userinfo.GroupID == int.Parse(ViewinglimitArray[i].Substring(0, ViewinglimitArray[i].IndexOf("="))))
                                {
                                    groupID = int.Parse(ViewinglimitArray[i].Substring(0, ViewinglimitArray[i].IndexOf("=")));
                                    groupNum = int.Parse(ViewinglimitArray[i].Substring(ViewinglimitArray[i].IndexOf("=") + 1, ViewinglimitArray[i].Length - ViewinglimitArray[i].Substring(0, ViewinglimitArray[i].IndexOf("=") + 1).Length));
                                    break;
                                }
                            }
                        }
                        #endregion
                    }
                    if (buser.CheckLogin() && (userinfo.UserPoint - nodeinfo.ConsumePoint) > 0)
                    {
                        B_CompleteHistory bcomhistory = new B_CompleteHistory();
                        switch (nodeinfo.ConsumeType)
                        {
                            case 0://0-不重复收费
                                ReadArticleStandardCharges(userinfo, nodeinfo, buser, bcomhistory, ItemInfo.GeneralID, nodeinfo.ConsumeType, groupID, groupNum);
                                break;
                            case 1://1-距离上次收费时间多少小时后重新收费
                                ReadArticleStandardCharges(userinfo, nodeinfo, buser, bcomhistory, ItemInfo.GeneralID, nodeinfo.ConsumeType, groupID, groupNum);
                                break;
                            case 2://2-重复阅读内容多少次重新收费
                                ReadArticleStandardCharges(userinfo, nodeinfo, buser, bcomhistory, ItemInfo.GeneralID, nodeinfo.ConsumeType, groupID, groupNum);
                                break;
                            case 3://3-上述两者都满足时重新收费
                                ReadArticleStandardCharges(userinfo, nodeinfo, buser, bcomhistory, ItemInfo.GeneralID, nodeinfo.ConsumeType, groupID, groupNum);
                                break;
                            case 4://4- 1、2两者任一个满足时就重新收费
                                ReadArticleStandardCharges(userinfo, nodeinfo, buser, bcomhistory, ItemInfo.GeneralID, nodeinfo.ConsumeType, groupID, groupNum);
                                break;
                            case 5: //5-每阅读一次就重复收费一次
                                ReadArticleStandardCharges(userinfo, nodeinfo, buser, bcomhistory, ItemInfo.GeneralID, nodeinfo.ConsumeType, groupID, groupNum);
                                break;
                            default:
                                ReadArticleStandardCharges(userinfo, nodeinfo, buser, bcomhistory, ItemInfo.GeneralID, nodeinfo.ConsumeType, groupID, groupNum);//不重复收费
                                break;
                        }
                    }
                    else
                    {
                        function.WriteErrMsg("您的点券不足,请充值!");
                    }
                }
                M_ModelInfo modelinfo = bmode.GetModelById(ItemInfo.ModelID);
                string TempNode = bnode.GetModelTemplate(ItemInfo.NodeID, ItemInfo.ModelID);
                string TempContent = ItemInfo.Template;
                string TemplateDir = modelinfo.ContentModule;
                if (!string.IsNullOrEmpty(TempContent))
                    TemplateDir = TempContent;
                else
                {
                    if (!string.IsNullOrEmpty(TempNode))
                        TemplateDir = TempNode;
                }
                if (string.IsNullOrEmpty(TemplateDir))
                {
                    function.WriteErrMsg("该内容所属模型未指定模板");
                }
                else
                {
                    GetNodePreate(nodeinfo.NodeID);
                    if (!(TemplateDir.ToLower().IndexOf("site") > 0 && TemplateDir.ToLower().IndexOf("site") <= 2))
                    {
                        TemplateDir = base.Request.PhysicalApplicationPath + SiteConfig.SiteOption.TemplateDir + "/" + TemplateDir;
                    }
                    else
                    {
                        TemplateDir = base.Request.PhysicalApplicationPath + "/" + TemplateDir;
                    }
                    int pid = bnode.GetContrarily(DataConverter.CLng(ItemInfo.NodeID), 5);//子站判断
                    M_Node mn = bnode.GetNodeXML(DataConverter.CLng(pid));
                    mn = bnode.dal_GetNode(DataConverter.CLng(pid));
                    if (mn.NodeBySite == 5)
                    {
                        string NodeDir = mn.NodeDir;
                        mn = bnode.GetNodeXML(DataConverter.CLng(ItemInfo.NodeID));
                        TemplateDir = modelinfo.ContentModule;
                        if (!string.IsNullOrEmpty(TempNode))
                            TemplateDir = TempNode;
                        if (TemplateDir.IndexOf("SiteTemplate") < 0)
                            TemplateDir = "\\Site\\" + NodeDir + "\\Template" + TemplateDir;
                        TemplateDir = base.Request.PhysicalApplicationPath + TemplateDir;// "\\Site\\" + NodeDir + "\\Template" +
                    }
                    TemplateDir = TemplateDir.Replace("/", @"\").Replace(@"\\", @"\");
                    string Templatestrstr = FileSystemObject.ReadFile(TemplateDir);
                    string ContentHtml = this.bll.CreateHtml(Templatestrstr, Cpage, ItemID, "0");//Templatestrstr:模板页面字符串,页码,该文章ID
                    /* --------------------判断是否分页 并做处理------------------------------------------------*/
                    if (!string.IsNullOrEmpty(ContentHtml))
                    {
                        string infoContent = ""; //进行处理的内容字段
                        string pagelabel = "";
                        string infotmp = "";

                        #region 分页符分页

                        string pattern = @"{\#PageCode}([\s\S])*?{\/\#PageCode}";  //查找要分页的内容
                        if (Regex.IsMatch(ContentHtml, pattern, RegexOptions.IgnoreCase))
                        {
                            infoContent = Regex.Match(ContentHtml, pattern, RegexOptions.IgnoreCase).Value;
                            infotmp = infoContent;
                            infoContent = infoContent.Replace("{#PageCode}", "").Replace("{/#PageCode}", "");
                            //查找分页标签
                            bool isPage = false;
                            string pattern1 = @"{ZL\.Page([\s\S])*?\/}";

                            if (Regex.IsMatch(ContentHtml, pattern1, RegexOptions.IgnoreCase))
                            {
                                pagelabel = Regex.Match(ContentHtml, pattern1, RegexOptions.IgnoreCase).Value;
                                isPage = true;
                            }
                            if (isPage)
                            {
                                if (string.IsNullOrEmpty(infoContent)) //没有设定要分页的字段内容
                                {
                                    ContentHtml = ContentHtml.Replace(pagelabel, "");
                                }
                                else   //进行内容分页处理
                                {
                                    //文件名
                                    string file1 = "Content.aspx?ID=" + ItemID.ToString();
                                    //取分页标签处理结果 返回字符串数组 根据数组元素个数生成几页 
                                    string ilbl = pagelabel.Replace("{ZL.Page ", "").Replace("/}", "").Replace(" ", ",");
                                    string lblContent = "";
                                    IList<string> ContentArr = new List<string>();

                                    if (string.IsNullOrEmpty(ilbl))
                                    {
                                        lblContent = "{loop}<a href=\"{$pageurl/}\">{$pageid/}</a>$$$<b>[{$pageid/}]</b>{/loop}"; //默认格式的分页导航
                                        ContentArr = this.bll.GetContentPage(infoContent);
                                    }
                                    else
                                    {
                                        string[] paArr = ilbl.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                                        if (paArr.Length == 0)
                                        {
                                            lblContent = "{loop}<a href=\"{$pageurl/}\">{$pageid/}</a>$$$<b>[{$pageid/}]</b>{/loop}"; //默认格式的分页导航
                                            ContentArr = this.bll.GetContentPage(infoContent);
                                        }
                                        else
                                        {
                                            string lblname = paArr[0].Split(new char[] { '=' })[1].Replace("\"", "");
                                            B_Label blbl = new B_Label();
                                            lblContent = blbl.GetLabelXML(lblname).Content;
                                            if (string.IsNullOrEmpty(lblContent))
                                            {
                                                lblContent = "{loop}<a href=\"{$pageurl/}\">{$pageid/}</a>$$$<b>[{$pageid/}]</b>{/loop}"; //默认格式的分页导航
                                            }
                                            ContentArr = this.bll.GetContentPage(infoContent);
                                        }
                                    }

                                    if (ContentArr.Count > 0) //存在分页数据
                                    {
                                        if (Cpage == 0)//显示全部
                                        {
                                            ContentHtml = ContentHtml.Replace(infotmp, infoContent);
                                            ContentHtml = ContentHtml.Replace("[PageCode/]", "");
                                        }
                                        else
                                        {
                                            ContentHtml = ContentHtml.Replace(infotmp, ContentArr[Cpage - 1]);
                                        }
                                        ContentHtml = ContentHtml.Replace(pagelabel, this.bll.GetPage(lblContent, ItemID, Cpage, ContentArr.Count, ContentArr.Count));//输出分页
                                    }
                                    else
                                    {
                                        ContentHtml = ContentHtml.Replace(infotmp, infoContent);
                                        ContentHtml = ContentHtml.Replace(pagelabel, "");
                                    }
                                }
                            }
                            else  //没有分页标签
                            {
                                //如果设定了分页内容字段 将该字段内容的分页标志清除
                                if (!string.IsNullOrEmpty(infoContent))
                                    ContentHtml = ContentHtml.Replace(infotmp, infoContent);
                            }
                        }
                        #endregion

                        pattern = @"{\#Content}([\s\S])*?{\/\#Content}";  //查找要分页的内容
                        if (Regex.IsMatch(ContentHtml, pattern, RegexOptions.IgnoreCase))
                        {
                            infoContent = Regex.Match(ContentHtml, pattern, RegexOptions.IgnoreCase).Value;
                            infotmp = infoContent;
                            infoContent = infoContent.Replace("{#Content}", "").Replace("{/#Content}", "");
                            //查找分页标签
                            bool isPage = false;
                            string pattern1 = @"{ZL\.Page([\s\S])*?\/}";
                            if (Regex.IsMatch(ContentHtml, pattern1, RegexOptions.IgnoreCase))
                            {
                                pagelabel = Regex.Match(ContentHtml, pattern1, RegexOptions.IgnoreCase).Value;
                                isPage = true;
                            }
                            if (isPage)
                            {
                                if (string.IsNullOrEmpty(infoContent)) //没有设定要分页的字段内容
                                {
                                    ContentHtml = ContentHtml.Replace(pagelabel, "");
                                }
                                else   //进行内容分页处理
                                {
                                    //文件名
                                    string file1 = "Content.aspx?ID=" + ItemID.ToString();
                                    //取分页标签处理结果 返回字符串数组 根据数组元素个数生成几页 
                                    string ilbl = pagelabel.Replace("{ZL.Page ", "").Replace("/}", "").Replace(" ", ",");
                                    string lblContent = "";
                                    int NumPerPage = 500;
                                    IList<string> ContentArr = new List<string>();

                                    if (string.IsNullOrEmpty(ilbl))
                                    {
                                        lblContent = "{loop}<a href=\"{$pageurl/}\">{$pageid/}</a>$$$<b>[{$pageid/}]</b>{/loop}"; //默认格式的分页导航
                                        ContentArr = this.bll.GetContentPage(infoContent, NumPerPage);
                                    }
                                    else
                                    {
                                        string[] paArr = ilbl.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                                        if (paArr.Length == 0)
                                        {
                                            lblContent = "{loop}<a href=\"{$pageurl/}\">{$pageid/}</a>$$$<b>[{$pageid/}]</b>{/loop}"; //默认格式的分页导航
                                            ContentArr = this.bll.GetContentPage(infoContent, NumPerPage);
                                        }
                                        else
                                        {
                                            string lblname = paArr[0].Split(new char[] { '=' })[1].Replace("\"", "");
                                            if (paArr.Length > 1)
                                            {
                                                NumPerPage = DataConverter.CLng(paArr[1].Split(new char[] { '=' })[1].Replace("\"", ""));
                                            }
                                            B_Label blbl = new B_Label();
                                            lblContent = blbl.GetLabelXML(lblname).Content;
                                            if (string.IsNullOrEmpty(lblContent))
                                            {
                                                lblContent = "{loop}<a href=\"{$pageurl/}\">{$pageid/}</a>$$$<b>[{$pageid/}]</b>{/loop}"; //默认格式的分页导航
                                            }
                                            ContentArr = this.bll.GetContentPage(infoContent, NumPerPage);
                                        }
                                    }
                                    if (ContentArr.Count > 0) //存在分页数据
                                    {
                                        ContentHtml = ContentHtml.Replace(infotmp, ContentArr[Cpage - 1]);
                                        ContentHtml = ContentHtml.Replace(pagelabel, this.bll.GetPage(lblContent, ItemID, Cpage, ContentArr.Count, NumPerPage));
                                    }
                                    else
                                    {
                                        ContentHtml = ContentHtml.Replace(infotmp, infoContent);
                                        ContentHtml = ContentHtml.Replace(pagelabel, "");
                                    }
                                }
                            }
                            else//没有分页标签
                            {
                                //如果设定了分页内容字段 将该字段内容的分页标志清除
                                if (!string.IsNullOrEmpty(infoContent))
                                    ContentHtml = ContentHtml.Replace(infotmp, infoContent);
                            }
                        }
                    }

                    string patterns = @"{ZL\.Page([\s\S])*?\/}";
                    string pagelabels = Regex.Match(ContentHtml, patterns, RegexOptions.IgnoreCase).Value;
                    if (pagelabels != "")
                    {
                        ContentHtml = ContentHtml.Replace(pagelabels, "");
                    }
                    if (nodeinfo.SafeGuard == 1 && File.Exists(Server.MapPath("/JS/Guard.js")))
                    {
                        ContentHtml = ContentHtml + SafeSC.ReadFileStr("/JS/Guard.js");
                    }
                    if (SiteConfig.SiteOption.IsSensitivity == 1)
                    { ContentHtml = sell.ProcessSen(ContentHtml); }
                    Response.Write(ContentHtml);
                }
        }  
        //阅读文章收费的方法
        private void ReadArticleCharge(M_UserInfo userinfo,M_Node nodeinfo, B_User buser, B_CompleteHistory bcomhistory, int GeneralID)
        {
                //function.WriteMessage("当前文章阅读为10点券每次，您重复阅读4次后收费", "/content.aspx", "收费提示");
                M_CompleteHistory mcomhistory = new M_CompleteHistory();
                mcomhistory.HisTime = DateTime.Now;
                mcomhistory.BidType = 0;
                mcomhistory.score = nodeinfo.ConsumePoint;
                mcomhistory.IP = HttpContext.Current.Request.UserHostAddress;
                mcomhistory.ComeType = 0;
                mcomhistory.CouType = "减值";
                mcomhistory.ShopId = GeneralID; //会员[admin]浏览ID为101的文章扣除点券
                mcomhistory.Detail = "会员：" + userinfo.UserName + " 浏览ID为" + GeneralID + "的文章扣除" + nodeinfo.ConsumePoint.ToString() + "点点券";
                mcomhistory.UserId = buser.GetLogin().UserID;
                int result = bcomhistory.GetInsert(mcomhistory); //新增收费记录信息
                buser.UpdateUserPoint(userinfo.UserPoint - nodeinfo.ConsumePoint, buser.GetLogin().UserID); //扣点券
           
        }
        /// <summary>
        /// 阅读文章标准的收费方法
        /// </summary>
        /// <param name="userinfo">用户属性</param>
        /// <param name="nodeinfo">节点属性</param>
        /// <param name="buser">用户方法类</param>
        /// <param name="bcomhistory">收费记录方法类</param>
        /// <param name="GeneralID">文章类容id</param>
        /// <param name="ConsumeType">文章类型、属性</param>
        /// <param name="groupID">会员级别类型</param>
        /// <param name="groupNum">该会员可浏览文章的篇数</param>
        private void ReadArticleStandardCharges(M_UserInfo userinfo, M_Node nodeinfo, B_User buser, B_CompleteHistory bcomhistory, int GeneralID, int ConsumeType, int groupID, int groupNum)
        {
            int num = 0;
            string message = "";
            if ((userinfo.GroupID == groupID || groupNum == 0) || (userinfo.GroupID == groupID)) //如果该会员浏览某文章超过规定，就不能继续浏览该文章了
            {
                if (ConsumeType == 0) //0-不重复收费
                {
                    //查找当前用户是否第一次浏览该文章
                    M_CompleteHistory ch = bcomhistory.SelReturnModel("where userid=" + buser.GetLogin().UserID + " and BidType=0 and BidPrice=" + nodeinfo.ConsumePoint + " AND ShopId="+GeneralID);
                    if (null == ch)
                    {
                        if (Request.Cookies["MyCook"] == null || Request.Cookies["MyCook"]["return"] != "1")
                        {
                            message = "当前文章阅读为" + nodeinfo.ConsumePoint + "点券/次，只收取一次费用";
                            GetUrl(); 
                            function.WriteMessage(message, "/Class_" + nodeinfo.NodeID + "/Default.aspx", "收费提示");
                        }
                        ReadArticleCharge(userinfo, nodeinfo, buser, bcomhistory, GeneralID);
                    }
                }
                else if (ConsumeType == 1)//1-距离上次收费时间多少小时后重新收费
                {
                    M_CompleteHistory ch = bcomhistory.GetCompleteHistoryTopOne(buser.GetLogin().UserID, GeneralID);
                    DateTime dt = DateTime.Now;
                    if (dt.Hour - ch.HisTime.Hour >= 0 && dt.Hour - ch.HisTime.Hour == nodeinfo.ConsumeTime)
                    {
                        message = "当前文章阅读为" + nodeinfo.ConsumePoint + "点券/次，距离这次收费时间" + nodeinfo.ConsumeTime + "小时后重新收费";
                        GetUrl(); 
                        ReadArticleCharge(userinfo, nodeinfo, buser, bcomhistory, GeneralID);
                    }
                }
                else if (ConsumeType == 2) //2-重复阅读内容多少次重新收费
                {
                    if (num == 0 || num % nodeinfo.ConsumeCount == 1)
                    {
                        if (Request.Cookies["MyCook"] == null || Request.Cookies["MyCook"]["return"] != "1")
                        {
                         message = "当前文章阅读为" + nodeinfo.ConsumePoint + "点券/次，您重复阅读此文章" + nodeinfo.ConsumeCount + "次后重新收费";
                         GetUrl(); 
                         function.WriteMessage(message, HttpContext.Current.ToString(), "收费提示");
                        }
                        ReadArticleCharge(userinfo, nodeinfo, buser, bcomhistory, GeneralID);
                    }
                }
                else if (ConsumeType == 3)//3-上述两者都满足时重新收费
                {
                    M_CompleteHistory ch = bcomhistory.GetCompleteHistoryTopOne(buser.GetLogin().UserID, GeneralID);
                    DateTime dt = DateTime.Now;
                    if ((num == 0 || num % nodeinfo.ConsumeCount == 1) && (dt.Hour - ch.HisTime.Hour >= 0 && dt.Hour - ch.HisTime.Hour == nodeinfo.ConsumeTime))
                    {
                        if (Request.Cookies["MyCook"] == null || Request.Cookies["MyCook"]["return"] != "1")
                        {
                            message = "当前文章阅读为" + nodeinfo.ConsumePoint + "点券/次，距离这次收费时间" + nodeinfo.ConsumeTime + "小时后重新收费，并且您重复阅读此文章" + nodeinfo.ConsumeCount + "次后重新收费";
                            GetUrl(); 
                            function.WriteMessage(message, "/Class_" + nodeinfo.NodeID + "/Default.aspx", "收费提示");
                        }
                        ReadArticleCharge(userinfo, nodeinfo, buser, bcomhistory, GeneralID);

                    }
                }
                else if (ConsumeType == 4)//4- 1、2上述两者任一个满足时就重新收费
                {
                    M_CompleteHistory ch = bcomhistory.GetCompleteHistoryTopOne(buser.GetLogin().UserID, GeneralID);
                    DateTime dt = DateTime.Now;
                    if ((num == 0 || num % nodeinfo.ConsumeCount == 1) || (dt.Hour - ch.HisTime.Hour >= 0 && dt.Hour - ch.HisTime.Hour == nodeinfo.ConsumeTime))
                    {
                        
                        if (Request.Cookies["MyCook"]== null || Request.Cookies["MyCook"]["return"] != "1")
                        {
                            if (nodeinfo.ConsumeTime != 0 && nodeinfo.ConsumeCount != 0)
                            { 
                                message = "当前文章阅读为" + nodeinfo.ConsumePoint + "点券/次，距离这次收费时间" + nodeinfo.ConsumeTime + "小时或重复阅读此文章" + nodeinfo.ConsumeCount + "次后重新收费";
                            }
                            else if (nodeinfo.ConsumeTime != 0)
                            {
                                message = "当前文章阅读为" + nodeinfo.ConsumePoint + "点券/次，距离这次收费时间" + nodeinfo.ConsumeTime + "小时后重新收费";
                            }
                            else if (nodeinfo.ConsumeCount != 0)
                            {
                                message = "当前文章阅读为" + nodeinfo.ConsumePoint + "点券/次，您重复阅读此文章" + nodeinfo.ConsumeCount + "次后重新收费";
                            }
                            else
                            {
                                message = "当前文章阅读为" + nodeinfo.ConsumePoint + "点券/次";
                            }
                            GetUrl(); 
                            function.WriteMessage(message, this.Page.Request.RawUrl, "收费提示");
                        }
                        ReadArticleCharge(userinfo, nodeinfo, buser, bcomhistory, GeneralID);
                    }
                }
                else if (ConsumeType == 5) //5-每阅读一次就重复收费一次
                {
                    
                    if (Request.Cookies["MyCook"] == null || Request.Cookies["MyCook"]["return"] != "1")
                    {
                        message = "当前文章阅读为" + nodeinfo.ConsumePoint + "点券/次，每阅读一次就重复收费一次";
                        GetUrl();
                        function.WriteMessage(message, this.Page.Request.RawUrl, "收费提示");
                    }
                    ReadArticleCharge(userinfo, nodeinfo, buser, bcomhistory, GeneralID);
                    
                }
                delcook();
            }
            else
            {
                function.WriteErrMsg("[非常抱歉，您不能继续浏览该文章！]");
                return;
            }
        }
        private void GetNodePreate(int prentid)
        {
            M_Node nodes = bnode.GetNodeXML(prentid);
            GetMethod(nodes);
            if (nodes.ParentID > 0)
            {
                GetNodePreate(nodes.ParentID);
            }
        }
        private void GetMethod(M_Node nodeinfo)
        {
            if (nodeinfo.Purview != null && nodeinfo.Purview != "")
            {
                string Purview = nodeinfo.Purview;
                if (Purview != null && Purview != "")
                {
                    Purview = "<Purview>" + Purview + "</Purview>";
                    XmlDocument doc = new XmlDocument();
                    doc.LoadXml(Purview);

                    string View_v = doc.SelectSingleNode("//View").InnerText;
                    string ViewGroup_v = doc.SelectSingleNode("//ViewGroup").InnerText;
                    string ViewSunGroup_v = doc.SelectSingleNode("//ViewSunGroup").InnerText;
                    string input_v = doc.SelectSingleNode("//input").InnerText;
                    string forum_v = doc.SelectSingleNode("//forum").InnerText;

                    M_UserInfo uinfos = ull.GetLogin();
                    switch (View_v)
                    {
                        case "allUser"://开放栏目

                            break;
                        case "moreUser"://半开放栏目
                            if (!ull.CheckLogin())
                            {
                                function.WriteErrMsg("很抱歉！您必须<a href=\"/User/Login.aspx\" style='color:red' target=\"_blank\">登录</a>才能看该栏目下信息！");
                            }
         
                            if (ViewGroup_v != null && ViewGroup_v != "")
                            {
                                string tmparr = "," + ViewGroup_v + ",";
                                switch (uinfos.Status)
                                {
                                    case 0://已认证
                                        if (tmparr.IndexOf("," + uinfos.GroupID.ToString() + ",") == -1)
                                        {
                                            if (tmparr.IndexOf(",-1,") == -1)
                                            {
                                                function.WriteErrMsg("很抱歉！您没有权限浏览该栏目下信息！");
                                            }
                                        }
                                        break;
                                    default://未认证
                                        if (tmparr.IndexOf(",-2,") == -1)
                                        {
                                            function.WriteErrMsg("很抱歉！您没有权限浏览该栏目下信息！");
                                        }
                                        break;
                                }
                            }
                            else
                            {
                                //为空
                                function.WriteErrMsg("很抱歉！您没有权限查看该栏目下信息！点此<a href='/User/Login.aspx' style='color:red'>登录会员中心</a>，或<a href='/'>返回首页</a>！");
                            }
                            break;
                        case "onlyUser"://认证栏目
                            if (!ull.CheckLogin())
                            {
                                function.WriteErrMsg("该栏目为<b>认证栏目</b>！您必须<a href=\"/User/Login.aspx\" style='color:red' target=\"_blank\">登录</a>才能看该栏目下信息！");
                            }

                            if (ViewSunGroup_v != null && ViewSunGroup_v != "")
                            {
                                string tmparr = "," + ViewSunGroup_v + ",";
                                switch (uinfos.Status)
                                {
                                    case 0://已认证
                                        if (tmparr.IndexOf("," + uinfos.GroupID.ToString() + ",") == -1)
                                        {
                                            if (tmparr.IndexOf(",-1,") == -1)
                                            {
                                                function.WriteErrMsg("很抱歉！您没有权限浏览该栏目下信息！");
                                            }
                                        }
                                        break;
                                    default://未认证
                                        if (tmparr.IndexOf(",-2,") == -1)
                                        {
                                            function.WriteErrMsg("很抱歉！您没有权限浏览该栏目下信息！");
                                        }
                                        break;
                                }
                            }
                            else
                            {
                                //为空
                                function.WriteErrMsg("很抱歉！您没有权限查看该栏目下信息！");
                            }

                            break;
                    }
                }
            }
        }
        protected void GetUrl()
        {
            string rawUrl = this.Page.Request.RawUrl;
            HttpCookie cookie = new HttpCookie("MyUrlCook");//初使化并设置Cookie的名称
            DateTime dt = DateTime.Now;
            TimeSpan ts = new TimeSpan(0, 1, 0, 0, 0);//过期时间为1分钟
            cookie.Expires = dt.Add(ts);//设置过期时间
            cookie.Values.Add("Url", rawUrl);
            Response.AppendCookie(cookie);
        }
        protected void delcook()
        {
            HttpCookie cok = new HttpCookie("MyCook");
            TimeSpan tss = new TimeSpan(-1, 0, 0, 0);
            cok.Expires = DateTime.Now.Add(tss);//删除整个Cookie，只要把过期时间设置为现在
            Response.AppendCookie(cok);
        }
    }
}