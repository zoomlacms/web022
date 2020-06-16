<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_StockList, App_Web_p5upeauk" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>库存管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">库存管理<a href="StockAdd.aspx">[添加库存]</a></li>
		<div class="clearfix"></div>
    </ol>
</div>
<div class="container btn_green">
    <uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
</div>
<div class="container">
    <div class="us_topinfo btn_green" style="margin-top: 10px; width: 98%">
        <table class="table table-striped table-bordered table-hover" >
            <tr align="center">
                <td width="5%" class="title">
                    <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
                <td width="13%" class="title">单据类型</td>
                <td width="20%" class="title">单据编号</td>
                <td width="15%" class="title">录入时间</td>
                <td width="12%" class="title">录入者</td>
                <td width="20%" class="title">备注</td>
                <td width="15%" class="title">操作</td>
            </tr>
            <asp:Repeater ID="StockRepeater" runat="server">
                <ItemTemplate>
                    <tr>
                        <td height="22" align="center">
                            <input name="Item" type="checkbox" value='<%# Eval("id")%>' /></td>
                        <td height="22" align="center"><%#stocktype(DataBinder.Eval(Container,"DataItem.stocktype","{0}"))%></td>
                        <td height="22" align="center"><%#Eval("danju") %></td>
                        <td height="22" align="center"><%#Eval("addtime") %></td>
                        <td height="22" align="center"><%#Eval("adduser") %></td>
                        <td height="22" align="center"><%#Eval("content")%></td>
                        <td height="22" align="center"><a href="StockAdd.aspx?menu=edit&id=<%#Eval("id") %>">修改</a> <a href="Stocklist.aspx?menu=del&id=<%#Eval("id") %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg">
                <td height="22" colspan="10" align="center" class="tdbgleft">共
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
        </table>
        <br />
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="height: 21px">
                    <asp:Button ID="Button3" CssClass="btn btn-primary" runat="server" OnClick="Button3_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" Text="批量删除" />
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
