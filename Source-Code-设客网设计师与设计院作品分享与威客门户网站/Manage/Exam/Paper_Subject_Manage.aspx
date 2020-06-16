<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Paper_Subject_Manage, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>试卷试题管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:Literal ID="liQuestion" runat="server" Visible="false"></asp:Literal>
    <table class="table table-striped table-bordered table-hover">
         <tr class="tdbg">
         <td><span><asp:Label ID="lblPaper" runat="server"></asp:Label>
                题型：<asp:DropDownList ID="ddType" runat="server" 
                    onselectedindexchanged="ddType_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></span>
            <asp:LinkButton ID="lbAdd" runat="server" onclick="lbAdd_Click">添加试题</asp:LinkButton>&nbsp;
            <a href="Paper_QuestionManage.aspx?pid=<%=Request.QueryString["pid"] %>">大题管理</a>&nbsp;<asp:LinkButton ID="lbUpd" runat="server">更新排序</asp:LinkButton>
            &nbsp;&nbsp;</td>
        </tr>
    </table>
    <table class="table table-striped table-bordered table-hover">
     <tr align="center" class="title">
        <td width="5%">选择</td>
        <td width="20%">试题标题</td>
        <td width="20%">创建日期</td>
        <td width="10%">难易程度</td>
        <td width="10%">缺省分数</td>
        <td width="10%">排序</td>
        <td width="20%" class="title">操作</td>
    </tr>
     <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <tr>
                <td height="22" align="center">
                    <input name="Item" type="checkbox" value='<%#Eval("p_id") %>' />
                </td>
                <td height="22" align="center">
                    <%#Eval("p_title")%>
                </td>
                <td height="22" align="center">
                    <%#Eval("p_CreateTime")%>
                </td>
                <td height="22" align="center">
                    <%#GetDiff(Eval("p_Difficulty", "{0}"))%>
                </td>
                <td height="22" align="center">
                    <%#Eval("p_defaultScores")%>
                </td>
                <td height="22" align="center">
                 <asp:TextBox ID="txtOrder" runat="server" Text='<%#Eval("p_Order")%>' class="l_input" Width="50px"> </asp:TextBox>
                </td>
                <td height="22" align="center">
                    <a href="AddPaperQuestion.aspx?id=<%#Eval("p_id")%>&pid=<%=Request.QueryString["pid"] %>">修改</a> <a href="?menu=delete&id=<%#Eval("p_id")%>&pid=<%=Request.QueryString["pid"] %>" OnClick="return confirm('确实要删除此题吗？');">删除</a>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    </table>
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td>
                <div class="tdbg">
                    <span>
                        <asp:CheckBox ID="CheckSelectAll" runat="server" AutoPostBack="True" Text="全选" OnCheckedChanged="CheckSelectAll_CheckedChanged" />
                        <asp:Button ID="BtnDelete" runat="server" class="btn btn-primary" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定删除？')}"
                            Text="批量删除选定内容" Width="134px" OnClick="BtnDelete_Click" />
                    </span><span style="text-align: center">共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />
                        页次：
                        <asp:Label ID="Nowpage" runat="server" Text="" />/
                        <asp:Label ID="PageSize" runat="server" Text="" />页
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged" Text="10"></asp:TextBox>
                        条数据/页 转到第
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                            ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                    </span>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>