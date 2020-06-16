<%@ page language="C#" autoeventwireup="true" inherits="App_PhotoLook, App_Web_bshq2mp0" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>图片浏览</title>
<link href="../App_Themes/CloudStyle/styles.css" type="text/css" rel="stylesheet" />
<link href="../App_Themes/CloudStyle/photoswipe.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../JS/klass.min.js"></script>
<script type="text/javascript" src="../JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../JS/code.photoswipe.jquery-3.0.5.min.js"></script>
<script type="text/javascript">
	(function (window, $, PhotoSwipe) {
	    $(document).ready(function () {
	        var options = {};
	        $("#Gallery a").photoSwipe(options);
	    });
	}(window, window.jQuery, window.Code.PhotoSwipe));
</script>
</head>
<body>
<form id="form1" runat="server">
<div id="Header" style="background:<%=GetColor()%>; text-align:center; padding-top:12px;">
<a href="javascript:history.go(-1)" style="background-image:url(../App_Themes/UserThem/images/icons-36-white.png); width:18px; height:18px;background-size:776px 16px;background-position:-576px 50%;border:4px <%=GetColor()%> solid;border-radius:18px; background-color:#663333; margin-left:8px; display:block;z-index:0;text-decoration:none; box-shadow:0px 0px 3px 0px">&nbsp;&nbsp;</a>
<div style="margin-top:-26px;">
<asp:Label ID="labTitle" runat="server" Font-Size="Larger" ForeColor="White"></asp:Label>
</div>
</div>
<div id="MainContent">
<div class="page-content">
 <h1>图片浏览</h1>
</div>
<table id="tabs" Width="100%">
    <tr style="text-align:center;">
        <td>
        <asp:DetailsView ID="DetailsView1"  runat="server"  CellPadding="4" 
        GridLines="None" Font-Size="12px" Style="margin-bottom: 0px; margin-top: 0px;" 
		CssClass="r_navigations" CellSpacing="1">
		<Fields>
		</Fields>
		<FooterStyle Font-Bold="True" BackColor="#FFF" />
		<CommandRowStyle Font-Bold="True" CssClass="r_navigations tdlefttxt"/>
		<RowStyle />
		<FieldHeaderStyle Font-Bold="True" />
		<PagerStyle HorizontalAlign="Center" />
		<HeaderStyle Font-Bold="True" />
		<EditRowStyle />
		<AlternatingRowStyle />
	    </asp:DetailsView>
        </td>
    </tr> 
</table>
<asp:HiddenField ID="HdnModelID" runat="server"/>
</div>
<div data-role="footer" id="Foot" class="footer-docs" data-theme="c">
<p class="jqm-version"></p>
<p> <%Call.Label("{$Copyright/}"); %> </p>
</div>
</form>
<script src="/js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script>
    var type;
    var typeDes;
    $("#DetailsView1 tr").each(function (trindex, tritem) {
            $(tritem).find("td").each(function (tdindex, tditem) {
            type = $(tditem).html();
             
            if (type.indexOf('<IMG') < 0 && type.indexOf('<img') < 0) {
                if (type.indexOf('.jpg') >= 0 || type.indexOf('.gif') >= 0 || type.indexOf('.png') >= 0 || type.indexOf('.bmp') >= 0 || type.indexOf('.jpeg') >= 0) {
                    // typeDes = "<a href='/UploadFiles/" + type + "' target='_blank'><img src='/UploadFiles/" + type + "' width='80' /></a>";
                    if (type.indexOf('图片地址') >= 0) {
                        type = type.split("$");
                        var strDes = "<ul id=\"Gallery\" class=\"gallery\">";
                        for (var i = 0; i < type.length; i++) {
                            type[i] = type[i].split("|");
                            if (type[i].length > 0) {
                                if (type[i][1].indexOf('http://') >= 0) {
                                    strDes += "<li><a href='" + type[i][1] + "' target='_blank'><img src='" + type[i][1] + "'/></a></li>";
                                }
                                else if (type[i][1].indexOf('UploadFiles/') >= 0)
                                    strDes += "<li><a href='/" + type[i][1] + "' target='_blank'><img src='/" + type[i][1] + "'/></a></li>";
                                else
                                    strDes += "<li><a href='/UploadFiles/" + type[i][1] + "' target='_blank'> <img src='/UploadFiles/" + type[i][1] + "'/></a></li>";
                            }
                        }
                        typeDes = strDes;
                    }
                    else if (type.indexOf('http://') >= 0)
                        typeDes = "<li><a href='" + type + "' target='_blank'><img src='" + type + "' /></a></li>";
                    else if (type.indexOf('UploadFiles/') >= 0) {
                        typeDes = "<li><a href='/" + type + "' target='_blank'><img src='/" + type + "'  /></a></li>";
                    }
                    else typeDes = "<li><a href='/UploadFiles/" + type + "' target='_blank'><img src='/UploadFiles/" + type + "' /></a></li>";
                    typeDes += "</ul>";
                    $(tditem).html(typeDes);
                }
            }
            });
            $(this).children('td').eq(0).html("");
    });
</script>
</body>
</html>
