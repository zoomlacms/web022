<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Papers_User_Manage, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>用户试卷管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <div>
        <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered table-hover"
            RowStyle-VerticalAlign="Middle" AllowPaging="true" AllowSorting="true" OnPageIndexChanging="EGV_PageIndexChanging"
            OnRowDataBound="gvPapers_RowDataBound" OnRowCommand="gvPapers_RowCommand" EmptyDataText="没有试卷信息" >
            <Columns>
                <asp:TemplateField HeaderText="选择" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("id") %>' />
                        <asp:CheckBox ID="chkSel" runat="server" /><%# Eval("id"," {0}") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="试卷名称">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlName" runat="server"><%#Eval("p_name") %></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="试卷分类" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfClassId" runat="server" />
                        <asp:Label ID="lblClassId" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:BoundField DataField="P_User" HeaderText="所属用户" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlQuestions" runat="server">浏览试题</asp:HyperLink>
                        <asp:LinkButton ID="lbAdd" CommandName="btAdd" CommandArgument='<%#Eval("id") %>'
                            runat="server">添加为系统试卷</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
   
                            <asp:Button ID="BtnAdd" runat="server" class="btn btn-primary" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定添加？')}"
                            Text="批量添加" OnClick="BtnAdd_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
     <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>

