<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_OrderSql, App_Web_xtlk0k3d" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>订单申请</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="shop"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">账单申请<a href="AddOrderSql.aspx">[添加申请账单]</a></li>
    </ol>
</div>
<div class="container">
    <div class="us_seta">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="8" class="text-center">账单申请
                </td>
            </tr>
            <tr>
                <td>ID </td>
                <td>帐单类型 </td>
                <td>提交金额 </td>
                <td>返分会员名 </td>
                <td>备注 </td>
                <td>状态</td>
                <td>提交时间 </td>
                <td>操作</td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("ID")%> </td>
                        <td><a href="OrderSql.aspx?Type=<%#Eval("OrderType")%>"><%#getOrderType(Eval("OrderType","{0}"))%></a></td>
                        <td><%#Eval("money","{0:N2}")%></td>
                        <td><%#getUserName(Convert.ToInt32(Eval("PuserID")))%> </td>
                        <td><%#Eval("remark")%></td>
                        <td><%#getStatus(Eval("status","{0}"))%> | <%#getPayStatus(Eval("PayState","{0}"))%> | <%#getRunStatus(Eval("SqlState","{0}"))%></td>
                        <td><%#Eval("AddTime")%></td>
                        <td><a href="AddOrderSql.aspx?ID=<%#Eval("ID")%> ">查看</a> </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td colspan="8" class="text-center">
                    <span>共
                        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                        条记录
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />
                        页次：
                        <asp:Label ID="Nowpage" runat="server" Text="" />
                        /
                        <asp:Label ID="PageSize" runat="server" Text="" />
                        页
                        <asp:TextBox ID="txtPage" runat="server" Width="25px" AutoPostBack="True" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                        条记录/页 转到第
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        页 
                    </span>
                </td>
            </tr>
        </table>
    </div>
</div> 
</asp:Content>
