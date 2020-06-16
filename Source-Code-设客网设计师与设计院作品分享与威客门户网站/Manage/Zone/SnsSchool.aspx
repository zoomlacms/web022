<%@ page language="C#" autoeventwireup="true" inherits="manage_Zone_SnsSchool, App_Web_ikj1rj5m" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>学校信息配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Egv_RowCommand" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无相关信息！！">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input name="idchk" type="checkbox" value='<%#Eval("ID")  %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField HeaderText="学校名称">
                <ItemTemplate>
                    <a href="SchoolShow.aspx?id=<%#Eval("ID") %>"><%#Eval("SchoolName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="学校微标">
                <ItemTemplate>
                    <%#GetIcon(Eval("Country").ToString()) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="省份" DataField="Province" />
            <asp:TemplateField HeaderText="类型">
                <ItemTemplate>
                    <%#GetSchoolType(Eval("SchoolType", "{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="性质">
                <ItemTemplate>
                    <%#GetVisage(Eval("Visage","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="添加时间">
                <ItemTemplate>
                    <%#Eval("Addtime","{0:yyyy-MM-dd}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="相关操作">
                <ItemTemplate>
                    <a href="SchoolShow.aspx?id=<%#Eval("ID") %>" title="浏览"><span class="fa fa-eye"></span></a>
                    <a href="AddSchool.aspx?id=<%#Eval("ID") %>" title="修改"><span class="glyphicon glyphicon-pencil"></span></a>
                    <asp:LinkButton ID="LinkButton1" CommandName="del1" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('是否删除!')" ToolTip="删除" runat="server"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                    <a href="AddClassRoom.aspx?sid=<%#Eval("ID") %>">添加班级</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="DelBtn" CssClass="btn btn-primary" runat="server" Text="批量删除" OnClick="DelBtn_Click" OnClientClick="return confirm('你确认要删除选定的记录吗？')}" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $("#Egv tr").dblclick(function () {
                window.location.href = "AddSchool.aspx?id="+$(this).find("input[name=idchk]").val();
            });
            $("#Egv tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "chkSel");
            });
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=chkSel]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
    </script>
</asp:Content>
