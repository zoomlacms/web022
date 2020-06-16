<%@ page language="C#" autoeventwireup="true" inherits="manage_Exam_ViewStudio, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>添加组别</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <table  class="table table-striped table-bordered table-hover">
        <tr align="center" class="title">
            <td width="2%">
                <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" />
            </td>
            <td width="10%">
                会员名称
            </td>
            <td width="8%">
                班级名称
            </td>
            <td width="10%">
                课程名称
            </td>
            <td width="8%">
                班级类别
            </td>
            <td width="6%">
                完成课时
            </td>
            <td width="14%">
                是否支付/支付号
            </td>
            <td width="13%">
                进入时间
            </td>
            <td width="13%">
                结束时间
            </td>
            <td width="12%" class="title">
                操作
            </td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr id="<%#Eval("ID") %>" ondblclick="ShowTabs(this.id)">
                    <td height="22" align="center">
                        <input name="Item" type="checkbox" value='<%#Eval("ID") %>' />
                    </td>
                    <td height="22" align="center">
                        <%#Eval("UserName")%>
                    </td>
                    <td height="22" align="center">
                        <%#GetRoomName(Eval("ClassID","{0}"))%>
                    </td>
                    <td height="22" align="center">
                        <%#GetCourseName(Eval("CourseID", "{0}"))%>
                    </td>
                    <td align="center">
                        <%#GetClassName(Eval("ClassID", "{0}"))%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("CurrCoureHour")%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("PayMent", "{0}") == "1" ? "<font color=green>已支付</font>" : "<font color=red>未支付"%><%#Eval("OrderID", "{0}") == "" ? "</font>" : "/</font>" + Eval("OrderID", "{0}")%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("Setuptime")%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("Endtime")%>
                    </td>
                    <td height="22" align="center">
                        <a href="EditCourese.aspx?menu=edit&id=<%#Eval("ID")%>">
                            修改</a> <a href="?menu=delete&cid=<%#Eval("ID")%>" onclick="return confirm('确实要删除此学员吗？');">
                                删除</a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg">
            <td height="22" colspan="10" align="center" class="tdbg">
                共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />页次：
                <asp:Label ID="Nowpage" runat="server" Text="" />/
                <asp:Label ID="PageSize" runat="server" Text="" />页
                <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                条数据/页 转到第
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                    ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
            </td>
        </tr>
    </table>
    <div>
        <asp:Button ID="Button3" class="btn btn-primary" Style="width: 110px;" runat="server" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"
            Text="批量删除" OnClick="Button3_Click" /></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
</script>
</asp:Content>
   
