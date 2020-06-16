<%@ page language="C#" autoeventwireup="true" inherits="Plat_Blog_Contact, App_Web_od3mslno" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:content runat="server" contentplaceholderid="head">
<title>通讯录</title>
</asp:content>
<asp:content runat="server" contentplaceholderid="Content">
  <div class="container-fluid">
    <ol class="breadcrumb">
      <li><a href="/">首页</a></li>
      <li><a href="/Plat/Task/">任务中心</a></li>
      <li>通讯录</li>
    </ol>
  </div>
  <br />
  <div class="input-group" style="width:200px;">
    <input runat="server" id="skey_t" class="form-control" placeholder="请输入搜索内容" type="text" />
    <span class="input-group-btn">
    <asp:Button runat="server" ID="Skey_Btn" Text="搜索" OnClick="Skey_Btn_Click" CssClass="btn btn-default" />
    </span> </div>
  <div style="width:100%"> <br />
    <Zl:ExGridview ID="EGV" AutoGenerateColumns="false" AllowPaging="true" EnableTheming="false" Width="98%" CssClass="table table-bordered table-hover" EmptyDataText="当前没有信息！" OnPageIndexChanging="EGV_PageIndexChanging"  OnRowCommand="EGV_RowCommand" PageSize="10" runat="server">
      <columns>
      <asp:templatefield HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="center">
        <itemtemplate>
          <input type="checkbox" name="idChk" value="<%#Eval("UserID") %>" />
        </itemtemplate>
      </asp:templatefield>
      <asp:BoundField HeaderText="用户名" DataField="UserName" />
      <asp:templatefield headertext="真实名称">
        <itemtemplate> <%# GetGN(Eval("TrueName")) %> </itemtemplate>
      </asp:templatefield>
      <asp:BoundField HeaderText="手机号码" DataField="Mobile" />
      <asp:BoundField HeaderText="所属部门" DataField="GroupName" />
      <asp:TemplateField HeaderText="二维码">
        <ItemTemplate> <span class="glyphicon glyphicon-qrcode" style="font-size:1.3em;color:gray;" title="获取二维码" onclick="GetQrCode(<%#Eval("UserID") %>);"></span>
          <div style="position:absolute;display:none;z-index:5;margin-left:-80px;" id="imgdiv_<%#Eval("UserID") %>" name="imgdiv"><img id="img_<%#Eval("UserID") %>" src="#" style="width:120px;height:120px;" /></div>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:templatefield Headertext="操作">
        <itemtemplate> <a href="/Plat/Mail/MessageSend.aspx?uid=<%#Eval("UserID") %>" title="发送邮件">邮件</a> 
          <!--<a href="#" title="发送短信">短信</a>--> 
        </itemtemplate>
      </asp:templatefield>
      </columns>
    </Zl:ExGridview>
    <div class="clearfix"></div>
    <table  class="TableWrap"  border="0" cellpadding="0" cellspacing="0" width="100%" id="sleall">
      <tr>
        <td style="height: 21px"><asp:Button ID="BtnSetTopPosation" runat="server" CssClass="btn btn-primary" OnClick="BtnSetTopPosation_Click" Text="批量发邮件"  />
          <asp:HiddenField ID="HdnCateID" runat="server" /></td>
      </tr>
    </table>
  </div>
</asp:content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/JQueryAjax.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script>
    $().ready(function () {
        $("#EGV tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");
        $("#chkAll").click(function () {
            selectAllByName(this, "idChk");
            selectAllByName();
        });
    });
    //生成图片,返回图片链接,显示链接,
    function GetQrCode(uid)
    {
        $("div[name=imgdiv]").hide();
        PostToCS2("/User/Left.aspx", "GetQrCode", uid, function (data) { $("#img_" + uid).attr("src", data); $("#imgdiv_" + uid).show(); console.log(data); });
    }
</script>
</asp:Content>