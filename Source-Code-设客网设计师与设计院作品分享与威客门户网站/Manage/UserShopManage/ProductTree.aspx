﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_ProductTree, App_Web_e1atrdhs" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>商家商品管理</title>
<script type="text/javascript">    
function Switch(obj)
{
	obj.className = (obj.className == "guideexpand") ? "guidecollapse" : "guideexpand";
	var nextDiv;
	if (obj.nextSibling)
	{
		if(obj.nextSibling.nodeName=="DIV")
		{
			nextDiv = obj.nextSibling;
		}
		else
		{
			if(obj.nextSibling.nextSibling)
			{
				if(obj.nextSibling.nextSibling.nodeName=="DIV")
				{
					nextDiv = obj.nextSibling.nextSibling;
				}
			}
		}
		if(nextDiv)
		{
			nextDiv.style.display = (nextDiv.style.display != "") ? "" : "none"; 
		}
	}
}
function OpenLink(lefturl,righturl)
{
	if(lefturl!="")
	{
		parent.frames["left"].location =lefturl;
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
</head>
<body id="Guidebody" style="margin: 0px; margin-top:1px;">
<form id="formGuide" runat="server">
<div id="Div1">
    <ul>
        <li id="Guide_top">
            <div id="Guide_toptext">商家商品管理</div>
        </li>
        <li id="Guide_main">
            <div id="Guide_box">
                <div class="guideexpand" onclick="Switch(this)"> 商家商品管理 </div>                    
                <div class="guide">
                <ul>                        
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../UserShopManage/ProductManage.aspx" target="main_right">商家商品列表</a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../UserShopManage/ProductExamine.aspx" target="main_right">商家商品审核</a></li>
                    
                </ul>
                </div>
            </div>
        </li>
     </ul>
</div>
</form>
</body>
</html>