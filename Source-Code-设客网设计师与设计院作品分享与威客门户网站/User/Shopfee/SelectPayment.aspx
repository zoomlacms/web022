<%@ page language="C#" autoeventwireup="true" inherits="User_Shopfee_SelectPayment, App_Web_2mub5day" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>完成订单提交</title>
<link type="text/css" href="../../App_Themes/UserThem/style.css" rel="Stylesheet" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
<div id="main" class="rg_inout" runat="server">
<h1>第三步:完成订单提交<span>[<asp:Label ID="Label1" runat="server" BorderWidth="0px" ForeColor="Red"></asp:Label>]</span><img alt="" src="/user/images/regl3.gif" width="242" height="14" /></h1>
	<ul>
	   <li style="text-align:center"></li>
	</ul>   
	<ul style="margin-top:50px;">
       <li style="text-align:center">
	     <asp:Button ID="Button1" CssClass="i_bottom"  runat="server" Text="在线支付" OnClick="Button1_Click" />
         <asp:Button ID="Button3" CssClass="i_bottom"  runat="server" Text="余额支付" onclick="Button3_Click"/>
         <asp:Button ID="SiverCoin" runat="server" CssClass="i_bottom"  Text="银币支付" onclick="SiverCoin_Click" />
	   </li>
	</ul>
</div>
<div id="bottom"> <a href="/"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a>
<p> 
  <script language="javascript" type="text/javascript"> 
<!--
      var year = "";
      mydate = new Date();
      myyear = mydate.getYear();
      year = (myyear > 200) ? myyear : 1900 + myyear;
      document.write(year); 
--> 
</script>&copy;&nbsp;Copyright&nbsp;
  <%Call.Label("{$SiteName/}"); %>
  All rights reserved.</p>
</div>
</form>
<style>
.p_center { margin-top:10px;}.p_center td{ border:1px solid #c6e3f7; line-height:25px; padding:0px 5px;}
.p_center table{ border-collapse:collapse;}
</style>
<div style="clear:both"></div>
<div style=" padding-top:120px;width:960px; margin:auto">
<table class="border" style="margin:auto; text-align:center;" cellspacing="1" id="display2" visible="false" runat="server">
  <tr class="title"><td><strong style="font-size:20px;">恭喜您，下单成功！</strong></td></tr>
  <tr>
    <td class="tdbg">
      <div class="p_center" >
        <table width="500" cellspacing="1" cellpadding="2" >
            <tr class="title">
              <td colspan="2"><b>确 认 款 项</b></td>
            </tr>
            <tr class="tdbg">
              <td style="width: 30%" align="right">支付方式：</td>
              <td align="left"><asp:Label ID="zfpt" runat="server"></asp:Label></td>
            </tr>
            <tr class="tdbg">
              <td align="right">订单号：</td>
              <td align="left"><asp:Label ID="ddh" runat="server"></asp:Label></td>
            </tr>
            <tr class="tdbg">
              <td align="right">支付金额：</td>
              <td align="left"><asp:Label ID="zfje" runat="server"></asp:Label></td>
            </tr>
            <tr class="tdbg">
                <td align="right">手续费：</td>
                <td align="left"><asp:Label ID="sxf" runat="server"></asp:Label></td>
            </tr>
            <tr class="tdbg">
              <td align="right">实际金额：</td>
              <td align="left"><asp:Label ID="sjhbje" runat="server"></asp:Label></td>
            </tr>
            <tr class="tdbg">
              <td colspan="2"><input id="bt2"  Class="i_bottom"  type="button" value="返回商城" onclick="window.location.href='/User/Develop/AppStore.aspx'" /></td>
            </tr>
        </table>
      </div>
    </td>
  </tr>
</table>
</div>
</form>
</body>
</html>
