<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_DSManage, App_Web_mq0353cm" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>数据源管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <div id="addDSDiv" runat="server" visible="false">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td colspan="2" class="text-center">添加新数据库源</td>
                </tr>
                <tr>
                    <td style="width: 5%; text-align: right;">名称： </td>
                    <td style="width: 15%; height: 22px; text-align: left;">
                        <asp:TextBox ID="DSName" runat="server" CssClass="form-control text_md pull-left" />
                        <span class="tips" style="color: red">*</span>
                        <asp:RequiredFieldValidator runat="server" ID="RFV1" ControlToValidate="DSName" CssClass="tips" ErrorMessage="数据源名称不能为空!" SetFocusOnError="True" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">类型： </td>
                    <td style="height: 22px; text-align: left;">
                        <asp:DropDownList ID="DataSourceList" CssClass=" form-control text_md pull-left" runat="server" Style="max-width: 200px;" OnSelectedIndexChanged="DataSourceList_SIChanged" AutoPostBack="true">
                            <asp:ListItem Enabled="false" Selected="True">默认</asp:ListItem>
                            <asp:ListItem Value="1">外部SQL数据库</asp:ListItem>
                            <asp:ListItem Value="2">外部MYSQL数据库</asp:ListItem>
                            <asp:ListItem Value="3">外部Oracle数据库</asp:ListItem>
                            <asp:ListItem Value="4">Access数据库</asp:ListItem>
                            <asp:ListItem Value="5">XML</asp:ListItem>
                            <asp:ListItem Value="6">Excel</asp:ListItem>
                        </asp:DropDownList><span class="tips" style="color: red; margin-left: 5px;">*</span></td>
                    <asp:HiddenField runat="server" ID="LastIndex_Hid" Value="1" />
                </tr>
                <tr>
                    <td style="text-align: right;">描述： </td>
                    <td style="height: 22px; text-align: left;">
                        <asp:TextBox ID="dsRemind" CssClass="form-control text_md" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">数据源连接字符串： </td>
                    <td style="height: 22px; text-align: left;">
                        <asp:TextBox ID="DBConnectText" CssClass="form-control text_md pull-left" runat="server" Text="Data Source=(local);Initial Catalog=test;User ID=test;Password=test" />
                        <span class="tips" style="color: red">*</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DBConnectText" ErrorMessage="连接字符串不能为空!" CssClass="tips" SetFocusOnError="True" Display="Dynamic" />
                        <label runat="server" id="remind"></label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">操作： </td>
                    <td style="height: 22px; text-align: left;">
                        <asp:Button ID="TestConBtn" runat="server" UseSubmitBehavior="false" Text="测试连接" CssClass="btn btn-primary" OnClick="TestConBtn_Click" />
                        <asp:Button ID="AddDS" runat="server" Text="保存连接" CssClass="btn btn-primary" OnClick="AddDS_Click" UseSubmitBehavior="false" Style="margin-left: 10px;" />
                        <span class="tips">注：~/为根目录通配符</span>
                    </td>
                </tr>
            </table>
        </div>
        <div id="sgv1Div" runat="server" visible="true">
            <ZL:ExGridView ID="sgv1" runat="server" DataSourceID="DSData" AllowPaging="True" AutoGenerateColumns="false" IsHoldState="false"
                RowStyle-CssClass="tdbg" CellPadding="2" CellSpacing="1" ForeColor="Black" CssClass="table table-striped table-bordered table-hover" Width="100%"
                GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！" SerialText="" EnableModelValidation="True"
                OnRowCommand="sgv1_RowCommand" OnRowDataBound="sgv1_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <input type="checkbox" name="idChk" style="float: left;" value="<%# Eval("ID") %>" />
                            <%# Eval("ID") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DSName" ControlStyle-CssClass="form-control text_md" HeaderText="名称" />
                    <asp:TemplateField HeaderText="类型">
                        <ItemTemplate>
                            <%#getType(Convert.ToInt32(Eval("Type") as string))%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList CssClass="form-control text_md" Style="max-width: 200px;" runat="server" ID="editList">
                                <asp:ListItem Value="1">外部SQL数据库</asp:ListItem>
                                <asp:ListItem Value="2">外部MYSQL数据库</asp:ListItem>
                                <asp:ListItem Value="3">外部Oracle数据库</asp:ListItem>
                                <asp:ListItem Value="4">Access数据库</asp:ListItem>
                                <asp:ListItem Value="5">XML</asp:ListItem>
                                <asp:ListItem Value="6">Excel</asp:ListItem>
                            </asp:DropDownList>
                            <input type="hidden" runat="server" id="typeValue" value='<%#Eval("Type") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="连接字符串">
                        <ItemTemplate>
                            <%# Eval("ConnectionString") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="editConnStr" CssClass=" form-control text_md" runat="server" Text='<%# Eval("ConnectionString") %>' Width="90%" Style="text-align: center;" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="创建时间">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "CreateTime", "{0:yyyy年M月d日}")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CreateMan" HeaderText="创建者" ReadOnly="true" />
                    <asp:TemplateField HeaderText="描述" ItemStyle-Width="20%">
                        <ItemTemplate>
                            <%# Eval("Remind") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" CssClass="form-control text_md" ID="editRemind" Text='<%#Eval("Remind")%>' Style="text-align: left;" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="Edit" runat="server" CommandName="Edit2" CommandArgument='<%# Container.DisplayIndex %>'>修改|</asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="Del" CommandArgument='<%# Eval("ID") %>'
                                OnClientClick="return confirm('你确定要删除该数据源吗!');">删除</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="Save" runat="server" CommandName="Save" CommandArgument='<%# Container.DisplayIndex+":"+Eval("ID") %>'>更新|</asp:LinkButton>
                            <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" CommandArgument='<%# Container.DisplayIndex %>'>取消</asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
                <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
            <input type="checkbox" id="allChk" onclick="selectAll(this, 'idChk')" /><label for="allChk">全选</label>
            <input type="button" id="BatDel" value="批量删除" class="btn btn-primary" />
        </div>
        <asp:ObjectDataSource ID="DSData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="getAllData" TypeName="GetDSData"></asp:ObjectDataSource>
    </div>
    <style>
        th {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        function selectAll(obj, name) {
            allInput = document.getElementsByName(name);
            loopTime = allInput.length;
            for (i = 0; i < loopTime; i++) {
                allInput[i].checked = obj.checked;
            }
        }
        function getCheckValue(name) {
            allInput = document.getElementsByName(name);
            loopTime = allInput.length;
            dataArrary = "";
            for (i = 0; i < loopTime; i++) {
                if (allInput[i].checked) {
                    dataArrary += allInput[i].value + ",";
                }
            }
            return dataArrary.substring(0, dataArrary.length - 1);
        }

        function postToCS(name) {
            dataArrary = getCheckValue(name);
            $.ajax({
                url: "DSManage.aspx",
                type: "Post",
                data: {
                    action: "del", data: dataArrary
                },
                success: function (data) { if (data == "1") { alert("删除成功"); location = location; } },
                error: function (data) { alert(data) }
            });
        }

        function checkedNum(name) {
            allInput = document.getElementsByName(name);
            loopTime = allInput.length;
            for (i = 0; i < loopTime; i++) {
                if (allInput[i].type == "checkbox" && allInput[i].checked == true) {
                    return true;
                }
            }
            alert("没有选择框被选择!");
            return false;
        }

        $(document).ready(function () {
            $("#BatDel").bind("click", { ckid: 'idChk' },
                function (ev) {
                    if (checkedNum(ev.data.ckid)) { if (confirm("你确定要删除选定数据吗?")) { postToCS(ev.data.ckid); } }
                });

        });
    </script>
</asp:Content>
