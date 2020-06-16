<%@ page language="C#" autoeventwireup="true" inherits="manage_Qmail_MailIdiographList, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>签名列表</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div>
    <table class="table table-striped table-bordered table-hover">
      <tr class="tdbg">
        <td align="center" class="spacingtitle">签名列表</td>
      </tr>
      <tr>
        <td valign="top" class="tdbg">
            <ZL:ExGridView ID="EGV" DataKeyNames="ID" Width="100%" runat="server"  class="table table-striped table-bordered table-hover" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
            <asp:TemplateField>
              <HeaderStyle Width="20px" />
              <ItemTemplate>
                <input  name="shkAll" type="checkbox" value='<%#DataBinder.Eval(Container.DataItem,"ID")  %>' />
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="编号" HeaderStyle-Width="35px">
              <ItemStyle HorizontalAlign="Center" />
              <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="签名名称">
              <HeaderStyle Width="100px" />
              <ItemStyle HorizontalAlign="Center" />
              <ItemTemplate> <a href='addMailIdiograph.aspx?ID=<%#DataBinder.Eval(Container.DataItem,"ID") %>'><%#DataBinder.Eval(Container.DataItem, "Name")%></a> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="签名内容">
              <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Context") %>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="添加时间">
              <HeaderStyle Width="115px" />
              <ItemStyle HorizontalAlign="Center" />
              <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("AddTime") %>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="签名状态">
              <HeaderStyle Width="55px" />
              <ItemTemplate> <%#GetState(DataBinder.Eval(Container.DataItem, "State").ToString())%> </ItemTemplate>
              <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True"  HeaderStyle-Width="30px"/>
            </Columns>
          </ZL:ExGridView></td>
      </tr>
      <tr class="tdbg">
          <td>
          <asp:Button ID="btn_DeleteRecords" runat="server" OnClientClick="return judgeSelect();" Text="删除选中记录" OnClick="btn_DeleteRecords_Click" class="btn btn-primary"/></td>
      </tr>
    </table>
  </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript">
    //全选
    $().ready(function () {
        $("#EGV tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");
        $("#chkAll").click(function () {
            selectAllByName(this, "shkAll");
        });
    });
    function selectAllByName(obj, name) {
        var allInput = document.getElementsByName(name);
        var loopTime = allInput.length;
        for (i = 0; i < loopTime; i++) {
            if (allInput[i].type == "checkbox") {
                allInput[i].checked = obj.checked;
            }
        }
    }
    //判断是否选中记录，用户确认删除
    function judgeSelect() {
        var result = false;
        var allInput = document.getElementsByTagName("input");
        var loopTime = allInput.length;
        for (i = 0; i < loopTime; i++) {
            if (allInput[i].checked) {
                result = true;
                break;
            }
        }
        if (!result) {
            alert("请先选则要删除的记录！");
            return result;
        }
        result = confirm("你确认要删除选定的记录吗？");
        return result;
    }

</script>
</asp:Content>
