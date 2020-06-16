<%@ page language="C#" autoeventwireup="true" inherits="manage_User_RoomManage, App_Web_3vlddosr" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>用户组管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div>
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="EGV_PageIndexChanging" PageSize="10" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据！！">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="用户组ID" DataField="ID" />
            <asp:BoundField HeaderText="用户组名称" DataField="UserGroupName" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="UserGroup.aspx?cid=<%#Eval("ID")%>">修改</a> <a href="?menu=delete&cid=<%#Eval("ID")%>" OnClick="return confirm('确实要删除此学员吗？');">删除</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    
    <div>
      <asp:Button ID="Button3" class="btn btn-primary" Style="width: 110px;display:inline;" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定删除？')}" Text="批量删除" onclick="Button3_Click" />
    </div>
  </div>
  <table class="margin_t5">
    <tr align="center">
      <td class="spacingtitle"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
    </tr>
  </table>
  <table class="table table-striped table-bordered table-hover">
    <tbody id="Tabs0">
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" style="width: 20%" align="right"><asp:Label ID="ssjd_txt" runat="server" Text="用户组名称："></asp:Label> 
          &nbsp; </td>
        <td class="bqright"><asp:TextBox ID="txt_Regulationame" runat="server" class="form-control" style="max-width:200px;display:inline;" Width="200px"></asp:TextBox> <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="添加" runat="server" ValidationGroup="user" onclick="EBtnSubmit_Click" />
          &nbsp;<font color="red">*</font>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户组不能为空!" ValidationGroup="user" ControlToValidate="txt_Regulationame"></asp:RequiredFieldValidator>
          <asp:HiddenField runat="server" ID="hfid"/></td>
      </tr>
    </tbody>
  </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>