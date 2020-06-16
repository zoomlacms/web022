<%@ page language="C#" autoeventwireup="true" inherits="User.AddUser, App_Web_1jbandww" title="添加会员" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <title>添加会员</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="4" class="text-center">添加会员 </td>
            </tr>
            <tr>
                <td class="text-right" style="width: 15%;" >用户名： </td>
                <td>
                    <asp:TextBox ID="tbUserName" TabIndex="1" onkeydown="return GetEnterCode('focus','WorkNum_T');" runat="server" class="form-control text_md"></asp:TextBox>
                    <span style="color: red;">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbUserName" ErrorMessage="用户名不能为空" Display="Dynamic" ForeColor="Red" />
                   
                    <div id="check" runat="server"></div></td>
                 <td style="width: 15%;" class="text-right">工号： </td>
                <td>
                    <asp:TextBox ID="WorkNum_T" CssClass="form-control" TabIndex="2"  onkeydown="return GetEnterCode('focus','txtpassword');" Style="max-width: 200px;" runat="server"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td style="width: 15%;;" class="text-right">用户密码： </td>
                <td colspan="3">
                    <asp:TextBox ID="txtpassword" runat="server" class="form-control" TabIndex="3" onkeydown="return GetEnterCode('focus','tbEmail');" Style="max-width: 200px; float: left;" />
                    <span style="color: red;">*</span>
                    <input type="button" value="随机密码" onclick="SetPassWord('txtpassword');" class="btn btn-primary" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="密码不能为空" ControlToValidate="txtpassword" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="密码不能少于6位" ControlToValidate="txtpassword" ValidationExpression="[\s\S]{6,}" />
                </td>
            </tr>
           
            <tr>
                <td style="width: 15%;" class="text-right">E-mail： </td>
                <td class="style2" style="width: 35%;">
                    <asp:TextBox ID="tbEmail" runat="server" class="form-control"  TabIndex="4" onkeydown="return GetEnterCode('focus','txtHoneyName');" Style="max-width: 200px; float: left;"></asp:TextBox>
                    <span style="color: red; float: left;">*</span>
                    <span class="red existemail" style="display:none;" >邮箱已被注册!</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="Email地址不能为空"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="电子邮箱格式不正确" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" Visible="true"></asp:RegularExpressionValidator></td>
                <td style="width: 15%;" class="text-right">呢称： </td>
                <td>
                    <asp:TextBox ID="txtHoneyName" runat="server" TabIndex="5" onkeydown="return GetEnterCode('focus','tbQuestion');" class="form-control" Style="max-width: 200px;"></asp:TextBox>
            </tr>
            <tr>
                <td style="width: 15%;" class="text-right">提示问题： </td>
                <td style="width: 514px;">
                    <asp:TextBox ID="tbQuestion" runat="server" class="form-control" TabIndex="6" onkeydown="return GetEnterCode('focus','tbAnswer');" Style="max-width: 200px; float: left;"></asp:TextBox>
                    <span style="color: red">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbQuestion" Display="Dynamic" ErrorMessage="请输入提示问题"></asp:RequiredFieldValidator></td>
                <td width="224" class="text-right" style="width: 15%;">VIP类型： </td>
                <td width="515" style="width: 35%;">
                    <input type="checkbox" runat="server" id="VIPUser" class="switchChk"  />
            </tr>
            <tr>
                <td style="width: 15%;" class="text-right">提示问题答案： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbAnswer" runat="server"  TabIndex="7" onkeydown="return GetEnterCode('focus','DDLGroup');" class="form-control" Style="max-width: 200px; float: left;"></asp:TextBox>
                    <span style="color: red; float: left;">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="tbAnswer" ErrorMessage="提示答案不能为空" Display="Dynamic"></asp:RequiredFieldValidator></td>
                <td style="width: 15%;" class="text-right">所属会员组： </td>
                <td style="width: 35%;">
                    <asp:DropDownList ID="DDLGroup" runat="server"  TabIndex="8" onkeydown="return GetEnterCode('focus','tbTrueName');" class="btn btn-default dropdown-toggle"></asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 15%;" class="text-right">真实姓名： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbTrueName" runat="server" class="form-control" TabIndex="9" onkeydown="return GetEnterCode('focus','tbUserSex');" Style="max-width: 200px;"></asp:TextBox></td>
                <td style="width: 15%;" class="text-right">性别： </td>
                <td style="width: 35%;">
                    <asp:RadioButtonList ID="tbUserSex" runat="server"  TabIndex="10" onkeydown="return GetEnterCode('focus','tbBirthday');" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">男</asp:ListItem>
                        <asp:ListItem Value="0">女</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td style="width: 15%;" class="text-right">出生日期： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbBirthday" runat="server" onblur="setday(this);" TabIndex="11" onkeydown="return GetEnterCode('focus','tbOfficePhone');" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' });" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                <td style="width: 15%;" class="text-right">办公电话： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbOfficePhone" runat="server" class="form-control" TabIndex="12" onkeydown="return GetEnterCode('focus','tbHomePhone');" Style="max-width: 200px;"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%;" class="text-right">家庭电话： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbHomePhone" runat="server" class="form-control"  TabIndex="13" onkeydown="return GetEnterCode('focus','tbFax');" Style="max-width: 200px;"></asp:TextBox></td>
                <td style="width: 15%;" class="text-right">传真： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbFax" runat="server" class="form-control" TabIndex="14" onkeydown="return GetEnterCode('focus','tbMobile');"  Style="max-width: 200px;"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%;" class="text-right">手机号码： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbMobile" runat="server" class="form-control" TabIndex="15" onkeydown="return GetEnterCode('focus','tbPHS');"  Style="max-width: 200px;"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="手机号码格式不正确" ControlToValidate="tbMobile" ValidationExpression="^[1][358][0-9]{9}$"></asp:RegularExpressionValidator>
                </td>
                <td style="width: 15%;" class="text-right">小灵通： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbPHS" runat="server" class="form-control"  TabIndex="16" onkeydown="return GetEnterCode('focus','tbAddress');" Style="max-width: 200px;"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%;" class="text-right">联系地址： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbAddress" runat="server" Columns="40" class="form-control"  TabIndex="17" onkeydown="return GetEnterCode('focus','tbZipCode');"  Style="max-width: 200px;"></asp:TextBox></td>
                <td style="width: 15%;" class="text-right">邮政编码： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbZipCode" runat="server" class="form-control"  TabIndex="18" onkeydown="return GetEnterCode('focus','tbIDCard');"  Style="max-width: 200px;"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%;" class="text-right">身份证号码： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbIDCard" runat="server" Columns="40" class="form-control"  TabIndex="19" onkeydown="return GetEnterCode('focus','tbHomepage');" Style="max-width: 200px;"></asp:TextBox></td>
                <td style="width: 15%;" class="text-right">个人主页： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbHomepage" runat="server" Columns="40" class="form-control" TabIndex="20" onkeydown="return GetEnterCode('focus','tbQQ');" Style="max-width: 200px;">http://</asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%;" class="text-right">QQ号码： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbQQ" runat="server" class="form-control" TabIndex="21" onkeydown="return GetEnterCode('focus','tbICQ');" Style="max-width: 200px;"></asp:TextBox></td>
                <td style="width: 15%;" class="text-right">ICQ号码： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbICQ" runat="server" class="form-control"  TabIndex="22" onkeydown="return GetEnterCode('focus','tbMSN');" Style="max-width: 200px;"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%;" class="text-right">MSN帐号： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbMSN" runat="server" class="form-control"  TabIndex="23" onkeydown="return GetEnterCode('focus','tbYahoo');" Style="max-width: 200px;"></asp:TextBox></td>
                <td style="width: 15%;" class="text-right">雅虎通帐号： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbYahoo" runat="server" class="form-control" TabIndex="24" onkeydown="return GetEnterCode('focus','tbUC');" Style="max-width: 200px;"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%;" class="text-right">UC帐号： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbUC" runat="server" class="form-control" TabIndex="25" onkeydown="return GetEnterCode('focus','tbUserFace');" Style="max-width:200px;"></asp:TextBox></td>
                <td style="width: 15%; height: 26px;" class="text-right">头像地址： </td>
                <td style="width: 35%; height: 26px;">
                    <asp:TextBox ID="tbUserFace" runat="server" TabIndex="26" onkeydown="return GetEnterCode('focus','tbFaceWidth');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%;" class="text-right">头像宽度： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbFaceWidth" runat="server" TabIndex="27" onkeydown="return GetEnterCode('focus','tbFaceHeight');" class="form-control" Style="max-width: 200px;">16</asp:TextBox></td>
                <td style="width: 15%;" class="text-right">头像高度： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbFaceHeight" runat="server"  TabIndex="28" onkeydown="return GetEnterCode('focus','tbSign');" class="form-control" Style="max-width: 200px;">16</asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%;; line-height: 70px;" class="text-right">签名档： </td>
                <td style="width: 35%;">
                    <asp:TextBox ID="tbSign" runat="server" class="form-control" TabIndex="29" onkeydown="return GetEnterCode('focus','btnSave');" Style="max-width: 200px;" TextMode="MultiLine" Width="300" Height="60"></asp:TextBox></td>
                <td style="width: 15%;; line-height: 70px;" class="text-right">隐私设定： </td>
                <td style="width: 35%;">
                    <asp:RadioButtonList ID="tbPrivacy" TabIndex="30" onkeydown="return GetEnterCode('focus','lblHtml');" runat="server">
                        <asp:ListItem Selected="True" Value="0">公开信息</asp:ListItem>
                        <asp:ListItem Value="1">只对好友公开</asp:ListItem>
                        <asp:ListItem Value="2">完全保密</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <asp:Literal ID="lblHtml" runat="server"></asp:Literal>
            <tr>
                <td style="height: 21px" colspan="4" class="text-center">
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" TabIndex="31"  Text="保存会员信息" OnClick="btnSave_Click"/>
                    <asp:Button ID="btnCancel" CssClass="btn btn-primary" runat="server" TabIndex="32" Text="取消" OnClientClick="location.href='UserManage.aspx';return false;" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript">
        $(window).load(function ()
        {
            $('#tbUserName').focus();
        });
        function SetPassWord(id) {
            $("#" + id).val(GetRanPass(6));
        }
        $(function () {
            SetPassWord('txtpassword');
            //existemail
            $("#tbEmail").change(function () {
                $.post("/API/UserCheck.ashx", { action: "ExistEmail", email: $(this).val() }, function (data) {
                    if (data == 1) {
                        $(".existemail").show();
                        $("#btnSave").attr("disabled", "disabled");
                    }
                    else {
                        $(".existemail").hide();
                        $("#btnSave").removeAttr("disabled");
                    }
                })
            });
        })
    </script>
</asp:Content>
