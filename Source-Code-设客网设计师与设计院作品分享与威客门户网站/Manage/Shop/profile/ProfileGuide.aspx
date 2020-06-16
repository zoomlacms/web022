<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_profile_ProfileGuide, App_Web_lmw1yagy" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%= lang.LF("返利管理") %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="Div1">
    <ul>
        <li id="Guide_top">
            <div id="Guide_toptext"><%= lang.LF("推广返利") %></div>
        </li>
        <li id="Guide_main">
            <div id="Guide_box">
               <div class="guideexpand" style="max-width:100px;cursor:pointer;padding:5px;" onclick="Switch(this)">
                   <%= lang.LF("统计报表") %><span class="glyphicon glyphicon-circle-arrow-down" style="margin-left:5px;"></span></div>                    
                <div class="guide">
                <ul style="padding-left:15px;">   
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="StatisticsBriefing.aspx" target="main_right"><%= lang.LF("统计简报") %></a></li>
                </ul>
                </div>
            </div>
        </li>
        <li id="Li1">
            <div id="Div2">
                <div class="guideexpand" style="max-width:100px;cursor:pointer;padding:5px;" onclick="Switch(this)">
                    <%= lang.LF("推广营销") %><span class="glyphicon glyphicon-circle-arrow-down" style="margin-left:5px;"></span>
                </div>                    
                <div class="guide">
                <ul style="padding-left:15px;">     
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="config.aspx" target="main_right"><%= lang.LF("基本设置") %></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="LmUserManage.aspx" target="main_right"><%= lang.LF("联盟会员") %></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="LmUserListTree.aspx" target="main_right"><%= lang.LF("联盟会员树状图") %></a></li>
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

