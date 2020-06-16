<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="LogTypeMange, App_Web_p4tij1sm" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="../WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的日志</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <uc1:WebUserControlTop ID="WebUserControlTop1" runat="server"></uc1:WebUserControlTop>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="left">
                <asp:Label ID="labErr" runat="server" Font-Size="20pt" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" style="height: 44px">
                <img src="../Images/LogType.gif" />日志类别管理
            </td>
        </tr>
        <tr>
            <td>
                <hr />
                 <a href="SelfLogManage.aspx">返回日志首页</a>
            </td>
        </tr>
        <tr>
            <td>
                <table class="table table-bordered">
                    <tr>
                        <td>
                            日志类别名称：
                            <asp:TextBox ID="txtTypeName" CssClass="form-control" runat="server" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请填写类别名称" ControlToValidate="txtTypeName" Display="Dynamic" Font-Size="10pt"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 26px">
                            <table>
                                <tr>
                                    <td>访问权限：</td>
                                    <td>
                                        <asp:DropDownList ID="dropReadAre" CssClass="form-control" runat="server" onChange="dropChang()">
                                            <asp:ListItem Selected="True" Value="1">好友</asp:ListItem>
                                            <asp:ListItem Value="0">所有人</asp:ListItem>
                                            <asp:ListItem Value="2">凭密码</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td>
                                        <div id="span1" style="display: none">
                                            设置密码：<asp:TextBox ID="txtPWD" CssClass="form-control" runat="server" TextMode="Password" MaxLength="10"></asp:TextBox>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnAddType" CssClass="btn btn-primary" runat="server" Text="增加分类" OnClick="btnAddType_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 2px">
                <ZL:ExGridView ID="GridView1" Width="100%" DataKeyNames="ID" runat="server" PageSize="20" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="名称">
                    <HeaderStyle Width="35%" />
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LogTypeName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("LogTypeName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="访问权限">
                    <HeaderStyle Width="35%" />
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" OnDataBound="DropDownList1_DataBound" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList></td>
                                <td>
                                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                                        设置密码：
                      <asp:TextBox ID="txtPWD" Width="50px" TextMode="password" runat="server" MaxLength="10"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <ItemTemplate><%#GetType(DataBinder.Eval(Container.DataItem, "LogArea").ToString())%> </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:CommandField EditText="[修改]" ShowEditButton="True" CausesValidation="false">
                    <HeaderStyle Width="15%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
                <asp:CommandField DeleteText="[删除]" ShowDeleteButton="True" CausesValidation="false">
                    <HeaderStyle Width="7%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
            </Columns>
        </ZL:ExGridView>
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function dropChang() {
            var obj = window.document.getElementById("<%=dropReadAre.ClientID %>");
            var span = window.document.getElementById("span1");
            if (obj.value == "2") {
                span.style.display = "";
            }
            else {
                span.style.display = "none";
            }
        }

        function spanDisy() {
            var span = window.document.getElementById("span1");
            span.style.display = "";
        }

        function LogType(id) {
            window.open('UpdateLogType.aspx?logTypeID=' + id, '', 'width=400,height=150,resizable=0,scrollbars=yes');
        }
    </script>
    <script type="text/javascript" src="../../Command/common.js"></script>
    <script type="text/javascript" src="../../Command/subModal.js"></script>
    <script>
        function ShowInfo(mess) {
            var obj = window.document.getElementById("<%=labErr.ClientID %>");
        obj.innerHTML = mess;
        window.setTimeout("clear()", 1000);

    }

    function clear() {
        var obj = window.document.getElementById("<%=labErr.ClientID %>");
        obj.innerHTML = "";
    }
    </script>
</asp:Content>
