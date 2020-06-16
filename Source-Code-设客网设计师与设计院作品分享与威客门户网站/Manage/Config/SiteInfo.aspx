<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Config_SiteInfo, App_Web_zol0bvcz" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableviewstate="False" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>网站信息配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr >
            <td class="tdbgleft"><strong><%:lang.LF("网站名称") %>：</strong></td>
            <td><asp:TextBox ID="TextBox1" runat="server"  class=" form-control text_300"></asp:TextBox></td>
        </tr>
        <tr >
            <td class="tdbgleft"><strong><%:lang.LF("网站标题") %>：</strong></td>
            <td><asp:TextBox ID="TextBox2" runat="server"  class="form-control text_300"></asp:TextBox></td>
        </tr>
        <tr >
          <td class="tdbgleft"><strong><%:lang.LF("网站地址") %>：</strong></td>
          <td><asp:TextBox ID="TextBox3" runat="server"  class="form-control text_300" ></asp:TextBox>
             <span Style="color:#1e860b;" >当前网址：<asp:Literal ID="siteurl" runat="server"></asp:Literal></span>
              <asp:RequiredFieldValidator ID="RF1" runat="server" ControlToValidate="TextBox3" ErrorMessage="网址不能为空"  Style="float:left;" Display="Dynamic" />
              <asp:RegularExpressionValidator ID="RF2" ValidationExpression="^[a-zA-z]+://[^s]*[^d]*$" runat="server" ErrorMessage="网址格式错误，需加'http://'头" ControlToValidate="TextBox3"  Display="Dynamic" />
            </td>
        </tr>
           <tr >
          <td class="tdbgleft"><strong><%:lang.LF("后台路径") %>：</strong></td>
          <td><asp:TextBox ID="CustomPath" runat="server"  MaxLength="10" class="form-control text_300" onkeyup="value=value.replace(/[^\w\/]/ig,'')"  />
              <span style="color:#1e860b;"> 3-10英文数字组合</span>
        <asp:RequiredFieldValidator ID="CustomPath_R2" SetFocusOnError="true" runat="server" ControlToValidate="CustomPath" Display="Dynamic" ErrorMessage="后台路径不能为空,最小三位!" ForeColor="Red"></asp:RequiredFieldValidator>
		<asp:RegularExpressionValidator ID="CustomPath_R1" ControlToValidate="CustomPath"
			ValidationExpression="^[a-zA-Z0-9_\u4e00-\u9fa5\@\.]{3,10}$" SetFocusOnError="true" runat="server" Display="Dynamic" ErrorMessage="后台路径不能少于三位" ForeColor="Red"></asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr >
            <td class="tdbgleft"><strong><%:lang.LF("LOGO地址") %>：</strong></td>
            <td><asp:TextBox ID="TextBox4" runat="server"  class="form-control text_300"></asp:TextBox></td>
        </tr>
        <tr >
            <td class="tdbgleft"><strong><%:lang.LF("后台LOGO") %>：</strong></td>
            <td><asp:TextBox ID="TextBox11" runat="server"  class="form-control text_300"></asp:TextBox></td>
        </tr>
        <tr class="tdbg">
            <td class="tdbgleft" style="width: 200px; height: 23px;"><strong><%:lang.LF("Banner地址") %>：</strong></td>
            <td><asp:TextBox ID="TextBox5" runat="server"  class="form-control text_300"></asp:TextBox></td>
        </tr>
        <tr>
          <td class="tdbgleft" style="width: 200px;"><strong><%:lang.LF("公司名称") %>：</strong></td>
          <td>
          <asp:TextBox ID="ComName_T"  runat="server" CssClass="form-control text_300"></asp:TextBox>
           </td>
          </tr>
        <tr >
            <td class="tdbgleft"><strong><%:lang.LF("站长姓名") %>：</strong></td>
            <td><asp:TextBox ID="TextBox6" runat="server" class="form-control text_300"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="tdbgleft"><strong><%:lang.LF("站长手机") %>：</strong></td>
            <td><asp:TextBox ID="MasterPhone_T" runat="server" class="form-control text_300" />
                 <asp:RegularExpressionValidator ID="Phone_Reg"  runat="server" ErrorMessage="手机号码格式不正确" SetFocusOnError="true" ForeColor="Red" ControlToValidate="MasterPhone_T"  Display="Dynamic" />
            </td>
        </tr>
        <tr >
            <td class="tdbgleft"><strong><%:lang.LF("站长信箱") %>：</strong></td>
            <td><asp:TextBox ID="TextBox7" runat="server" class="form-control text_300" />
                 <asp:RegularExpressionValidator ID="Email_Reg"  runat="server" ErrorMessage="邮件格式不正确" SetFocusOnError="true" ForeColor="Red" ControlToValidate="TextBox7"  Display="Dynamic" />
            </td>
        </tr>
        <tr >
            <td class="tdbgleft"><strong><%:lang.LF("网站META关键词") %>：</strong></td>
            <td><asp:TextBox ID="TextBox9" runat="server" TextMode="MultiLine" Width="300" Rows="3" Columns="60" class="form-control"></asp:TextBox></td>
        </tr>
        <tr >
            <td class="tdbgleft"><strong><%:lang.LF("网站META网页描述") %>：</strong></td>
            <td><asp:TextBox ID="TextBox10" runat="server" TextMode="MultiLine" Width="300" Rows="3" Columns="60" class="form-control"></asp:TextBox></td>
        </tr>
        <tr >
            <td class="tdbgleft" style="width: 200px; height: 68px;"><strong><%:lang.LF("版权信息") %>：</strong></td>
            <td><asp:TextBox ID="TextBox8" runat="server" TextMode="MultiLine" Width="300" Rows="5" Columns="60" class="form-control"></asp:TextBox></td>
        </tr>
        <tr >
            <td class="tdbgleft"><strong><%:lang.LF("站长统计脚本") %>：</strong></td>
            <td><asp:TextBox ID="allSiteJS" runat="server" TextMode="MultiLine" Width="300" Rows="5" Columns="60" class="form-control" /></td>
        </tr>
    </table>
    <div style="width:100%;text-align:center;">
       <asp:Button ID="Button1" runat="server" Text="保存设置" style="margin-bottom:20px;" OnClick="Button1_Click" class="btn btn-primary" OnClientClick="disBtn(this,2000);"/>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4", "TabTitle5", "TabTitle6", "TabTitle7", "TabTitle8", "TabTitle9");
        var arrTabs = new Array("Div0", "Div1", "Div2", "Div3", "Div4", "Div5", "Div6", "Div7", "Div8", "Div9");
        window.onload = function () {
            pload();
        }
        function ShowTabs(ID) {
            location.href = 'ContentManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&id=' + ID + '&type=' + ID;
        }
        function pload() {
            var ID = '<%=Request.QueryString["id"]%>';
            if (ID != tID) {
                document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
                tID = ID;
            }
        }
        function CheckInfo() {//更新配置前检测
            var a = document.getElementById("<%=CustomPath.ClientID%>").value;
            if (a.length < 3) {
                alert("个性化路径最少三位");
                document.getElementById("<%=CustomPath.ClientID%>").focus();
                return false;
            }
            else if (a.toLowerCase() == "user") {
                alert("不允许使用已有目录名user");
                document.getElementById("<%=CustomPath.ClientID%>").focus();
                return false;
            }
        setTimeout(function () { document.getElementById('Button1').disabled = true; }, 50)
        return true;
    }
    </script>
</asp:Content>