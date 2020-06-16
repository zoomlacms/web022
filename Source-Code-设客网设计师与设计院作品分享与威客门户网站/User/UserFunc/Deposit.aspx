<%@ page language="C#" autoeventwireup="true" inherits="User_UserFunc_Deposit, App_Web_jaigsi5h" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>资金管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%--     <%ZoomLa.Common.function.WriteErrMsg("该页面关闭访问");%>--%>
    <div id="pageflag" data-nav="shop" data-ban="UserInfo"></div>
    <div class="container margin_t10">
        <ol class="breadcrumb">
            <li>您现在的位置：<a href="/" title="网站首页"><%= Call.SiteName%></a></li>
            <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
            <li><a href="/User/Info/UserInfo.aspx">账户管理</a></li>
            <li class="active">用户充值
                [<a href="BonusList.aspx">分红记录</a>]
                [<a href="UnitList.aspx">管理奖</a>]
                [<a href="PromoList.aspx">推广佣金</a>]
            </li>
        </ol>
    </div>
    <div class="container btn_green">
       <div class="bgfff">
            <ul class="nav nav-tabs">
                <li ><a href="#tab0" data-toggle="tab">用户充值</a></li>
                <li class="active"><a href="#tab1" data-toggle="tab">资金转账</a></li>
    <%--            <li><a href="#tab2" data-toggle="tab">分红记录</a></li>--%>
            </ul>
            <div class="tab-content">
                <div id="tab0" class="tab-pane">
                    <table class="table table-bordered">
                        <tr>
                            <td><span>充值金额,最少为100(美元):</span>
                                <asp:TextBox runat="server" ID="Money_T" CssClass="form-control text_300 num" AutoCompleteType="None"></asp:TextBox>
                                <asp:Button runat="server" ID="Mone_Btn" CssClass="btn btn-primary" Text="确定充值" OnClick="Mone_Btn_Click" OnClientClick="return CheckMoney();" Visible="false" />
                                <input type="button" value="确定充值" onclick="CheckMoney();" class="btn btn-primary" id="money_btn" />
                            </td>
                        </tr>
                    </table>
                    <div class="alert alert-info">提示：系统将按6.3汇率转为人民币支付</div>
                </div>
                <div id="tab1" class="tab-pane active">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <td class="td_m">帐户资金：</td>
                            <td>
                                <div class="divline">
                                    <asp:Label class="min80" runat="server" ID="Purse_L"></asp:Label>
                                    <a href="/User/Info/ConsumeDetail.aspx?SType=1" class="btn btn-primary" target="_blank">查看记录</a>
                                    <button type="button" class="btn btn-primary" onclick="ShowDeposit()">用户转账</button>
                                </div>
                                <div class="divline">
                                    <span>将<asp:TextBox runat="server" ID="PurseT1" CssClass="form-control text_x num" Text="100" />资金<span></span>
                                        <input type="button" class="btn btn-default" value="转入手动账户" onclick="SendTransfer();" />
                                        <a href="TransferLog.aspx" target="_blank" class="btn btn-primary">转入记录</a>
                                    </span>
                                </div>
                                <div>
                                    <span>将<asp:TextBox runat="server" ID="PurseT2" CssClass="form-control text_x num" Text="1000" />资金</span>
                                    <asp:Button runat="server" ID="PurseToPoint_Btn" CssClass="btn btn-default" OnClick="PurseToPoint_Btn_Click" Text="转入账户余额" OnClientClick="return confirm('确定要转入吗!');" />
                                    <span class="r_green">转入必须是1000的倍数</span>
                                    <div class="alert alert-info">
                                        转入后可参与分红并将获赠50%赠金.
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr><td>手动帐户：</td><td>
                            <asp:Label class="min80" runat="server" ID="Sicon_L" Text="同步中..."></asp:Label>
            <%--                <a href="/User/Info/ConsumeDetail.aspx?SType=2" class="btn btn-primary" target="_blank">查看记录</a>--%>
                            <a href="/widget/withdrawrequest.aspx" class="btn btn-primary">申请出金</a>
                        </td></tr>
                        <tr runat="server" visible="false"><td>理财帐户：</td><td>
                            <asp:Label class="min80" runat="server" ID="UserPoint_L"></asp:Label>
                            <a href="/User/Info/ConsumeDetail.aspx?SType=4" class="btn btn-primary" target="_blank">查看记录</a>
                            <span class="r_green" runat="server" id="upoint_sp"></span>
                                          </td></tr>
                        <tr><td>账户余额：<br />(托管理财)</td><td>
                            <table class="table table-bordered table-striped">
                                <tr><td>金额</td><td>分红额度</td><td>转入日期</td><td>分红次数</td><td>操作(满20次分红方可出金)</td></tr>
                               <asp:Repeater runat="server" ID="Balance_RPT" OnItemCommand="Balance_RPT_ItemCommand" OnItemDataBound="Balance_RPT_ItemDataBound">
                                   <ItemTemplate>
                                       <tr>
                                           <td><%#Eval("Money","{0:f0}") %></td>
                                           <td><%#GetPerStr() %></td>
                                           <td><%#Eval("CDate") %></td>
                                           <td><%#Eval("BonusCount") %></td>
                                           <td>
                                               <asp:LinkButton ID="withdraw_btn" runat="server" CssClass="btn btn-primary" CommandArgument='<%#Eval("ID") %>' CommandName="withdraw">余额出金</asp:LinkButton>
