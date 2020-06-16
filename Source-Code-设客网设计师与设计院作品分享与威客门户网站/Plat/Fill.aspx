<%@ page language="C#" autoeventwireup="true" inherits="Plat_Fill, App_Web_wgc0fbnq" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>能力中心_用户信息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<style type="text/css">
#menu { list-style: none; margin-left: -36.6px; }
#content { width: 355px; height: 244px; border: 1px solid #CCC; margin-top: 40px; }
.txt { margin-top: 10px; }
#move { margin-left: 40%; }
</style>
</head>
<body>
<form id="form1" runat="server">
<div id="move">
<div id="content">
  <ul id="menu">
    <li >
      <asp:TextBox runat="server" ID="TrueName_T" BorderStyle="none" Width="350px"  onkeydown="return GetEnterCode('focus','Post_T');" Height="40px" CssClass="form-control" placeholder="姓名"></asp:TextBox>
    </li>
    <%--  <li class="txt">
                <asp:TextBox runat="server" ID="CompName_T" BorderStyle="none" Width="350px" onkeydown="return GetEnterCode('focus','Post_T')" Height="40px" CssClass="form-control" placeholder="企业名称"></asp:TextBox></li>--%>
    <li class="txt">
      <asp:TextBox runat="server" ID="Post_T" BorderStyle="none" onkeydown="" Width="350px" Height="40px" CssClass="form-control" placeholder="职位"></asp:TextBox>
    </li>
    <li class="txt">
      <asp:TextBox runat="server" ID="Mobile_T" BorderStyle="none" Width="350px" Height="40px" CssClass="form-control" placeholder="手机号码"></asp:TextBox>
    </li>
    <li class="txt">
      <input type="text" class="form-control" style="border:none; width:251px; height:40px;" placeholder="请输入我们发送给您的验证码" />
      <span style="float: right; margin-top: -40px; margin-right: 2px;">
      <asp:Button runat="server" Height="40px" ID="Code_Btn" Width="95px" Text="获取验证码" CssClass="btn btn-primary" />
      </span></li>
  </ul>
</div>
<%--   <p style="margin-left:60px; margin-top:50px;">如果你已拥有帐号，请使用密码进行登录!</p>
    <asp:TextBox runat="server" TextMode="Password"  Width="350px" Height="40px" CssClass="form-control" ID="PassWord_T" placeholder="登录密码"></asp:TextBox>
    <p style="margin-left:150px; margin-top:15px;"><a title="找回密码" href="#" style="color: red; text-decoration: none;">忘记密码？</a></p>--%>
<asp:Button runat="server" ID="Sure_Btn" OnClick="Sure_Btn_Click" Width="355px" Height="45px" Style="margin-top: 10px;" Text="确定" CssClass="btn btn-primary" />
</div>
</form>
</body>
</html>