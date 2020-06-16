﻿<%@ page language="C#" autoeventwireup="true" inherits="ZoomLaManage.WebSite.Manage.User.AddManage, App_Web_3vlddosr" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>编辑管理员</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#home" role="tab" data-toggle="tab">基本信息</a></li>
        <li><a href="#profile" role="tab" data-toggle="tab">角色设置</a></li>
        <li><a href="#messages" role="tab" data-toggle="tab">审核权限</a></li>
    </ul>
    <div class="tab-content" >
        <div class="tab-pane active" id="home">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td class="text-right td_l"><strong>管理员名：</strong></td>
                    <td>
                        <asp:TextBox ID="tbdName"  CssClass="form-control text_md" onkeydown="return GetEnterCode('focus','txtAdminTrueName');" runat="server"></asp:TextBox>
                        <span style="padding: 5px;">管理员名必须大于等于2个字符并且不能超过20个字符</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="管理员名不能为空" ControlToValidate="tbdName" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbdName" ErrorMessage="不能包含特殊字符，如@，#，$，%，^，&，*，(，)，'，?，{，}，[，]，;，:等" ValidationExpression="^[^@#$%^&*()'?{}\[\];:]*$" SetFocusOnError="True" Display="None"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbdName" ErrorMessage="管理员名必须大于等于2个字符并且不能超过20个字符!" ValidationExpression="\S{2,20}$" SetFocusOnError="True" Display="None"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="text-right"><strong>真实姓名：</strong></td>
                    <td>
                        <asp:TextBox ID="txtAdminTrueName" onkeydown="return GetEnterCode('focus','tbPwd');" runat="server" class="form-control pull-left text_md"></asp:TextBox>
                        <span style="padding: 5px;">真实姓名必须大于等于2个字符并且不能超过20个字符</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="真实姓名不能为空" ControlToValidate="txtAdminTrueName" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="R4" runat="server" ControlToValidate="txtAdminTrueName" ErrorMessage="不能包含特殊字符，如@，#，$，%，^，&，*，(，)，'，?，{，}，[，]，;，:等" ValidationExpression="^[^@#$%^&*()'?{}\[\];:]*$" Display="Dynamic" ForeColor="Red"/>
                        <asp:RegularExpressionValidator ID="R5" runat="server" ControlToValidate="txtAdminTrueName" ErrorMessage="真实姓名必须大于等于2个字符并且不能超过20个字符！" ValidationExpression="\S{2,20}$" SetFocusOnError="True" Display="Dynamic" ForeColor="Red"/>
                    </td>
                </tr>
                <tr>
                    <td class="text-right"><strong>新密码：</strong></td>
                    <td>
                        <asp:TextBox ID="tbPwd" onkeydown="return GetEnterCode('focus','tbPwd1');" class="form-control pull-left text_md" runat="server" TextMode="Password"></asp:TextBox>
                        <span style="padding: 5px;">管理员密码字符数要在6-18之间</span>
                        <asp:CompareValidator ID="CV2" runat="server" ControlToCompare="tbPwd1" ControlToValidate="tbPwd" ErrorMessage="密码与初始密码不一致" Display="Dynamic" ForeColor="Red"/>
                        <asp:RegularExpressionValidator ID="R3" runat="server" ControlToValidate="tbPwd" ErrorMessage="管理员密码字符数要在6-18之间！" ValidationExpression="\S{6,18}" SetFocusOnError="True" Display="Dynamic" ForeColor="Red" />                      
                    </td>
                </tr>
                <tr>
                    <td class="text-right"><strong>确认密码：</strong></td>
                    <td>
                        <asp:TextBox ID="tbPwd1" runat="server" onkeydown="return GetEnterCode('focus','cb1');" TextMode="Password" class="form-control pull-left text_md" ></asp:TextBox>
                        <span style="padding: 5px;">确认密码必须与密码保持一致</span>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbPwd" ControlToValidate="tbPwd1" ErrorMessage="密码与初始密码不一致" Display="Dynamic" ForeColor="Red" />
                        <asp:HiddenField ID="HdnPwd" runat="server" />
                     </td>
                </tr>
                 <tr>
                    <td class="text-right"><strong>二级密码：</strong></td>
                    <td>
                        <input runat="server" type="text" id="Spwd_T" class="form-control pull-left text_md"  />
						<span style="padding: 5px;">开发中心等增进功能需要验证此密码，初始为123456</span>
                     </td>
                </tr>
                <tr id="SetModel_Div" visible="false" runat="server">
                    <td class="text-right"><strong>场景设置：</strong></td>
                    <td>
                        <asp:Label runat="server" ID="Theme_L"><span class="alert alert-info">默认场景</span></asp:Label>
                        <input type="button" value="配置" class="btn btn-primary" onclick="ShowAD();" />
                        <input type="button" value="清除" class="btn btn-primary" onclick="ClearAD();" />
                        <asp:HiddenField ID="curmodel_hid" runat="server" />
                    </td>
                </tr>
                <tr runat="server" visible="false">
                    <td class="text-right"><strong>所属组织：</strong></td>
                    <td class="bqright" onmouseover="this.className='tdbgmouseover'">
                        <asp:TextBox ID="txtNode" CssClass="form-control text_md"  runat="server" Enabled="false" Text="组织结构"></asp:TextBox>
                        <input id="Button3" type="button"  value="更改组织" onclick="AddNode('link')" class="btn btn-primary" style="width: auto" />
                        <table cellpadding="0" cellspacing="0" id="NondeTable" border="0"></table>
                        <asp:HiddenField ID="hfNode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="text-right"><strong>选项设置：</strong></td>
                    <td>
                        <asp:CheckBox ID="cb1" Checked="true" runat="server" Text="允许多人同时使用此帐号登录" />
                        <br />
                        <asp:CheckBox ID="cb2" Checked="true" runat="server" Text="允许管理员修改密码" />
                        <br />
                        <asp:CheckBox ID="cb3"  runat="server" Text="是否锁定(超级管理员不允许锁定)" />
                        <br />
                        <asp:CheckBox ID="cb4" runat="server" Text="是否启用个性桌面" /></td></tr>
                <tr id="showmenu" runat="server">
                    <td class="title" colspan="2">
                        <input id="adduser" runat="server" type="checkbox" onclick="hideAdmin()" onkeydown="return GetEnterCode('focus','tbQuestion');" checked="checked" /><label for="adduser">添加同名用户</label>
                    </td>
                </tr>
                <tbody runat="server" id="SameNameDiv">
                    <tr id="Tr1">
                        <td align="right">提示问题： </td>
                        <td>
                            <asp:TextBox ID="tbQuestion" onkeydown="return GetEnterCode('focus','tbAnswer');" runat="server" class="form-control pull-left text_md"></asp:TextBox>
                            <span style="color: red; float: left; padding-top: 8px;">*</span>
                        
                        </td>
                    </tr>
                    <tr id="Tr2">
                        <td align="right">提示问题答案： </td>
                        <td>
                            <asp:TextBox ID="tbAnswer" onkeydown="return GetEnterCode('focus','tbEmail');"  runat="server" class="form-control pull-left text_md"></asp:TextBox>
                            <span style="color: red; float: left; padding-top: 8px;">*</span>
                        
                    </tr>
                    <tr id="viewmail">
                        <td align="right">Email： </td>
                        <td>
                            <asp:TextBox ID="tbEmail" runat="server" onkeydown="return GetEnterCode('focus','btnSubmit');" class="form-control pull-left text_md"></asp:TextBox>
                            <span style="color: red; float: left; padding-top: 8px;">*</span>
                        
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="profile">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td class="td_l text-right"><strong>管理员角色设置：</strong></td>
                    <td>
                        <asp:CheckBoxList ID="cblRoleList"  runat="server" DataTextField="RoleName" DataValueField="RoleID" /></td>
                </tr>
            </table>
        </div>
        <div class="tab-pane" id="messages">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td class="td_l text-right"><strong>是否前台审核互动：</strong></td>
                    <td><asp:CheckBox ID="CheckBox1" runat="server" /></td>
                </tr>
                <tr>
                    <td class="text-right"><strong>发布内容默认状态：</strong></td>
                    <td>
                        <asp:DropDownList ID="DefaultStart"  class="form-control" Style="width: auto" runat="server">
                            <asp:ListItem Value="-99">请选择状态</asp:ListItem>
                            <asp:ListItem Value="99" Selected="True">已审</asp:ListItem>
                            <asp:ListItem Value="0">待审</asp:ListItem>
                            <asp:ListItem Value="-1">退稿</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" OnClick="btnSubmit_Click" Text="保存" />
            <asp:Button ID="btnCancel" class="btn btn-primary" runat="server" Text="取消" OnClientClick="location.href='AdminManage.aspx';return false;" />
        </div>
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
        .alert {padding:10px;}
    </style>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        //同名用户
        function hideAdmin() {
            if (event.srcElement.checked) {
                $("#SameNameDiv").show();
            }
            else $("#SameNameDiv").hide();
        }
        //自定义场景
        function ClearAD() {
            $("#Theme_L").html("<span class='alert alert-info'>默认配置</span>");
            $.post("", { action: "scene", "adminid": "<%:AdminID%>", "config": "",model:"" }, function (data) {
                if (data != 1) { alert("保存自定义场景失败"); }
            });
            $("#curmodel_hid").val("");
        }
        function ShowAD() {
            comdiag.reload = true;
            ShowComDiag("../Scence.aspx?Source=admin&curmodel=" + $("#curmodel_hid").val(), "场景设置");
        }
        function SetConfig(config, model) {
            $("#Theme_L").html("<span class='alert alert-danger'>自定义场景</span>");
            $.post("", { action: "scene", "adminid": "<%:AdminID%>", "config": config, model: model }, function (data) {
                if (data != 1) { alert("保存自定义场景失败"); }
            });
            $("#curmodel_hid").val(model);
            CloseComDiag();
        }
    </script>
</asp:Content>
