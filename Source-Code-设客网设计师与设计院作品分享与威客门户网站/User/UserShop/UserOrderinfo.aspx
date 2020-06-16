<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_UserOrderinfo, App_Web_laoyo01p" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>订单详情</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li><a href="OrderList.aspx">店铺订单管理</a></li>
        <li class="active">订单详情</li>
    </ol>
    <div>
        <!--startprint-->
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="4" align="center">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 13%; height: 23px">客户名称：<asp:Label ID="Reuser" runat="server" Text=""></asp:Label>
                </td>
                <td align="left" style="width: 14%; height: 23px">用 户 名：<asp:Label ID="Rename" runat="server" Text=""></asp:Label>
                </td>
                <td align="left" style="width: 13%; height: 23px">购买日期：<asp:Label ID="adddate" runat="server"></asp:Label>
                </td>
                <td style="width: 20%; height: 23px" align="left">下单日期：<asp:Label ID="addtime" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 13%; height: 12px">需开发票：<asp:Label ID="Invoiceneeds" runat="server"></asp:Label>
                </td>
                <td align="left" style="width: 14%; height: 12px">已开发票：<asp:Label ID="Developedvotes" runat="server"></asp:Label>
                </td>
                <td align="left" style="width: 13%; height: 12px">付款状态：<asp:Label ID="Paymentstatus" runat="server"></asp:Label>
                </td>
                <td style="width: 20%; height: 12px" align="left">物流状态：<asp:Label ID="StateLogistics" runat="server"></asp:Label>
                    <asp:LinkButton ID="WLXX" runat="server" Text="查看物流详细信息"
                        OnClientClick="show()" OnClick="WLXX_Click" Visible="false"></asp:LinkButton>
                </td>
            </tr>
        </table>
        <div id="Orders" visible="false" runat="server" style="position: absolute; top: 150px; left: 200px; background-color: Gray;">
            <iframe src="http://api.kuaidi100.com/api?id=<%=KDKey %>&com=<%=Company %>&nu=<%=txtlabel11 %>&show=2&muti=1" width='550' height='310' scrolling='no' frameborder='1'></iframe>
            <div align="center">
                <asp:Button runat="server" ID="close" Text="关闭" OnClientClick="close()" OnClick="close_Click" />
            </div>
        </div>
        <table class="table table-bordered">
            <tr>
                <td style="width: 35%;" align="center">
                    <table class="table table-striped table-bordered table-hover" style="margin-bottom: 0;">
                        <tr>
                            <td style="width: 28%;" align="right">收货人姓名：
                            </td>
                            <td style="width: 72%;" align="left">
                                <asp:Label ID="Reusers" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">收货人地址：
                            </td>
                            <td align="left">
                                <asp:Label ID="Jiedao" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">收货人邮箱：
                            </td>
                            <td align="left">
                                <asp:Label ID="Email" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">发票信息：
                            </td>
                            <td align="left">
                                <asp:Label ID="Invoice" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">订单类型：
                            </td>
                            <td align="left">
                                <asp:Label ID="Ordertype" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">要求送货时间：
                            </td>
                            <td align="left">
                                <asp:Label ID="Deliverytime" runat="server" Text=""></asp:Label>
                                <asp:Button ID="Button10" CssClass="btn btn-primary" runat="server" Text="服务记录" OnClick="Button10_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 50%;" align="center">
                    <table class="table table-striped table-bordered table-hover">
                        <tr>
                            <td style="width: 28%;" align="right">联系电话：
                            </td>
                            <td style="width: 72%;" align="left">
                                <asp:Label ID="Phone" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">邮政编码：
                            </td>
                            <td align="left">
                                <asp:Label ID="ZipCode" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">收货人手机：
                            </td>
                            <td align="left">
                                <asp:Label ID="Mobile" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">送货方式：
                            </td>
                            <td align="left">
                                <asp:Label ID="Delivery" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">包装方式：
                            </td>
                            <td align="left">
                                <asp:Label ID="floMethod" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">订单状态：
                            </td>
                            <td align="left">
                                <asp:Label ID="OrderStatus" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table>
            <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
        </table>
        <br />
        <table class="table table-bordered table-striped table-hover">
            <tr>
                <td style="width: 10%;" align="center">图片
                </td>
                <td style="width: 18%;" align="center">商品名称
                </td>
                <td style="width: 6%;" align="center">单位
                </td>
                <td style="width: 6%;" align="center">数量
                </td>
                <td style="width: 6%;" align="center">市场价
                </td>
                <td style="width: 6%;" align="center">实价
                </td>
                <td style="width: 6%;" align="center">指定价
                </td>
                <td style="width: 6%;" align="center">金额
                </td>
                <td style="width: 8%;" align="center">服务期限
                </td>
                <td style="width: 12%;" align="center">备注
                </td>
            </tr>
            <asp:Repeater ID="procart" runat="server" OnItemDataBound="cartinfo_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td style="height: 24px;" align="center">
                            <%#getproimg(DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
                        </td>
                        <td align="center">
                            <a href='/Store/Shopinfo.aspx?Itemid=<%#Eval("ProID") %>&ID=<%#GetUserShopID() %>' target='_blank'><%#Getprotype(Eval("ProID","{0}"))%><%#Eval("proname")%></a>
                        </td>
                        <td style="width: 6%;" align="center">
                            <%#Eval("Danwei") %>
                        </td>
                        <td style="width: 6%;" align="center">
                            <%#Eval("pronum") %>
                        </td>
                        <td style="width: 6%;" align="center">
                            <%#getjiage(Eval("proclass","{0}"),"1", DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
                        </td>
                        <td style="width: 6%;" align="center">
                            <%#getshichangjiage(DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
                        </td>
                        <td style="width: 6%;" align="center">
                            <%#shijia(Eval("proclass", "{0}"), Eval("ProID", "{0}"), DataBinder.Eval(Container, "DataItem.Shijia", "{0}"))%>
                        </td>
                        <td style="width: 6%;" align="center">
                            <%#getprojia(Eval("ProID", "{0}"), DataBinder.Eval(Container, "DataItem.ID", "{0}"))%>
                        </td>
                        <td style="width: 8%;" align="center">
                            <%#qixian(DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
                        </td>
                        <td align="center">
                            <%#beizhu(DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
                        </td>
                    </tr>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr
                                style="background-color: #F6F6F6;">
                                <td align="center">
                                    <%#getproimg(Eval("id","{0}"))%>
                                </td>
                                <td align="center">
                                    <%#Getprotype(DataBinder.Eval(Container, "DataItem.id", "{0}"))%><%#Eval("proname")%>
                                </td>
                                <td style="width: 6%;" align="center">
                                    <%#getProUnit(DataBinder.Eval(Container, "DataItem.id", "{0}"))%>
                                </td>
                                <td style="width: 6%;" align="center">1
                                </td>
                                <td style="width: 6%;" align="center">
                                    <%#getjiage(Eval("proclass", "{0}"), "1", DataBinder.Eval(Container, "DataItem.id", "{0}"))%>
                                </td>
                                <td style="width: 6%;" align="center">
                                    <%#getjiage(Eval("proclass", "{0}"), "2", DataBinder.Eval(Container, "DataItem.id", "{0}"))%>
                                </td>
                                <td style="width: 6%" align="center">-
                                </td>
                                <td style="width: 6%;" align="center">-
                                </td>
                                <td style="width: 8%;" align="center">-
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td colspan="5"></td>
                <td align="left" colspan="5">合计：&nbsp;
                <asp:TextBox ID="Label2" runat="server" CssClass="form-control" Width="116px"></asp:TextBox>
                    <asp:Button ID="Button8" runat="server" Text="修改" CssClass="btn btn-primary" OnClick="Button8_Click" Visible="false" />
                </td>
            </tr>
            <tr>
                <td colspan="1">&nbsp;运费：<asp:Label ID="Label32" runat="server" Text=""></asp:Label>
                </td>
                <td colspan="9" align="left">&nbsp; 包装费：<asp:Label ID="pack" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 50%;" align="left" colspan="5">&nbsp;实际金额：
                <asp:Label ID="Label29" runat="server" Text=""></asp:Label>
                    +<asp:Label ID="Label30" runat="server" Text=""></asp:Label>
                    +<asp:Label ID="packfei" runat="server"></asp:Label>
                    ＝<asp:Label ID="Label31" runat="server" Text=""></asp:Label>
                    (积分折换率：<asp:Label ID="LabPoint" runat="server"></asp:Label>)&nbsp; &nbsp; <span>赠送积分数</span>：<asp:Label ID="LabScore" runat="server"></asp:Label>
                    分
                </td>
                <td style="width: 50%" align="right" colspan="5">&nbsp;已付款：<asp:Label ID="Label28" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
        <!--endprint-->
        <table class="table table-bordered">
            <asp:Repeater ID="procart2" runat="server">
                <ItemTemplate></ItemTemplate>
            </asp:Repeater>
            <tr>
                <td style="width: 25%">
                    <asp:Button ID="Button4" CssClass="btn btn-primary" Style="width: 100px;" runat="server" Text="订单有效" Width="100px" OnClientClick="SelectOrderState();return false;" />
                </td>
                <td>
                    <input type="button" id="Button2" class="btn btn-primary" style="width: 100px;" runat="server" value="已经支付" /></td>
                <td>
                    <asp:Button ID="Button9" CssClass="btn btn-primary" Style="width: 100px;" runat="server" Text="结清订单" Width="100px" Enabled="false" /></td>
                <td>
                    <asp:Button ID="btn3" CssClass="btn btn-primary" Style="width: 100px;" runat="server" Text="订单完成" Width="100px" OnClick="Button14_Click" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button7" CssClass="btn btn-primary" Style="width: 100px;" runat="server" Text="客户已签收" Width="100px" Enabled="false" /></td>
                <td>
                    <asp:Button ID="Button11" CssClass="btn btn-primary" Style="width: 100px;" runat="server" Text="开发票" Width="100px" /></td>
                <td>
                    <asp:Button ID="Button6" CssClass="btn btn-primary" Style="width: 100px;" runat="server" Text="订单作废" Width="100px" OnClick="Button6_Click" /></td>
                <td>
                    <asp:Button ID="Button12" CssClass="btn btn-primary" Style="width: 100px;" runat="server" Text="删除订单" Width="100px" OnClick="Button12_Click" /></td>
            </tr>
            <tr>
                <td style="width: 25%">
                    <asp:Button ID="Button3" CssClass="btn btn-primary" Style="width: 100px;" runat="server" Width="100px" Text="发货" OnClientClick="SelectDelivery();return false;" /></td>
                <td style="width: 25%">
                    <asp:Button ID="Button13" CssClass="btn btn-primary" Style="width: 100px;" runat="server" Text="暂停处理" Width="100px" /></td>
                <td>
                    <asp:Button ID="Button15" CssClass="btn btn-primary" Style="width: 100px;" runat="server" Text="打印订单" Width="100px" OnClientClick="preview();return false;" /></td>
                <td>
                    <asp:Button ID="Button1" CssClass="btn btn-primary" Style="width: 100px;" runat="server" Text="打印签收单" Width="100px" OnClientClick="order();return false;" /><br />
                </td>
            </tr>
        </table>
        <asp:Button ID="Button5" CssClass="btn btn-primary" Style="width: 100px;" runat="server" Text="取消确认" Width="100px" OnClick="Button5_Click" Visible="false" />
    </div>
    <div id="msgDiv">
        <div id="msgShut" onclick="close()">关闭</div>
        <div id="msgDetail"></div>
    </div>
    <div id="bgDiv"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function order() {
            location.href = "/User/UserShop/diunpuorders.aspx?id=" +<%=Request.QueryString["id"] %> +"&menu=print";
        }
        function preview() {
            location.href = "UserOrderinfo.aspx?id=" +<%=Request.QueryString["id"] %> +"&menu=print";
            pageload();
        }
        function pageload() {
<%
        if (Request.QueryString["menu"] == "print")
        {
%>
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint-->";
            eprnstr = "<!--endprint-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
<%
        } 
%>
        }
    </script>
    <script type="text/javascript">
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
            msgObj.style.display = bgObj.style.display = "block";
            msgDetail.innerHTML = "<p align=center><iframe src='/User/UserShop/OrderSelState.aspx?id=<%:OrderID%>' width='550' height='510' scrolling='no' frameborder='0'></iframe></p>"
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
            msgObj.style.display = bgObj.style.display = "block";
            msgDetail.innerHTML = "<p align=center><iframe src='<%=CustomerPageAction.customPath2%>shop/OrderStateManage.aspx?type=1&id=<%:OrderID%>' width='550' height='510' scrolling='no' frameborder='0'></iframe></p>"
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
            msgObj.style.display = bgObj.style.display = "block";
            msgDetail.innerHTML = "<p align=center><iframe src='/User/UserShop/OrderDeliverinfo.aspx?type=1&id=<%:OrderID%>' width='550' height='410'  frameborder='0'></iframe></p>"
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
            msgObj.style.display = bgObj.style.display = "block";
            msgDetail.innerHTML = "<p align=center><iframe src='<%=CustomerPageAction.customPath2%>shop/OrderSigninfo.aspx?type=1&id=<%:OrderID%>' width='550' height='410' scrolling='no' frameborder='0'></iframe></p>"
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
            msgObj.style.display = bgObj.style.display = "block";
            msgDetail.innerHTML = "<p align=center><iframe src='<%=CustomerPageAction.customPath2%>shop/Suspendedinfo.aspx?type=1&id=<%:OrderID%>' width='550' height='310' scrolling='no' frameborder='0'></iframe></p>"
        }
    </script>
</asp:Content>
