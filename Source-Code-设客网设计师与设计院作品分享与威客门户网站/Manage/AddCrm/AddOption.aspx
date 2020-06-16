<%@ page language="C#" autoeventwireup="true" inherits="manage_AddCRM_AddOption, App_Web_4jghbugi" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>添加新选项</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:Literal ID="liTitle" runat="server" Visible="false"></asp:Literal>
        <table class="table table-striped table-bordered table-hover">
            <tr class="gridtitle">
                <td colspan="5" align="center" style="height: 25px;">
                    <asp:Label ID="Tit" runat="server" Text="自定义字段表"></asp:Label>
                </td>
            </tr>
            <tr class="tdbgleft">
                <td align="center">序号
                </td>
                <td align="center">选项名称
                </td>
                <td align="center">展现形式
                </td>
                <td align="center">是否启用
                </td>
                <td align="center">操作
                </td>
            </tr>
            <asp:Repeater ID="repeater1" runat="server" OnItemCommand="repeater1_ItemCommand" DataSourceID="CRMOption" OnItemDataBound="repeater1_ItemDataBound">
                <ItemTemplate>
                    <tr style="width: 500px" title="双击修改" ondblclick="location='CRMDictionary.aspx?FieldName=<%# Server.UrlEncode(Eval("tagName")as string) %>';">
                        <td align="center">
                            <%# Eval("ID")%>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="TextBox1" class="l_input" runat="server" Text='<%# Eval("displayName")%>'
                                Style="text-align: center" MaxLength="10"></asp:TextBox>
                            <asp:HiddenField runat="server" ID="tagName" Value='<%#Eval("tagName") %>' />
                        </td>
                        <td style="text-align: center;">
                            <asp:DropDownList runat="server" ID="BuildMethod">
                                <asp:ListItem Value="1">下拉框</asp:ListItem>
                                <asp:ListItem Value="2">单选框</asp:ListItem>
                                <asp:ListItem Value="3">多选框</asp:ListItem>
                                <asp:ListItem Value="4">文本框</asp:ListItem>
                            </asp:DropDownList>
                            <asp:HiddenField runat="server" ID="BuildValue" Value='<%#Eval("buildMethod") %>' />
                        </td>
                        <td align="center">
                            <asp:CheckBox ID="isEnabled" runat="server" Checked='<%#Convert.ToBoolean(Eval("enable"))%>' />
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del" CommandArgument='<%#Eval("tagName") %>' OnClientClick="return confirm('你确定要删除吗!');">删除</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <asp:ObjectDataSource runat="server" ID="CRMOption" SelectMethod="GetAllCrmOption" TypeName="GetDSData"></asp:ObjectDataSource>
        <input type="button" id="addBtn1" value="添加新选项" class="btn btn-primary" onclick="$('#addOptionDiv').toggle();" />
        <asp:Button ID="Button1" runat="server" Text="保存" OnClick="Button1_Click" class="btn btn-primary" />
        <div id="addOptionDiv" style="display: none;">
            <table class="table table-striped table-bordered table-hover">
                <tr class="gridtitle">
                    <td colspan="2" align="center" style="height: 25px;">
                        <asp:Label ID="Tit0" runat="server" Text="添加区域"></asp:Label>
                    </td>
                </tr>
                <tr class="tdbg">
                    <td align="right">选 项 名 称：
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txt_content" runat="server" CssClass="l_input" ValidationGroup="ww" MaxLength="10" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="选项值不能为空！" ControlToValidate="txt_content" ValidationGroup="ww" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="Re1" runat="server" ValidationExpression="^([a-zA-Z\u4e00-\u9fa5\@\.]([a-zA-Z0-9_\u4e00-\u9fa5\@\.]){3,10}$)" ControlToValidate="txt_content" ValidationGroup="ww"
                            Text="不能以数字或特殊字符开头,最少需要四位中文/数字/字母组合，例:投资意向1" Display="Dynamic" />
                    </td>
                </tr>
                <tr class="tdbg">
                    <td align="right">默认显示：
                    </td>
                    <td align="left">
                        <input type="radio" id="ra1" name="ra" value="True" checked="checked" /><label for="ra1">是</label>
                        <input type="radio" id="ra2" name="ra" value="False" /><label for="ra2">否</label>
                    </td>
                </tr>
                <tr class="tdbg">
                    <td align="right">是否启用：
                    </td>
                    <td align="left">
                        <asp:CheckBox ID="txt_enable" runat="server" Checked="true" />
                    </td>
                </tr>
                <tr class="tdbg">
                    <td align="right">生成方式：
                    </td>
                    <td align="left">
                        <asp:RadioButtonList runat="server" ID="BuildMethod" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">下拉列表</asp:ListItem>
                            <asp:ListItem Value="2">单选框</asp:ListItem>
                            <asp:ListItem Value="3">多选框</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Add2" runat="server" Text="添加" class="btn btn-primary" OnClick="Add2_Click" ValidationGroup="ww" />
                        <asp:Button ID="Button3" runat="server" Text="取消" class="btn btn-primary" CausesValidation="false" />
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
         