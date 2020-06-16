<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Project_Detail, App_Web_if021ws0" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="Head" runat="Server">
    <title>项目详细内容</title>
</asp:Content>


<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div class="s_bright">
   <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">项目详细内容</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 



       <ul class="nav nav-tabs">
           <li class="active"> <a href="ProjectRequire.aspx">提交需求</a></li>
           <li> <a href="ProjectList.aspx">我的项目</a></li>
    	</ul>
      </div>

<div style="margin-top:10px";class="table table-bordered table-hover table-striped">
	  <div class="us_seta"   style="margin-top:5px;">
		  <li style="width:15%; float:left;line-height:30px">
			<div align="right"></div>
		  </li>  
		<li style="width:83%;line-height:30px"> <asp:Label ID="LblProName" runat="server" Text=""></asp:Label></li>
		  <li style="width:15%; float:left;line-height:30px">
			<div align="right">项目简述：</div>
		  </li> 
		<li style="width:83%;line-height:30px"><asp:Label ID="LblProIntro" runat="server" Text=""></asp:Label></li>
		  <li style="width:15%; float:left;line-height:30px">
			<div align="right">开始时间：</div>
		  </li>  
		<li style="width:83%;line-height:30px"> <asp:Label ID="LblStartDate" runat="server" Text=""></asp:Label></li>            
		<li style="width:15%; float:left;line-height:30px">
			<div align="right">完成时间：</div>
		</li>  
		<li style="width:83%;line-height:30px">
		<asp:Label ID="LblEndDate" runat="server" Text=""></asp:Label>
		</li> 
		<li style="width:15%; float:left;line-height:30px">
			<div align="right">工作内容：</div>
		</li>
		<li style="width:83%;line-height:30px"><asp:Label ID="LblContent" runat="server" Text="暂无工作内容"></asp:Label>
		</li>
		<li style="width:100%; float:left;line-height:30px">
		  <div align="center">
		  </div>
		</li> 
		<li style="width:100%; float:left;line-height:30px">
		<div align="center">
		</div>
		</li>
	  </div>
</div>
</asp:Content>
