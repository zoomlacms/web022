<%@ page language="C#" autoeventwireup="true" inherits="test_WxCodePay, App_Web_i3mjmiwl" masterpagefile="~/Cart/order.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>微信支付</title>
    <style>
        .codepay_title{padding:10px;}
        .codepay_panel{}
        .codeimg_panel{width:400px; margin:auto;}
        .codeimg_img{border:1px solid #ccc; padding:10px; text-align:center;}
        .codeimg_img img{width:100%;}
        .codeimg_tip{background-color:#ff7674;font-size:16px; font-weight:500; padding:5px;color:white;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="top_pay"><div class="pay_logo"><a href="/"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt=""></a></div></div>
    <div class="pay_select">
        <div class="pay_tab">
            <strong>请您及时付款，以便订单尽快处理！ 订单号：<%=PayNo %></strong><br /> 
            请您在提交订单后24小时内完成支付，否则订单会自动取消。
        </div>
       <div class="codepay_title">
           <h3>微信支付</h3>
       </div>
        <div class="codepay_panel">
            <div class="codeimg_panel">
                <div class="codeimg_img">
                    <img id="code_img" runat="server" src="#" />
                </div>
                <div class="margin_t5 codeimg_tip text-center">
                    请使用微信扫一扫<br />
                    扫描二维码支付
                </div>
            </div>
        </div>
        <div id="success_div" class="text-center" style="display:none;">
            <h2>支付成功!即将跳转到商城首页!<a href="/Class_2/Default.aspx">手动跳转</a></h2>
        </div>
    </div>
    <script>
        $().ready(function () {
            setInterval(function () {
                $.ajax({
                    type: 'POST',
                    data: { action: 'getpay', payno: '<%=PayNo %>' },
                    success: function (data) {
                        if (data == "1") {
                            $("#success_div").show();
                            $(".codepay_panel").hide();
                            setTimeout(function () { window.location.href = "/Class_2/Default.aspx"; },3000);
                        }
                    }
                });
            },2000)
        });
    </script>
</asp:Content>

