<%@ page language="C#" autoeventwireup="true" inherits="MIS_MisSignSetInfo, App_Web_5qibkz2g" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>考勤设置</title>
<link href="/App_Themes/User.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function loadPage(id, url) {
    $("#" + id).addClass("loader");
    $("#" + id).append("Loading......");
    $.ajax({
        type: "get",
        url: url,
        cache: false,
        error: function () { alert('加载页面' + url + '时出错！'); },
        success: function (msg) {
            $("#" + id).empty().append(msg);

            $("#" + id).removeClass("loader");
        }
    });
}
</script>
</head>
<body>
<div id="Meno">
  <form id="form1" runat="server">
    <div id="pro_left">
      <ul class="AttenLis list-unstyled">
        <li onmouseover="this.style.backgroundColor='#e0e8fc'" onmouseout="this.style.backgroundColor='#f6f9fe'"><a href="/Mis/MisAttendance.aspx">考勤打卡</a></li>
        <li onmouseover="this.style.backgroundColor='#e0e8fc'" onmouseout="this.style.backgroundColor='#f6f9fe'"><a href="#">我的考勤</a></li>
        <li onmouseover="this.style.backgroundColor='#e0e8fc'" onmouseout="this.style.backgroundColor='#f6f9fe'"><a href="#">考勤统计</a></li>
        <li onmouseover="this.style.backgroundColor='#e0e8fc'" onmouseout="this.style.backgroundColor='#f6f9fe'"><a href="#">考勤设置</a></li>
      </ul>
    </div>
    <div id="pro_right">
      <div id="SetSign" style="margin-left:24px;">
        <div class="Chkdays"> 工作日：
          <asp:CheckBoxList ID="cbkDays" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>周一</asp:ListItem>
            <asp:ListItem>周二</asp:ListItem>
            <asp:ListItem>周三</asp:ListItem>
            <asp:ListItem>周四</asp:ListItem>
            <asp:ListItem>周五</asp:ListItem>
            <asp:ListItem>周六</asp:ListItem>
            <asp:ListItem>周日</asp:ListItem>
          </asp:CheckBoxList>
        </div>
        <div class="SetTime"> 上班时间：
          <input id="B_time" class="M_input" type="text"  onfocus="WdatePicker({dateFmt:'HH:mm'});" runat="server"/>
          下班时间：
          <input id="E_time" type="text" class="M_input" onfocus="WdatePicker({dateFmt:'HH:mm'});" runat="server"/>
        </div>
        <div class="BPTime"> 开始执行日期：
          <asp:TextBox ID="TextDate" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" class="M_input" runat="server"/>
        </div>
        <div>
          <asp:Button ID="BtnSub" runat="server" OnClick="BtnSub_Click" CssClass="btn btn-primary i_bottom" Text="提交"/>
          &nbsp;
          <asp:Button ID="BtnReset" runat="server" OnClick="BtnReset_Click" CssClass="btn btn-primary i_bottom" Text="取消"/>
        </div>
      </div>
    </div>
  </form>
</div>
</body>
</html>