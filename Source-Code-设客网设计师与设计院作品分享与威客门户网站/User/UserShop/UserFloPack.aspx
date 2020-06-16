<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_UserFloPack, App_Web_p5upeauk" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<%@ Register Src="WebUserControlTop2.ascx" TagName="WebUserControlTop2" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>用户包装管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">用户包装管理<a href="AddFlowerPack.aspx">[添加包装]</a></li>
    </ol>
    <div style="width: 100%">
        <table class="table table-striped table-bordered table-hover">
            <tr align="center">
                <td class="title" width="10%">
                    <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
                <td class="title" width="10%">包装名</td>
                <td class="title" width="10%">包装费用</td>
                <td class="title" width="15%">用户名</td>
                <td class="title" width="40%">备注</td>
                <td class="title" width="15%">操作</td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td height="22" align="center">
                            <input name="Item" type="checkbox" value='<%# Eval("id")%>' /></td>
                        <td height="22" align="center"><%#Eval("PackName")%></td>
                        <td height="22" align="center"><%#DataBinder.Eval(Container, "DataItem.PackPrice", "{0:N2}")%></td>
                        <td height="22" align="center"><%#GetUserName(Eval("UserId","{0}")) %></td>
                        <td height="22" align="center"><%#Eval("Remark") %></td>
                        <td height="22" align="center">
                            <a href="AddFlowerPack.aspx?id=<%#Eval("id") %>">修改</a>
                            <a href="UserFloPack.aspx?menu=del&id=<%#Eval("id") %>" onclick="return confirm('确定删除？');">删除</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="height: 21px">
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary" OnClick="Button3_Click" OnClientClick="return confirm('确定删除？');" Text="批量删除" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
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
