<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_FloGoodsManage, App_Web_p5upeauk" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>送货方式管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
<div class="container margin_t5">
    <ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">送货方式管理<a href="AddFloGoods.aspx">[添加送货方式]</a></li>
    </ol>
</div>
<div class="container">
    <div class="btn_green"><uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" /></div>
    <div style="width: 100%">
        <table class="table table-bordered table-striped table-hover margin_t5">
            <tr align="center">
                <td width="10%">
                    <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
                <td width="10%">送货方式</td>
                <td width="10%">运费</td>
                <td width="15%">用户名</td>
                <td width="40%">备注</td>
                <td width="15%">操作</td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td align="center">
                            <input name="Item" type="checkbox" value='<%# Eval("id")%>' />
                        </td>
                        <td align="center"><%#Eval("GoodsMethod")%></td>
                        <td align="center"><%#DataBinder.Eval(Container, "DataItem.Price", "{0:N2}")%></td>
                        <td align="center"><%#GetUserName(Eval("UserId","{0}")) %></td>
                        <td align="center"><%#Eval("Remark")%></td>
                        <td align="center">
                            <a href="AddFloGoods.aspx?id=<%#Eval("id") %>">修改</a>
                            <a href="FloGoodsManage.aspx?menu=del&id=<%#Eval("id") %>" onclick="return confirm('确定删除？');">删除</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td class="btn_green">
                    <asp:Button ID="Button3" CssClass="btn btn-primary" runat="server" OnClick="Button3_Click" OnClientClick="return confirm('确定删除？');" Text="批量删除" />
                </td>
            </tr>
        </table>
    </div>
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
