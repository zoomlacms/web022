<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_Arrive_AddArrive, App_Web_rillxipg" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>编辑优惠劵</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-striped table-bordered">
<tr>
<td class="text-center">
    <asp:Literal ID="LTitle" runat="server" Text="添加优惠劵"></asp:Literal>
</td>
</tr>
<tr>
<td valign="top" style="margin-top: 0px; margin-left: 0px;">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td><strong>卡别名：</strong></td>
            <td>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Style="max-width: 300px"></asp:TextBox>
                <font color="red">*</font><font color="green">便于识别的名称</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="卡别名不能为空!" />
            </td>
        </tr>
        <tr>
            <td><strong>优惠券类型：</strong></td>
            <td>
                <asp:RadioButtonList RepeatDirection="Horizontal" runat="server" ID="Magclass">
                    <asp:ListItem Value="0" Selected="True"><lable style="font-weight:normal">现金卡&nbsp;&nbsp;</lable></asp:ListItem>
                    <asp:ListItem Value="1"><lable style="font-weight:normal">银行卡&nbsp;&nbsp;</lable></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr id="EditecodType" runat="server">
            <td><strong>编码类型：</strong></td>
            <td>
                <asp:RadioButtonList RepeatDirection="Horizontal" runat="server" ID="EcodeType">
                    <asp:ListItem Value="2" Selected="True"><lable style="font-weight:normal">混淆&nbsp;&nbsp;</lable></asp:ListItem>
                    <asp:ListItem Value="0"><lable style="font-weight:normal">数字&nbsp;&nbsp;  </lable></asp:ListItem>
                    <asp:ListItem Value="1"><lable style="font-weight:normal">字母&nbsp;&nbsp;</lable></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tbody id="no" runat="server">
            <tr>
                <td><strong>编号:</strong></td>
                <td>
                    <asp:TextBox ID="txtNo" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox></td>
            </tr>
            <tr>
                <td><strong>密码:</strong></td>
                <td>
                    <asp:TextBox ID="txtPwd" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox></td>
            </tr>
            <tr>
                <td><strong>状态:</strong></td>
                <td>
                    <asp:TextBox ID="txtState" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox></td>
            </tr>
            <tr>
                <td><strong>所属用户:</strong></td>
                <td>
                    <asp:TextBox ID="txtUserID" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    <asp:HiddenField ID="hfid" runat="server" />
                    <input id="Button1" type="button" value="选择用户" onclick="Openwin(); void (0)" class="btn btn-primary" />
                    <input type="button" id="btnC" value="不送出" class="btn btn-primary" onclick="clears()" />
                </td>
            </tr>
        </tbody>
        <tr id="amountTr">
            <td><strong>金额：</strong></td>
            <td>
                <asp:TextBox ID="txtAmount" runat="server" Text="100" CssClass="form-control" Style="width: auto;" /><font color="red">*</font>
                <span style="color: red;">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="txtAmount" ErrorMessage="生成数量必须是数字!" ValidationExpression="^(-?\d+)(\.\d+)?$" SetFocusOnError="True" /></span>
            </td>
        </tr>
        <tr id="amountAreaTr">
            <td><strong>适用范围：</strong></td>
            <td>
                <asp:TextBox runat="server" ID="minAmount" class="form-control pull-left" MaxLength="10" Style="width: 55px;" Text="0" /><span style="float: left; padding: 6px;">到</span>
                <asp:TextBox runat="server" ID="maxAmount" class="form-control pull-left" MaxLength="10" Style="width: 56px;" />
                <span style="color: green; margin-left: 1px;">*如输入(200-300)则只有200-300单价商品才能使用，不填则代表不限制。</span>
        </tr>
        <tbody id="createNum" runat="server">
            <tr>
                <td><strong>生成数量：</strong></td>
                <td>
                    <asp:TextBox ID="txtCreateNum" Text="100" runat="server" CssClass="form-control" Style="width: auto;" />
                    <span style="color: red;">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server"
                            ControlToValidate="txtCreateNum" ErrorMessage="生成数量必须是数字!" ValidationExpression="^(-?\d+)(\.\d+)?$" SetFocusOnError="True" /></span></td>
            </tr>
        </tbody>
        <tr>
            <td style="height: 26px"><strong>生效时间：</strong></td>
            <td style="height: 26px">
                <asp:TextBox ID="txtCreateTime" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd'});" runat="server" CssClass="form-control" Style="width: auto; float: left" />
                <span style="line-height: 26px; color: green; float: left;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="/App_Themes/AdminDefaultTheme/images/Calendar.gif" ToolTip="鼠标点击左边输入框出现时间选择框" Style="top: 4px; position: relative;" />
                    </span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                    runat="server" ControlToValidate="txtCreateTime" ErrorMessage="生效时间不能为空!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 26px"><strong>到期时间:</strong></td>
            <td style="height: 26px">
                <asp:TextBox ID="txtEndTime" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd'});" runat="server" CssClass="form-control" Style="width: auto; float: left;"></asp:TextBox>
                <span style="line-height: 26px; color: green; float: left;"><asp:Image ID="Image1" runat="server" ImageUrl="/App_Themes/AdminDefaultTheme/images/Calendar.gif" ToolTip="鼠标点击左边输入框出现时间选择框" Style="top: 4px; position: relative;" />默认一年有效</span>
                <font color="red"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                runat="server" ControlToValidate="txtEndTime" ErrorMessage="到期时间不能为空!"></asp:RequiredFieldValidator>
            </font></td>
        </tr>
        <tr>
            <td style="height: 26px"><strong>是否立即激活:</strong></td>
            <td style="height: 26px">
                <asp:CheckBox runat="server" ID="isValid" Checked="true" />
            </td>
        </tr>
    </table>
</td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%" id="TABLE1">
<tr>
<td align="left" style="height: 59px">&nbsp; &nbsp;
<asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="制作优惠劵" runat="server" OnClick="EBtnSubmit_Click" />
    <input type="button" class="btn btn-primary" value="返回列表" onclick="location.href = 'ArriveManage.aspx'" />
</td>
</tr>
</table>
    
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/pacalendar.js" type="text/javascript"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
    $("body").ready(function () {
        $("#txtName").focus();
    });
    var userdiag = new ZL_Dialog();
function Openwin() {
    userdiag.title = "选择客户";
    userdiag.url = "SelectUserName.aspx";
    userdiag.ShowModal();
}
function clears() {
var ite = document.getElementById("txtUserID");
var ite1 = document.getElementById("hfid");
ite.value = "未激活";
ite1.value = "0";
}
</script>
</asp:Content>
