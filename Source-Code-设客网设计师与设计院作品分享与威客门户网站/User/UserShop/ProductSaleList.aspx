<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_ProductSaleList, App_Web_p5upeauk" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>销售记录</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">销售记录</li> 
    </ol>
</div>
    <div class="container btn_green">
        <uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
        <div class="alert alert-success"><a href="ProductSaleList.aspx">总体销售统计</a> | <a href="ProductSale.aspx">商品销售排名</a> | <a href="ProductTypeSale.aspx">商品类别销售排名</a> | <a href="UserOrder.aspx">会员订单排名</a> | <a href="UserShopOrder.aspx">会员购物排名</a></div>
        <div class="us_topinfo margin_t10">
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <td align="center" style="height: 23px">
                        从
	                    <asp:TextBox ID="toptime" CssClass="form-control" runat="server" onclick="WdatePicker();" />
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/App_Themes/AdminDefaultTheme/images/Calendar.gif" />&nbsp;
	                    至
	                    <asp:TextBox ID="endtime" runat="server" CssClass="form-control" onclick="WdatePicker();" />&nbsp;
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/AdminDefaultTheme/images/Calendar.gif" />
                        <asp:Button ID="Button1" Text="查询" CssClass="btn btn-primary" runat="server" />
                    </td>
                </tr>
            </table>
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <td colspan="3" class="text-center">
                        客户平均订单金额
                    </td>
                </tr>
                <tr align="center">
                    <td width="33%" class="title">总订单金额</td>
                    <td width="33%" class="title">总订单数</td>
                    <td width="33%" class="title">客户平均订单金额</td>
                </tr>
                <tr class="">
                    <td height="22"  align="center">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </td>
                    <td height="22"  align="center">
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    </td>
                    <td height="22"  align="center">
                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <td colspan="3" class="text-center">
                        每次访问平均订单金额
                    </td>
                </tr>
                <tr align="center">
                    <td width="33%" class="title">总订单金额</td>
                    <td width="33%" class="title">总订单数</td>
                    <td width="33%" class="title">客户平均订单金额</td>
                </tr>
                <tr class="">
                    <td height="22"  align="center">
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                    </td>
                    <td height="22"  align="center">
                        <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                    </td>
                    <td height="22"  align="center">
                        <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <td colspan="3" class="text-center">
                        匿名订单购买率
                    </td>
                </tr>
                <tr align="center">
                    <td width="33%" class="title">总订单金额</td>
                    <td width="33%" class="title">总订单数</td>
                    <td width="33%" class="title">客户平均订单金额</td>
                </tr>
                <tr class="">
                    <td height="22"  align="center">
                        <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
                    </td>
                    <td height="22"  align="center">
                        <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
                    </td>
                    <td height="22"  align="center">
                        <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <td colspan="3" class="text-center">
                        注册会员购买率
                    </td>
                </tr>
                <tr align="center">
                    <td width="33%" class="title">总订单金额</td>
                    <td width="33%" class="title">总订单数</td>
                    <td width="33%" class="title">客户平均订单金额</td>
                </tr>
                <tr class="">
                    <td  align="center">
                        <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                    </td>
                    <td  align="center">
                        <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
                    </td>
                    <td  align="center">
                        <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
<div class="u_sign" id="u_userinfo"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="scriptcontent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script language="javascript">
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
    </script>
</asp:Content>
