<%@ page language="C#" autoeventwireup="true" inherits="Plat_Blog_Declined, App_Web_tbedsbxg" masterpagefile="~/Plat/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<title>日程详情</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div style="width:600px;">
    <div style="background-color:#f7f7f7; width: 100%;height:50px;line-height:50px;padding-left:10px;">
      <asp:TextBox runat="server" ID="Name" CssClass="form-control required date"></asp:TextBox>
      <asp:LinkButton runat="server" ID="Del_Btn" OnClick="Del_Btn_Click" OnClientClick="return confirm('确定要删除吗!!');"> <span class="glyphicon glyphicon-trash" title="删除" style="margin-left:10px;"></span> </asp:LinkButton>
    </div>
    <div style="padding-left:1em; padding-top:10px;">
      <table id="DetailTable">
        <tr>
          <td><span class="glyphicon glyphicon-calendar"></span> <span>时间： </span></td>
          <td><asp:TextBox class="form-control" ID="StartDate" runat="server" onclick="WdatePicker();" Style="width: 150px;"></asp:TextBox>
            -
            <asp:TextBox class="form-control" ID="EndDate" runat="server" onclick="WdatePicker();" Style="width: 150px;">></asp:TextBox></td>
        </tr>
        
        <%--<tr>
          <td colspan="2"><span class="glyphicon glyphicon-user"></span> <a href="#">管理员</a><span>创建</span></td>
        </tr>--%>
        <%--<tr>
          <td><span class="glyphicon glyphicon-user"></span> <span>主负责人：</span> <a href="#"><span class="glyphicon glyphicon-plus-sign" title="添加"></span></a></td>
          <td><asp:Label runat="server" ID="LeaderIDS_L"></asp:Label></td>
        </tr>
        <tr>
          <td><span class="glyphicon glyphicon-user"></span> <span>任务成员：</span> <a href="#"><span class="glyphicon glyphicon-plus-sign" title="添加"></span></a></td>
          <td><asp:Label runat="server" ID="ParterIDS_L"></asp:Label></td>
        </tr>--%>
        <tr>
          <td><span class="glyphicon glyphicon-list-alt"></span><span>详情：</span></td>
          <td><asp:TextBox runat="server" ID="Describe" CssClass="form-control required date" TextMode="MultiLine" style="max-width:100%;width:100%;height:60px;"></asp:TextBox></td>
        </tr>
        <tr>
          <td colspan="2"><asp:CheckBox runat="server" ID="IsOpen_Chk" />
            <span class="glyphicon glyphicon-lock"></span><span>公开日程</span></td>
        </tr>
        <tr>
          <td colspan="2" runat="server"><asp:Button runat="server" ID="Edit_Btn" Text="保存" OnClick="Edit_Btn_Click" CssClass="btn btn-primary" />
            <input type="button" value="关闭" class="btn btn-default" onclick="parent.HideMe();" /></td>
        </tr>
      </table>
    </div>
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<style type="text/css">
.glyphicon { color: #AFAFAF; font-size: 1.3em; margin-right: 5px; }
#DetailTable tr td { padding-top: 10px; padding-bottom: 10px; }
</style>
<script>
    function UpdateData(id,content) {
        parent.UpdateData(id,content)
    }
    function DelData(id) {
        parent.DelData(id);
    }
</script>
</asp:Content>