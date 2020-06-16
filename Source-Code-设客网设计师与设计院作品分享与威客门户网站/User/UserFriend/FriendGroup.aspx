<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserFriend_FriendGroup, App_Web_k2x0q1ci" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../UserZone/WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<%@ Register Src="WebUserControlMessage.ascx" TagName="WebUserControlMessage" TagPrefix="uc1" %>
<%@ Register Src="../UserFriend/WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc3" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的好友</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content"> 
<div id="pageflag" data-nav="index" data-ban="zone"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/User/UserFriend/Default.aspx">我的好友</a></li>
        <li class="active">好友分组管理</li> 
    </ol>
</div>
<div class="container btn_green">
        <uc2:WebUserControlTop ID="WebUserControlTop2" runat="server" />
        <uc3:WebUserControlTop ID="WebUserControlTop1" runat="server" />
        <div class="us_topinfo" style="margin-top: 10px;">
            <a href="FriendGroup.aspx">分组管理</a> <a href="FriendGroupAdd.aspx">添加分组</a>
        </div>
</div>
<div class="container btn_green">
        <div class="us_topinfo" style="margin-top: 10px;">
            <ZL:ExGridView CssClass="table table-striped table-bordered table-hover" PageSize="20" ID="EGV" runat="server" DataKeyNames="ID" Width="100%" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="GroupName" HeaderText="分组名称">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CommandName='<%#DataBinder.Eval(Container.DataItem,"ID") %>'>[修 改]</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">[删 除]</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
            </ZL:ExGridView>
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
