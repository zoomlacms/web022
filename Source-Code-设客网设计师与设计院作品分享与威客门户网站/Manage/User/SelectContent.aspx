<%@ page language="C#" autoeventwireup="true" inherits="manage_User_SelectContent, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>查询所有内容</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div style="width:25%; float:left">
      <asp:TreeView ID="tvNav" runat="server" ShowLines="True" EnableViewState="False" NodeIndent="10">
        <NodeStyle BorderStyle="None" ImageUrl="~/Images/TreeLineImages/plus.gif" />
        <ParentNodeStyle ImageUrl="~/Images/TreeLineImages/plus.gif" />
        <SelectedNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
        <RootNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
      </asp:TreeView>
    </div>
    <div style="float:right;text-align:center;width:70%">
      <div class="divbox" id="nocontent"  runat="server" style="float:right;text-align:center;width:100%"> 暂无内容信息</div>
      <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" OnPageIndexChanging="EGV_PageIndexChanging" > 
        <Columns>
        <asp:BoundField HeaderText="ID" DataField="GeneralID">
          <HeaderStyle />
          <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="标题">
          <ItemTemplate> <%# GetPic(Eval("ModelID", "{0}"))%> <%# GetTitle(Eval("GeneralID", "{0}"), Eval("NodeID", "{0}"), Eval("Title", "{0}"), Eval("ModelID", "{0}"))%> </ItemTemplate>
          <ItemStyle HorizontalAlign="Center" />
          <ItemStyle />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="操作">
          <ItemTemplate> <a href="javascript:parentOpen('?menu=add&generid=<%#Eval("GeneralID") %>');void(0);">选择</a> </ItemTemplate>
          <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle Height="24px" HorizontalAlign="Center"  />
</ZL:ExGridView>
 
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="../../JS/SelectCheckBox.js"></script>
<script language="javascript" type="text/javascript" src="../../JS/Popmenu.js"></script>
<script type="text/javascript" src="../../JS/Drag.js"></script>
<script type="text/javascript" src="../../js/Dialog.js"></script>
<script type="text/javascript">
    function setvalue(objname, valuetxt) {
        var mainright = window.top.main_right;
        mainright.frames[parent.nowWindow].document.getElementById(objname).value = valuetxt;
    }
</script>
</asp:Content>