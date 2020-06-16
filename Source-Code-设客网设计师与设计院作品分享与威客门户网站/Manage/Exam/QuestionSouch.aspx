<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_QuestionSouch, App_Web_bsieufqv" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>系统试题管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td style="height: 24px">
                试题分类：<asp:DropDownList ID="Class" runat="server">
                </asp:DropDownList>
                难度：<asp:DropDownList ID="Difficulty" runat="server">
                </asp:DropDownList>题型：<asp:DropDownList ID="Type" runat="server">
                </asp:DropDownList> 标题：<asp:TextBox ID="Keyword" runat="server" CssClass="l_input"></asp:TextBox>(支持模糊查询) <asp:Button
                    ID="Button3" runat="server" Text="搜索" CssClass="btn btn-primary" />
            </td>
        </tr>
    </table>
    <div class="clearbox">
    </div>
    <div class="divbox" id="nocontent" runat="server" style="display: none">
        暂无试题信息</div>
    
    <div>
        <ZL:EXGridView ID="EGV" runat="server" AutoGenerateColumns="False" AllowSorting="true"  AllowPaging="true"
           ForeColor="Black" CssClass="table table-striped table-bordered table-hover" EnableTheming="False"  OnPageIndexChanging="EGV_PageIndexChanging"
           OnRowDataBound="gvCard_RowDataBound" OnRowCommand="gvCard_RowCommand">
            <RowStyle CssClass="tdbg" Height="26px"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText="选择" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("p_id") %>' />
                        <asp:CheckBox ID="chkSel" runat="server" /><%# Eval("p_id"," {0}") %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="试题标题">
                    <ItemTemplate>
                        <asp:HyperLink ID="lbTitle" runat="server"><%# Eval("p_title")%></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_Inputer" HeaderText="作者" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle" />
                <asp:TemplateField HeaderText="难度" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Label ID="lblDiff" runat="server" Text="Label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类别" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Label ID="lblClass" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_Views" HeaderText="使用次数" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle" />
                <asp:TemplateField HeaderText="题型" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Label ID="lblType" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="知识点" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Label ID="lblKnow" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:TemplateField HeaderText="试题内容">
                    <ItemTemplate>
                        <asp:Label ID="lblContent" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:BoundField DataField="p_CreateTime" HeaderText="创建时间" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />
                <asp:TemplateField HeaderText="相关操作" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Upd" CommandArgument='<%#Eval("p_id") %>'>修改</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del" CommandArgument='<%#Eval("p_id") %>' OnClientClick="return confirm('你确定将该数据删除吗？');">删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:EXGridView>
    </div>
    <div>
                        <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="批量导出" />
                         <asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="批量导入" />
                        <asp:Button ID="BtnDelete" runat="server" class="btn btn-primary" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定删除？')}"
                            Text="批量删除选定内容" Width="134px" OnClick="BtnDelete_Click" />
   </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
      <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>
   
