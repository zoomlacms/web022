<%@ page language="C#" autoeventwireup="true" inherits="Manage_Shop_OtherOrder_DomainOrder, App_Web_y4s3y1ms" validaterequest="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>IDC订单管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
  <table class="table table-striped table-bordered table-hover">
    <tr>
      <td><span class="pull-left">高级查询：
        <asp:DropDownList ID="souchtable" CssClass="form-control" Width="150" runat="server">
          <asp:ListItem Selected="True" Value="1">订单编号</asp:ListItem>
          <asp:ListItem Value="2">客户名称</asp:ListItem>
          <asp:ListItem Value="4">用户名</asp:ListItem>
          <asp:ListItem Value="5">联系地址</asp:ListItem>
        </asp:DropDownList>
        </span> <span class="pull-left" style="padding-top:5px;">
        <asp:RadioButtonList runat="server" ID="dateRadio" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="DateChk_CheckedChanged">
          <asp:ListItem Value="0" Selected="True">全部</asp:ListItem>
          <asp:ListItem Value="1">未到期</asp:ListItem>
          <asp:ListItem Value="2">已到期</asp:ListItem>
        </asp:RadioButtonList>
        </span>
        <div class="input-group pull-left" style="width:300px;">
          <asp:TextBox runat="server" ID="souchkey" class="form-control" placeholder="请输入需要搜索的内容" />
          <span class="input-group-btn">
          <asp:LinkButton runat="server" CssClass="btn btn-default" ID="souchok" OnClick="souchok_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
          </span> </div></td>
    </tr>
  </table>
  <div id="TableList" runat="server">
      <table id="EGV" class="table table-bordered table-hover">
          <tr>
              <td></td>
              <td><span>订单编号</span></td>
              <td><span>品名</span></td>
              <td><span>用户名</span></td>
              <td><span>下单时间</span></td>
              <td><span>到期时间</span></td>
              <td><span>是否到期</span></td>
              <td><span>实际金额</span></td>
              <td><span>收款金额</span></td>
              <td><span>订单状态</span></td>
              <td><span>付款状态</span></td>
              <td><span>操作</span></td>
          </tr>
            <ZL:ExRepeater runat="server" ID="RPT" OnItemCommand="Orderlisttable_ItemCommand" PageSize="10" PagePre="<tr id='page_tr'><td><input type='checkbox' id='AllID_Chk'/></td><td colspan='11' id='page_td'>" PageEnd="</td></tr>">
                <ItemTemplate>
                    <tr class="tdbg" id='<%#Eval("id") %>' ondblclick="getinfo(this.id)">
                        <td><%#Getclickbotton(DataBinder.Eval(Container,"DataItem.id","{0}"))%></td>
                        <td><%#GetOrderNo(Eval("ID").ToString())%></td>
                        <td><a href="<%#GetShopUrl() %>" title="点击浏览商品"><%#Eval("Proname") %></a></td>
                        <td><a onclick="opentitle('../../User/Userinfo.aspx?id=<%#Eval("userId") %>','查看会员')" href="###" title="查看会员"><%#GetUsers(Eval("UserID").ToString())%></a></td>
                        <td><%#Eval("AddTime") %></td>
                        <td><%#Eval("EndTime") %></td>
                        <td><%#IsExpire(Eval("EndTime")) %>
                            <div id="more_div" class="border more">
                                <div class="moreTitle"><span class="closeSpan" onclick="HideMoreF();">关闭</span><%#"订单号："+Eval("OrderNo") %></div>
                                <%#string.IsNullOrEmpty(Eval("OrderMessage",""))?"无备注":Eval("OrderMessage") %>
                            </div>
                        </td>
                        <td><%#getshijiage(DataBinder.Eval(Container, "DataItem.id", "{0}"))%></td>
                        <td><%#formatcs(DataBinder.Eval(Container,"DataItem.Receivablesamount","{0:N2}"))%><%#getMoney_sign(Eval("Money_code").ToString())%></td>
                        <td><%#formatzt(DataBinder.Eval(Container, "DataItem.OrderStatus", "{0}"),"0")%></td>
                        <td><%#formatzt(DataBinder.Eval(Container, "DataItem.Paymentstatus", "{0}"),"1")%></td>
                        <td>
                             <a href="javascript:;" onclick="ShowMoreF(this);">浏览备注</a>
                            <%#GetOP() %>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                  <%--  <tr><td colspan="11"><span>实际金额合计:</span><span class="rd_red_l"><%#GetTotalSum() %></span></td></tr>--%>
                </FooterTemplate>
            </ZL:ExRepeater>
        <asp:HiddenField runat="server" ID="TotalSum_Hid" />
    </table>
        <asp:Button ID="Button1" class="btn btn-primary" Text="批量删除" runat="server" OnClick="Button1_Click1" OnClientClick="if(!IsSelectByName('idchk')){alert('请选择内容');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" />
        <%--<asp:Button ID="Button2" class="btn btn-primary" Text="设为成功" runat="server" OnClick="Button2_Click" OnClientClick="if(!IsSelectByName('idchk')){alert('请选择内容');return false;}else{return confirm('你确定要将订单设为成功吗？')}" />--%>
  </div>
<div id="PayStatus" style="display:none;">
    <div class="text-center">
        <button class="btn btn-primary" onclick="window.location=location;" type="button">支付成功</button>
        <button class="btn btn-primary" onclick="ClosePayDiag()" type="button">取消支付</button>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    $(function () {
        $("#AllID_Chk").click(function () {
            $('input:checkbox[name=idchk]:enabled').each(function () { this.checked = $('#AllID_Chk')[0].checked; });
        });
    })
    function getinfo(id) { location.href =<%=CustomerPageAction.customPath2%> +'Shop/Orderlistinfo.aspx?id=' + id; }
    var userdiag = new ZL_Dialog();
    function opentitle(url, title) {
        userdiag.title = title;
        userdiag.url = url;
        userdiag.backdrop = true;
        userdiag.maxbtn = false;
        userdiag.ShowModal();
    }
    var paydiag = new ZL_Dialog();
    function ShowPayDiag() {
        paydiag.title = "支付状态";
        paydiag.content = "PayStatus";
        paydiag.ShowModal();
    }
    function ClosePayDiag() {
        paydiag.CloseModal();
    }
    function CloseDiag() {
        userdiag.CloseModal();
    }
    function ShowMoreF(obj)//more_div,more_div2
    {
        $(".more").hide();
        $(obj).parent().parent().find("#more_div").show();
    }
    function HideMoreF() {
        $(".more").hide();
    }
</script>
<style>
.more { width: 400px; height: 300px; position: absolute; display: none; top: 100px; border-radius: 3px; }
.moreTitle { text-align: center; background-color: #08C; font-family: 'Microsoft YaHei'; font-size: 14px; color: white; height: 30px; padding-top: 5px; }
.closeSpan { float: right; margin-right: 10px; cursor: pointer; }
.border { border: 1px solid #428bca; background-color: #ffffff; }
</style>
</asp:Content>
