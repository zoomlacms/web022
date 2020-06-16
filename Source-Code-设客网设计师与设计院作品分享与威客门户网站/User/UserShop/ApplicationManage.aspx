<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_ApplicationManage, App_Web_p5upeauk" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的店铺</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">申请商品处理</li> 
    </ol>
</div>
    <div class="container">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div class="btn_green"><uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" /></div>
            <div class="us_topinfo" style="margin-top: 10px;">
                <asp:HiddenField ID="HiddenUser" runat="server" />
                <table class="table table-bordered table-striped table-hover">
                    <tr align="center">
                        <td width="5%">
                            <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" />
                        </td>
                        <td width="5%">ID</td>
                        <td width="15%">被申请人</td>
                        <td width="8%">你锁定</td>
                        <td width="8%">对方锁定</td>
                        <td width="8%">你状态</td>
                        <td width="8%">对方状态</td>
                        <td width="8%">交易状态</td>
                        <td width="8%">你发货</td>
                        <td width="8%">对方发货</td>
                        <td width="20%">操作</td>
                    </tr>
                    <asp:Repeater ID="ChangeRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td align="center">
                                    <input name="Item" type="checkbox" value='<%# Eval("C_ID")%>' />
                                </td>
                                <td align="center">
                                    <%#Eval("C_ID")%>
                                </td>
                                <td align="center">
                                    <%#getName(Eval("UserID").ToString())%>
                                </td>
                                <td align="left">
                                    <a href="?menu=LOck&id=<%#Eval("C_ID") %>" style="color: Red;">
                                        <%#queren(Eval("UserLock").ToString())%></a>
                                </td>
                                <td align="left">
                                    <%#queren(Eval("PUserLock").ToString())%></a>
                                </td>
                                <td align="center">
                                    <a href="?menu=User&id=<%#Eval("C_ID") %>" style="color: Red;">
                                        <%#State(Eval("UserChange").ToString(),1)%>
                                </td>
                                <td align="center">
                                    <%#State(Eval("PUserChange").ToString(),1)%>
                                </td>
                                <td align="center">
                                    <%#State(Eval("EState").ToString(),3)%>
                                </td>
                                <td align="center">
                                    <a href="?menu=Post&id=<%#Eval("C_ID") %>" style="color: Red;">
                                        <%#State(Eval("UserPost").ToString(),2)%></a>
                                </td>
                                <td align="center">
                                    <%#State(Eval("PUserPost").ToString(), 2)%>
                                </td>
                                <td align="center">
                                    <a onclick="javascript: window.open('ChangeProduct.aspx?menu=User&C_ID=<%#Eval("C_ID") %>', 'newwindow', 'height=700, width=1000, top=0, left=5, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');"
                                        href="javascript:void(0);">查看</a> <a href="?menu=del&id=<%#Eval("C_ID") %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr class="tdbg">
                        <td colspan="11" align="center" class="tdbgleft">共
							<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                            条记录
							<asp:Label ID="Toppage" runat="server" Text="" />
                            <asp:Label ID="Nextpage" runat="server" Text="" />
                            <asp:Label ID="Downpage" runat="server" Text="" />
                            <asp:Label ID="Endpage" runat="server" Text="" />
                            页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                                Text="" />页
							<asp:Label ID="pagess" runat="server" Text="" />条记录/页 转到第<asp:DropDownList ID="DropDownList1"
                                runat="server" AutoPostBack="True">
                            </asp:DropDownList>
                            页
                        </td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td class="btn_green">
                            <asp:Button ID="Button3" CssClass="btn btn-primary" runat="server" OnClick="Button3_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"
                                Text="批量删除" />&nbsp;
                        </td>
                    </tr>
                </table>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            该功能尚未开启！
        </asp:View>
    </asp:MultiView>
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
