<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_PreViewOrder, App_Web_ivqqslkk" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>购物订单管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="shop"></div> 
<div class="container margin_t5">
<ol class="breadcrumb">
    <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
    <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
    <li><a href="/User/UserShop/ProductList.aspx">我的店铺</a></li>
    <li class="active">购物订单管理</li>
</ol>
</div>
<div class="container">
    <div runat="server" id="Login" class="us_seta" visible="false">
        <table class="table table-bordered table-hover table-striped">
            <tr>
                <td colspan="2" class="text-center"><font color="red">本页需支付密码才能登入请输入支付密码</font></td>
            </tr>
            <tr>
                <td style="width: 50%;" class="text-right">
                    <asp:TextBox ID="Second" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:Button ID="sure" runat="server" Text="确定" OnClick="sure_Click" />
                </td>
            </tr>
        </table>
    </div>
</div>
<div class="container">
    <div runat="server" id="DV_show" class="btn_green btn_green_xs">
        <div class="btn-group">
            <a href="PreViewOrder.aspx?menu=Cartinfo" class="btn btn-primary">购物车管理</a>
            <a href="OrderList.aspx?menu=Orderinfo" class="btn btn-primary">我的订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo" class="btn btn-primary">订单管理</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=1" class="btn btn-primary">已确定的订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=2" class="btn btn-primary">已发货订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=3" class="btn btn-primary">正常订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=4" class="btn btn-primary">成交订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=5" class="btn btn-primary">回收站</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=1&panel=1" class="btn btn-primary">代购历史订单</a>
            <a href="HotelOrder.aspx?menu=Cartinfo" class="btn btn-primary">酒店订单</a>
            <a href="FeightOrder.aspx?menu=Cartinfo" class="btn btn-primary">机票订单</a>
            <a href="TripOrder.aspx?menu=Cartinfo" class="btn btn-primary">旅游订单</a>
            <a class="btn btn-primary" href="/User/Info/UserRecei.aspx">收货地址</a>
        </div>
            <table class="table table-striped table-bordered" style="margin-bottom: 0;">
                <tr>
                    <td class="text-center">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Orderlist" runat="server" Visible="false">
                <table class="table table-striped table-bordered">
                    <tr>
                        <td style="text-align:center;" class="td_x"><input type="checkbox" id="chkall"/></td>
                        <td style="text-align: center;">订单编号</td>
                        <td style="text-align: center;">客户名称</td>
                        <td style=" text-align: center;">下单时间</td>
                        <td style=" text-align: center;">订单金额</td>
                        <td style=" text-align: center;">实际金额</td>
                        <td style=" text-align: center;">订单状态</td>
                        <td style=" text-align: center;">支付备注</td>
                        <td style=" text-align: center;">付款状态</td>
                        <td style=" text-align: center;">物流状态</td>
                        <td style=" text-align: center;">操作</td>
                    </tr>
                    <ZL:ExRepeater runat="server" ID="Order_RPT" OnItemDataBound="Order_RPT_ItemDataBound" OnItemCommand="Order_RPT_ItemCommand" PagePre="<tr><td colspan='13' style='text-align:center;vertical-align:middle;'>" PageEnd="</td></tr>" PageSize="10">
                        <ItemTemplate>
                            <tr>
                                <td style="text-align: center;">
                                    <input type="checkbox" name="idchk" value="<%#Eval("id") %>" /></td>
                                <td style="text-align: center; white-space: nowrap; overflow: hidden">
                                    <a href="OrderProList.aspx?OrderNo=<%#Eval("OrderNo")%>"><%#Eval("OrderNo")%></a></td>
                                <td style="text-align: center;">
                                    <%#Eval("Reuser") %></td>
                                <td style="text-align: center; white-space: nowrap; overflow: hidden">
                                     <%#Eval("AddTime") %>
                                </td>
                                <td style="text-align: center;">
                                    <%#formatcc(DataBinder.Eval(Container, "DataItem.Ordersamount", "{0:N2}"))%>
                                </td>
                                <td class="text-center">
                                    <%#getshijiage(Eval("id", "{0}"))%></td>
                                <td style="text-align: center;">
                                    <%#formatzt("0")%>
                                    <%#GetReturnStr() %>
                                    <input type="hidden" class="returnmsg_hid" value="<%#Eval("Guojia") %>" />
                                </td>
                                <td style="text-align: center;"><%#formatzt("3")%></td>
                                <td style="text-align: center;"><%#formatzt("1")%></td>
                                <td style="text-align: center;"><%#formatzt("2")%></td>
                                <td class="text-center">
                                    <asp:LinkButton ID="CancelRe_L" runat="server" CommandName="cancel" CommandArgument='<%#Eval("ID") %>'>取消退款</asp:LinkButton>
                                    <%#GetOP() %>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate></FooterTemplate>
                    </ZL:ExRepeater>
                </table>
                <div class="btn_green">
                <asp:Button runat="server" ID="BatDel_Btn"  Text="批量删除" OnClick="BatDel_Btn_Click" OnClientClick="return DelConfirm();"  CssClass="btn btn-primary"  Visible="false"/>
                <asp:Button runat="server" ID="Recoverty_Btn" Text="恢复订单" OnClick="Recoverty_Btn_Click" OnClientClick="return DelConfirm();"  CssClass="btn btn-primary"  Visible="false"/>
                <asp:Button runat="server" ID="BatDel2_Btn" Text="永久删除" OnClick="BatDel2_Btn_Click" OnClientClick="return DelConfirm();" CssClass="btn btn-primary" Visible="false"/>
                </div>
            </asp:Panel>
            
            <asp:Panel ID="Cartinfo" runat="server" Width="100%" Visible="false">
                <ZL:ExGridView runat="server" ID="Carttable" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" 
                CssClass="table table-striped table-bordered table-hover margin_t5" EmptyDataText="没有相关数据!!" 
                OnPageIndexChanging="Carttable_PageIndexChanging" >
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                    <input type="checkbox" name="idchk" value="<%#Eval("id")%>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="购物车ID">
                            <ItemTemplate>
                                    <a href="OrderProList.aspx?OrderNo=<%#Eval("Cartid")%>&SType=1"><%#Eval("Cartid")%></a></td>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="客户名称" DataField="Username" />
                        <asp:BoundField HeaderText="下单时间" DataField="Addtime" />
                        <asp:BoundField HeaderText="数量" DataField="Pronum" />
                        <asp:TemplateField HeaderText="金额">
                            <ItemTemplate>
                                <%#formatcc(DataBinder.Eval(Container, "DataItem.AllMoney", "{0}"))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作">
                            <ItemTemplate>
                                    <a href="OrderProList.aspx?OrderNo=<%#Eval("Cartid")%>&SType=1" class="option_style" title="查看"><i class="fa fa-eye"></i></a>
									<a href="?menu=delcart&id=<%#Eval("id") %>" class="option_style" title="删除" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"><i class="fa fa-trash"></i></a>
                                    <a href="?menu=actcart&id=<%#Eval("id") %>" class="option_style"><i class="fa fa-check"></i>提交订单</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </ZL:ExGridView>
                
                <div class="btn_green"><asp:Button ID="Dels" runat="server" CssClass="btn btn-primary" Text="批量删除" OnClick="Dels_Click" /></div>
            </asp:Panel>
            <asp:Panel ID="ViewCartpro" runat="server" Visible="true">
                 <ZL:ExGridView runat="server" ID="cartproinfo" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" 
                CssClass="table table-striped table-bordered table-hover margin_t5" EmptyDataText="没有相关数据!!" 
                OnPageIndexChanging="cartproinfo_PageIndexChanging" >
                     <Columns>
                         <asp:BoundField HeaderText="商品名称" DataField="proname" />
                         <asp:TemplateField HeaderText="单位">
                             <ItemTemplate>
                                    <%# Eval("Danwei").ToString() == "" ? "空" : Eval("Danwei")%>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:BoundField HeaderText="数量" DataField="pronum" />
                         <asp:TemplateField HeaderText="销售类型">
                             <ItemTemplate>
                                    <%#formatnewstype(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="市场价">
                             <ItemTemplate>
                                    <%#getjiage(Eval("proclass","{0}"),"1",DataBinder.Eval(Container, "DataItem.proid", "{0}"))%>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="相关操作">
                             <ItemTemplate>
                                    <a href="?menu=delcartpro&id=<%#Eval("id") %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" class="option_style" title="删除"><i class="fa fa-trash"></i></a>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                 </ZL:ExGridView>
            </asp:Panel>
            <%--以下为代购列表显示--%>
            <asp:Panel ID="OrderProlist" runat="server" Width="100%">
                <table class="table table-striped table-bordered table-hover" style="margin-bottom:0;">
                    <tr>
                        <td style="text-align: center;">商品名称</td>
                        <td style="text-align: center;">单位</td>
                        <td style="text-align: center;">数量</td>
                        <td style="text-align: center;">销售类型</td>
                        <td style="text-align: center;">市场价</td>
                        <td style="text-align: center;">金额</td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <asp:HiddenField ID="orderID" runat="server" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <link type="text/css" href="/Plugins/JqueryUI/EasyDialog/easydialog.css" rel="stylesheet" />
    <script type="text/javascript" src="/Plugins/JqueryUI/EasyDialog/easydialog.min.js"></script>
    <script type="text/javascript">
        function openWin(obj) 
        {
            window.showModelessDialog("Shopfee/PayWindow.aspx?sid=" + obj + "", "", "dialogHeight:450px;dialogWidth:600px;status:no;scroll:no");
        }
        $().ready(function(){
            $("#chkall").click(function(){
                $("input[name=idchk]").each(function(){this.checked=$("#chkall")[0].checked;});});
        });
        function ChkAll(data){
            $("[name=idchk]").each(function(i,d){
                d.checked=data.checked;
            });
        }
        function DelConfirm()
        {
            if($("input[name=idchk]:checked").length>0)
            {
                return confirm('你确定要操作所选订单吗!!');
            }
            else {alert("请先选择订单");return false;}
        }
        var diag=new ZL_Dialog();
        function ShowDrawBack(oid)
        {
            diag.maxbtn=false;
            diag.title="申请退款";
            diag.url="/User/Order/DrawBack.aspx?id="+oid;
            diag.ShowModal();
        }
        var tempdiag=new ZL_Dialog();
        //拒绝退款理由
        function ShowReturn(obj){
            var $td=$(obj).closest("td");
            $('body').append("<div id='ReturnDiag' style='display:none;'><p>" + $td.find('.returnmsg_hid').val() + "</p></div>");
            tempdiag.title="拒绝退款理由";
            tempdiag.body="";
            tempdiag.content="ReturnDiag";
            tempdiag.reload=true;
            tempdiag.ShowModal();
        }
        function SureRece(oid)
        {
            if(!confirm("确定要确认收货吗?")){return false;}
            else
            {
                $("#OPOid_Hid").val(oid);
                $("#SureRece_Btn").click();
            }
        }
    </script>
    <asp:HiddenField runat="server" ID="OPOid_Hid" />
    <asp:Button runat="server" ID="SureRece_Btn" OnClick="SureRece_Btn_Click" style="display:none;" />
</asp:Content>
