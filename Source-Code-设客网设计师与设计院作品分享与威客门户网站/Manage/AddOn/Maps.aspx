<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="manage_AddOn_Maps, App_Web_tfdav4no" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>地图管理</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false"
            class="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!"
            OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="选中">
                    <HeaderStyle Width="5%" />
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectCheckBox" runat="server" />
                    </ItemTemplate>
                    <ItemStyle />
                </asp:TemplateField>
                <asp:BoundField DataField="mid" HeaderText="ID">
                    <HeaderStyle Width="5%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="地图名称">
                    <HeaderStyle Width="15%" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem,"type")%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="纬度">
                    <HeaderStyle Width="18%" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem,"lx")%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="经度">
                    <HeaderStyle Width="18%" />
                    <HeaderStyle />
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem, "ly")%>
                    </ItemTemplate>
                    <ItemStyle />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="创建时间">
                    <HeaderStyle Width="20%" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "CreateTime")%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <HeaderStyle Width="12%" />
                    <ItemTemplate>
                        <a onclick="aa(<%# Eval("mid")%>)" title="修改">修改</a>
                        <a href="javascript:if(confirm('你确定要删除吗?')) window.location.href='Maps.aspx?AUId=<%# Eval("mid")%>';" title="删除">删除</a>
                        <asp:LinkButton ID="LinkButton8" runat="server" CommandName="ifframe" CommandArgument='<%# Eval("mid") %>' ToolTip="获取地图代码">获取地图代码</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle />
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="sleall">
        <tr>
            <td style="height: 21px">
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="全选" />
                &nbsp;
            <asp:Button ID="btndelete" CssClass="btn btn-primary" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" Text="删除选定地图" OnClick="btndelete_Click" />
            </td>
        </tr>
        <tr>
            <td style="height: 21px"></td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript">
        function aa(id) {
            window.open('AddMap.aspx?Mid=' + id, 'newWin', 'modal=yes,width=900,height=600,resizable=yes,scrollbars=yes');
            //window.parent.frames['main_right'].location.reload();
        }
        function myrefresh() {
            window.location.reload();
        }
        //setTimeout('myrefresh()', 10000);
    </script>
</asp:Content>