<%--                                               <asp:TextBox runat="server" ID="bamoney_t" CssClass="form-control text_150 num" placeholder="请输入金额"></asp:TextBox>
                                               <asp:LinkButton runat="server" CssClass="btn btn-primary" CommandArgument='<%#Eval("ID") %>' CommandName="tosicon" OnClientClick="return confirm('确定要转账入理财账户吗?');">转入理财账户</asp:LinkButton>--%>
                                           </td>
                                       </tr>
                                   </ItemTemplate>
                               </asp:Repeater>
                               <tr><td colspan="5">总额：<span class="r_red_mid" runat="server" id="balance_total_sp"></span></td></tr>
                            </table>
                            <a href="/User/Info/ConsumeDetail.aspx?SType=3" class="btn btn-primary" target="_blank">查看记录</a>
                        </td></tr>
                        <tr><td>
                            赠金帐户：<br />
                            </td><td>
                            <table class="table table-bordered table-striped">
                                <tr><td>金额</td><td>赠送日期</td><td>分红次数</td><td>操作(满40次分红方可出金)</td></tr>
                               <asp:Repeater runat="server" ID="Present_RPT" OnItemCommand="Present_RPT_ItemCommand" OnItemDataBound="Present_RPT_ItemDataBound">
                                   <ItemTemplate>
                                       <tr>
                                           <td><%#Eval("Money","{0:f0}") %></td>
                                   <%--        <td>0</td>--%>
                                           <td><%#Eval("CDate") %></td>
                                           <td><%#Eval("BonusCount") %></td>
                                           <td><asp:LinkButton runat="server" ID="withdraw_btn" CssClass="btn btn-primary" CommandArgument='<%#Eval("ID") %>' CommandName="withdraw">赠金出金</asp:LinkButton></td>
                                       </tr>
                                   </ItemTemplate>
                               </asp:Repeater>
                               <tr><td colspan="4">总额：<span class="r_red_mid" runat="server" id="present_total_sp"></span></td></tr>
                            </table>
                       </td></tr>
                    </table>
                </div>
            </div>
       </div>
    </div>
    <div id="Deposit_Div" style="display:none;">
        <table class="table table-bordered">
            <tr>
                <td>用户邮箱:</td>
                <td><asp:TextBox ID="UserEmail_T" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
            </tr>
            <tr>
                <td>转入金额:</td>
                <td><asp:TextBox ID="DepositMoney_T" runat="server" CssClass="form-control text_300 num"></asp:TextBox></td>
            </tr>
        </table>
        <div class="text-center"><asp:Button ID="Deposit_Btn" runat="server" OnClick="Deposit_Btn_Click" OnClientClick="return confirm('确定转账给对方吗?')" Text="转账" CssClass="btn btn-primary" /> <button type="button" onclick="localdiag.CloseModal()" class="btn btn-primary">取消</button></div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script src="/JS/ZL_Regex.js"></script>
    <script src="/wp-content/plugins/sitepress-multilingual-cms/res/js/jquery.cookie.js"></script>
    <script src="/widget/widhelper.js"></script>
    <script>
        $(function () {
            ZL_Regex.B_Num(".num");
            $("#PurseT1").blur(function () {
                var val = this.value; this.value = parseInt(val / 100) * 100;
            });
            $("#PurseT2").blur(function () {
                var val = this.value; this.value = parseInt(val / 1000) * 1000;
            });
            $("#Money_T").keypress(function (e) {
                if (e.keyCode == 13) { $("#money_btn").click(); return false; }
            });
            GetCurMoney(function (money)
            {
                if (!money || money == undefined) { $("#Sicon_L").text(""); }
                else { $("#Sicon_L").text(money); }
            });
        })
        function SendTransfer() {
            var money = parseInt($("#PurseT1").val());
            if (!confirm("确定要转入手动账户吗?")) { return false; }
            if (isNaN(money)) { alert("转入金额错误"); return false; }
            if (money < 100) { alert("最少必须转入100"); return false; }
            if (comdiag == null) { comdiag = new ZL_Dialog(); }
            comdiag.closebtn = false;
            comdiag.ShowMask("正在操作中,请等待");
            TransferTo(money, function (ret) {
                if (ret.retcode == 1) {
                    alert("转入成功"); location = location;
                }
                else { alert("转入失败,原因:" + ret.retmsg); }
                comdiag.CloseModal();
            });
        }
        //充值校验
        function CheckMoney() {
            var flag = false;
            var val = $("#Money_T").val();
            if (ZL_Regex.isEmpty(val)) {
                alert("充值金额不能为空");
            }
            else if (parseInt(val) < 100||isNaN(parseInt(val))) { alert("充值金额最少为100"); }
            else { flag = true; }
            if (flag)
            {
                var winname = window.open("DepositMoney.aspx?money=" + val,'_blank','');
            }
            return false;
        }
        var localdiag = new ZL_Dialog();
        function ShowDeposit() {
            localdiag.title = "用户转账";
            localdiag.content = "Deposit_Div";
            localdiag.width = "none";
            localdiag.ShowModal();
            ZL_Regex.B_Num(".num");
        }
	$().ready(function(e) {
        if('<%Call.Label("{$GetRequest(type)$}");%>'=="1")
		{
			$(".nav-tabs li").removeClass("active");
			$(".nav-tabs li:first-child").addClass("active");
			$("#tab0").addClass("active");
			$("#tab1").removeClass("active");
		}
    });
    </script>
</asp:Content>
