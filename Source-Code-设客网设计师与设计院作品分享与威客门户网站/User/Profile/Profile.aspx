<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Profile_Profile, App_Web_rqfijtq4" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>返利详情</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="u_sign" id="u_store" data-nav="shop"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="Default.aspx">我的返利</a></li>
        <li class="active">返利详情</li>
		<div class="clearfix"></div>
    </ol>
</div>
    <div class="container">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="5" class="text-center">返利详情
                </td>
            </tr>
            <tr>
                <td align="center" width="20%">订单编号</td>
                <td align="center" width="20%">订单金额</td>
                <td align="center" width="20%">购物商城</td>
                <td align="center" width="20%">返利金额</td>
                <td align="center" width="20%">确认返利</td>
            </tr>
            <asp:Repeater ID="repf" runat="server" OnItemDataBound="repf_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td align="center" width="20%">
                            <asp:HiddenField ID="hfId" runat="server" Value='<%#Eval("id") %>' />
                            <asp:Label ID="lblOrderNo" runat="server" Text='<%#Eval("orderNo") %>'></asp:Label></td>
                        <td align="center" width="20%">
                            <asp:Label ID="lblOrderMoney" runat="server"
                                Text='<%#DataBinder.Eval(Container, "DataItem.OrderMoney", "{0:N2}") %>'></asp:Label></td>
                        <td align="center" width="20%">
                            <asp:Label ID="lblShop" runat="server"> </asp:Label></td>
                        <td align="center" width="20%">
                            <asp:Label ID="lblFM" runat="server"
                                Text='<%#DataBinder.Eval(Container, "DataItem.ProfileMoney", "{0:N2}")%>'></asp:Label></td>
                        <td align="center" width="20%">
                            <asp:Label ID="lblProSate" runat="server"></asp:Label></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td colspan="5" align="center">
                    共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条信息 
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：
                    <asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />
                    页
                    <span style="text-align: center">
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" Height="22" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                    </span>条信息/页  转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    页
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/Common/Common.js" type="text/javascript"></script>
    <script>
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
