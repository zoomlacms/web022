<%@ page language="C#" autoeventwireup="true" inherits="Manage_APP_JsonPManage, App_Web_krmjq4vt" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>JsonP调用管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" IsHoldState="false" PageSize="10" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="调用名称" DataField="Alias" />
            <asp:BoundField HeaderText="主表" DataField="T1" />
            <asp:BoundField HeaderText="次表" DataField="T2" />
            <asp:TemplateField HeaderText="开放参数">
                <ItemTemplate>
                    <%#GetParamStr() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="备注" DataField="Remark" />
            <asp:TemplateField HeaderText="启用">
                <ItemTemplate>
                    <%#Eval("MyState","").Equals("1")?"<i class='fa fa-check rd_green'></i>":" <i class='fa fa-close rd_red'></i>" %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="AddJsonP.aspx?ID=<%#Eval("ID") %>" title="修改">修改</a>
                    <a target="_blank" href="<%#GetJsLink() %>">生成实例</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="Dels_Btn" runat="server" CssClass="btn btn-primary" OnClientClick="return confirm('是否确定删除所选项?')" Text="批量删除" OnClick="Dels_Btn_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
