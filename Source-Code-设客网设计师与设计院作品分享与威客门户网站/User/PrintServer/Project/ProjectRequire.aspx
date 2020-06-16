<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Project_ProjectRequire, App_Web_if021ws0" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>


<asp:Content ContentPlaceHolderID="Head" runat="Server">
    <title>需求提交</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div class="s_bright">
     <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">提交服务</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 


         <div class="us_topinfo" style="width:97%; ">
       <ul class="nav nav-tabs">
        
        <li><a href="ProjectList.aspx">我的项目</a></li>
           <li class="active"><a href="ProjectRequire.aspx">提交需求</a></li>
    </ul>
  </div>

<div style="margin-top:10px;">
	  <div class="us_seta" style="margin-top:5px;">
		<ul class="list-unstyled">
		  <li style="width:15%; float:left;line-height:30px">
			<div align="right">用户名：</div>
		  </li>
		<li style="width:83%;line-height:30px">
	   <asp:TextBox ID="TxtUserName" runat="server" class="form-control m715-50" ReadOnly="true"></asp:TextBox>
			<asp:RequiredFieldValidator ID="ValrKeywordText" ControlToValidate="TxtUserName"
				runat="server" ErrorMessage="用户名不能为空！" Display="Dynamic"></asp:RequiredFieldValidator>
		</li>
		  <li style="width:15%; float:left;line-height:30px; margin-top:40px">
			<div align="right" >需求描述：</div>
		  </li>
		<li style="width:83%;line-height:30px;margin-top:10px">
		<asp:TextBox  ID="TxtRequireContent" runat="server" CssClass="form-control m715-50" TextMode="MultiLine" Columns="50" Rows="8"></asp:TextBox>
		   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtUserName"
				runat="server" ErrorMessage="需求描述不能为空！" Display="Dynamic"></asp:RequiredFieldValidator>
		</li>
		<li style="width:100%; float:left;line-height:30px">
			   <div align="center">
		  <asp:Button ID="EBtnSubmit" Text="保存" CssClass="btn btn-primary" OnClick="EBtnSubmit_Click" runat="server" />&nbsp;&nbsp;
			<input name="Cancel" type="button" Class="btn btn-primary"  id="Cancel" value="取消" onclick="javascript: window.location.href = 'ProjectList.aspx'" />
				</div>
		</li>
		<li style="width:100%; float:left;line-height:30px">
			<div align="center"></div>
		</li>
        </ul>  
	  </div>
</div>
</div>
</asp:Content>


