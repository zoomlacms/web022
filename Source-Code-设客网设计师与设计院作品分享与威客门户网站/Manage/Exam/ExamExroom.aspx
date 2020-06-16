<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_ExamManage, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>添加组别</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
      <table class="table table-striped table-bordered table-hover">
        <tr align="center" class="title">
            <td width="2%">
                <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" />
            </td>
            <td width="10%">
                ID
            </td>
            <td width="10%">
                考场名称
            </td>
            <td width="10%">
                考试开始时间
            </td>
            <td width="10%">
                考试结束时间
            </td>
            <td width="10%">
                试卷模板
            </td>
            <td width="10%">
                添加时间
            </td>
            <td width="10%">
                考生人数
            </td>
            <td width="6%" class="title">
                操作
            </td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr id="<%#Eval("ExrID") %>" ondblclick="ShowTabs(this.id)">
                    <td height="22" align="center">
                        <input name="Item" type="checkbox" value='<%#Eval("ExrID") %>' />
                    </td>
                    <td height="22" align="center">
                        <%#Eval("ExrID")%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("RoomName")%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("Starttime")%>
                    </td>
                     <td height="22" align="center">
                        <%#Eval("Endtime")%>
                    </td>
                     <td height="22" align="center">
                        <%#GetExaName(Eval("ExaID","{0}"))%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("AddTime")%>
                    </td>
                    <td height="22" align="center">
                        <%#GetStuidoNum(Eval("Stuidlist","{0}"))%>
                    </td>
                    <td height="22" align="center">
                        <a href="AddExamExroom.aspx?cid=<%#Eval("ExrID")%>">修改</a> <a href="?menu=delete&cid=<%#Eval("ExrID")%>" OnClick="return confirm('确实要删除此学员吗？');">删除</a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg">
            <td height="22" colspan="9" align="center" class="tdbg">
                共 <asp:Label ID="Allnum" runat="server" Text=""></asp:Label> 条信息  <asp:Label ID="Toppage" runat="server" Text="" /> <asp:Label ID="Nextpage" runat="server" Text="" /> <asp:Label ID="Downpage" runat="server" Text="" /> <asp:Label ID="Endpage" runat="server" Text="" />  页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页  
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>条信息/页  转到第<asp:DropDownList 
                        ID="DropDownList1" runat="server" AutoPostBack="True">
              </asp:DropDownList>页
            </td>
        </tr>
    </table>
    <div>
        <asp:Button ID="Button3" class="btn btn-primary" runat="server" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"
            Text="批量删除" onclick="Button3_Click" /></div>
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