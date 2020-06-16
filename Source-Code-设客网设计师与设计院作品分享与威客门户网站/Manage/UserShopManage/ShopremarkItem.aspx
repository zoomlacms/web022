<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_ShopremarkItem, App_Web_t4b0mnki" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
  <title>查看评论信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div class="btn-group"> <a class="btn btn-primary" href="ShopRemark.aspx?actions=userremark" >用户评论
    <asp:Label CssClass="badge" ID="Label2" runat="server"></asp:Label>
    </a> <a class="btn btn-primary" href="ShopRemark.aspx?actions=proremark" >商品评论
    <asp:Label CssClass="badge" ID="Label3" runat="server"></asp:Label>
    </a> <a class="btn btn-primary" href="ShopRemark.aspx?actions=orderremark" >交易评论
    <asp:Label CssClass="badge" ID="Label4" runat="server"></asp:Label>
    </a> </div>
  <table class="table table-striped table-bordered table-hover">
    <tr>
      <td width="100%" align="center" class="title" colspan="2">查看评论信息</td>
    </tr>
    <tr>
      <td style="width:20%;text-align:left;"><b>评论标题</b></td>
      <td style="width:80%;text-align:left;"><asp:Label ID="S_Comtitle" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr id="show1" runat="server">
      <td style="width:20%;text-align:left;"><b>受论用户ID</b></td>
      <td style="width:80%;text-align:left;"><asp:Label ID="S_CUserid" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr id="show2" runat="server">
      <td style="width:20%;text-align:left;"><b>受论用户</b></td>
      <td style="width:80%;text-align:left;"><asp:Label ID="S_CUsername" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr id="show3" runat="server">
      <td style="width:20%;text-align:left;"><b>商品ID</b></td>
      <td style="width:80%;text-align:left;"><asp:Label ID="S_Proid" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr id="show4" runat="server">
      <td style="width:20%;text-align:left;"><b>商品名称</b></td>
      <td style="width:80%;text-align:left;"><asp:Label ID="S_ProName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr id="show5" runat="server">
      <td style="width:20%;text-align:left;"><b>交易ID</b></td>
      <td style="width:80%;text-align:left;"><asp:Label ID="S_COrderid" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr id="show6" runat="server">
      <td style="width:20%;text-align:left;"><b>店铺店主</b></td>
      <td style="width:80%;text-align:left;"><asp:Label ID="S_Storeid" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr id="show7" runat="server">
      <td style="width:20%;text-align:left;"><b>评论类型</b></td>
      <td style="width:80%;text-align:left;"><asp:Label ID="S_ComOption" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
      <td style="width:20%;text-align:left;"><b>作者</b></td>
      <td style="width:80%;text-align:left;"><asp:Label ID="S_ComUser" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
      <td style="width:20%;text-align:left;"><b>提交时间</b></td>
      <td style="width:80%;text-align:left;"><asp:Label ID="S_Addtime" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
      <td style="width:20%;text-align:left;"><b>评论内容</b></td>
        <td style="width:80%;text-align:left;" style="word-break: break-all; word-wrap: break-word;">
      <asp:Label ID="S_ComContent" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
      <td colspan="2"><asp:Button ID="Button3" CssClass="btn btn-primary" runat="server" Text="删除" CommandName="5" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" OnClick="Button3_Click" />
        <input type="button" onclick="javascript: location.href = 'ShopRemark.aspx'" value="返回" class="btn btn-primary" /></td>
    </tr>
  </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
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