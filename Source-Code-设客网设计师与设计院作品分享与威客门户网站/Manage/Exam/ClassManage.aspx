<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_ClassManage, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>添加组别</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <table class="table table-striped table-bordered table-hover" id="EGV">
        <tr align="center" class="title">
            <td width="2%">
                
            </td>
            <td width="10%">班级名称</td>
            <td width="8%">负责人</td>
            <td width="10%">课程名称</td>
            <td width="8%">班级类别</td>
            <td width="6%">售价</td>
            <td width="6%">优惠价</td>
            <td width="8%">是否赠送</td>
            <td width="13%">建立时间</td>
            <td width="13%">结束时间</td>
            <td width="12%" class="title">操作</td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr id="<%#Eval("GroupID") %>" ondblclick="ShowTabs(this.id)">
                    <td height="22" align="center">
                        <input name="Item" type="checkbox" value='<%#Eval("GroupID") %>' />
                    </td>
                    <td height="22" align="center">
                        <%#Eval("Regulationame")%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("Regulation")%>
                    </td>
                       <td height="22" align="center">
                        <%#GetCourseName(Eval("CourseID","{0}"))%>
                    </td>                    
                       <td align="center">
                        <%#GetClassName(Eval("ClassID","{0}"))%>
                       </td>
                      <td height="22" align="center">
                       <%#DataBinder.Eval(Container, "DataItem.ShiPrice", "{0:N2}")%>
                    </td>
                      <td height="22" align="center">
                      <%#DataBinder.Eval(Container, "DataItem.LinPrice", "{0:N2}")%>
                    </td>
                      <td height="22" align="center">
                        <%#GetPresented(Eval("Presented","{0}"))%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("Setuptime")%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("Endtime")%>
                    </td>
                    <td height="22" align="center">
                        <a href="ViewStudio.aspx?cid=<%#Eval("GroupID")%>">学员</a> 
                        <a href="AddClass.aspx?cid=<%#Eval("GroupID")%>">修改</a> 
                        <a href="?menu=delete&cid=<%#Eval("GroupID")%>" OnClick="return confirm('确实要删除此学员吗？');">删除</a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg">
            <td style="text-align:center"><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
            <td height="22" colspan="10" align="center" class="tdbg">
               共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />页次：
                        <asp:Label ID="Nowpage" runat="server" Text="" />/
                        <asp:Label ID="PageSize" runat="server" Text="" />页
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="16px"
                            Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                        条数据/页 转到第
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                            ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
            </td>
        </tr>
    </table>
        <asp:Button ID="Button3" class="btn btn-primary" Style="width: 110px;" runat="server" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" Text="批量删除" onclick="Button3_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
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
        HideColumn("4,5,6,7,8");
    </script>
</asp:Content>