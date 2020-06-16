<%@ page language="C#" autoeventwireup="true" inherits="Plat_PreView, App_Web_pk13pou2" enableviewstate="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/JS/jquery.media.js"></script>
    <script type="text/javascript" src="/User/Cloud/Jwplayer/jwplayer.js"></script>
    <asp:Literal runat="server" ID="Head_L"></asp:Literal>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div runat="server" id="pdfDiv" visible="false">
              <embed id="pdfEmbed" class="precenter" src="<%=pdfUrl %>" <%=string.Format("style='width:{0}px;height:{1}px;'",viewWidth,viewHeight)%> type="application/pdf" />
        </div>
        <div id="imgDiv" runat="server" visible="false">
            <img src="<%=imgUrl %>" style="border:none;" />
        </div>
        <div id="generalDiv" runat="server" visible="false">
            <asp:Literal runat="server" ID="html_L"></asp:Literal>
        </div>
        <asp:TextBox runat="server" ID="ViewTxt" TextMode="MultiLine" CssClass="precenter"  Visible="false"></asp:TextBox>
        <div runat="server" id="videoDiv">
         	<div id="mediaplayer"></div>
        </div>
        <style>
            .precenter{margin:0 auto; display:block;border:1px solid #ccc;}
        </style>
        <script type="text/javascript">
            $('.media').media({
                width: <%=viewWidth%>,
                height: <%=viewHeight%>,
                autoplay: true,
                //src: 'myBetterMovie.mov',
                //attrs: { attr1: 'attrValue1', attr2: 'attrValue2' }, // object/embed attrs 
                //params: { param1: 'paramValue1', param2: 'paramValue2' }, // object params/embed attrs 
                //caption: false // supress caption text 
            });
            function PlayVideo() {
                jwplayer("mediaplayer").setup({
                    flashplayer: "/User/Cloud/Jwplayer/Player.swf",
                    file: "<%:Request.QueryString["vpath"]%>",
                    autostart: true
                });
            }
        </script>
    </form>
</body>
</html>
