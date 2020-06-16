<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Profile_PointRecord, App_Web_rqfijtq4" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的积分</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">我的积分</li> 
    </ol>
</div>
    <div class="container">
        <asp:Literal ID="liPoint" runat="server"></asp:Literal>
    </div>
    <div align="center" class="us_seta container">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="4" class="text-center">我的积分
                </td>
            </tr>
            <tr>
                <th align="center" width="20%" height="25">日期</th>
                <th align="center" width="20%">所得积分</th>
                <th align="center" width="20%">类型</th>
                <th align="center" width="40%">备注</th>
            </tr>
            <asp:Repeater ID="repf" runat="server">
                <ItemTemplate>
                    <tr>
                        <td align="center" width="20%">
                            <asp:Label ID="AddTime" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"AddTime","{0:yyyy-MM-dd}") %>'></asp:Label></td>
                        <td align="center" width="20%">
                            <asp:Label ID="Points" runat="server" Text='<%#Eval("Points") %>'></asp:Label></td>
                        <td align="center" width="20%">
                            <asp:Label ID="Type" runat="server" Text='<%#Eval("Type") %>'> </asp:Label></td>
                        <td align="center" width="40%">
                            <asp:Label ID="Remark" runat="server" Text='<%#Eval("Remark") %>'></asp:Label></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td colspan="4" align="center">
                    <asp:Label ID="divTips" runat="server" ForeColor="Red"></asp:Label>
                    共
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
                    页
                    <span style="text-align: center">
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                    </span>条信息/页  转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    页
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="../../Common/Common.js" type="text/javascript"></script>
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
