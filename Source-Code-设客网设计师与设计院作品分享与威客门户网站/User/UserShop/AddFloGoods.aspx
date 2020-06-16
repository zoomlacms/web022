<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_AddFloGoods, App_Web_rfdgijc1" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>编辑运货方式</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li><a href="FloGoodsManage.aspx">运货方式管理</a></li>
        <li class="active"><%= str %></li>
		<div class="clearfix"></div>
    </ol>
</div>
    <div class="container">
        <asp:HiddenField ID="hfid" runat="server" />
        <div class="btn_green"><uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" /></div>
        <div class="us_seta" style="margin-top: 5px;">
            <h1 align="center"></h1>
        </div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="2" class="text-center">
                    编辑运货方式
                </td>
            </tr>
            <tr>
                <td width="33%" align="right">运货方式：</td>
                <td width="67%">
                    <asp:TextBox ID="paname" CssClass="form-control text_300" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ErrorMessage="包装名称不能为空！" ControlToValidate="paname"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td width="33%" align="right">运费：</td>
                <td width="67%">
                    <asp:TextBox ID="txtprice" CssClass="form-control text_300" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtPrice" ErrorMessage="运费格式不正确!" ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td width="33%" align="right">运货说明：</td>
                <td width="67%">
                    <asp:TextBox ID="remark" runat="server" CssClass="form-control text_300" Height="119px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="btn_green" align="center" colspan="2">
                    <asp:Button ID="Button1" runat="server" CssClass=" btn btn-primary" Text=" 添 加 " OnClick="Button1_Click" />
                    &nbsp;<input type="button" id="b" class="btn btn-primary" onclick="javascript: location.href = 'FloGoodsManage.aspx'" value=" 取 消 " />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
