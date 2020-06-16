﻿<%@ page language="C#" autoeventwireup="true" inherits="User_PromotUnion_userunioninviteview, App_Web_k2ou405e" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>已邀请到的好友</title>
<script src="/Common/Common.js" type="text/javascript"></script>
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
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="group" data-ban="promot"></div>
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">我的赚钱记录</li> 
    </ol>
</div> 
<div  class="container u_cnt">
<div  class="alert alert-success" id="nocontent" runat="server" >您目前还没有成功推荐好友注册!</div>
</div>
<br />
<div class="clear"> </div>
	<div align="center"  runat="server" id="content">
	 <div class="us_seta"  style="margin-top:5px;"><h1 align="center">赚钱记录</h1></div>
	   <table width="100%">
		   <tr>
			   <td align="center" width="30%">推荐好友帐号</td>
			   <td align="center" width="30%">时间</td>
			   <td align="center" width="30%">有效用户</td>
		   </tr>  
	   </table>
			 <asp:Repeater ID="repf" runat="server" >
			 <ItemTemplate>
			   <table width="100%">
			   <tr>
				   <td align="center" width="30%"><asp:Label ID="Points" runat="server" Text='<%#Eval("RecommUserId" )%>'></asp:Label></td>
				   <td align="center" width="30%"><asp:Label ID="Type" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"RegData","{0:yyyy-MM-dd}") %>'> </asp:Label></td>
				   <td align="center" width="30%"><asp:Label ID="Remark" runat="server" Text='<%# GetisVal(Eval("isValid","{0}") )%>'></asp:Label></td>
				</tr>  
			  </table>
			 </ItemTemplate>
			 </asp:Repeater>
			 <table width="100%" > 
			 <tr>
				<td  width="30%">合计:<asp:Label ID="lblCountNum" runat="server"></asp:Label></td><td  width="30%">&nbsp;</td>
				<td width="30%">合计:<asp:Label ID="lblCountIsVal" runat="server"></asp:Label></td>
			 </tr>
			 <tr align="left">
				<td colspan="3" valign="bottom"><div style="float:left">我的收入：<asp:Label ID="lblIncome" runat="server"></asp:Label>
				<asp:HiddenField ID="hfRemoney" runat="server" />
				&nbsp; &nbsp; &nbsp;<asp:Button ID="btnRe" runat="server" Text="转入我的返利帐户" onclick="btnRe_Click" OnClientClick="return confirm('转入后所有记录归零,确定转入?')" /></div>
				<div id="tips" style="float:left;">(如果转入返利账户,则以上所有记录清空,收入从头计算)</div></td>
			 </tr>
			 <tr>
			<td height="24" align="center" colspan="3">
				共 <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条信息<asp:Label ID="Toppage" runat="server" Text="" /> <asp:Label ID="Nextpage" runat="server" Text="" /> <asp:Label ID="Downpage" runat="server" Text="" /> <asp:Label ID="Endpage" runat="server" Text="" />  页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页  
				<span style="text-align: center">
				 <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px"  ontextchanged="txtPage_TextChanged"></asp:TextBox>
				 </span>条信息/页  转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"	onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>页
			</td>
		</tr></table>
</div>
</asp:Content>