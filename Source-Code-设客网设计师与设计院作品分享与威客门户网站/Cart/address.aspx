<%@ page language="C#" autoeventwireup="true" inherits="test_Cart_address, App_Web_0su1zyub" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8"/>
<script src="/JS/jquery-1.9.1.min.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script src="/dist/js/bootstrap.min.js"></script>
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="/App_Themes/V3.css" rel="stylesheet" />
    <title>地址管理</title>
    <script src="http://code.zoomla.cn/Area.js"></script>
    <script src="/JS/Controls/ZL_PCC.js"></script>
    <style>
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="SM1" runat="server"></asp:ScriptManager>
<table class="table table-bordered">
        <tr><td style="width:120px;" class="text-right">所在地区：</td><td>
                    <select id="province_dp" name="province_dp" class="form-control td_m"></select>
                    <select id="city_dp" class="form-control td_m"></select>
                    <select id="county_dp" class="form-control" style="width:92px;"></select>
            <asp:HiddenField ID="pro_hid" runat="server" />
<%--            <select class="form-control control-sm" id="province_dp" name="province_dp" onchange="changeValue()"></select>
            <select class="form-control control-sm" id="city_dp" name="city_dp" onchange="changeCity()"></select>
            <select class="form-control control-sm" id="county_dp" name="county_dp"></select>--%>
                                                                  </td></tr>
        <tr><td class="text-right">详细地址：</td><td><asp:TextBox runat="server" class="form-control text_300" ID="Street_T" TextMode="MultiLine" /></td></tr>
        <tr><td class="text-right">邮政编码：</td><td><asp:TextBox runat="server" class="form-control text_300 num" ID="ZipCode_T" MaxLength="6" /></td></tr>
        <tr><td class="text-right">收货人姓名：</td><td><asp:TextBox runat="server" class="form-control text_300" ID="ReceName_T" /></td></tr>
        <tr><td class="text-right">手机号码：</td><td><asp:TextBox runat="server" class="form-control text_300 num" ID="MobileNum_T" MaxLength="13" /></td></tr>
        <tr><td class="text-right">电话号码：</td><td>
            <asp:TextBox runat="server" style="width:80px;" class="form-control pull-left num" ID="Area_T" placeholder="区号" MaxLength="4" />
            <asp:TextBox runat="server" style="width:210px;margin-left:10px;" class="form-control pull-left num" ID="Phone_T" placeholder="号码" MaxLength="8"/></td></tr>
        <tr><td></td><td><label><asp:CheckBox runat="server" ID="Def_chk" />设置为默认收货地址</label></td></tr>
            <tr><td></td><td><asp:Button runat="server" ID="SaveBtn" Text="保存" OnClientClick="return CheckForm()" OnClick="SaveBtn_Click"  CssClass="btn btn-primary" /></td></tr>
    </table>
        <style type="text/css">
            .control-sm{width:120px;display:inline-block;}
        </style>
        <script type="text/javascript">
            $().ready(function () {
                ZL_Regex.B_Num(".num");
                var pcc = new ZL_PCC("province_dp", "city_dp", "county_dp");
                if ($("#pro_hid").val() == "") {
                    pcc.ProvinceInit();
                }
                else {
                    var attr = $("#pro_hid").val().split(' ');
                    pcc.SetDef(attr[0], attr[1], attr[2]);
                    pcc.ProvinceInit();
                }
            });
            function CheckForm() {
                var flag = false;
                if ($("#Street_T").val().length<5) {
                    $("#Street_T").focus();
                    alert("详细地址字数必须大于5个字！");
                }
                else if (!ZL_Regex.isZipCode($("#ZipCode_T").val())) {
                    alert("邮政编码格式不正确！");
                    $("#ZipCode_T").focus();
                }
                else if (ZL_Regex.isEmpty($("#ReceName_T").val())) {
                    alert("收货人姓名不能为空！");
                    $("#ReceName_T").focus();
                }
                else if (!ZL_Regex.isMobilePhone($("#MobileNum_T").val()) && ZL_Regex.isEmpty($("#Phone_T").val())) {
                    alert("请输入正确的手机号码或电话！");
                    $("#MobileNum_T").focus();
                }
                else { flag = true; }
                $("#pro_hid").val($("#province_dp option:selected").text() + " " + $("#city_dp option:selected").text() + " " + $("#county_dp option:selected").text());
                return flag;
            }
            function Refresh() { 
                if (parent && parent.Refresh) parent.Refresh();
                parent.location = parent.window.location;
            }
        </script>
    </form>
</body>
</html>