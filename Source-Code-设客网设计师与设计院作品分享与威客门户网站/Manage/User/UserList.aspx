<%@ page language="C#" autoeventwireup="true" inherits="manage_User_UserList, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>选择会员</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr class="title" style="height: 22px;">
            <td align="left"><b>已经选定的用户：</b></td>
            <td align="right"><a href="javascript:window.close();">返回&gt;&gt;</a></td>
        </tr>
        <tr class="tdbg">
            <td align="left"><input type="text" class="form-control" style="max-width:350px;" id="UserNameList" size="60" maxlength="200" readonly="readonly" />
                <input type="hidden" name="HdnUserName" id="HdnUserName" value="" /></td>
            <td align="center"><input type="button" class="btn btn-primary"  name="del1" onclick="del(1)" value="删除最后" />
                <input type="button" class="btn btn-primary" name="del2" onclick="del(0)" value="删除全部" /></td>
        </tr>
    </table><br />
    <table class="table table-striped table-bordered table-hover">
        <tr class="title">
            <td align="left"><b>会员列表：</b></td>
            <td align="right">
                <asp:TextBox ID="TxtKeyWord" class="form-control" style="max-width:200px;display:inline;" runat="server"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button class="btn btn-primary" ID="BtnSearch" runat="server" Text="查找" />
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2"><div id="DivUserName" runat="server" visible="false"> 未找到任何用户！</div>
                <asp:Repeater ID="RepUser" runat="server" OnItemDataBound="RepUser_ItemDataBound">
                    <HeaderTemplate>
                        <table class="table table-striped table-bordered table-hover">
                            <tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <td align="center"><a href="#" onclick="<%# "add('" + Container.DataItem + "')"%>"> <%# Container.DataItem%> </a></td>
                        <% 
                            i++; %>
                        <% if (i % 8 == 0 && i > 1)
                           {%>
                        </tr>
                        <tr>
                            <%} %>
                            </ItemTemplate>
                    <FooterTemplate>
                        </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr class="tdbg">
            <td align="center" colspan="2"><div id="DivAdd" runat="server"> <a href="#" onclick="add('<%=m_allUser %>')">增加以上所有用户</a></div></td>
        </tr>
    </table>
    <table border="0" align="center" cellpadding="2" cellspacing="0">
        <tr>
            <td align="center"></td>
        </tr>
    </table>
    <div id="pager1" runat="server"></div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript">
        document.getElementById('UserNameList').value = opener.document.getElementById('<%= m_UserInput %>').value;
        function add(obj) {
            if (obj == "") { return false; }
            if (opener.document.getElementById('<%= m_UserInput %>').value == "") {
                opener.document.getElementById('<%= m_UserInput %>').value = obj;
                document.getElementById('UserNameList').value = opener.document.getElementById('<%= m_UserInput %>').value;
                return false;
            }
            var singleUserName = obj.split(",");
            var ignoreUserName = "";
            for (i = 0; i < singleUserName.length; i++) {
                if (checkUserName(opener.document.getElementById('<%= m_UserInput %>').value, singleUserName[i])) {
                ignoreUserName = ignoreUserName + singleUserName[i] + " ";
            }
            else {
                opener.document.getElementById('<%= m_UserInput %>').value = opener.document.getElementById('<%= m_UserInput %>').value + "," + singleUserName[i];
                document.getElementById('UserNameList').value = opener.document.getElementById('<%= m_UserInput %>').value;
            }
        }
        if (ignoreUserName != "") {
            alert(ignoreUserName + "用户已经存在，此操作已经忽略！");
        }
    }
    function del(num) {
        if (num == 0 || opener.document.getElementById('<%= m_UserInput %>').value == "" || opener.document.getElementById('<%= m_UserInput %>').value == ",") {
            opener.document.getElementById('<%= m_UserInput %>').value = "";
            document.getElementById('UserNameList').value = "";
            return false;
        }

        var strDel = opener.document.getElementById('<%= m_UserInput %>').value;
        var s = strDel.split(",");
        opener.document.getElementById('<%= m_UserInput %>').value = strDel.substring(0, strDel.length - s[s.length - 1].length - 1);
        document.getElementById('UserNameList').value = opener.document.getElementById('<%= m_UserInput %>').value;
    }

    function checkUserName(UserNamelist, thisUserName) {
        if (UserNamelist == thisUserName) {
            return true;
        }
        else {
            var s = UserNamelist.split(",");
            for (j = 0; j < s.length; j++) {
                if (s[j] == thisUserName)
                    return true;
            }
            return false;
        }
    }
</script>
</asp:Content>

