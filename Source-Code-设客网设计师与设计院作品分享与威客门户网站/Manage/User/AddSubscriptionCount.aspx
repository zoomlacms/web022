<%@ page language="C#" autoeventwireup="true" inherits="manage_User_AddSubscriptionCount, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加订阅内容</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:HiddenField runat="server" ID="lblName_Hid" Value="" />
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr style="display:none;">
                <td align="center" colspan="2" class="spacingtitle">
                    <b><asp:Label ID="lblName1" runat="server"></asp:Label></b></td>
            </tr>
            <tr>
                <td width="15%" align="right" class="tdbgleft">投递标题：</td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" class="form-control" style="max-width:150px;" ReadOnly="true"></asp:TextBox>
                    <asp:TextBox ID="title_T" runat="server" class="form-control" style="max-width:300px;margin:5px 0; height:100px;" ReadOnly="true" TextMode="MultiLine" ></asp:TextBox>
                    <input id="Button2" runat="server" type="button" value="选择订阅内容" onclick="Openwin('SelectContent.aspx', '选择内容'); void (0)" class="btn btn-primary" />
                    <asp:RequiredFieldValidator ID="checkTitle" runat="server" ErrorMessage="投递标题不能为空!" ControlToValidate="title_T" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:HiddenField ID="GerenerId" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="height: 26px" align="right">投递对象：</td>
            <td style="height: 26px">
            <asp:TextBox ID="txtSel" runat="server" class="form-control pull-left" style="max-width:150px;" ReadOnly="true" ></asp:TextBox>
                <select id="selUserType" runat="server" onchange="SelChan(this.value)" class="btn btn-default dropdown-toggle pull-left" style="margin-left:5px;">
                    <option Value="0" Selected="Selected">用户</option>
                    <option Value="1">用户组</option>
                    <option Value="2">所有用户</option>
                </select></td>
            </tr>
            <tbody id="priUser">
            <tr>
                <td class="tdbgleft" align="right">目标用户：</td>
                <td>
                <asp:TextBox ID="userId" runat="server" class="form-control" style="max-width:150px;" ReadOnly="true" ></asp:TextBox>
                <asp:TextBox ID="txtUserID" runat="server" ReadOnly="true" class="form-control" style="max-width:300px;margin:5px 0; height:100px;" TextMode="MultiLine"></asp:TextBox>
                <input id="Button1" type="button" runat="server" value="选择订阅用户" onclick="Openwin('SelectUserName.aspx', '选择客户'); void (0)" class="btn btn-primary"/>
                <asp:HiddenField ID="hfid" runat="server"  />&nbsp;</td>
            </tr>
            </tbody>
            <tbody id="UserGroup" style="display:none">
            <tr>
                <td class="tdbgleft" align="right">用户组：</td>
                <td><asp:DropDownList ID="ddGroup" runat="server" >
                </asp:DropDownList></td>
            </tr>
            </tbody>
            <tr>
            <td class="tdbgleft" style="height: 26px" align="right">允许退订：</td>
            <td style="height: 26px">
                <asp:DropDownList ID="ddlRe" runat="server" class="btn btn-default dropdown-toggle">
                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                    <asp:ListItem Value="1">是</asp:ListItem>
                </asp:DropDownList></td>
            </tr>
            <tr>
                <td class="tdbgleft" style="height: 26px" align="right">生效时间：</td>
                <td style="height: 26px">
                    <asp:TextBox ID="txtCreateTime" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" runat="server" class="form-control" style="max-width:150px;"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="tdbgleft" style="height: 26px" align="right">到期时间：</td>
                <td style="height: 26px">
                 <asp:TextBox ID="txtEndTime" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" runat="server" class="form-control" style="max-width:150px;"></asp:TextBox></td>
            </tr>
            <tr><td ></td><td><font color="red">注:生效时间为空为当前时间即生效,到期时间为空则为无限期; 如已投递信息则匹配最新策略</font></td></tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <asp:Button ID="BtnSend" class="btn btn-primary" runat="server" Text="提交" Width="76px" OnClick="BtnSend_Click"  />
                    &nbsp;&nbsp; &nbsp;
                    <input id="Reset1" type="button" value="取消" width="60px" class="btn btn-primary" onclick="javascript: location.href = 'SubscriptListManage.aspx?menu=all'" /></td>
            </tr>
        </table>
    </div>
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
    <script src="/JS/Common.js" type="text/javascript"></script>
    <script src="/JS/calendar.js" type="text/javascript"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/js/Dialog.js"></script>    
<script>
    function Openwin(url, title) {
        $("#title").text(title);
        $("#user_ifr").attr("src", url);
        $("#userinfo_div").modal({});
    }

    function SelChan(obj) {
        if (obj == "0") {
            document.getElementById("priUser").style.display = "";
            document.getElementById("UserGroup").style.display = "none";
        }
        if (obj == "1") {
            document.getElementById("priUser").style.display = "none";
            document.getElementById("txtUserID").value = "";
            document.getElementById("hfid").value = "";
            document.getElementById("UserGroup").style.display = "";
        }
        if (obj == "2") {
            document.getElementById("priUser").style.display = "none";
            document.getElementById("txtUserID").value = "";
            document.getElementById("hfid").value = "";
            document.getElementById("UserGroup").style.display = "none";
        }
    }

    function Check() {
        if (document.getElementById("selUserType").value == "0") {
            if (document.getElementById("priUser").value == "") {
                return true;
            }
        }
        return false;
    }
</script>

    <script type="text/javascript">
        function setValues(objname, valuetxt) {
             document.getElementById(objname).value = valuetxt;
         }
           function closdlg() {
                Dialog.close();
         }
    </script>
</asp:Content>
