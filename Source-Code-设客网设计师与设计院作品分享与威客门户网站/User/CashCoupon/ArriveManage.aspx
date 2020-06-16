<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_CashCoupon_ArriveManage, App_Web_v0pwsqry" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>优惠劵管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
 <div id="pageflag" data-nav="group" data-ban="ArriveManage"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li><a href="#"><%= Call.SiteName%></a></li>
        <li><a href="/User/">会员中心</a></li>
        <li><a href="/User/Info/UserInfo.aspx">账户管理</a></li>
        <li>优惠劵管理</li> 
    </ol>
</div>
    <div class="container">
    <div class="us_seta u_cnt" runat="server" id="DV_show">
        <table width="100%" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="7" class="text-center">我的优惠劵</td>
            </tr>
            <tr>
                <td align="center" width="20%">编号</td>
                <td align="center" width="15%">密码</td>
                <td align="center" width="10%">金额</td>
                <td align="center" width="15%">生成时间</td>
                <td align="center" width="15%">到期时间</td>
                <td align="center" width="15%">使用时间</td>
                <td align="center" width="10%">状态 </td>
            </tr>
            <asp:Repeater ID="Manufacturerslist" runat="server" OnItemCommand="Manufacturerslist_ItemCommand" OnItemDataBound="Manufacturerslist_ItemDataBound">
                <ItemTemplate>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td height="24" align="center">
                            <asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("id") %>' />
                            <%#Eval("arriveNO")%></td>
                        <td height="24" align="center">
                            <asp:HiddenField ID="hfpwd" runat="server" Value='<%# Eval("id") %>' />
                            <%#Eval("arrivePwd")%></td>
                        <td height="24" align="center"><%#Eval("amount")%></td>
                        <td height="24" align="center"><%#Eval("againTime", "{0:yyyy-MM-dd}")%></td>
                        <td height="24" align="center"><%#Eval("endTime", "{0:yyyy-MM-dd}")%></td>
                        <td height="24" align="center"><%#GetUseTime(Eval("useTime", "{0}"))%></td>
                        <td height="24" align="center">
                            <asp:Label ID="lblState" runat="server" Text='<%# GetState(Eval("State","{0}")) %>'></asp:Label></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg">
                <td height="24" colspan="7" align="center" class=" text-center">共
        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条信息
        <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：
        <asp:Label ID="Nowpage" runat="server" Text="" />
                    /
        <asp:Label ID="PageSize" runat="server" Text="" />
                    页 <span style="text-align: center">
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input"
                            Width="24" Height="24" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                    </span>条信息/页  转到第
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    页 </td>
            </tr>
        </table>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="../../JS/SelectCheckBox.js"></script>
    <script language="javascript" type="text/javascript">
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