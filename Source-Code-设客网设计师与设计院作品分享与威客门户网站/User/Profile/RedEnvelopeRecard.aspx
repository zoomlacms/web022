<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Profile_RedEnvelopeRecard, App_Web_rqfijtq4" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>红包申请记录</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="Default.aspx">我的返利</a></li>
        <li class="active">红包申请记录</li>
    </ol>
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="5" class="text-center">红包申请记录
                </td>
            </tr>
            <tr>
                <td align="center" width="15%">申请时间</td>
                <td align="center" width="15%">红包</td>
                <td align="center" width="20%">扣除手续费</td>
                <td align="center" width="10%">申请状态</td>
                <td align="center" width="40%">备注</td>
            </tr>
            <asp:Repeater ID="repf" runat="server" OnItemDataBound="repf_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td align="center" width="15%">
                            <asp:HiddenField ID="hfId" runat="server" Value='<%#Eval("id") %>' />
                            <asp:Label ID="lblOrderData" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"OrderData","{0:yyyy-MM-dd}") %>'></asp:Label></td>
                        <td align="center" width="15%">
                            <asp:Label ID="lblRedE" runat="server"></asp:Label></td>
                        <td align="center" width="20%">
                            <asp:Label ID="lblDeducFee" runat="server" Text='<%#Eval("DeducFee") %>'> </asp:Label></td>
                        <td align="center" width="10%">
                            <asp:Label ID="lblState" runat="server"></asp:Label></td>
                        <td align="center" width="40%">
                            <asp:Label ID="lblRemark" runat="server"></asp:Label></td>
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
                    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22" Height="22" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                    </span>
                    条信息/页  转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    页
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
