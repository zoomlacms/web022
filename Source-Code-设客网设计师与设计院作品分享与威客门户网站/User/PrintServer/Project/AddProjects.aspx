<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Project_AddProjects, App_Web_if021ws0" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="Head" runat="Server">
    <title>新建项目</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">新建项目</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 


    <table class="table table-bordered table-hover table-striped">
		<tr class="spacingtitle" style="height:30px">
			<td align="center" colspan="2"><asp:Label ID="lblText" runat="server"></asp:Label></td>
		</tr>
		<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td class="style2"><b>名称</b><br />项目的名称</td>
			<td  ><asp:TextBox    ID="TxtProjectName" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV" runat="server" 
                    ControlToValidate="TxtProjectName" Display="Dynamic" ErrorMessage="*">项目名称不可为空</asp:RequiredFieldValidator>
            </td>
		</tr>
		<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td class="style4" > <b>项目类型</b><br />请选择项目类型</td>
			<td class="style5" > 
                <asp:DropDownList ID="DDList" runat="server" Width="126px" CssClass="form-control pull-left"></asp:DropDownList>
			    <a href="ProjectsAddType.aspx" style=" margin-left:12px;">添加项目类型</a>
			</td>
		</tr>
		<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td class="tdbgleft" style=" width: 282px;"><b>项目价格</b><br />完成此项目的价格</td>
			<td ><asp:TextBox ID="TxtProjectPrice" runat="server" class="form-control" Width="300px" ></asp:TextBox></td>
		</tr>
		<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td class="tdbgleft" ><b>要求</b><br />项目需求说明</td>
			<td><asp:TextBox ID="TxtProjectRequire" runat="server" Width="398px" class="form-control" Height="68px" TextMode="MultiLine"></asp:TextBox></td>
		</tr>
		<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td  class="tdbgleft" style=" width: 282px;"><b>姓名</b><br />申请人姓名</td>
			<td ><asp:TextBox ID="TxtUserName" runat="server" Width="300px" class="form-control"></asp:TextBox></td>
		</tr>
		<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td class="tdbgleft"  ><b>单位</b><br />申请人的工作单位</td>
			<td class="style6" ><asp:TextBox ID="TxtUserCompany" runat="server" Width="300px" class="form-control"></asp:TextBox></td>
		</tr>
		<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td  class="tdbgleft" ><b>联系电话</b><br />申请人的常用电话</td>
			<td style="width: 766px;"><asp:TextBox ID="TxtUserTel" runat="server" Width="300px" class="form-control"></asp:TextBox></td>
		</tr>
		<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td class="tdbgleft" ><b>手机</b><br />申请人的手机号码</td>
			<td align="left" valign="middle"><asp:TextBox ID="TxtUserMobile" runat="server" Width="300px" class="form-control"></asp:TextBox></td>
		</tr>
		<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td  class="tdbgleft" valign="top" ><b>QQ</b><br />申请人的QQ号码</td>
			<td ><asp:TextBox ID="TxtUserQQ" runat="server" Width="300px" class="form-control"></asp:TextBox> </td>
		</tr>
		<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td class="tdbgleft"  valign="top" ><b>MSN</b><br />申请人MSN号码</td>
			<td ><asp:TextBox ID="TxtUserMSN" runat="server" Width="300px" class="form-control"></asp:TextBox></td>
		</tr>
		<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td  class="tdbgleft" ><b>联系地址</b><br />申请人的居住地址</td>
			<td style="width: 766px;">
           <asp:TextBox ID="TxtUserAddress" runat="server" Width="300px" class="form-control"></asp:TextBox></td>
		</tr>
		<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td  class="tdbgleft" ><b>邮箱</b><br />申请人的电子邮箱地址</td>
			<td style="width: 766px;"><asp:TextBox ID="TxtUserEmail" runat="server" Width="300px" class="form-control"></asp:TextBox></td>
		</tr>
		<td><asp:Literal ID="lblHtml" runat="server"></asp:Literal></td>
	</table>
	<div class="clearbox"></div>
    <div style=" text-align:center">
        <asp:Button ID="Commit" CssClass="btn btn-primary"  runat="server" Text="提交" class="C_input"  onclick="Commit_Click"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Cancle" CssClass="btn btn-primary"  runat="server" Text="返回" class="C_input"  onclick="Cancle_Click" />
    </div>
</asp:Content>
