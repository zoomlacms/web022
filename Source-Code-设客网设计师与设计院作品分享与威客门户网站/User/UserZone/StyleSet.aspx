<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserZone_StyleSet, App_Web_knf0i1bd" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的空间</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="index" data-ban="zone"></div>
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">设定空间模板</li>
    </ol>
    </div> 
    <div class="container btn_green">   
    <uc1:WebUserControlTop ID="WebUserControlTop1" runat="server"></uc1:WebUserControlTop>
    </div>
    <div class="clearfix"></div>
    <div class="container">
    <div class="alert alert-success">
         <a href="/user/userzone/StyleSet.aspx">设定空间模板</a> | (当前模板:<asp:Label ID="StyleNameLB" runat="server" Text="Label"></asp:Label>)
    </div> 
    </div>
    <div class="container margin_t10">
    <div class="us_topinfo u_cnt ">
        <ul class="list-ustyled">
        <ZL:ExRepeater runat="server" ID="RPT" PageSize="12" PagePre="<li class='text-center'>" PageEnd="</li>" OnItemCommand="RPT_ItemCommand"> 
            <ItemTemplate>
              <li class=" padding5">
                    <div class="user_temp text-center">             
                            <asp:Image ID="Image1" runat="server" CssClass="center-block" onerror="this.src='/Images/nopic.gif';" ImageUrl='<%#GetImg(DataBinder.Eval(Container.DataItem, "ID").ToString())%>' />    
                            <span><%#Eval("StyleName", "{0}")%></span>
                            <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID")%>' CssClass="btn btn-sm btn-primary" CommandName="set">设为模板</asp:LinkButton> 
                     <div class="clearfix"></div>              
                    </div>
                </li>             
            </ItemTemplate>
        <FooterTemplate><div class="clearfix"></div></FooterTemplate> 
    </ZL:ExRepeater>
    </ul>        
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