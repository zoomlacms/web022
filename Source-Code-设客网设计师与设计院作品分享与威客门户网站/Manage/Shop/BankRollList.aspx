<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.BankRollList, App_Web_1lmqzdkx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>资金明细</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
    <table id="EGV" class="table table-striped table-bordered table-hover">
        <tr>
            <td width="15%" height="24" align="center" class="title">
                <span>交易时间</span>
            </td>
            <td width="10%" align="center" class="title">
                <span>用户名</span>
            </td>
            <td width="15%" align="center" class="title">
                <span>交易方式</span>
            </td>
            <td width="10%" align="center" class="title">
                <span>支付序号</span>
            </td>
            <td width="15%" align="center" class="title">
                <span>金额</span>
            </td>
            <td width="15%" align="center" class="title">
                <span>实际金额</span>
            </td>
            <td width="10%" align="center" class="title">
                <span>交易状态</span>
            </td>
            <td width="10%" align="center" class="title">
                <span>处理状态</span>
            </td>
        </tr>
        <asp:Repeater ID="paymanage" runat="server">
            <ItemTemplate>
                <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td height="24" align="center">
                    <%#DataBinder.Eval(Container.DataItem, "PayTime", "{0:yyyy-MM-dd hh:mm:ss}")%>
                    </td>
                    <td height="24" align="center">
                        <%#getusername(Eval("UserID","{0}"))%>
                    </td>
                    <td height="24" align="center">
                    <%#GetContent(Eval("PayPlatID", "{0}"))%>
                    </td>
                    <td height="24" align="center">
                        <%#Eval("PaymentNum") %>
                    </td>
                    <td height="24" align="right">
                        <%#Eval("MoneyPay","{0:f}") %>
                    </td>
                    <td height="24" align="right">
                        <%#Eval("MoneyTrue","{0:f}") %>
                    </td>
                    <td height="24" align="center">
                        <%# GetStatus(Eval("Status","{0}"))%>
                    </td>
                    <td height="24" align="center">
                        <%# GetCStatus(Eval("CStatus","{0}"))%>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td height="24" colspan="4" align="right">
                总计金额：
            </td>
            <td height="24" align="right">
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            </td>
            <td height="24" align="right">
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </td>
            <td height="24" colspan="4" align="right">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td height="22" colspan="10" style="position:relative;" align="center" class="tdbgleft">
               共
                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                条记录
                <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />
                页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                    Text="" />页  <asp:TextBox ID="txtPage" runat="server"  AutoPostBack="true" class="l_input" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
               条记录/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                页
                <div id="divBack" style="float:left;text-align:right;display:none;">
                    <input type="button" value="返回" style="right:5px;bottom:-2px;" class="C_input" onclick="history.go(-1)" />
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        HideColumn("0,1");
    </script>
</asp:Content>