<%@ page language="C#" autoeventwireup="true" inherits="manage_User_RuleList, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>选择角色</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
     <table class="table table-striped table-bordered table-hover">
    <tr class="title">
      <td align="left"><b>角色列表：</b></td>
      <td align="right"><asp:TextBox ID="TxtKeyWord" runat="server" class="form-control" style="max-width:150px; display:inline;"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:Button ID="BtnSearch" runat="server" Text="查找" OnClick="BtnSearch_Click" class="btn btn-primary" /></td>
    </tr>
    <tr>
      <td valign="top" colspan="2"><table>
          <tr class="tdbgleft">
            <td width="5%" height="24" align="center"><strong>ID</strong></td>
            <td width="5%" height="24" align="center"><asp:CheckBox ID="CheckBox1" runat="server" onclick="CheckAll(this);" /></td>
            <td width="15%" height="24" align="center"><strong>角色名称</strong></td>
            <td width="35%" height="24" align="center"><strong>角色说明</strong></td>
            <td width="10%" height="24" align="center"><strong>优先级别</strong></td>
            <td width="10%" height="24" align="center"><strong>是否启用</strong></td>
          </tr>
          <asp:Repeater ID="Pagetable" runat="server">
            <ItemTemplate>
              <tr>
                <td height="24" align="center"><%#Eval("ID") %></td>
                <td height="24" align="center"><input name="Item" type="checkbox" value=<%#Eval("ID") %>></td>
                <td height="24" align="center"><a target="_blank" href="Permissionadd.aspx?menu=edit&id=<%#Eval("ID") %>"><%#Eval("RoleName") %></a></td>
                <td height="24" align="center"><%#Eval("info")%></td>
                <td height="24" align="center"><%#Eval("Precedence")%></td>
                <td height="24" align="center"><%#Eval("IsTrue","{0}")=="True"?"<font color=green>启用</font>":"<font color=red>停用</font>"%></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
          <tr class="tdbg">
            <td class="tdbgleft" colspan="6" align="center">共
              <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
              条信息
              <asp:Label ID="Toppage" runat="server" Text="" />
              <asp:Label ID="Nextpage" runat="server" Text="" />
              <asp:Label ID="Downpage" runat="server" Text="" />
              <asp:Label ID="Endpage" runat="server" Text="" />
              页次：
              <asp:Label ID="Nowpage" runat="server" Text="" />
              /
              <asp:Label ID="PageSize" runat="server" Text="" />
              页
              <asp:Label ID="pagess" runat="server" Text="" />
              条信息/页  转到第
              <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"> </asp:DropDownList>
              页 </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="添加角色" OnClick="Button1_Click" class="btn btn-primary" />
        <asp:Button ID="Button2" runat="server" Text="取消添加" OnClick="Button2_Click" class="btn btn-primary" /></td>
    </tr>
  </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script language="javascript">
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


