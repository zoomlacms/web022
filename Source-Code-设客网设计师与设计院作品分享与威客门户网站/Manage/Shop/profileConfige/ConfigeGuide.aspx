<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_profileConfige_ConfigeGuide, App_Web_gbtj4am5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>返利配置信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="Div1">
<ul>
<li id="Guide_main">
<div id="Guide_box">
    <div class="guideexpand" style="max-width:135px;cursor:pointer;padding:5px; background:#428BCA;color:#ffffff;" onclick="Switch(this)">
        返利信息配置
        <span class="glyphicon glyphicon-circle-arrow-down" style="margin-left:5px;"></span>
    </div>                    
    <div class="guide">
     <ul style="padding-left:15px;">       
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'" ><a href="HonorConfige.aspx" target="main_right">兑现信息管理</a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'" ><a href="SmellCashConfige.aspx" target="main_right">小额兑现信息管理</a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'" ><a href="RedEnvlop.aspx" target="main_right">红包信息管理</a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'" ><a href="MakeMoneyRegu.aspx" target="main_right">赚钱计划规则管理</a></li>
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

        function gotourl(url) {
            try {
                parent.MDILoadurl(url); void (0);
            } catch (Error) {
                parent.frames["main_right"].location = "../" + url; void (0);
            }
        }
</script>
</asp:Content>



