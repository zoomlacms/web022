<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Papers_System_Manage, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>系统试卷管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ZL:ExGridView ID="EGV" runat="server" AllowPaging="true" AutoGenerateColumns="False"  AllowSorting="true" 
         CssClass="table table-striped table-bordered table-hover" EnableTheming="False"
            DataKeyNames="id" OnPageIndexChanging="EGV_PageIndexChanging">
            <RowStyle CssClass="tdbg" Height="26px"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText="选择" ItemStyle-VerticalAlign="Middle" ItemStyle-CssClass="td_m">
                    <ItemTemplate>
                        <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="试卷标题" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#Eval("p_name") %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="试卷分类" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                       <%#Eval("TypeName") %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="出题方式" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                          <%#GetModus(Eval("p_type", "{0}"))%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="阅卷方式" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                       <%#GetRType(Eval("p_rtype", "{0}"))%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <a href="Paper_QuestionManage.aspx?pid=<%#Eval("id") %>">题目管理</a>&nbsp;|&nbsp;
                        <%--<a href="Paper_Subject_Manage.aspx?pid=<%#Eval("id") %>">浏览试题</a>&nbsp;|&nbsp;--%>
                        <a href="Add_Papers_System.aspx?menu=Edit&paper_id=<%#Eval("id") %>">修改试卷</a>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
    <div class="clearbox">
        </div>
     <asp:Button ID="BtnDelete" runat="server" class="btn btn-primary" OnClientClick="return confirm('确定删除?')" Text="批量删除" OnClick="BtnDelete_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>