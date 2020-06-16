<%@ page language="C#" autoeventwireup="true" inherits="manage_User_ShopTagerList, App_Web_nnlnivgk" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>标签订单列表</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tabs">
            <tr class="tdbg">
                <td width="34%" height="24" align="center" class="title">
                    快速查找：
                    <asp:DropDownList ID="quicksouch" runat="server" AutoPostBack="True" class="btn btn-default dropdown-toggle">
                        <asp:ListItem Selected="True">请选择查找方式</asp:ListItem>
                        <asp:ListItem Value="1">我负责跟踪的订单</asp:ListItem>
                        <asp:ListItem Value="2">今天的新订单</asp:ListItem>
                        <asp:ListItem Value="3">所有订单</asp:ListItem>
                        <asp:ListItem Value="4">最近10天内的新订单</asp:ListItem>
                        <asp:ListItem Value="5">最近一个月内的新订单</asp:ListItem>
                        <asp:ListItem Value="6">未确认的订单</asp:ListItem>
                        <asp:ListItem Value="7">未付款的订单</asp:ListItem>
                        <asp:ListItem Value="8">未付清的订单</asp:ListItem>
                        <asp:ListItem Value="9">未送货的订单</asp:ListItem>
                        <asp:ListItem Value="10">未签收的订单</asp:ListItem>
                        <asp:ListItem Value="11">未结清的订单</asp:ListItem>
                        <asp:ListItem Value="12">未开发票的订单</asp:ListItem>
                        <asp:ListItem Value="13">已经作废的订单</asp:ListItem>
                        <asp:ListItem Value="14">暂停处理的订单</asp:ListItem>
                        <asp:ListItem Value="15">已发货的订单</asp:ListItem>
                        <asp:ListItem Value="16">已签收的订单</asp:ListItem>
                        <asp:ListItem Value="17">已结清的订单</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="66%" align="center" class="title">
                    高级查询：
                    <asp:DropDownList ID="souchtable" runat="server" class="btn btn-default dropdown-toggle">
                        <asp:ListItem Selected="True" Value="1">订单编号</asp:ListItem>
                        <asp:ListItem Value="2">客户名称</asp:ListItem>
                        <asp:ListItem Value="3">用户名</asp:ListItem>
                        <asp:ListItem Value="4">收货人</asp:ListItem>
                        <asp:ListItem Value="5">联系地址</asp:ListItem>
                        <asp:ListItem Value="6">联系电话</asp:ListItem>
                        <asp:ListItem Value="7">下单时间</asp:ListItem>
                        <asp:ListItem Value="8">备注/留言</asp:ListItem>
                        <asp:ListItem Value="9">商品名称</asp:ListItem>
                        <asp:ListItem Value="10">收货人邮箱</asp:ListItem>
                        <asp:ListItem Value="11">发票信息</asp:ListItem>
                        <asp:ListItem Value="12">内部记录</asp:ListItem>
                        <asp:ListItem Value="13">跟单员</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="souchkey" runat="server" class="form-control" style="max-width:150px;display:inline;" />
                    <asp:Button ID="souchok" runat="server" Text=" 搜索 " class="btn btn-primary" OnClick="souchok_Click" />
                </td>
            </tr>
        </tbody>
    </table>
    <br />
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tbody1">
            <tr class="tdbgleft">
                <td width="20" height="24" align="center" class="title">
                    <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" />
                </td>
                <td width="140" align="center" class="title">订单编号</td>
                <td width="70" align="center" class="title">客户名称</td>
                <td width="60" align="center" class="title">用户名</td>
                <td width="160" align="center" class="title">下单时间</td>
                <td align="center" class="title" style="width: 68px">实际金额</td>
                <td width="60" align="center" class="title">收款金额</td>
                <td width="70" align="center" class="title">订单状态</td>
                <td width="70" align="center" class="title">付款状态</td>
            </tr>
            <asp:Repeater ID="Orderlisttable" runat="server" >
                <ItemTemplate>
                    <tr class="tdbg" id="<%#Eval("id") %>" onmouseover="this.className='tdbgmouseover'"
                        ondblclick="getinfo(this.id)" onmouseout="this.className='tdbg'">
                        <td height="24" align="center">
                            <%#Getclickbotton(DataBinder.Eval(Container,"DataItem.id","{0}"))%>
                        </td>
                           <td height="24" align="center">
                             <%#getorderno(Eval("id","{0}"))%>
                        </td>
                        <td height="24" align="center">
                         <%#GetUser(DataBinder.Eval(Container, "DataItem.Reuser", "{0}"))%>
                        </td>
                        <td height="24" align="center">
                        <a onclick="opentitle('Userinfo.aspx?id=<%#Eval("userId") %>','查看会员')"
                              href="###" title="查看会员"><%#GetUsers(DataBinder.Eval(Container, "DataItem.userId", "{0}"))%></a>
                        </td>
                        <td height="24" align="center">
                            <%#Eval("AddTime") %>
                        </td>
                        <td height="24" align="right">
                            <%#getshijiage(DataBinder.Eval(Container, "DataItem.id", "{0}"))%>
                        </td>
                        <td height="24" align="right">
                            <%#formatcs(Eval("ordertype","{0}"),DataBinder.Eval(Container,"DataItem.Receivablesamount","{0:N2}"))%><%#getMoney_sign(Eval("Money_code").ToString())%>
                        </td>
                        <td height="24" align="center">
                            <%#formatzt(DataBinder.Eval(Container, "DataItem.OrderStatus", "{0}"),"0")%>
                        </td>
                        <td height="24" align="center">
                            <%#formatzt(DataBinder.Eval(Container, "DataItem.Paymentstatus", "{0}"),"1")%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td height="24" colspan="6" align="right">
                    本次查询合计：<br />
                    总计金额：
                </td>
                <td height="24" align="right" style="width: 68px">
                    <asp:Label ID="thisall" runat="server"></asp:Label><br />
                    <asp:Label ID="allall" runat="server"></asp:Label>
                </td>
                <td height="24" align="center" style="width: 88px">
                    &nbsp;
                </td>
                <td height="24" colspan="5" align="center">
                    &nbsp;
                </td>
            </tr>
            <tr class="tdbg">
                <td height="24" colspan="13" align="center" class="tdbgleft">
                    共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条记录
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                        Text="" />页
                    <asp:Label ID="Label1" runat="server" Text="" />
                    条记录/页 转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    页
                </td>
            </tr>
            <tr>
                <td height="24" colspan="13">
                    说明：“已结清”与“已付款”的订单不允许删除,当订单号码成“灰色”代表此订单已“作废”
                </td>
            </tr>
            <tr>
                <td height="24" colspan="13"style="text-align:center;">
                    <asp:Button ID="Button1" Style="width: 110px" class="btn btn-primary" Text="删除选中订单" runat="server"
                        OnClick="Button1_Click1" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" />
                </td>
            </tr>
        </tbody>
    </table>
    <div class="modal" id="userinfo_div">
        <div class="modal-dialog" style="width: 600px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <span class="modal-title"><strong id="title">用户信息</strong></span>
                </div>
                <div class="modal-body">
                      <iframe id="user_ifr" style="width:100%;height:400px;border:none;" src=""></iframe>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="../../js/Drag.js"></script>
<script type="text/javascript" src="../../js/Dialog.js"></script>
<script language="javascript">
    function CheckAll(spanChk)//CheckBox全选
    {
        var oItem = spanChk.children;
        var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
        xState = theBox.checked;
        elm = theBox.form.elements;
        for (i = 0; i < elm.length; i++)
            if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                if (elm[i].checked != xState)
                    elm[i].click();
            }
    }

    function getinfo(id) {
        location.href = '../Shop/Orderlistinfo.aspx?id=' + id;
    }

    function opentitle(url, title) {
        $("#title").text(title);
        $("#user_ifr").attr("src", url);
        $("#userinfo_div").modal({});
    }
</script>
</asp:Content>


