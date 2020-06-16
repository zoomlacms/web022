<%@ page language="C#" autoeventwireup="true" inherits="User_Shopfee_Moneytop, App_Web_2mub5day" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<meta charset="utf-8">
<title>货币选择与确认</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="/dist/css/bootstrap.min.css" rel="stylesheet"/>
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<link href="/dist/css/font-awesome.min.css" rel="stylesheet"/>
<script type="text/javascript">
function sterline(s) {
    if (s == 1) {
        document.getElementById("sterline").style.display = 'block';
        document.getElementById("other").style.display = 'none';
    } else {
        document.getElementById("other").style.display = 'block';
        document.getElementById("sterline").style.display = 'none';
    }
}
</script>
</head>
<body>
<form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="jumbotron" style="margin-top: 5%; height: 30em;">
                <h3><i class="fa fa-spinner fa-spin"></i>货币选择与确认</h3>
                <br />
                <br />
                <asp:LinkButton ID="Button1" runat="server" Text="人民币支付" PostBackUrl="UserOrderinfo.aspx"></asp:LinkButton>
                <a href="javascript:sterline(1)">英镑支付</a> <a href="javascript:sterline(2)">美元货币</a>
                <div style="margin-top:5px;">
                    <div id="sterline" style="display: none">
                        <asp:LinkButton ID="LinkButton1" runat="server" Text="线下汇款" PostBackUrl="UserOrderinfo.aspx?page=1" CssClass="btn btn-primary" />
                        <asp:LinkButton ID="LinkButton2" runat="server" Text="Paypal支付" PostBackUrl="PaypalDefray.aspx?page=1" CssClass="btn btn-primary" />
                    </div>
                    <div id="other" style="display: none">
                        <asp:LinkButton ID="LinkButton3" runat="server" Text="Paypal支付" PostBackUrl="PaypalDefray.aspx?page=2" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        Copyright &copy;<script>
                            var year = ""; mydate = new Date(); myyear = mydate.getYear(); year = (myyear > 200) ? myyear : 1900 + myyear; document.write(year);
        </script>
        <a href="<%:ZoomLa.Components.SiteConfig.SiteInfo.SiteUrl %>" target="_blank"><%:Call.SiteName %></a>版权所有
    </div>
    </form>
</body>
</html>
