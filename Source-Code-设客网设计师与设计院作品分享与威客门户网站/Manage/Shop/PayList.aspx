<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.PayList, App_Web_1lmqzdkx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>支付明细</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td>
                <span class="pull-left">
                    快速查找：
                    <asp:DropDownList ID="quicksouch" CssClass="form-control" Width="200" runat="server" AutoPostBack="true">
                        <asp:ListItem Selected="True" Value="1">所有在线支付记录</asp:ListItem>
                        <asp:ListItem Value="2">最近10天内的新记录</asp:ListItem>
                        <asp:ListItem Value="3">最近一月内的新记录</asp:ListItem>
                        <asp:ListItem Value="4">未成功的在线支付记录</asp:ListItem>
                        <asp:ListItem Value="5">支付成功的在线支付记录</asp:ListItem>
                    </asp:DropDownList>
                </span>
                <span class="pull-left" style="margin-left:5px;">
                    高级查询：
                    <asp:DropDownList ID="souchtable" CssClass="form-control" Width="150" runat="server">
                        <asp:ListItem Selected="True" Value="PaymentNum">在线支付记录编号</asp:ListItem>
                        <asp:ListItem Value="UserName">用户名</asp:ListItem>
                        <asp:ListItem Value="PayTime">交易时间</asp:ListItem>
                    </asp:DropDownList>
                </span>
                <div class="input-group pull-left" style="width:300px;">
                    <asp:TextBox runat="server" ID="souchkey" class="form-control" placeholder="请输入需要搜索的内容" />
                    <span class="input-group-btn">
                        <asp:LinkButton runat="server" CssClass="btn btn-default" ID="souchok" OnClick="souchok_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                    </span>
                </div>
            </td>
        </tr>
    </table>
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tbody1">
            <tr class="tdbg">
                <td width="135" align="center" class="title"><span>支付序号</span></td>
                <td width="110" align="center" class="title"><span>用户名</span></td>
                <td width="126" align="center" class="title"><span>支付平台</span></td>
                <td width="164" align="center" class="title"><span>交易时间</span></td>
                <td width="109" align="center" class="title"><span>汇款金额</span></td>
                <td width="110" align="center" class="title"><span>实际转帐金额</span></td>
                <td width="86" align="center" class="title"><span>交易状态</span></td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td height="24" align="left"><%#Eval("PaymentNum") %></td>
                        <td height="24" align="center"><%#getusername(Eval("UserID","{0}"))%></td>
                        <td height="24" align="center"><%#getPayPlat(Eval("PayPlatID","{0}"))%></td>
                        <td height="24" align="right"><%#Eval("PayTime")%></td>
                        <td height="24" align="right"><%#Eval("MoneyPay","{0:f}") %></td>
                        <td height="24" align="center"><%#Eval("MoneyTrue","{0:f}") %></td>
                        <td height="24" align="center"><%# GetStatus(Eval("Status","{0}"))%></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg">
                <td height="22" colspan="7" align="center" class="tdbgleft">共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条记录 
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页 
                    <asp:Label ID="pagess" runat="server" Text="" />条记录/页  转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    </asp:DropDownList>页</td>
            </tr>
        </tbody>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
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
