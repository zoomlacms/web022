<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_EditDataList, App_Web_zol0bvcz" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/SPwd.ascx" TagPrefix="uc1" TagName="SPwd" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>系统全库概况</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <uc1:SPwd runat="server" ID="SPwd" Visible="false" />
    <div runat="server" visible="false" id="maindiv">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td>
                    <asp:LinkButton ID="Link2" OnClientClick='return confirm("本操作将从云台获取默认数据库标注信息且会覆盖您的个性定义，是否确定？")' OnClick="Link1_Click" runat="server" Style="color: #1e860b;"> [更新ZL_DataList表]</asp:LinkButton>
                    <span class="red">[
            <asp:LinkButton ID="LinkButton5" OnClick="Link2_Click" runat="server">运行库概况</asp:LinkButton>]</span>&nbsp;<span class="line"><a href="ViewList.aspx" style="color: red;">[视图概况]</a> </span>
                    <div class="input-group nav_searchDiv">
                        <asp:TextBox runat="server" ID="TxtName" class="form-control" placeholder="请输入需要搜索的内容" />
                        <span class="input-group-btn">
                            <asp:LinkButton runat="server" CssClass="btn btn-default" ID="BntSearch" OnClick="sech_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                        </span>
                    </div>
                </td>
            </tr>
        </table>
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
                <Columns>
                <asp:BoundField HeaderText="序号" DataField="ID">
                <ItemStyle Width="3%" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="数据表名">
                <ItemTemplate>
                <%# Eval("TableName")%>
                </ItemTemplate>
                <ItemStyle Width="15%" HorizontalAlign="left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类型">
                <HeaderStyle Width="10%" />
                <ItemTemplate>
                <a href="DatalistProfile.aspx?type=<%#Eval("Type")%>"><%#GetType(Eval("Type","{0}"))%> </a>
                <%--
                <%#getzonetypename(DataBinder.Eval(Container.DataItem, "ZoneType").ToString())%> --%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="说明">
                <HeaderStyle />
                <ItemTemplate>
                <%# Eval("Explain")%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                <HeaderStyle Width="20%" />
                <ItemTemplate>
                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ID") %>'>修改</asp:LinkButton>
                | 
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="View" CommandArgument='<%# Eval("ID") %>'>表结构</asp:LinkButton>
                | 
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="ViewData" CommandArgument='<%# Eval("ID") %>'>表数据</asp:LinkButton>
                | 
                <%--<asp:LinkButton ID="LinkButton4" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ID") %>'>表操作</asp:LinkButton> --%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Center" />
                <RowStyle Height="24px" HorizontalAlign="Center"  />
        </ZL:ExGridView>    
        <div id="RunOK" runat="server">
            提示：未初始化ZL_DataList数据字典表，是否初始化?（下载<asp:LinkButton ID="Link1" OnClick="Link1_Click" runat="server"> Update.zoomla.cn/ZL_DataList.sql</asp:LinkButton>执行查询）。
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
     <style type="text/css">
         #GridView2 td,#GridView2 th{ border:#FFF 1px solid; padding-left:5px;}
         h1{margin:0;padding:20px 0;font-size:16px;}
         ol{padding-left:20px;line-height:130%;}
         #box{width:600px;text-align:left;margin:0 auto;padding-top:80px;}
         #suggest,#suggest2{width:200px;}
         .gray{color:gray;}
         .ac_results {background:#fff;border:1px solid #7f9db9;position: absolute;z-index: 10000;display: none;}
         .ac_results ul{margin:0;padding:0;list-style:none;}
         .ac_results li a{white-space: nowrap;text-decoration:none;display:block;color:#05a;padding:1px 3px;}
        .ac_results li{border:1px solid #fff;}
        .ac_over,.ac_results li a:hover {background:#c8e3fc;}
        .ac_results li a span{float:right;}
        .ac_result_tip{border-bottom:1px dashed #666;padding:3px;}
     </style>
    <script type="text/javascript" src="/js/j.dimensions.js"></script>
    <script type="text/javascript" src="/js/datalist.js"></script>
    <script type="text/javascript" src="/js/j.suggest.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#TxtName").suggest(citys, { hot_list: commoncitys, dataContainer: '#arrcity_3word', onSelect: function () { $("#BntSearch").click(); }, attachObject: '#suggest' });
        });
        var commoncitys = new Array();
        commoncitys[0] = new Array('NOD', '节点表', 'ZL_Node', 'NO');
        commoncitys[1] = new Array('USR', '会员表', 'ZL_User', 'US');
        commoncitys[2] = new Array('CMD', '内容主表', 'ZL_CommonModel', 'CM');
        commoncitys[3] = new Array('CDT', '商城主表', 'ZL_Commodities', 'CD');
        commoncitys[4] = new Array('UBS', '会员详情表', 'ZL_UserBase', 'UB');
        commoncitys[5] = new Array('UCT', '会员购物车', 'ZL_UserCart', 'UC');
        commoncitys[6] = new Array('ORD', '会员订单', 'ZL_OrderInfo', 'OI');
        commoncitys[7] = new Array('PGR', '黄页申请表', 'ZL_PageReg', 'PR');
        commoncitys[8] = new Array('QUE', '问答表', 'ZL_Question', 'QT');
        commoncitys[9] = new Array('ART', '文章内容表', 'ZL_C_Article', 'CA');
        <%=Session["dataArr"]%>
    </script>
</asp:Content>