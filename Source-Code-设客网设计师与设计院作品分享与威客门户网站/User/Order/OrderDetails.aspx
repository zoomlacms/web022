<%@ page language="C#" autoeventwireup="true" masterpagefile="~/User/Empty.master" inherits="User_Order_OrderDetails, App_Web_ivqqslkk" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>订单详情</title>
<style>
.orderdetails .orederinfo_ul { margin: 0;padding: 0;}
.orderdetails .orederinfo_ul li{line-height:25px;}
.orderdetails .tab-content{height:240px; border:1px solid #ddd;border-top:none;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid orderdetails">
<div runat="server" id="OrderInfo_Div">
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">确认订单</h3>
  </div>
  <div class="panel-body">
    <ul class="orederinfo_ul">
    <li class="col-md-4">
        <strong>订单详情号：</strong>
        <asp:Label ID="OrderNo_L" runat="server"></asp:Label>
    </li>
    <li class="col-md-4">
        <strong>产品名称：</strong>
        <asp:Label ID="PruName_L" runat="server"></asp:Label>
    </li>
    <li class="col-md-4">
        <strong>所属分类：</strong>
        旅游产品
    </li>
    <li class="col-md-4">
        <strong>产品编号：</strong>
        <asp:Label ID="ProCode_T" runat="server"></asp:Label>
    </li>
    <li class="col-md-4">
        <strong>出团日期：</strong>
        <asp:Label ID="StartDate_L" runat="server"></asp:Label>
    </li>
    <li class="col-md-4">
        <strong>行程天数：</strong>
        2天
    </li>
    <li class="col-md-4">
        <strong>销售部门：</strong>
        测试账户
    </li>
     <li class="col-md-4">
        <strong>销售经办：</strong>
        test
    </li>
     <li class="col-md-4">
        <strong>订单状态：</strong>
        <span class="color_red"><asp:Literal ID="OrderStatus_Li" EnableViewState="false" runat="server"></asp:Literal></span>
    </li>
    <li class="col-md-4">
        <strong>报名时间：</strong>
        2015-05-24 21:25:24
    </li>
</ul>
<div class="clearfix"></div>
<ul class="nav nav-tabs margin_t10" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">行程安排</a></li>
    <li role="presentation"><a href="#orderprice" aria-controls="orderprice" role="tab" data-toggle="tab">结算价格</a></li>
    <li role="presentation"><a href="#orderguest" aria-controls="orderguest" role="tab" data-toggle="tab">客人名单</a></li>
    <li role="presentation"><a href="#orderremark" aria-controls="orderremark" role="tab" data-toggle="tab">备注信息</a></li>
  </ul>
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
        ...
    </div>
    <div role="tabpanel" class="tab-pane" id="orderprice">
        <table class="table table-hover table-striped">
            <thead>
                <tr><th>类型</th><th>单价</th><th>人数</th><th>小计</th></tr>
            </thead>
            <tbody>
                <asp:Repeater ID="Price_RPT" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("Proname") %></td><td><span> <%#Eval("LinPrice","{0:f2}") %></span>元/人</td><td><span class="pronum"><%#Eval("Pronum") %></span>人</td><td></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
            <tfoot>
                <tr>
                    <th>合计</th><th></th><th><span id="pronums_span"></span> 人</th><th><asp:Label ID="SumPrice_L" runat="server"></asp:Label> .00元</th>
                </tr>
            </tfoot>
        </table>
    </div>
    <div role="tabpanel" class="tab-pane" id="orderguest">
        <table class="table table-hover table-striped">
            <thead>
                <tr><th>姓名</th><th>性别</th><th>证件类型</th><th>证件号码</th><th>电话</th><th>备注</th></tr>
            </thead>
            <tbody id="guestlist">
                
            </tbody>
        </table>
        <div>
         <asp:Button ID="Exprot_Btn" runat="server" Text="导出客人名单" CssClass="btn btn-info margin_l5" OnClick="Exprot_Btn_Click" />
        </div>
    </div>
    <div role="tabpanel" class="tab-pane" id="orderremark">
    </div>
  </div>
  </div>
  <div class="panel-footer text-right">
      <asp:Button ID="Submit_Btn" runat="server" CssClass="btn btn-primary" OnClick="Submit_Btn_Click" Text="确认订单" />
      <asp:Button ID="CloseOrder_Btn" runat="server" CssClass="btn btn-primary" OnClick="CloseOrder_Btn_Click" Text="取消审核" Visible="false" />
        <asp:Button ID="Refuse_Btn" runat="server" CssClass="btn btn-primary" OnClick="Refuse_Btn_Click" Text="拒绝订单" />
        <button type="button" class="btn btn-primary" onclick="parent.CloseDetail()">取消返回</button>
  </div>
</div>

    <%--<div class="margintop50 text-right">
        
    </div>--%>
  </div>
<div runat="server" visible="false" id="SubmitOrder_Div">
    <div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">确认订单</h3>
  </div>
  <div class="panel-body">
    <table class="table">
            <tr>
                <td class="td_m text-right">订单编号:</td><td><asp:Label ID="SubOrderNo_L" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="text-right">产品名称:</td><td><asp:Label ID="SubProName_L" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="text-right">付款金额:</td><td><asp:Label ID="SubPrice_L" runat="server"></asp:Label>元</td>
            </tr>
            <tr>
                <td class="text-right">付款方式:</td>
                <td>
                    <div><label><input name="paytype" checked="checked" type="radio" value="1" /> 直接确认（不用预付款）</label></div>
                    <div><label><input name="paytype" type="radio" value="2" /> 团款全额预付</label></div>
                    <div><label><input name="paytype" type="radio" value="3" /> 预付部分团款,金额￥</label><asp:TextBox ID="SubPrice_T" disabled="disabled" runat="server" CssClass="form-control text_x num"></asp:TextBox>元</div>
                </td>
            </tr>
        </table>
  </div>
   <div class="panel-footer text-right">
       <asp:Button ID="Check_Btn" runat="server" CssClass="btn btn-primary" OnClick="Check_Btn_Click" Text="确认订单" /> <button type="button" onclick="parent.CloseDetail()" class="btn btn-primary">取消操作</button>
   </div>
</div>
        
    </div>
</div>
<asp:HiddenField ID="GuestJson_Hid" runat="server" />
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
    $().ready(function () {
        GetProNum();
        InitGuestList();
        $("[name='paytype']").click(function () {
            if ($("[name='paytype']:checked").val() == "3") {
                $("#SubPrice_T").removeAttr("disabled");
            } else {
                $("#SubPrice_T").attr("disabled", "disabled");
            }
        });
        ZL_Regex.B_Num(".num");
    });
    //加载客户数据
    function InitGuestList() {
        if ($("#GuestJson_Hid").val() == "") { return; }
        var trtlp = '<tr><td>@Name</td><td></td><td>身份证</td><td>@CertCode</td><td></td><td></td></tr>';
        var guestarry = JSON.parse($("#GuestJson_Hid").val()).Guest;
        var html = JsonHelper.FillData(trtlp, guestarry);
        $("#guestlist").html(html);
        $("#GuestJson_Hid").val(JSON.stringify(guestarry));
    }
    //获得结算总人数
    function GetProNum() {
        var proarry = $(".pronum");
        var pronums = 0;
        for (var i = 0; i < proarry.length; i++) {
            pronums +=parseInt($(proarry[i]).text());
        }
        $("#pronums_span").text(pronums);
    }
</script>
</asp:Content>


