<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Plat_PlatInfoManage, App_Web_3jlet1o3" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
    <title>信息管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="EGV" AllowPaging="true" CssClass="table table-bordered table-striped table-hover" OnPageIndexChanging="EGV_PageIndexChanging" 
        PageSize="10" runat="server" AutoGenerateColumns="false" EmptyDataText="无相关数据">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input name="idchk" type="checkbox" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <%#Eval("ID") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="信息内容">
                <ItemStyle Width="40%" />
                <ItemTemplate>
                    <%#getText() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用户">
                <ItemTemplate>
                    <a href="../User/UserInfo.aspx?id=<%#Eval("CreateUser") %>"><%#Eval("CreateUName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                    <%#GetStatus() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="创建时间">
                <ItemStyle Width="10%" />
                <ItemTemplate>
                    <%#Eval("CreateTime") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <a href="PlatInfoDeail.aspx?ID=<%#Eval("ID") %>">详情</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="Dels" runat="server" OnClientClick="return confirm('确定要删除选中的内容吗？')" CssClass="btn btn-primary" Text="批量删除" OnClick="Dels_Click" />
    <asp:Button ID="Rels" Visible="false" runat="server" OnClientClick="return confirm('确定要删除选中的内容吗？')" CssClass="btn btn-primary" Text="批量还原" OnClick="Rels_Click" />
</asp:Content> 
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
   <script type="text/javascript">
       $(function () {
           $("#EGV tr:gt(0):not(:last)").dblclick(function () {
               location = "PlatInfoDeail.aspx?ID=" + $(this).find("input[name=idchk]").val();
           });
       });
   </script>
</asp:Content>
