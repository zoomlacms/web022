<%@ page language="C#" autoeventwireup="true" inherits="manage_User_CustomerGuide, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=lang.LF("在线客服")%></title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="Div1">
    <ul>
      <li id="Guide_top">
        <div id="Guide_toptext"><%=lang.LF("客服管理")%></div>
      </li>
      <li id="Guide_main">
        <div id="Guide_box">
          <div class="guideexpand" onclick="Switch(this)"> <%=lang.LF("客服管理")%></div>
          <div class="guide">
            <ul>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/ServiceSeat.aspx" target="main_right"><%=lang.LF("客服席位")%></a> </li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/ServiceCode.aspx" target="main_right"><%=lang.LF("在线生成")%></a> </li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="javascript:void(0);" onclick="ShowMains('Onlineuser.aspx','../User/ALLOnlineInfo.aspx')"><%=lang.LF("客服信息")%></a></li>
            </ul>
          </div>
        </div>
      </li>
    </ul>
    <ul>
      <li id="Li1">
        <div>
          <div class="guideexpand" onclick="Switch(this)"><%=lang.LF("有问必答")%></div>
          <div class="guide">
            <ul>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../iServer/BiServer.aspx?num=-3&strTitle=" target="main_right"><%=lang.LF("有问必答")%></a> </li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../iServer/BselectiServer.aspx?num=-3&strTitle=" target="main_right"><%=lang.LF("问题列表")%></a> </li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../iServer/AddQuestionRecord.aspx" target="main_right"><%=lang.LF("创建问题记录")%></a> </li>
            </ul>
          </div>
        </div>
      </li>
    </ul>
    <ul>
      <li id="Li2">
        <div>
          <div class="guideexpand" onclick="Switch(this)"><%=lang.LF("聊天室管理")%></div>
          <div class="guide">
            <ul>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../User/MsgEx.aspx" target="main_right"><%=lang.LF("聊天记录")%></a> </li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/UserGroup.aspx" target="main_right"><%=lang.LF("用户组管理")%></a> </li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/SelectFrient.aspx" target="main_right"><%=lang.LF("查找好友")%></a> </li>
            </ul>
          </div>
        </div>
      </li>
    </ul>
  </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function Switch(obj) {
            obj.className = (obj.className == "guideexpand") ? "guidecollapse" : "guideexpand";
            var nextDiv;
            if (obj.nextSibling) {
                if (obj.nextSibling.nodeName == "DIV") {
                    nextDiv = obj.nextSibling;
                }
                else {
                    if (obj.nextSibling.nextSibling) {
                        if (obj.nextSibling.nextSibling.nodeName == "DIV") {
                            nextDiv = obj.nextSibling.nextSibling;
                        }
                    }
                }
                if (nextDiv) {
                    nextDiv.style.display = (nextDiv.style.display != "") ? "" : "none";
                }
            }
        }
        function OpenLink(lefturl, righturl) {
            if (lefturl != "") {
                parent.frames["left"].location = lefturl;
            }
            parent.frames["main_right"].location = righturl;
        }
        function ShowMains(lefturl, righturl) {
            if (lefturl != "") {
                parent.frames["left"].location = lefturl;
            }
            try {
                parent.MDIOpen(righturl); return false;
            } catch (Error) {
                parent.frames["main_right"].location = righturl;
            }
        }

        function gotourl(url) {
            try {
                parent.MDILoadurl(url); void (0);
            } catch (Error) {
                parent.frames["main_right"].location = "../" + url; void (0);
            }
        }
</script>
</asp:Content>
