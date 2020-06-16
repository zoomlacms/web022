<%@ page language="C#" autoeventwireup="true" inherits="manage_User_SubscriptListManage, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>内容订阅列表</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr style="margin-top: 5px;">
                <td valign="top" class="tdbg">
                    <ZL:ExGridView runat="server" ID="EGV" DataKeyNames="Id" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" OnRowDataBound="GridView1_RowDataBound"> 
                        <Columns>
                            <asp:TemplateField HeaderText="选择">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hfId" Value='<%#Eval("id") %>' runat="server" />
                                    <asp:CheckBox ID="pidCheckbox" runat="server" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编号">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="标题">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate><%# Eval("Title") %> </ItemTemplate>
                                <HeaderStyle />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="订阅者">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label ID="lblUser" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="生效时间">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("effectTime") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="到期时间">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("endTime") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="用户类型">
                                <ItemTemplate>
                                    <asp:Label ID="lblUsertype" runat="server" Text='<%# GetRes(Eval("Reserve","{0}")) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="允许退订">
                                <ItemTemplate>
                                    <asp:Label ID="lblRe" runat="server" Text='<%# GetRes(Eval("Reserve","{0}")) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <ItemTemplate>
                                    <asp:LinkButton ID="upd" runat="server" PostBackUrl='<%# Eval("Id","AddSubscriptionCount.aspx?menu=update&id={0}") %>' Text="修改/"></asp:LinkButton>
                                    <asp:LinkButton ID="end" runat="server" CommandName="End" CommandArgument='<%#Eval("Id") %>'>终止订阅/</asp:LinkButton>
                                    <asp:LinkButton ID="Del" runat="server" CommandName="Del" CommandArgument='<%#Eval("Id") %>' OnClientClick="if(confirm('确定删除?')) return true; else return false;">删除</asp:LinkButton>
                                    <asp:LinkButton ID="audit" runat="server" CommandName="Audit" CommandArgument='<%#Eval("Id") %>'>通过审核</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    <PagerStyle HorizontalAlign="Center" />
                    <RowStyle Height="24px" HorizontalAlign="Center"  />
            </ZL:ExGridView>
                </td>
            </tr>
            <tr class="tdbg">
                <td align="left">
                    <asp:CheckBox ID="CheckSelectAll" runat="server" AutoPostBack="True" onclick="selectAll(this)" Text="全选" />
                    &nbsp;
          <asp:Button ID="btn_DeleteRecords" runat="server" OnClientClick="return judgeSelect();" Text="删除选中记录" OnClick="btn_DeleteRecords_Click" class="btn btn-primary" /></td>
            </tr> 
        </table>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript">
        //根据传入的checkbox的选中状态设置所有checkbox的选中状态
        function selectAll(obj) {
            var allInput = document.getElementsByTagName("input");
            //alert(allInput.length);
            var loopTime = allInput.length;
            for (i = 0; i < loopTime; i++) {
                //alert(allInput[i].type);
                if (allInput[i].type == "checkbox") {
                    allInput[i].checked = obj.checked;
                }
            }
        }
        //判断是否选中记录，用户确认删除
        function judgeSelect() {
            var result = false;
            var allInput = document.getElementsByTagName("input");
            var loopTime = allInput.length;
            for (i = 0; i < loopTime; i++) {
                if (allInput[i].checked) {
                    result = true;
                    break;
                }
            }
            if (!result) {
                alert("请先选择要删除的记录！");
                return result;
            }
            result = confirm("你确认要删除选定的记录吗？");
            return result;
        }

    </script>
</asp:Content>
