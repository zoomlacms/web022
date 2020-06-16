<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="manage_Shop_Interference, App_Web_g0x3iq3z" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>干扰设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td colspan="2" align="center" class="title">
                <asp:Label ID="Label1" runat="server" Text="竞拍全局干扰设置"></asp:Label>&nbsp;
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft" style="width: 200px; height: 23px;">
                干扰状态：
            </td>
            <td>
                <asp:RadioButtonList ID="Start" runat="server" 
                    RepeatDirection="Horizontal" AutoPostBack="true" 
                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Value="1" Selected="True">关闭</asp:ListItem>
                    <asp:ListItem Value="2">按人数干扰</asp:ListItem>
                    <asp:ListItem Value="3">按价格干扰</asp:ListItem>
                    <asp:ListItem Value="4">按倒计时干扰</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr class="tdbg" id="t1" runat="server">
            <td class="tdbgleft" style="width: 200px; height: 23px;">
                干扰参数：
            </td>
            <td>
                <table width="100%" id="Panel2">
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td id="mnum" runat="server" visible="false">
                            <span style="float:left;padding:5px">出价额度达到</span> <asp:TextBox ID="txt_Mnum" runat="server" Width="53px" Style="text-align: center" class="form-control pull-left" onkeyup="this.value=this.value.replace(/\D/g,'')">0</asp:TextBox><span style="float:left;padding:5px"> 元时开始干扰</span>
                        </td>
                        <td id="pnum" runat="server" visible="false">
                            <span style="float:left;padding:5px">当参与竞拍人数达到</span> <asp:TextBox ID="txt_Pnum" runat="server" Width="53px" Style="text-align: center" class="form-control pull-left" onkeyup="this.value=this.value.replace(/\D/g,'')">0</asp:TextBox><span style="float:left;padding:5px"> 人时开始干扰</span>
                        </td>
                        <td id="snum" runat="server" visible="false">
                            <span style="float:left;padding:5px">当倒计时达到</span> <asp:TextBox ID="txt_Snum" runat="server" Width="53px" Style="text-align: center" class="form-control pull-left"  onkeyup="this.value=this.value.replace(/\D/g,'')">0</asp:TextBox> <span style="float:left;padding:5px">秒时开始干扰</span>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" style="display:none">
                        <td>
                            干扰次数:
                            <asp:TextBox ID="Times" Style="text-align: center" runat="server" Width="78px"
                                class="form-control">0</asp:TextBox>
                            次/人
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" style="display:none">
                        <td>
                            干扰时间间隔:
                            <asp:TextBox ID="TextBox10" Style="text-align: center" runat="server" Width="78px"
                                class="form-control">0</asp:TextBox>
                            <asp:DropDownList ID="Interval" runat="server" CssClass="x_input">
                                <asp:ListItem Value="Hours">小时</asp:ListItem>
                                <asp:ListItem Value="Minutes">分钟</asp:ListItem>
                                <asp:ListItem Value="Second">秒</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" id="t2" runat="server" style="display:none">
            <td class="tdbgleft" style="width: 200px; height: 23px;">
                干扰价格：
            </td>
            <td>
                <asp:RadioButtonList ID="Price" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">随机价格</asp:ListItem>
                    <asp:ListItem Value="2">最低价格</asp:ListItem>
                    <asp:ListItem Value="3">最高价格</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr class="tdbg" id="t3" runat="server">
            <td class="tdbgleft" style="width: 200px; height: 23px;">
                参与干扰人员：
            </td>
            <td>
                <asp:HiddenField ID="hfNum" runat="server" />
                <asp:ListBox ID="ListBox1" runat="server" class="form-control" SelectionMode="Multiple"  Width="200px" Height="150px"></asp:ListBox>
                <br />
                <input id="Button11" type="button" value="选择用户" class="btn btn-primary"  onclick="window.open('<%=customPath2%>/Common/SelectUser.aspx', '', 'width=600,height=450,resizable=0,scrollbars=yes');" />
                <input id="Button2" type="button" value="删除" class="btn btn-primary"  onclick="deluser()" />
            </td>
        </tr>
        <tr class="tdbg">
            <td colspan="2" align="center">
                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="保存设置"
                    OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function buttonclick(username, userid) {
            var objlist = document.getElementById("ListBox1");
            node = document.createElement("<option   value='" + userid + "'>");
            text = document.createTextNode(username);
            node.appendChild(text);
            objlist.appendChild(node);

            for (var i = 0; i < objlist.length; i++) {
                objlist.options[i].selected = true;
            }
        }
        function deldata(userid) {
            var objlist = document.getElementById("ListBox1");
            for (i = objlist.length - 1; i >= 0; i--) {
                if (objlist.options[i].value == userid) {
                    objlist.remove(i);
                }
            }
        }
        function deluser() {
            var objlist = document.getElementById("ListBox1");
            for (i = objlist.length - 1; i >= 0; i--) {
                if (objlist.options[i].selected) {
                    objlist.remove(i);
                }
            }
        }
    </script>
</asp:Content>

