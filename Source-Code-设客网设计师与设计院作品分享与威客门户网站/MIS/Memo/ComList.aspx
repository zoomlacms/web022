<%@ page language="C#" autoeventwireup="true" inherits="MIS_Memo_ComList, App_Web_zwf0mx51" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>评论</title>
<script type="text/javascript">
    //弹出DIV
    function ShowDiv(div_id) {
        var div_obj = $("#" + div_id);
        div_obj.animate({ opacity: "show", left: 300, top: 660, width: div_obj.width, height: div_obj.height }, 300);
    }
    //隐藏DIV
    function HideDiv(div_id) {
        $("#" + div_id).animate({ opacity: "hide" }, 300);
    }

    function GetID(id, Cont) {
        document.getElementById("HidID").value = Cont;
        document.getElementById("Txtcos").innerText=id;
        document.getElementById("divEdits").style.display = "block";
    }
</script>
<style>
.spanU{float:left;  width:30px; padding-top:5px;}
.uface{width:30px;height:30px;}
.divuinfo{position:relative;background-color:#fdfce6;}
.divuinfo p{float:left; padding:0; margin:0; padding-left:10px;  }
.divuinfo li{border-bottom:dotted 1px #ccc;}
.divuinfo .spedt{ display:block; text-align:right;}

#Contents{background-color:#808080;  width:680px; height:228px; padding-top:-100px;}
#Close { text-align:right;}
.Close{ float:right; padding-right:10px;}
#head{ padding-top:-50px;}
.TextDiv{background-color:#fff; width:660px; margin-left:10px; border:solid 1px #808080;}
#TxtComment{}
#BtnSubmit{ text-align:right; padding-right:10px;}
#hidenComment{display:none;}
.BtnDiv{ float:right; padding-right:10px;}
#divEdits{display:none;}
</style>
</head>
<body>
<form id="form2" runat="server">

<div class="divuinfo">
    <ul>
<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommmand">
    <ItemTemplate>
     <li><span class="spanU"><%#getUserface(Eval("UserID","{0}")) %></span>
         <p><span><%#getUserInfo(Eval("UserID","{0}")) %></span><%#Eval("CommentTime") %>
          <br /><%#Eval("Contents") %>
         </p>
         <div class="clear"></div>
       <span class="spedt">
           <a href="#" title="" onclick="GetID('<%#Eval("Contents")%>','<%#Eval("CommentID")%>')">编辑</a>
           <asp:LinkButton ID="del" runat="server" CommandArgument='<%#Eval("CommentID")%>' CommandName="Del" Text="删除"></asp:LinkButton></span></li>
    </ItemTemplate>
</asp:Repeater>
     <li>
        <asp:LinkButton ID="LinkMore" runat="server" OnClick="LinkMore_Click"></asp:LinkButton>
        <input id="HidComID" type="hidden" />
        <input type="hidden" id="HidID" runat="server" />
     </li> 
     <li>
    </li>
  </ul>
</div>

<div id="divEdits">
    <div class="heads">
        <div class="Close"><a href="#" title="" onclick="HideDiv('divEdits')">关闭</a></div>
    </div>
    <div class="TextDiv">
        <asp:TextBox ID="Txtcos" runat="server" TextMode="MultiLine" Height="139px" Width="658px"></asp:TextBox>
        <br />
        <asp:CheckBox ID="Chk" runat="server" Text="提醒所有共享人"/>
    </div>
    <div class="BtnDiv">
        <asp:Button ID="BtnSub" runat="server" Text="提交" OnClick="BtnSub_Click"/>&nbsp;<input type="button" ID="BtnClose" onclick="HideDiv('divEdits')" value="取消" />
    </div>
</div>
</form>
</body>
</html>
