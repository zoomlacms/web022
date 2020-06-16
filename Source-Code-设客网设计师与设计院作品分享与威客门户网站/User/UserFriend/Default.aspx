<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserFriend_Default, App_Web_yzngnbbv" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../UserZone/WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<%@ Register Src="WebUserControlMessage.ascx" TagName="WebUserControlMessage" TagPrefix="uc1" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc3" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的好友</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="index" data-ban="zone"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">我的好友</li> 
    </ol>
</div>
<div class="container btn_green">
    <uc2:WebUserControlTop ID="WebUserControlTop2" runat="server" />
    <uc3:WebUserControlTop ID="WebUserControlTop1" runat="server" />
    <uc1:WebUserControlMessage ID="WebUserControlMessage1" runat="server" />
</div>
<div class="container btn_green">
    <div class="us_topinfo" style="margin-top: 10px;">
        <table class="table table-bordered table-striped table-hover">
            <tr>
                <td>
                    <ZL:ExGridView ID="gvGroup" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="ID" CellPadding="4" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="好友分组">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnGroup" runat="server" Text='<%# Bind("GroupName") %>' OnClick="lbtnGroup_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Center" />
                    </ZL:ExGridView>
                </td>
                <td>
                    <div style="margin-bottom: 10px;">
                        好友搜索：
                        <asp:TextBox ID="TextBox1" CssClass="form-control text_md" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="搜索" OnClick="Button1_Click" />
                    </div>
                    <asp:DataList ID="DataList1" CssClass="table table-bordered" runat="server" RepeatColumns="1" RepeatDirection="Horizontal" Width="100%" DataKeyField="ID">
                        <ItemTemplate>
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <td align="center">
                                        <font color="#000066"><strong>
									<%#GetName(DataBinder.Eval(Container.DataItem, "FriendID").ToString())%>
								</strong></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <label onmouseover="showmenu(event,'<%#ShowDivStr(Eval("UserID").ToString(),Eval("ID").ToString())%>')">
                                            <asp:Image ID="Image1" runat="server" Height="68px" Width="72px" ImageUrl='<%#GetPic(Eval("FriendID","{0}").ToString()) %>' /></label></td>
                                </tr>
                                <tr>
                                    <td align="center">[<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删 除</asp:LinkButton>]</td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <div class="text-center">
                        共
                        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />
                        页次：
                        <asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
                        <asp:Label ID="pagess" runat="server" Text="" />个/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>页
                    </div>
                </td>
            </tr>
        </table>
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
        function SpanClick(curid, ToGroup) {
            if (confirm('确定转入此分组？')) {

                location.href = 'Default.aspx?curid=' + curid + '&ToGroup=' + ToGroup;
            }
        }
    </script>
</asp:Content>
