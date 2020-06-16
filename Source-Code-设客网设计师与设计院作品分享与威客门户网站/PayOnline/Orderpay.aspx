<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Orderpay.aspx.cs" Inherits="ZoomLa.WebSite.PayOnline.Orderpay" EnableViewStateMac="false" MasterPageFile="~/Cart/order.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>选择支付平台</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <div class="pay_select">
            <div class="pay_tab">
                <strong>订单提交成功，请您尽快付款！</strong><br /> 
                订单号:<asp:Label ID="OrderCode" runat="server" Text=""></asp:Label>
                应付金额:<asp:Label ID="TxtvMoney" runat="server" Text="0"></asp:Label>
            </div>
            <table class="border maintable">
                <tr>
                    <td class="paytitle"><strong>在线支付操作(选择支付平台)</strong></td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <div runat="server" id="money_div" visible="false">
                            <ul class="list-unstyled moneyul">
                                <asp:Repeater runat="server" ID="Money_RPT" EnableViewState="false">
                                    <ItemTemplate>
                                        <li class="moneyli">
                                            <input type="radio" name="money_rad" value="<%#Eval("Flow") %>" />
                                            <a href="javascript:;" class="btn btn-primary"><%#Eval("Money_Sign") %><%#Eval("Money_descp") %></a>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="PayPlat_s">
                            <asp:RadioButtonList runat="server" ID="DDLPayPlat" Style="text-align: center; vertical-align: middle; text-align: left;" RepeatDirection="Horizontal" RepeatColumns="4"></asp:RadioButtonList>
                            <div class="divline"></div>
                            <ul class="dashpay_ul" runat="server" id="virtual_ul" hidden>
                                <li runat="server" id="purseli" title="用户余额支付" visible="false"><input type="radio" name="<%=DDLPayPlat.UniqueID %>" value="Purse" /> <div class='pay_btn'><i class="fa fa-credit-card">余额支付</i></div></li>
                                <li runat="server" id="siconli" title="用户银币支付" visible="false"><input type="radio" name="<%=DDLPayPlat.UniqueID %>" value="SilverCoin" /> <div class='pay_btn'><i class="fa fa-rouble">银币支付</i></div></li>
                                <li runat="server" id="pointli" title="用户积分支付" visible="false"><input type="radio" name="<%=DDLPayPlat.UniqueID %>" value="Score" /> <div class='pay_btn'><i class="fa fa-money">积分支付</i></div> </li>
                            </ul>
                            <asp:Button ID="BtnSubmit" CssClass="i_bottom" runat="server" OnClick="BtnSubmit_Click" />
                            <div class="clear"></div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
     <style type="text/css">
        .maintable {width: 100%; margin-top: 10px;}
        .paytitle {color: #F60; font-size: 14px;padding-left:20px;}
        .moneyul {padding-left: 20px; padding-top: 10px;}
        .moneyli {float:left;border:2px solid #fff;padding:5px;cursor:pointer;}
        .dashpay_ul{float:left;width:100%;margin-top:10px;margin-left:-10px;}
        .dashpay_ul li{float:left;margin-left:10px; line-height:40px; color:#fff;cursor:pointer;}
        .pay_btn{display:inline-block; border-radius:5px; width:149px; height:39px; background:#428bca;text-align:left; padding-left:15px;}
        .pay_btn i{font-size:16px;font-weight:700;}
    </style>
    <script>
        function createImage(a, b, ids) {
            var array = b.split(",");
            ids = ids.split(",");
            for (var i = 0; i < array.length ; i++) {
                var image = document.createElement("img");
                image.display = "block";
                var id = array[i];
                image.src = a + id + ".jpg";
                var obj = document.getElementById("td_" + id + "_" + ids[i]);
                $(obj).append(image);
            }
        }
        $(function () {
            if ($("#money_div").length > 0) {
                $(".moneyli").click(function () {
                    $(this).find("[name=money_rad]")[0].checked = true;
                    $(".moneyli").removeClass("active");
                    $(this).addClass("active");
                });
                $(".moneyli")[0].click();
            }
            $("#DDLPayPlat img").click(function () { $(this).siblings(":radio")[0].checked = true; });
            $(".dashpay_ul li").click(function () {
                $(".dashpay_ul .active").removeClass('active');
                $(this).find('input')[0].checked = true;
                $(this).addClass('active');
            });
        })
    </script>
</asp:Content>
