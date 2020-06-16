<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.User.UserPassModify, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>修改用户信息</title>
<script type="text/javascript" src="http://code.zoomla.cn/Area.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_PCC.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tbody>
            <tr align="center">
                <td colspan="4" class="spacingtitle"><strong>修改
        <asp:Label ID="LblUserName" runat="server" Text="Label"></asp:Label>
                    的信息</strong></td>
            </tr>
            <tr>
                <td colspan="4">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#Tabs0" onclick="tab1()" data-toggle="tab">基本信息</a></li>
                        <li><a href="#Tabs1" data-toggle="tab" onclick="tab2()" >联系信息</a></li>
                        <li><a href="#Tabs2" data-toggle="tab" onclick="tab3()">其他信息</a></li>
                        <li><a id="platInfo_A" href="#Tabs3" data-toggle="tab" visible="false" runat="server">能力中心信息</a></li>
                        <li><a href="#Tabs4" data-toggle="tab">权限角色</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="Tabs0">
                            <table class="table table-striped table-bordered table-hover">
                                <tr>
                                    <td style="width: 15%;" class="text-right">用户名： </td>
                                    <td class="text-left">
                                        <asp:Label ID="lblUser" runat="server"  Text="Label"></asp:Label></td>
                                    <td style="width: 15%;" class="text-right">用户昵称： </td>
                                    <td colspan="3" class="text-left">
                                        <asp:TextBox ID="txtHoneyName" runat="server" onkeydown="return GetEnterCode('focus','WorkNum_T');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">新密码： </td>
                                    <td class="text-left">
                                        <asp:TextBox ID="tbNewPwd" runat="server" onkeydown="return GetEnterCode('focus','tbConPwd');" class="form-control" Style="max-width: 200px;"></asp:TextBox>  <input type="button" value="随机密码" onclick="SetPassWord('tbNewPwd');" class="btn btn-primary" />
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="新密码和确认密码必须一样" ControlToValidate="tbNewPwd" ControlToCompare="tbConPwd"></asp:CompareValidator><br />
                                        如果不修改密码，请不要输入新密码和确认密码
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" runat="server" ErrorMessage="密码不能少于6位" ControlToValidate="tbNewPwd" ValidationExpression="[\s\S]{6,}" ForeColor="Red"></asp:RegularExpressionValidator>
                                    </td>
                                    <td style="width: 15%;" class="text-right">工号： </td>
                                    <td>
                                        <asp:TextBox ID="WorkNum_T" runat="server"  onkeydown="return GetEnterCode('focus','tbNewPwd');" class="form-control text_md"></asp:TextBox>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">新密码确认： </td>
                                    <td class="text-left">
                                        <asp:TextBox ID="tbConPwd" runat="server" TextMode="Password" onkeydown="return GetEnterCode('focus','tbEmail');" class="form-control" Style="max-width: 200px;"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="新密码和确认密码必须一样" ControlToValidate="tbConPwd" ControlToCompare="tbNewPwd"></asp:CompareValidator>
                                    </td>
                                    <td style="width: 15%;" class="text-right">VIP类型： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:DropDownList ID="VIPUser" onkeydown="return GetEnterCode('focus','DDLGroup');" CssClass="form-control" Width="80" runat="server">
                                            <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                                            <asp:ListItem Value="1">是</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">Email： </td>
                                    <td class="text-left">
                                        <asp:TextBox ID="tbEmail" runat="server" onkeydown="return GetEnterCode('focus','tbQuestion');" class="form-control" Style="max-width: 200px;"></asp:TextBox>
                                        <asp:HiddenField ID="OldEmail_Hid" runat="server" />
                                        <span style="color: red">*</span>
                                        <span class="red existemail" style="display:none;" >邮箱已被注册!</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="Email地址不能为空"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="格式不正确" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" Visible="False"></asp:RegularExpressionValidator>
                                    </td>
                                    <td style="width: 15%;" class="text-right">所属会员组： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:DropDownList ID="DDLGroup" CssClass="form-control" onkeydown="return GetEnterCode('focus','DDLGroup');" Width="150" runat="server"></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">提示问题： </td>
                                    <td class="text-left">
                                        <asp:TextBox ID="tbQuestion" runat="server"  onkeydown="return GetEnterCode('focus','tbAnswer');" class="form-control text_md"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="RT1" ForeColor="Red" ErrorMessage="提示问题不能为空" ControlToValidate="tbQuestion" Display="Dynamic" />
                                    </td>
                                    <td style="width: 15%;" class="text-right">问题答案： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbAnswer" runat="server"  onkeydown="return GetEnterCode('focus','BtnSubmit');"  class="form-control text_md" ></asp:TextBox>
                                        <span style="color: red">*</span>
                                         <asp:RequiredFieldValidator runat="server" ID="RT2" ForeColor="Red" ErrorMessage="答案不能为空" ControlToValidate="tbAnswer" Display="Dynamic" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane" id="Tabs1">
                            <table class="table table-striped table-bordered table-hover">
                                <tr>
                                    <td style="width: 15%;" class="text-right">真实姓名： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbTrueName" runat="server" onkeydown="return GetEnterCode('focus','tbBirthday');"  class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">性别： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:RadioButtonList ID="tbUserSex" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="1">男</asp:ListItem>
                                            <asp:ListItem Value="0">女</asp:ListItem>
                                        </asp:RadioButtonList></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">出生日期： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbBirthday" runat="server" onkeydown="return GetEnterCode('focus','tbOfficePhone');" onblur="setday(this);" onclick="WdatePicker()"
                                            class="form-control text_md"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">办公电话： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbOfficePhone" runat="server" onkeydown="return GetEnterCode('focus','tbProvince');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr class="tdbg">
                                    <td style="width: 15%;" class="text-right">省市县：  </td>
                                    <td style="height: 22px" class="text-left">
                                        <select id="selprovince" name="selprovince">
                                        </select>
                                        <select id="selcity" name="selcity">
                                        </select>
                                        <select id="selcoutry" name="selcoutry">
                                        </select><asp:HiddenField ID="Adress_Hid" runat="server" /></td>
                                    <td style="width: 15%;" class="text-right">推荐人： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbParentUserID" runat="server" onkeydown="return GetEnterCode('focus','tbHomePhone');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>

                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">家庭电话： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbHomePhone" runat="server" onkeydown="return GetEnterCode('focus','tbFax');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">传真： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbFax" runat="server" class="form-control"  onkeydown="return GetEnterCode('focus','tbMobile');" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="text-right">手机号码： </td>
                                    <td class="text-left">
                                        <asp:TextBox ID="tbMobile" runat="server"  onkeydown="return GetEnterCode('focus','tbPHS');" MaxLength="13" class="form-control" Style="max-width: 200px;" />
                                        <asp:RegularExpressionValidator runat="server" ID="Mobile_R" ErrorMessage="手机号码格式不正确" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ControlToValidate="tbMobile" />
                                    </td>
                                    <td class="text-right">小灵通： </td>
                                    <td class="text-left">
                                        <asp:TextBox ID="tbPHS" runat="server" onkeydown="return GetEnterCode('focus','tbAddress');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">联系地址： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbAddress" runat="server" Columns="40" onkeydown="return GetEnterCode('focus','tbZipCode');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">邮政编码： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbZipCode" runat="server" class="form-control" onkeydown="return GetEnterCode('focus','tbIDCard');" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">身份证号码： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbIDCard" runat="server" Columns="40" onkeydown="return GetEnterCode('focus','tbHomepage');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">个人主页： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbHomepage" runat="server" onkeydown="return GetEnterCode('focus','tbQQ');" Columns="40" class="form-control" Style="max-width: 200px;">http://</asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">QQ号码： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbQQ" runat="server" onkeydown="return GetEnterCode('focus','tbICQ');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">ICQ号码： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbICQ" runat="server" class="form-control" onkeydown="return GetEnterCode('focus','tbMSN');" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">MSN帐号： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbMSN" runat="server" class="form-control"  onkeydown="return GetEnterCode('focus','tbYahoo');" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">雅虎通帐号： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbYahoo" runat="server" class="form-control"  onkeydown="return GetEnterCode('focus','tbUC');"  Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">UC帐号： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbUC" runat="server" class="form-control" onkeydown="return GetEnterCode('focus','tbUserFace');" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%; height: 26px;" class="text-right">头像地址： </td>
                                    <td style="width: 35%; height: 26px;" class="text-left">
                                        <asp:TextBox ID="tbUserFace" runat="server" class="form-control" onkeydown="return GetEnterCode('focus','tbFaceWidth');" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">头像宽度： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbFaceWidth" runat="server" class="form-control" onkeydown="return GetEnterCode('focus','tbFaceHeight');" Style="max-width: 200px;">16</asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">头像高度： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbFaceHeight" runat="server" class="form-control"  onkeydown="return GetEnterCode('focus','CompanyNameT');"  Style="max-width: 200px;">16</asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">公司名称： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="CompanyNameT" runat="server" class="form-control" onkeydown="return GetEnterCode('focus','CompanyDescribeT');" Style="max-width: 200px;" Columns="40"></asp:TextBox>
                                    </td>
                                    <td style="width: 15%;" class="text-right">公司简介： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="CompanyDescribeT" runat="server" TextMode="MultiLine" onkeydown="return GetEnterCode('focus','BtnSubmit');" Rows="4" Columns="28"></asp:TextBox></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane" id="Tabs2">
                            <table class="table table-striped table-bordered table-hover">
                                <tr class="tdbg">
                                    <td style="width: 15%;" class="text-right">剩余资金： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtMoney" runat="server" onkeydown="return GetEnterCode('focus','txtUserCrite');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">用户信誉值</td>
                                    <td>
                                        <asp:TextBox ID="txtUserCrite" runat="server" onkeydown="return GetEnterCode('focus','txtUserPoint');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">点券： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtUserPoint"  onkeydown="return GetEnterCode('focus','txtPoint');" runat="server" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">用户积分： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtPoint" runat="server" onkeydown="return GetEnterCode('focus','txtPurm');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">虚拟币： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtPurm" runat="server" onkeydown="return GetEnterCode('focus','txtSilverCoin');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">用户银币：</td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtSilverCoin" runat="server" onkeydown="return GetEnterCode('focus','txtCerificateDeadLine');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">商铺认证有效期截止： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtCerificateDeadLine" onkeydown="return GetEnterCode('focus','txtDeadLine');"  runat="server" class="form-control" Style="max-width: 200px;" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' })"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">有效期截止时间： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtDeadLine" runat="server" onkeydown="return GetEnterCode('focus','txtboffExp');" class="form-control" Style="max-width: 200px;" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' })"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">卖家积分： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtboffExp" runat="server" onkeydown="return GetEnterCode('focus','txtConsumeExp');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">消费积分： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="txtConsumeExp" runat="server" onkeydown="return GetEnterCode('focus','tbSign');" class="form-control" Style="max-width: 200px;"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" class="text-right">签名档： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:TextBox ID="tbSign" runat="server" onkeydown="return GetEnterCode('focus','BtnSubmit');" class="form-control" Style="max-width: 200px;" TextMode="MultiLine" Width="253px"
                                            Height="60"></asp:TextBox></td>
                                    <td style="width: 15%;" class="text-right">隐私设定： </td>
                                    <td style="width: 35%;" class="text-left">
                                        <asp:RadioButtonList ID="tbPrivacy" runat="server">
                                            <asp:ListItem Selected="True" Value="0">公开信息</asp:ListItem>
                                            <asp:ListItem Value="1">只对好友公开</asp:ListItem>
                                            <asp:ListItem Value="2">完全保密</asp:ListItem>
                                        </asp:RadioButtonList></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="padding-left: 0;">
                                        <table width="100%" border="0" cellpadding="0">
                                            <asp:Literal ID="lblHtml" runat="server"></asp:Literal>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane" id="Tabs3">
                        <table class="table table-striped table-bordered table-hover padding0">
                            <tr>
                                <td style="width:15%;" class="text-right">真实姓名：</td>
                                <td style="width:35%;"><asp:TextBox ID="tbTrueName_T" CssClass="form-control text_md" runat="server"></asp:TextBox>
                                </td>
                                <td style="width:15%;" class="text-right">公司名称：</td>
                                <td style="width:35%;"><asp:DropDownList ID="tbCompName_D" CssClass="form-control text_md" runat="server" DataTextField="CompName" DataValueField="ID"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width:15%;" class="text-right">公司部门：</td>
                                <td style="width:35%;"><asp:TextBox ID="tbPost_T" CssClass="form-control text_md" runat="server"></asp:TextBox></td>
                                <td style="width:15%;" class="text-right">手机号码：</td>
                                <td style="width:35%;"><asp:TextBox ID="tbPhone_T" CssClass="form-control text_md" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ErrorMessage="手机号码格式不正确" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ControlToValidate="tbPhone_T" />
                                </td>
                            </tr>
                        </table>
                    </div>
                       <div class="tab-pane" id="Tabs4">
                        <table class="table table-striped table-bordered table-hover">
                            <tr>
                                <td style="width: 200px;"><strong>管理员角色设置：</strong></td>
                                <td valign="top">
                                    <asp:CheckBoxList ID="cblRoleList"  runat="server" /></td>
                            </tr>
                        </table>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:Literal ID="ltlTab" runat="server"></asp:Literal>
    <asp:Literal ID="models" runat="server"></asp:Literal>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="4">
                <asp:HiddenField ID="HdnUserID" runat="server" />
                <asp:Button ID="BtnSubmit" runat="server" Text="修改" OnClick="BtnSubmit_Click" class="btn btn-primary" />
                <asp:Button ID="Button1" runat="server" Text="取消" class="btn btn-primary" OnClick="Button1_Click" CausesValidation="False" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" class="btn btn-primary" />
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="../Common/Common.js"></script>
    <script type="text/javascript" src="../../JS/calendar.js"></script>
    <script type="text/javascript" src="../JS/ajaxrequest.js"></script>
    <script src="/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        $().ready(function () {
            var pcc = new ZL_PCC("selprovince", "selcity", "selcoutry");
            var defstrs = $("#Adress_Hid").val().split(',');
            if (defstrs.length > 0)
                pcc.SetDef(defstrs[0], defstrs[1], defstrs[2]);
            pcc.ProvinceInit();
            pcc.$province.change(area);
            pcc.$city.change(area);
            pcc.$county.change(area);
            //检测用户邮箱
            $("#tbEmail").change(function () {
                if ($("#OldEmail_Hid").val() == $(this).val()) {
                    $(".existemail").hide();
                    $("#BtnSubmit").removeAttr("disabled");
                    return;
                }
                $.post("/API/UserCheck.ashx", { action: "ExistEmail", email: $(this).val() }, function (data) {
                    if (data == 1) {
                        $(".existemail").show();
                        $("#BtnSubmit").attr("disabled", "disabled");
                    }
                    else {
                        $(".existemail").hide();
                        $("#BtnSubmit").removeAttr("disabled");
                    }
                })
            });
        });
        $().ready(function () {
            $("[href='#<%=Request.QueryString["tabs"] %>']").tab('show');
        });
        function SetPassWord(id) {
            $("#" + id).val(GetRanPass(6));
        }
        $(window).load(function () {
            $("#txtHoneyName").focus();
        });
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2"<%=tabTitles %>);
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2"<%=tabs %>);
        function ShowTabss(SID) {
            if (SID != tID) {
                if (document.getElementById(arrTabTitle[tID].toString()) != null)
                    document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                if (document.getElementById(arrTabTitle[SID].toString()) != null)
                    document.getElementById(arrTabTitle[SID].toString()).className = "titlemouseover";
                if (document.getElementById(arrTabs[tID].toString()) != null)
                    document.getElementById(arrTabs[tID].toString()).style.display = "none";
                if (document.getElementById(arrTabs[SID].toString()) != null)
                    document.getElementById(arrTabs[SID].toString()).style.display = "";
                tID = SID;
            }
        }
    </script>
    <script type="text/javascript">
       
        function area() {
            $("#tbProvince").val($("#selprovince").val());
            $("#tbCity").val($("#selcity").val());
            $("#tbCoutry").val($("#selcoutry").val());
        }
        function tab2(){
            $("#tbTrueName").focus();
        }
        function tab1() {
            $("#txtHoneyName").focus();
        }
        function tab3() {
            $("#txtMoney").focus();
        }
    </script>
</asp:Content>
