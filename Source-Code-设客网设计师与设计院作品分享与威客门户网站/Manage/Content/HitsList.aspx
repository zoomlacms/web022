<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_HitsList, App_Web_ik5hwt2g" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>访问评价</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div style="margin-left: 30px; float: left; margin-bottom: 10px;">
        <span class="pull-left" style="line-height: 32px;"><%=lang.LF("信息标题")%>： </span>
        <asp:TextBox ID="txtTitle" ToolTip="支持模糊查询" runat="server" Width="100px" CssClass="form-control pull-left"></asp:TextBox>
        <span class="pull-left" style="line-height: 32px; margin-left: 5px;"><%=lang.LF("月份")%>：</span>
        <asp:TextBox ID="txtTime" runat="server" Width="100px" CssClass=" form-control pull-left" onclick="WdatePicker({ dateFmt: 'yyyy-MM' });"></asp:TextBox>
        <asp:Button ID="btnSeach" runat="server" class="btn btn-primary" Text="查询" Style="margin-left: 5px;" OnClick="btnSeach_Click" />
    </div>
    <div style="margin-right: 150px; float: right;"><%=lang.LF("IP数统计")%>：<asp:Label ID="txtIpCount" runat="server"></asp:Label></div>

    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无评价信息！！">
        <Columns>
            <asp:TemplateField>
                <HeaderStyle Width="5%" />
                <ItemTemplate>
                    <input type="checkbox" name="idchk" title="" value='<%#Eval("ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="ID" HeaderStyle-Width="5%" />
            <asp:TemplateField HeaderText="时间">
                <HeaderStyle Width="15%" />
                <ItemTemplate>
                    <%#  Convert.ToDateTime(Eval("UpdateTime")).ToString("yyyy-MM-dd HH:mm:ss")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="访问者" DataField="UserName" HeaderStyle-Width="10%" />
            <asp:TemplateField HeaderText="信息标题">
                <HeaderStyle Width="20%" />
                <ItemTemplate>
                    <a href="?title=<%#Eval("Title") %>"><%# getSubstring(25, Eval("Title"))%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="来源IP" DataField="Ip" HeaderStyle-Width="15%" />
            <asp:TemplateField HeaderText="是否评价">
                <HeaderStyle Width="8%" />
                <ItemTemplate>
                    <%# GetStatus(Eval("status"))%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="btnAudit" CausesValidation="false" runat="server" Text="评价奖励" CssClass="btn btn-primary" OnClick="btnShow_Click" OnClientClick="if(!IsSelectedId()){alert('请选择一项项以上');return false;}else{return confirm('你确定要奖励选中项吗？')}" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $().ready(function () {
            $("#Egv tr:last").children().first().attr("colspan", "8").before("<td><input type=checkbox id='chkAll'/></td>");
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "idchk");
            });
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=idchk]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
        HideColumn("2,5");
    </script>
</asp:Content>
