<%@ page language="C#" autoeventwireup="true" inherits="manage_Polymeric_ClassManage, App_Web_eptrlqwq" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>聚合分类</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td class="title">
                
            </td>
            <td  class="title">
                分类ID
            </td>
            <td class="style10">
                分类名称
            </td>
            <td class="style7">
                排列顺序
            </td>
            <td width="6%" class="title">
                操作
            </td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                    id="<%#Eval("ID") %>" ondblclick="ShowTabs(this.id)">
                    <td height="22" align="center">
                        <input name="Item" type="checkbox" value='<%#Eval("ID") %>' />
                    </td>
                    <td height="22" align="center">
                        <%#Eval("ID")%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("ClassName")%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("Orderid")%>
                    </td>
                    <td height="22" align="center">
                        <a href="AddClass.aspx?menu=edit&id=<%#Eval("ID")%>">修改</a> <a href="?menu=delete&id=<%#Eval("ID")%>" OnClick="return confirm('确实要删除此信息吗？');">删除</a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td style="text-align:center"><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
            <td class="tdbg" colspan="4" align="center">
                共 <asp:Label ID="Allnum" runat="server" Text=""></asp:Label> 条信息  <asp:Label ID="Toppage" runat="server" Text="" /> <asp:Label ID="Nextpage" runat="server" Text="" /> <asp:Label ID="Downpage" runat="server" Text="" /> <asp:Label ID="Endpage" runat="server" Text="" />  页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页  
                     <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" OnTextChanged="txtPage_TextChanged"
                Width="30px"></asp:TextBox>条信息/页  转到第<asp:DropDownList 
                        ID="DropDownList1" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
              </asp:DropDownList>页
            </td>
        </tr>
    </table>
    <div>
        <asp:Button ID="Button3" class="btn btn-primary" runat="server" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"
            Text="批量删除" /></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
     <script type="text/javascript">
         var tID = 0;
         var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4");
         var arrTabs = new Array("Div0", "Div1", "Div2", "Div3", "Div4");
         function ShowTabs(ID) {
             location.href = "Addclass.aspx?menu=edit&id=" + ID + "";
         }
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