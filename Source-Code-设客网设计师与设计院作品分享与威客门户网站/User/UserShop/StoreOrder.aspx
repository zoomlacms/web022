﻿<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_StoreOrder, App_Web_0mdweblp" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>订单详情</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">订单详情</li>
    </ol>
    <div class="us_topinfo" style="width: 98%">
        您现在的位置：会员中心&gt;&gt;<a href="Default.aspx">我的店铺</a>&gt;&gt;<a href="OrderList.aspx">店铺订单管理</a>&gt;&gt; 订单详情
    </div>
    <asp:HiddenField ID="orderID" runat='server' />
    <table class="table table-bordered table-striped table-hover">
        <tr>
            <td colspan="4" class="text-center"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td align="left" style="width: 13%; height: 23px">客户名称：<asp:Label ID="Reuser" runat="server" Text=""></asp:Label>
            </td>
            <td align="left" style="width: 14%; height: 23px">用 户 名：<asp:Label ID="Rename" runat="server" Text=""></asp:Label>
            </td>
            <td align="left" style="width: 13%; height: 23px">购买日期：<asp:Label ID="adddate" runat="server"></asp:Label>
            </td>
            <td width="20%" align="left" style="height: 23px">下单日期：<asp:Label ID="addtime" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 13%; height: 12px">需开发票：<asp:Label ID="Invoiceneeds" runat="server"></asp:Label><span id="tip" runat="server" style="color: Red"></span>
            </td>
            <td align="left" style="width: 14%; height: 12px">已开发票：<asp:Label ID="Developedvotes" runat="server"></asp:Label>
            </td>
            <td align="left" style="width: 13%; height: 12px">付款状态：<asp:Label ID="Paymentstatus" runat="server"></asp:Label>
            </td>
            <td width="20%" align="left" style="height: 12px">物流状态：<asp:Label ID="StateLogistics" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <table class="table table-bordered table-striped">
        <tr class="tdbg">
            <td width="50%" align="center">
                <table class="table table-bordered table-striped table-hover" style="margin-bottom: 0;">
                    <tr>
                        <td width="28%" align="right" class="tdbgleft">订花人姓名：</td>
                        <td width="72%" align="left">
                            <asp:Label ID="Reusers" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="28%" align="right" class="tdbgleft">订花人性别：</td>
                        <td width="72%" align="left">
                            <asp:Label ID="lblSex" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="28%" align="right" class="tdbgleft">订花人电话：</td>
                        <td width="72%" align="left">
                            <asp:Label ID="Phone" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="tdbgleft">订花人手机：</td>
                        <td align="left">
                            <asp:Label ID="Mobile" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="tdbgleft">订花人地址：</td>
                        <td align="left">&nbsp;<asp:Label ID="Jiedao" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="tdbgleft">订花人邮箱：
                        </td>
                        <td align="left">
                            <asp:Label ID="Email" runat="server" Text=""></asp:Label>
                            <asp:Button ID="Button10" runat="server" CssClass="btn btn-primary" Text="服务记录" OnClick="Button10_Click" />
                        </td>
                    </tr>
                </table>
            </td>
            <td width="50%" align="center">
                <table class="table table-bordered table-striped table-hover" style="margin-bottom: 0;">
                    <tr>
                        <td width="28%" align="right" class="tdbgleft">收花人姓名：
                        </td>
                        <td width="72%" align="left">&nbsp;<asp:Label ID="lblDinName" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="28%" align="right" class="tdbgleft">收花人性别：
                        </td>
                        <td width="72%" align="left">&nbsp;<asp:Label ID="lblDinSex" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="28%" align="right" class="tdbgleft">收花人电话：
                        </td>
                        <td width="72%" align="left">&nbsp;<asp:Label ID="lblDinPhone" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="tdbgleft">收花人手机：
                        </td>
                        <td align="left">&nbsp;<asp:Label ID="lblDinMobile" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="tdbgleft" style="height: 24px">收花人地址：
                        </td>
                        <td align="left" style="height: 24px">&nbsp;<asp:Label ID="txtAdd" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="tdbgleft">订单状态：&nbsp;
                        </td>
                        <td align="left">&nbsp;<asp:Label ID="OrderStatus" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <table class="table table-bordered table-striped table-hover">
        <tr>
            <td height="27" class="tdbgleft" width="25%">理想商品：</td>
            <td width="75%">
                <asp:Label ID="lblShopD" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td height="27" class="tdbgleft" width="25%">理想花束：</td>
            <td width="75%"><span id="spFlo" runat="server"></span></td>
        </tr>
        <tr>
            <td height="27" class="tdbgleft" width="25%">价格范围：</td>
            <td width="75%"><span id="spPrice" runat="server"></span></td>
        </tr>
        <tr>
            <td height="27" class="tdbgleft" width="25%">送花区域：</td>
            <td width="75%"><span id="spQue" runat="server"></span></td>
        </tr>
        <tr>
            <td height="27" width="25%" class="tdbgleft">发票信息：</td>
            <td width="75%">
                <asp:Label ID="Invoice" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 27px" width="25%" class="tdbgleft">要求送花时间：</td>
            <td width="75%">
                <asp:Label ID="Deliverytime" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 37px" width="25%" class="tdbgleft">贺卡赠言：</td>
            <td width="75%"><span id="FloLan" runat="server"></span></td>
        </tr>
        <tr>
            <td style="height: 37px" width="25%" class="tdbgleft">其他要求：</td>
            <td width="75%"><span id="spOther" runat="server"></span></td>
        </tr>
        <tr>
            <td></td>
            <td height="27" align="left">合计：
            <asp:Label ID="Label2" runat="server" CssClass="l_input" Height="17px"></asp:Label>元
            </td>
        </tr>
        <tr>
            <td></td>
            <td width="50%" align="left">实际金额：
            <asp:Label ID="Label29" runat="server" Text=""></asp:Label>
                +<asp:Label ID="Label30" runat="server" Text=""></asp:Label>
                +<asp:Label ID="packfei" runat="server"></asp:Label>＝<asp:Label ID="Label31"
                    runat="server" Text=""></asp:Label>
                &nbsp;<span style="color: Red">已付款：<asp:Label ID="Label28" runat="server" Text=""></asp:Label></span>
            </td>
        </tr>
    </table>
    <!--endprint-->
    <table class="table table-bordered table-striped table-hover">
        <asp:Repeater ID="procart2" runat="server">
            <ItemTemplate>
            </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg">
            <td width="25%" rowspan="3">
                <asp:Button ID="Button4" class="btn btn-primary" Style="width: 100px;" runat="server" Text="订单有效" Width="100px" OnClientClick="SelectOrderState();return false;" /><br />
                <asp:Button ID="Button7" class="btn btn-primary" Style="width: 100px;" runat="server" Text="客户已签收" Width="100px" Enabled="false" /><br />
                <asp:Button ID="Button3" class="btn btn-primary" Style="width: 100px;" runat="server" Text="发货" Width="100px" OnClientClick="SelectDelivery(); return false;" />
            </td>
            <td width="25%" rowspan="3">
                <asp:Button ID="Button2" class="btn btn-primary" Style="width: 100px;" runat="server" Text="付款状态" Width="100px" OnClientClick="SelectState();return false;" /><br />
                <asp:Button ID="Button13" class="btn btn-primary" Style="width: 100px;" runat="server" Text="暂停处理" Width="100px" OnClick="Button13_Click" OnClientClick="SelectSuspend(); return false;" /><br />
                <asp:Button ID="Button6" class="btn btn-primary" Style="width: 100px;" runat="server" Text="订单作废" Width="100px" OnClick="Button6_Click" />
            </td>
            <td width="25%" rowspan="3">
                <asp:Button ID="Button9" CssClass="btn btn-primary" Style="width: 100px;" runat="server" Text="结清订单" Enabled="false" Width="100px" /><br />
                <asp:Button ID="Button11" class="btn btn-primary" Style="width: 100px;" runat="server" Text="开发票" Width="100px" OnClientClick="SelectTicState();return false;" /><br />
                <asp:Button ID="btn3" class="btn btn-primary" Style="width: 100px;" runat="server" Text="订单完成" Width="100px" /><br />

            </td>
            <td width="25%" rowspan="3">
                <asp:Button ID="Button12" class="btn btn-primary" Style="width: 100px;" runat="server" Text="删除订单" Width="100px" OnClick="Button12_Click" /><br />
                <asp:Button ID="Button15" class="btn btn-primary" Style="width: 100px;" runat="server" Text="打印订单" Width="100px" OnClientClick="preview();return false;" /><br />
            </td>
        </tr>
    </table>
    <div id="flotop">
        <div id="msgDiv">
            <div id="msgShut">关闭</div>
            <div id="msgDetail"></div>
        </div>
        <div id="bgDiv"></div>
    </div>
    <asp:Button ID="Button5" class="btn btn-primary" runat="server" Text="订单无效" OnClick="Button5_Click" Visible="false" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>

        ///发票状态
        function SelectTicState() {
            //背景
            var bgObj = document.getElementById("bgDiv");
            bgObj.style.width = (document.body.offsetWidth) + "px";
            bgObj.style.height = screen.height + "px";

            //定义窗口
            var msgObj = document.getElementById("msgDiv");
            msgObj.style.marginTop = -75 + document.documentElement.scrollTop + "px";
            //关闭
            document.getElementById("msgShut").onclick = function () {
                bgObj.style.display = msgObj.style.display = "none";
                window.location.href = window.location.href;
            }
            var ordreid = document.getElementById("orderID").value;
            msgObj.style.display = bgObj.style.display = "block";
            msgDetail.innerHTML = "<p align=center><iframe src='<%=CustomerPageAction.customPath2%>shop/Ordertic.aspx?type=1&id=" + ordreid + "' width='550' height='430' scrolling='no' frameborder='0'></iframe></p>"

        }

        ///订单状态
        function SelectOrderState() {
            //背景
            var bgObj = document.getElementById("bgDiv");
            bgObj.style.width = (document.body.offsetWidth) + "px";
            bgObj.style.height = screen.height + "px";

            //定义窗口
            var msgObj = document.getElementById("msgDiv");
            msgObj.style.marginTop = -75 + document.documentElement.scrollTop + "px";
            //关闭
            document.getElementById("msgShut").onclick = function () {
                bgObj.style.display = msgObj.style.display = "none";
                window.location.href = window.location.href;
            }
            var ordreid = document.getElementById("orderID").value;
            msgObj.style.display = bgObj.style.display = "block";
            msgDetail.innerHTML = "<p align=center><iframe src='<%=CustomerPageAction.customPath2%>shop/OrderSelState.aspx?type=1&id=" + ordreid + "' width='550' height='510' scrolling='no' frameborder='0'></iframe></p>"

        }

        ///付款状态
        function SelectState() {
            //背景
            var bgObj = document.getElementById("bgDiv");
            bgObj.style.width = (document.body.offsetWidth) + "px";
            bgObj.style.height = screen.height + "px";

            //定义窗口
            var msgObj = document.getElementById("msgDiv");
            msgObj.style.marginTop = -75 + document.documentElement.scrollTop + "px";
            //关闭
            document.getElementById("msgShut").onclick = function () {
                bgObj.style.display = msgObj.style.display = "none";
                window.location.href = window.location.href;
            }
            var ordreid = document.getElementById("orderID").value;
            msgObj.style.display = bgObj.style.display = "block";
            msgDetail.innerHTML = "<p align=center><iframe src='<%=CustomerPageAction.customPath2%>shop/OrderStateManage.aspx?type=1&id=" + ordreid + "' width='550' height='510' scrolling='no' frameborder='0'></iframe></p>"

        }

        //配送状态
        function SelectDelivery() {
            //背景
            var bgObj = document.getElementById("bgDiv");
            bgObj.style.width = (document.body.offsetWidth) + "px";
            bgObj.style.height = screen.height + "px";

            //定义窗口
            var msgObj = document.getElementById("msgDiv");
            msgObj.style.marginTop = -75 + document.documentElement.scrollTop + "px";
            //关闭
            document.getElementById("msgShut").onclick = function () {
                bgObj.style.display = msgObj.style.display = "none";
                window.location.href = window.location.href;
            }
            var ordreid = document.getElementById("orderID").value;
            msgObj.style.display = bgObj.style.display = "block";
            msgDetail.innerHTML = "<p align=center><iframe src='<%=CustomerPageAction.customPath2%>shop/OrderDeliverinfo.aspx?type=1&id=" + ordreid + "' width='550' height='470' scrolling='no' frameborder='0'></iframe></p>"
        }

        //签收状态
        function SelectSign() {
            //背景
            var bgObj = document.getElementById("bgDiv");
            bgObj.style.width = (document.body.offsetWidth) + "px";
            bgObj.style.height = screen.height + "px";

            //定义窗口
            var msgObj = document.getElementById("msgDiv");
            msgObj.style.marginTop = -75 + document.documentElement.scrollTop + "px";
            //关闭
            document.getElementById("msgShut").onclick = function () {
                bgObj.style.display = msgObj.style.display = "none";
                window.location.href = window.location.href;
            }
            var ordreid = document.getElementById("orderID").value;
            msgObj.style.display = bgObj.style.display = "block";
            msgDetail.innerHTML = "<p align=center><iframe src='<%=CustomerPageAction.customPath2%>shop/OrderSigninfo.aspx?type=1&id=" + ordreid + "' width='550' height='410' scrolling='no' frameborder='0'></iframe></p>"
        }
        //延迟/暂停处理状态
        function SelectSuspend() {
            //背景
            var bgObj = document.getElementById("bgDiv");
            bgObj.style.width = (document.body.offsetWidth) + "px";
            bgObj.style.height = screen.height + "px";

            //定义窗口
            var msgObj = document.getElementById("msgDiv");
            msgObj.style.marginTop = -75 + document.documentElement.scrollTop + "px";
            //关闭
            document.getElementById("msgShut").onclick = function () {
                bgObj.style.display = msgObj.style.display = "none";
                window.location.href = window.location.href;
            }
            var ordreid = document.getElementById("orderID").value;
            msgObj.style.display = bgObj.style.display = "block";
            msgDetail.innerHTML = "<p align=center><iframe src='<%=CustomerPageAction.customPath2%>shop/Suspendedinfo.aspx?type=1&id=" + ordreid + "' width='550' height='310' scrolling='no' frameborder='0'></iframe></p>"
        }

    </script>
</asp:Content>
