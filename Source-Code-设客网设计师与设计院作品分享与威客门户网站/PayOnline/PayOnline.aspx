<%@ Page Language="C#" ResponseEncoding="utf-8" AutoEventWireup="true" CodeFile="PayOnline.aspx.cs" Inherits="ZoomLa.WebSite.Shop.PayOnline" EnableViewStateMac="false" Debug="true" %><!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>在线支付</title>
<script src="/JS/jquery-1.11.0.min.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/dist/js/bootstrap.min.js"></script>
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="/dist/css/font-awesome.min.css" rel="stylesheet" />
<link href="/App_Themes/User.css" rel="stylesheet" />
<link href="/Template/Ke/style/global.css?id=20150909" rel="stylesheet"/>
</head>
<body>
<%Call.Label("{ZL.Label id=\"全站头部\"/}");%>

<form id="form1" runat="server">
    <div class="mainpay_div"> 
      <table class="paytable" id="display1" runat="server">
        <tr><td>
            <div class="pay_tab" id="pay_con">
                <div><strong>订单提交成功，请您尽快付款!</strong></div>
                <span>订单号：</span><asp:Label ID="LblOid" runat="server"></asp:Label>
                <span>应付金额：</span><asp:Label ID="LblPayMoney" runat="server"></asp:Label><br />
                <asp:Label Text="手续费：" ID="Fee" runat="server"></asp:Label>
                <asp:Label ID="LblRate" runat="server"></asp:Label>
            </div>
            <div class="PayPlat_s">
                <h3 class="r_green">请选择在线支付的方式：</h3>
                <asp:Label ID="Plat" Text="支付平台：" runat="server"></asp:Label>
                <asp:Label ID="LblPayPlatform" runat="server"></asp:Label>
                <a href="/PayOnline/Orderpay.aspx?PayNo=<%:PayNo %>" class="margin_l5">重新选择</a>
                <div class="margin_t5" runat="server" visible="false" id="Alipay_Btn">
                    <input type="button" value="确定付款" class="btn btn-info" onclick="alipaySubmit();" />
                </div>
                <div class="margin_t5">
                    <asp:Button runat="server" Text="确定支付" class="btn btn-info" Visible="false" ID="Confirm_VMoney_Btn" OnClick="Confirm_Click"   /><%//虚拟币,微信支付,Mobo %>
                </div>
                <div id="SecPwd" class="paypwd_div" runat="server" visible="false">
                    <span>请输入支付密码：</span><asp:TextBox ID="Second" runat="server" TextMode="Password" />
                </div>
            </div>
            <span style="display:none"><asp:Label ID="Titles" runat="server"><strong>在线支付操作（确认支付款项)</strong></asp:Label></span>
        </td></tr>
        <tr>
          <td class="tdbg">
            <div class="p_center">
              <table style="width:500px;">
                <tr class="tdbg">
                    <td align="right"> </td>
                    <td align="left"></td>
                </tr>
                <tr class="tdbg" id="Paymoney2" runat="server" style="display:none">
                    <td align="right">支付金额：</td>
                    <td align="left"></td>
                </tr>
                <tr class="tdbg" id="ActualAmount1" runat="server" style="display:none">
                    <td align="right">：</td>
                    <td align="left"> </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>
      <table class="paytable" id="AfterPay_Tb" runat="server">
          <tr><td><div class="top_pay"><div class="pay_logo"><img src="<%:Call.LogoUrl %>"></div></div></td></tr>
          <tr>
              <td>
                  <div class="p_center">
                      <div class="pay_tab"><strong>恭喜您,下单成功！</strong><br /></div>
                      <div class="PayPlat_s payed">
                          <h3 class="r_green">确认款项：</h3>
                          <div>支付方式：<asp:Label ID="zfpt" runat="server"></asp:Label></div>
                          <div>订单号：<asp:Label ID="ddh" runat="server"></asp:Label></div>
                          <div>支付金额：<asp:Label ID="PayNum_L2" runat="server" Text="0"></asp:Label></div>
                          <div><asp:Label ID="fees" runat="server" Text="手续费："></asp:Label><asp:Label ID="sxf" runat="server"></asp:Label></div>
                          <div id="ActualAmount" runat="server" visible="false"><span>实际金额：</span><asp:Label ID="sjhbje" runat="server"></asp:Label></div>
                          <asp:Literal runat="server" ID="remindHtml" EnableViewState="false"></asp:Literal>
                          <div>
                          	<a href="/User/Content/MyProject.aspx?NodeID=14">项目管理</a>
                              <asp:HyperLink runat="server" ID="Rurl_Href" CssClass="btn btn-primary hidden">我的订单</asp:HyperLink>
                          </div>
                      </div>
                  </div>
              </td>
          </tr>
    </table>
    </div>
    <div id="payremind_div" style="display:none;">
        <div class="panel panel-primary">
            <div class="panel-heading"><span class="glyphicon glyphicon-bookmark"></span><span class="margin_l5">登录平台支付</span></div>
            <div class="panel-body">
            <div style="padding-bottom: 15px; padding-left: 10px;">请您在新打开的支付平台页面进行支付,支付完成前请不要关闭该窗口</div>
            <div class="text-center">
                <a href="/User/Content/MyProject.aspx?NodeID=14" class="btn btn-primary">已完成支付</a>
                <a href="OrderPay.aspx?PayNo=<%:PayNo %>" class="btn btn-primary margin_l20">重选支付平台</a>
            </div>
        </div>
        </div>
    </div>
</form>
    <asp:Panel runat="server" ID="alipay_form" style="display:none;"><div class="margin_t5" runat="server" id="LblHiddenValue"></div></asp:Panel>
    <style type="text/css">
        .mainpay_div {width:950px; margin:auto;}
        .paytable{margin: auto; width:100%; margin-top: 10px; height: 180px;}
        .paypwd_div {width:300px;}
        .payed div {margin-top:5px;}
        .width500 {width:500px;}
    </style>
    <script>
        function alipaySubmit() {
            $("#payform").submit();
            var diag = new ZL_Dialog();
            diag.maxbtn = false;
            diag.closebtn = false;
            diag.backdrop = true;
            diag.width = "width500";
            diag.title = "正在支付";
            diag.body = $("#payremind_div").show().html(); $("#payremind_div").remove();
            diag.ShowModal();
        }
    </script>
<%Call.Label("{ZL.Label id=\"全站底部\"/}");%>
</body>
</html>