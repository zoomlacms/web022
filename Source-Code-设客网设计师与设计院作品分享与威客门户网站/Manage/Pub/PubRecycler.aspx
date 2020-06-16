<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Pub_PubRecycler, App_Web_5ka2xlr0" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>存档管理</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="PubID" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无相关信息！">
        <Columns>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <input type="checkbox" name="idChk" value="<%#Eval("PubID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="PubID" HeaderStyle-Width="5%" />
            <asp:BoundField HeaderText="模块名称" DataField="Pubname" HeaderStyle-Width="20%" />
            <asp:TemplateField HeaderText="模块类型">
                <ItemStyle Width="10%" />
                <ItemTemplate>
                    <%#PubtypeName(Eval("Pubtype", "{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="信息类别">
                <ItemStyle Width="10%" />
                <ItemTemplate>
                    <%#GetClassName(Eval("PubClass", "{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="模型表名" DataField="PubTableName" HeaderStyle-Width="10%" />
            <asp:TemplateField HeaderText="调用标签">
                <ItemStyle Width="20%" />
                <ItemTemplate>
                    {Pub.Load_<%#Eval("PubLoadstr")%>/}
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemStyle Width="25%" />
                <ItemTemplate>
                    <a href="pubinfo.aspx?menu=revert&id=<%#Eval("Pubid")%>">还原</a>
                    <a href="Pubsinfo.aspx?Pubid=<%#Eval("Pubid") %>&type=0">管理信息</a>
                    <a href="pubinfo.aspx?menu=edit&id=<%#Eval("Pubid")%>">修改</a>
                    <a href="pubinfo.aspx?menu=Truedelete&id=<%#Eval("Pubid")%>" onclick="return confirm('确实要彻底删除吗？');">彻底删除</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button runat="server" ID="Clear_Btn" Text="批量删除" OnClick="Clear_Btn_Click" CssClass="btn btn-primary" OnClientClick="return confirm('确定删除选中项?'); "/>
    <asp:Button runat="server" ID="Recyle_Btn" Text="批量还原" OnClick="Recyle_Btn_Click" CssClass="btn btn-primary"  />
    <asp:Button runat="server" ID="DelAll_Btn" Text="清空文档" OnClick="DelAll_Btn_Click" CssClass="btn btn-primary" OnClientClick="return confirm('确定清空文档?'); "/>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript">
        function getinfo(id) {
            location.href = "pubinfo.aspx?menu=edit&id=" + id + "";
        }
        $().ready(function () {
            $("#Egv th:eq(0)").html("<input type='checkbox' id='chkAll' onclick='selectAllByName(this,\"idChk\");'>");
        });
       
    </script>
</asp:Content>
