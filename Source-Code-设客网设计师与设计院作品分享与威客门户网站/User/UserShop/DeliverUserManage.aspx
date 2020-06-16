<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_DeliverUserManage, App_Web_p5upeauk" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>送货员管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">送货员管理</li>
    </ol>
</div>
<div class="container">
    <div class="btn_green"><uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" /></div>

    <table class="table table-bordered table-striped table-hover margin_t5">
        <tr>
            <td colspan="4" class="text-center">已保存的送货员信息</td>
        </tr>
        <tr align="center">
            <td class="title" width="10%">
                <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
            <td class="title">送货人姓名</td>
            <td class="title">手机号码</td>
            <td class="title">操作</td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td height="22" align="center">
                        <input name="Item" type="checkbox" value='<%# Eval("id")%>' /></td>
                    <td height="22" align="center"><%#Eval("DeName")%></td>
                    <td height="22" align="center"><%#Eval("ModelNum")%></td>
                    <td height="22" align="center">
                        <a href="DeliverUserManage.aspx?menu=upd&id=<%#Eval("id") %>">修改</a>
                        <a href="DeliverUserManage.aspx?menu=del&id=<%#Eval("id") %>" onclick="return confirm('确定删除？');">删除</a></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <div class="btn_green">
        <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary" OnClick="Button3_Click" OnClientClick="return confirm('确定删除？');" Text="批量删除" CausesValidation="false" />&nbsp;
    </div>
    <div class="btn_green margin_t10">
        <asp:Label ID="lbl" runat="server" Style="color: Red; font-size: 14px; font-weight: bold" Visible="false"></asp:Label>
        <br />
        <asp:Label ID="lbltips" runat="server" Style="color: Green; font-size: 14px; font-weight: bold">添加送货员</asp:Label>
        <asp:HiddenField ID="hfuserid" runat="server" />
        姓名：<asp:TextBox ID="txtname" CssClass="form-control text_md" runat="server"></asp:TextBox>
        &nbsp;&nbsp;手机号码：<asp:TextBox ID="txtMobile" CssClass="form-control text_md" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator runat="server" Display="Dynamic" ID="RegularExpressionValidator4" ValidationExpression="^1[(0-9)]{10}$" ControlToValidate="txtMobile" ErrorMessage="按照手机号规则输入"></asp:RegularExpressionValidator>
        &nbsp;<asp:Button ID="btn" runat="server" CssClass="btn btn-primary" Text="提交" OnClick="btn_Click" />
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
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
