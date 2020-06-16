<%@ page language="C#" autoeventwireup="true" inherits="test_RouteConfig, App_Web_zol0bvcz" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>网站路由器</title>
    <script type="text/javascript" src="/JS/Controls/Control.js"></script>
    <script type="text/javascript" src="/JS/ZL_Regex.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="bs-example bs-example-standalone" data-example-id="dismissible-alert-js">
<div class="alert alert-danger alert-dismissible fade in margin_b2px" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>欢迎使用站点路由器，使您的目录绑定域名!</strong> 在使用前您需要对您的域名进行泛解析或在本地设置Host文件进行测，关于这一教程您可以访问逐浪官网搜索与“站群”相关的内容。
</div>
<table class="table table-striped table-bordered table-hover">
<tr>
  <td style="width:60px;"></td>
  <td>别名</td>
  <td>类型</td>
  <td>域名</td>
  <td>指向</td>
  <td>操作</td>
</tr>
<tr>
  <td></td>
  <td>能力中心</td>
  <td>系统内置</td>
  <td><a href="/Home" target="_blank" title="点击浏览">Home</a></td>
  <td><a href="/Plat/Blog/" target="_blank" title="浏览页面">/Plat/Blog/</a></td>
  <td><a class="disabled">修改</a><a class="disabled">删除</a></td>
</tr>
<tr>
  <td></td>
  <td>贴吧</td>
  <td>系统内置</td>
  <td><a href="/Index" target="_blank" title="点击浏览">Index</a></td>
  <td><a href="/Guest/Bar/" target="_blank" title="浏览页面">/Guest/Bar/</a></td>
  <td><a class="disabled">修改</a><a class="disabled">删除</a></td>
</tr>
<tr>
  <td></td>
  <td>百科</td>
  <td>系统内置</td>
  <td><a href="/Baike" target="_blank" title="点击浏览">Baike</a></td>
  <td><a href="/Guest/Baike/" target="_blank" title="浏览页面">/Guest/Baike/</a></td>
  <td><a class="disabled">修改</a><a class="disabled">删除</a></td>
</tr>
    <tr>
  <td></td>
  <td>问答</td>
  <td>系统内置</td>
  <td><a href="/Ask" target="_blank" title="点击浏览">Ask</a></td>
  <td><a href="/Guest/Ask/" target="_blank" title="浏览页面">/Guest/Ask/</a></td>
  <td><a class="disabled">修改</a><a class="disabled">删除</a></td>
</tr>
<tr>
  <td></td>
  <td>留言</td>
  <td>系统内置</td>
  <td><a href="/Guest" target="_blank" title="点击浏览">Guest</a></td>
  <td><a href="/Guest/" target="_blank" title="浏览页面">/Guest/</a></td>
  <td><a class="disabled">修改</a><a class="disabled">删除</a></td>
</tr>
<tr>
  <td></td>
  <td>OA办公</td>
  <td>系统内置</td>
  <td><a href="/Office" target="_blank" title="点击浏览">Office</a></td>
  <td><a href="/Mis/OA/" target="_blank" title="浏览页面">/Mis/OA/</a></td>
  <td><a class="disabled">修改</a><a class="disabled">删除</a></td>
</tr>
<asp:Repeater runat="server" ID="RPT" OnItemCommand="RPT_ItemCommand">
  <ItemTemplate>
    <tr>
      <td><input type="checkbox" name="idchk" value="<%#Eval("Index") %>" /></td>
      <td><%#Eval("nick") %></td>
      <td><%#GetType() %></td>
      <td><a href="http://<%#Eval("Domain") %>" target="_blank" title="点击浏览"><%#Eval("Domain") %></a></td>
      <td><a href="<%#GetDir(Eval("SendTo").ToString())+"default.aspx" %>" target="_blank" title="浏览页面"> <%#GetDir(Eval("SendTo").ToString()) %> </a></td>
      <td><asp:LinkButton runat="server" CommandArgument='<%#Eval("Index")%>' CommandName="edit2">修改</asp:LinkButton>
        <asp:LinkButton runat="server" CommandArgument='<%#Eval("Index")%>' CommandName="del2" OnClientClick="return confirm('确定要删除吗?');">删除</asp:LinkButton></td>
    </tr>
  </ItemTemplate>
</asp:Repeater>
</table>
<div class="modal fade" id="modeldiv" style="top:20%;">
<div class="modal-dialog" style="width: 460px;">
  <div class="modal-content">
    <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="glyphicon glyphicon-remove-sign">Close</span></button>
    <h4 class="modal-title" id="myModalLabel">添加路由</h4>
    </div>
    <div class="modal-body">
      <table class="table table-bordered">
        <tr>
          <td>类型</td>
          <td><asp:DropDownList runat="server" ID="TypeDP" CssClass="form-control" Enabled="false">
              <asp:ListItem Value="2">二级域名</asp:ListItem>
            </asp:DropDownList></td>
        </tr>
        <tr>
          <td style="width:50px">别名</td>
          <td><asp:TextBox runat="server" ID="nick_t" CssClass="form-control" data-enter="0"/></td>
        </tr>
        <tr>
          <td>域名</td>
          <td><div class="input-group"> <span class="input-group-addon">http://</span>
              <asp:TextBox runat="server" ID="domain_t" CssClass="form-control" data-enter="1"/>
            </div>
            <p>必须解析到网站服务器并开放80端口独占状态</p>
          </td>
        </tr>
        <tr>
          <td>指向</td>
          <td><asp:TextBox runat="server" ID="sendto_t"  CssClass="form-control" data-enter="2"/>
            <p>示例:/Guest/Bar/</p></td>
        </tr>
      </table>
    <div class="text-center"><asp:Button runat="server" ID="Save_Btn" ValidationGroup="Add" Text="添加" OnClick="Save_Btn_Click" OnClientClick="return CheckData();" CssClass="btn btn-primary" data-enter="3"/>
     <input type="button" value="关闭" class="btn btn-default" onclick="CloseModal();"/></div>
</div>
</div>
</div></div>
<asp:HiddenField runat="server" ID="CurID_Hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
      .disabled{margin-right:5px;color:gray;}
    </style>
<script type="text/javascript">
    function ShowAdd()
    {
        $("#domain_t").val("");
        $("#sendto_t").val("");
        $("#Save_Btn").val("添加");
        $("#CurID_Hid").val("");
        ShowModal();
    }
    function ShowModal() {
        $("#modeldiv").modal({});
        setTimeout(function () { $("#nick_t").focus(); },300);
    }
    function CloseModal() {
        $("#modeldiv").modal("hide");
    }
    function CheckData() {
        flag = false;
        var nick = $("#nick_t").val().replace(/ /g, "");
        var dir = $("#sendto_t").val().replace(/ /g, "");
        var domain = $("#domain_t").val().replace(/ /g, "");
        if (ZL_Regex.isEmpty(nick,dir,domain)) {
            alert("目录,别名,二级域名不能为空");
        }
        else if (ZL_Regex.isContainChina(domain)) {
            alert("域名不能带中文");
        }
        else if (domain.indexOf(".") < 0) {
            alert("二级域名格式不正确,示例:club.demo.com");
        }
        else { flag = true; }
        return flag;
    }
    $(function () {
        $(".disabled").click(function () {
            alert("提示：系统内置路由器不允许操作！");
        });
        Control.EnableEnter();
    })
</script>
</asp:Content>
