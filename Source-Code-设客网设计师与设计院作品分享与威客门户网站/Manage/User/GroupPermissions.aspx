<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.User.GroupPermissions, App_Web_3vlddosr" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>会员组权限设置</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td colspan="2" class="spacingtitle"><b>会员组权限设置</b></td>
        </tr>
        <tr>
            <td class="tdbgleft" align="right" style="width: 100px;"><strong>会员组名称：</strong></td>
            <td>
                <asp:Label ID="LblGroupName" runat="server" Text="" /></td>
        </tr>
        <tr>
            <td class="tdbgleft" align="right" style="width: 100px;"><strong>会员组描述：</strong></td>
            <td>
                <asp:Label ID="LblDescription" runat="server" Text="" /></td>
        </tr>
        <tr>
            <td class="tdbgleft" align="right" style="width: 100px;"><strong>发布权限：</strong></td>
            <td>每天最多发布
            <asp:TextBox ID="TxtCCountPerDay" Columns="5" runat="server" class="l_input">0</asp:TextBox>
                条信息（不想限制请设置为0）。 </td>
        </tr>
        <tr>
            <td class="tdbgleft" align="right" style="width: 100px;"><strong>收藏夹限制：</strong></td>
            <td>会员收藏夹内最多可收录
            <asp:TextBox ID="TxtFavCount" Columns="5" runat="server" class="l_input">0</asp:TextBox>
                条信息（如果为0，则没有收藏权限） </td>
        </tr>
        <tr>
            <td class="tdbgleft" align="right" style="width: 100px;"><strong>计费方式：</strong></td>
            <td>
                <asp:RadioButtonList ID="RblConsumeType" runat="server">
                    <asp:ListItem Selected="True" Value="0">只判断点券：有点券时，即使有效期已经到期，仍可以查看收费内容；点券用完后，即使有效期没有到期，也不能查看收费内容。</asp:ListItem>
                    <asp:ListItem Value="1">只判断有效期：只要在有效期内，点券用完后仍可以查看收费内容；过期后，即使会员有点券也不能查看收费内容。</asp:ListItem>
                    <asp:ListItem Value="2">同时判断点券和有效期：点券用完或有效期到期后，就不可查看收费内容。</asp:ListItem>
                    <asp:ListItem Value="3">同时判断点券和有效期：点券用完并且有效期到期后，才不能查看收费内容。</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td class="tdbgleft" align="right" style="width: 100px;"><strong>节点权限设置：</strong></td>
            <td>&nbsp;
            <asp:ListBox ID="UserPromotions" runat="server" Height="213px" Width="488px" SelectionMode="Multiple"></asp:ListBox>
                <br />
                <input id="Button5" type="button" value="添加" class="btn btn-primary" onclick="javascript:Openwinadd(<%=Request.QueryString["GroupID"] %>);" />
                <input id="Button6" type="button" value="批量修改" class="btn btn-primary" onclick="javascript:getselect(<%=Request.QueryString["GroupID"] %>);" />
                <asp:Button ID="Button2" runat="server" Text="删除" class="btn btn-primary" OnClick="Button2_Click" OnClientClick="return confirm('确实要删除该权限吗？')" /></td>
        </tr>
        <tr>
            <td align="center" class="tdbgleft" colspan="2" style="height: 79px">&nbsp;
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保存权限设置" class="btn btn-primary" />
                &nbsp; &nbsp;&nbsp;
            <input id="Button1" type="button" value="返回" onclick="javascript:window.location.href='GroupManage.aspx'" class="btn btn-primary" />
                <asp:HiddenField ID="HdnGroupID" runat="server" />
            </td>
        </tr>
    </table>
    <div class="modal" id="userinfo_div">
        <div class="modal-dialog" style="width: 1024px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <span class="modal-title"><strong id="title">用户信息</strong></span>
                </div>
                <div class="modal-body">
                      <iframe id="user_ifr" style="width:100%;height:600px;border:none;" src=""></iframe>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function getselect(GroupID) {
            var actionstr = "";
            var optionart = document.getElementById("UserPromotions").options;
            for (var i = 0; i < optionart.length; i++) {
                if (optionart[i].selected) {
                    actionstr += optionart[i].value + "|";
                }
            }

            if (actionstr.substring(actionstr.length - 1, actionstr.length) == "|") {
                actionstr = actionstr.substring(0, actionstr.length - 1);
            }
            Openwin(actionstr, GroupID);
        }
</script>
<script type="text/javascript" src="/js/Console.js"></script>
<script type="text/javascript" src="/js/Drag.js"></script>
<script type="text/javascript" src="/js/Dialog.js"></script>
<script language="javascript">
    function Openwin(pid,GroupID) {
        $("#title").text("修改权限");
        $("#user_ifr").attr("src","NodeScript.aspx?GroupID=" + GroupID + "&pid=" + pid);
        $("#userinfo_div").modal({});
    }
    
    function Openwinadd(Groupid) {
        $("#title").text("添加权限");
        $("#user_ifr").attr("src","NodeScript.aspx?Groupid=" + Groupid);
        $("#userinfo_div").modal({});
    }
</script>
</asp:Content>
