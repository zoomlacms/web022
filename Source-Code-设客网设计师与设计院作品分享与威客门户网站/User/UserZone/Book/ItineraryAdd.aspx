﻿<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ItineraryAdd, App_Web_btz5xi4j" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc3" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>添加旅途</title>
<link href="../../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="index" data-ban="zone"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li> 
        <li class="active">旅途</li>
    </ol>
</div> 
<div class="container btn_green">  
<uc3:WebUserControlTop ID="WebUserControlTop1" runat="server"></uc3:WebUserControlTop>
</div>
<div class="container btn_green u_cnt">
      <table class="table" border="1" cellpadding="0" cellspacing="0" height="167" width="100%" align="center">
        <tr>
          <td><h3>   <img src="../Images/c94b5c389e8cbfebb311c764.jpg" style="width: 57px; height: 54px" />添加旅途</h3></td>
        </tr>
        <tr>
          <td style="height: 92px"><table width="100%" height="246" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="29%" align="center"> 景点名称：</td>
                <td width="71%">
                  <asp:TextBox ID="titletxt" CssClass="form-control text_300" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="titletxt"   ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                <td align="center"><span class="pl"><span class="pl">出行时间</span>：</span></td>
                <td>
                  <asp:TextBox ID="yeartxt" runat="server"  CssClass="form-control text_300"  MaxLength="4"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="不能为空"  ControlToValidate="yeartxt"></asp:RequiredFieldValidator>
                  <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="yeartxt"
                                        ErrorMessage="请输入正确的出游年份" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator></td>
              </tr>
              <tr>
                <td align="center">图片：</td>
                <td>
                  <input type="file" name="FileUpload1" id="FileUpload1" runat="server" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FileUpload1" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                  <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="图片大小不得超过1024KB"></asp:Label></td>
              </tr>
              <tr>
                <td align="center"><span class="pl">内容：</span></td>
                <td>
                  <textarea id="contenttxt" runat="server" rows="10" class="form-control text_300" ></textarea>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="contenttxt" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <asp:Button ID="sBtn" runat="server" CssClass="btn btn-primary" OnClick="sBtn_Click" Text="添加保存" /></td>
              </tr>
            </table></td>
        </tr>
      </table>
    </div> 
</asp:Content>