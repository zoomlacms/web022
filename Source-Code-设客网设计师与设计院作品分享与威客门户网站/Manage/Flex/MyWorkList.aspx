<%@ page language="C#" autoeventwireup="true" inherits="manage_Flex_MyWorkList, App_Web_54finohp" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>我的作品列表</title>
    <script type="text/javascript">
        var txtName = "<%=Request.QueryString["txtName"].ToString() %>";
        function SetValue(text) {
            opener.document.getElementById('txt' + txtName).value = text;
            window.close();
        }
        function showImg(obj) {
            var evt = getEvent();
            var btop = document.body.scrollTop + evt.clientY + 5 + "px";
            var bleft = document.body.scrollLeft + evt.clientX + 5 + "px";
            $("#Magnifying").attr("src", $(obj).attr("src"));
            $("#boxCover").css({ "top": btop, "left": bleft }).show();
        }
        function hiddleImg(obj) {
            $("#boxCover").hide();
        }
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate><ul id="imgul"></HeaderTemplate>
                <ItemTemplate>
                   <li><img title="单击提取图片" class="rpimg" src='<%#Eval("VPath")%>' onclick="SetValue('<%#Eval("VPath")%>')" onmouseover="showImg(this)" onmouseout="hiddleImg(this)" />
                       <div style="color:gray;text-align:center;"><%#Eval("Name") %></div>
                   </li>
                </ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
            </asp:Repeater>
    <div style="clear:both;"></div>
    <div style="margin-left:30px;">
        <asp:Literal runat="server" ID="Page_Lit" EnableViewState="false"></asp:Literal>
    </div>
    <style>
        #BreadNav{display:none;}
        #imgul{margin-left:30px;}
        #imgul li{float:left;width:260px;border:1px solid #ddd;margin-right:2px;margin-bottom:2px;padding:5px;}
        #imgul li:hover{border:1px solid #0066cc;}
        #imgul li img{width:98%;height:300px;cursor: pointer;}
    </style>
</asp:Content>

