<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_OrderList, App_Web_p5upeauk" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的店铺</title>
    <link href="/App_Themes/V3.css" rel="stylesheet" type="text/css" /> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
    <div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">我的店铺订单</li> 
    </ol>
    </div>
    <div class="container btn_green">
    <uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
    <table class="table table-striped table-bordered table-hover hidden-xs margin_t5">
        <tr>
            <td>
                <span class="pull-left">快速查找：
                    <asp:DropDownList ID="quicksouch" CssClass="form-control" Width="200" runat="server" AutoPostBack="True" OnSelectedIndexChanged="quicksouch_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="0">请选择查找方式</asp:ListItem>
                        <asp:ListItem Value="1">我负责跟踪的订单</asp:ListItem>
                        <asp:ListItem Value="2">今天的新订单</asp:ListItem>
                        <asp:ListItem Value="3">所有订单</asp:ListItem>
                        <asp:ListItem Value="4">最近10天内的新订单</asp:ListItem>
                        <asp:ListItem Value="5">最近一个月内的新订单</asp:ListItem>
                        <asp:ListItem Value="6">未确认的订单</asp:ListItem>
                        <asp:ListItem Value="7">未付款的订单</asp:ListItem>
                        <asp:ListItem Value="8">未付清的订单</asp:ListItem>
                        <asp:ListItem Value="9">未送货的订单</asp:ListItem>
                        <asp:ListItem Value="10">未签收的订单</asp:ListItem>
                        <asp:ListItem Value="11">未结清的订单</asp:ListItem>
                        <asp:ListItem Value="12">未开发票的订单</asp:ListItem>
                        <asp:ListItem Value="13">已经作废的订单</asp:ListItem>
                        <asp:ListItem Value="14">暂停处理的订单</asp:ListItem>
                        <asp:ListItem Value="15">已发货的订单</asp:ListItem>
                        <asp:ListItem Value="16">已签收的订单</asp:ListItem>
                        <asp:ListItem Value="17">已结清的订单</asp:ListItem>
                        <asp:ListItem Value="18">已申请退款的订单</asp:ListItem>
                    </asp:DropDownList>
                </span>
                <span class="pull-left" style="margin-left:10px;margin-right:10px;">
                    高级查询：
                    <asp:DropDownList ID="souchtable" CssClass="form-control" Width="150" runat="server">
                        <asp:ListItem Selected="True" Value="1">订单编号</asp:ListItem>
                        <asp:ListItem Value="2">客户名称</asp:ListItem>
                        <asp:ListItem Value="3">用户名</asp:ListItem>
                        <asp:ListItem Value="4">收货人</asp:ListItem>
                        <asp:ListItem Value="5">联系地址</asp:ListItem>
                        <asp:ListItem Value="6">联系电话</asp:ListItem>
                        <asp:ListItem Value="7">下单时间</asp:ListItem>
                        <asp:ListItem Value="8">备注/留言</asp:ListItem>
                        <asp:ListItem Value="9">商品名称</asp:ListItem>
                        <asp:ListItem Value="10">收货人邮箱</asp:ListItem>
                        <asp:ListItem Value="11">发票信息</asp:ListItem>
                        <asp:ListItem Value="12">内部记录</asp:ListItem>
                        <asp:ListItem Value="13">跟单员</asp:ListItem>
                    </asp:DropDownList>
                </span>
                <div class="input-group" style="width:300px; float:left;">
                    <asp:TextBox runat="server" ID="souchkey" class="form-control" placeholder="请输入需要搜索的内容" />
                    <span class="input-group-btn">
                        <asp:LinkButton runat="server" CssClass="btn btn-default" ID="souchok" OnClick="souchok_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                    </span>
                </div>
            </td>
        </tr>
    </table>
    </div>
    <div class="container u_cnt">
        <table id="store_tb" class="table table-bordered table-hover">
        <tr>
            <td></td>
            <td>订单编号</td>
            <td>客户名称</td>
            <td>用户名</td>
            <td>下单时间</td>
            <td>实际金额</td>
            <td>收款金额</td>
            <td>需要发票</td>
            <td>订单状态</td>
            <td>支付方式</td>
            <td>付款状态</td>
            <td>物流状态</td>
            <td>操作</td>
        </tr>
            <ZL:ExRepeater runat="server" ID="Store_RPT" PageSize="10" PagePre="<tr id='page_tr'><td><input type='checkbox' id='chkAll'/></td><td colspan='12' id='page_td'>" PageEnd="</td></tr>">
                <ItemTemplate>
                  <tr ondblclick="location='Orderlistinfo.aspx?id=<%#Eval("ID") %>';">
                      <td><%#Getclickbotton(Eval("ID","{0}"))%></td>
                      <td><a href="OrderListInfo.aspx?ID=<%#Eval("ID") %>"><%#Eval("OrderNo") %></a></td>
                      <td><%#GetUser(Eval("Reuser", "{0}"))%></td>
                      <td><%#GetUsers(Eval("userId", "{0}"))%></td>
                      <td><%#Eval("AddTime") %></td>
                      <td><%#getshijiage(Eval("id", "{0}"))%></td>
                      <td><%#formatcs(Eval("ordertype","{0}"),Eval("Receivablesamount","{0:N2}"))%><%#getMoney_sign(Eval("Money_code").ToString())%></td>
                      <td><%#IsNeedInvo(Eval("Developedvotes","{0}")) %></td>
                      <td><%#formatzt(Eval("OrderStatus", "{0}"),"0")%></td>
                      <td><%#formatzt(Eval("Delivery","{0}"),"3") %></td>
                      <td><%#formatzt(Eval("Paymentstatus", "{0}"),"1")%></td>
                      <td><%#formatzt(Eval("StateLogistics", "{0}"),"2")%></td>
                      <td> <%#GetOP() %></td>
                  </tr>
                </ItemTemplate>
                <FooterTemplate>
                    <tr><td colspan="13"><span>实际金额合计:</span><span class="rd_red_l"><%#GetTotalSum() %></span></td></tr>
                </FooterTemplate>
            </ZL:ExRepeater>
        <asp:HiddenField runat="server" ID="TotalSum_Hid" />
    </table>
        <div class="btn_green"><asp:Button ID="Button1" class="btn btn-primary" Text="删除订单" runat="server" OnClick="Button1_Click1" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" /></div>
    </div>
<div class="u_sign" id="u_usershop"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $(function () {
            $("#chkAll").click(function () {
                selectAllByName(this, "idchk");
            });
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=idchk]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
        function ShowDetail(orderno) {
            comdiag.maxbtn = false;
            comdiag.reload = true;
            ShowComDiag("/User/Order/OrderDetails.aspx?OrderNo=" + orderno, "订单明细");
        }
        function CloseDetail() {
            CloseComDiag();
        }
        function ShowElement(id) {
            $("#" + id).show();
        }
    </script>
</asp:Content>
