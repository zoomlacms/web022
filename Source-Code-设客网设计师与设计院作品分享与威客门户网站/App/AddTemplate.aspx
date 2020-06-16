<%@ page language="C#" autoeventwireup="true" inherits="manage_APP_AddAPP, App_Web_1c4ndlws" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>添加应用模板</title>
<script src="../JS/CheckContent.js"></script>
      <script type="text/javascript">
          function SelectColor(t, clientId) {
              var url = "../Common/SelectColor.aspx?d=f&t=6";
              var old_color = (document.getElementById(clientId).value.indexOf('#') == 0) ? '&' + document.getElementById(clientId).value.substr(1) : '&' + document.getElementById(clientId).value;
              var color = "";
              if (document.all) {
                  color = showModalDialog(url + old_color, "", "dialogWidth:18.5em; dialogHeight:16.0em; status:0");
                  if (color != null) {
                      document.getElementById(clientId).value = color;
                  } else {
                      document.getElementById(clientId).focus();
                  }
              } else {
                  color = window.open(url + '&' + clientId, "hbcmsPop", "top=200,left=200,scrollbars=yes,dialog=yes,modal=no,width=300,height=260,resizable=yes");
              }
          }

          function Check() {
              var hid = document.getElementById("HidCheck").value;
              if (hid != "") {
                  document.getElementById("Hids").value = document.getElementById("HidCheck").value;
                  if (hid == 0) {
                      document.getElementById("TypeTit").innerText = "栏目ID：";
                      document.getElementById("RadNode").checked = true;
                      document.getElementById("RadCom").checked = false;
                      document.getElementById("LisBox").style.display = "block";
                      document.getElementById("ComBox").style.display = "none";
                  }
                  else if (hid == 1) {
                      document.getElementById("TypeTit").innerText = "内容ID：";
                      document.getElementById("RadNode").checked = false;
                      document.getElementById("RadCom").checked = true;
                      document.getElementById("ComBox").style.display = "block";
                      document.getElementById("LisBox").style.display = "none";
                  }
              }
              else {
                  document.getElementById("HidCheck").value = 0;
              }
          }

          function CheckNode() {
              document.getElementById("TypeTit").innerText = "栏目ID：";
              document.getElementById("RadNode").checked = true;
              document.getElementById("RadCom").checked = false;
              document.getElementById("HidCheck").value = "0";
              document.getElementById("Hids").value = document.getElementById("HidCheck").value;
              document.getElementById("LisBox").style.display = "block";
              document.getElementById("ComBox").style.display = "none";
              document.getElementById("LblNewMessage").innerText = "";
          }
          function CheckCom() {
              document.getElementById("TypeTit").innerText = "内容ID：";
              document.getElementById("RadNode").checked = false;
              document.getElementById("RadCom").checked = true;
              document.getElementById("HidCheck").value = "1";
              document.getElementById("Hids").value = document.getElementById("HidCheck").value;
              document.getElementById("ComBox").style.display = "block";
              document.getElementById("LisBox").style.display = "none";
          }

          function CheckNameExit() {
              var AppName = document.getElementById("TextAppName").value;
              if (AppName == null || AppName == "") {
                  document.getElementById("LblMessage").innerText = "请输入应用名称";
              }
              else {
                  document.getElementById("LblMessage").innerText = "";
              }
          }
          window.onload = Check;
        </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-hover">
    <tbody id="Tabs0">
      <tr>
        
        <td style="width: 150px" class="tdbgleft"><strong>应用名称：</strong></td>
        <td><asp:TextBox ID="TextAppName" onblur="CheckNameExit()" class="form-control text_300" runat="server" />
          <asp:Label ID="LblMessage" runat="server" ForeColor="#FF3300"></asp:Label>  
        </td>
      </tr>
        <tr>
        <td><strong><asp:Label ID="TypeTit" runat="server" Text="栏目ID"></asp:Label></strong></td>
        <td>
            <input id="RadNode" runat="server" onclick="CheckNode()" type="radio" checked="true"/>栏目
            <input id="RadCom" runat="server" onclick="CheckCom()" type="radio"/>内容
<%--            <asp:RadioButtonList ID="RidType" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">栏目</asp:ListItem>
                <asp:ListItem>内容</asp:ListItem>
            </asp:RadioButtonList>--%>
            <br />
            <div id="LisBox" runat="server">
            <asp:ListBox ID="LstNodes" runat="server" DataTextField="NodeName" DataValueField="NodeId"  SelectionMode="Multiple" Height="100px" Width="200px"></asp:ListBox>
            </div>
            <br />
            <div id="ComBox" runat="server" style="display:none;">
            <asp:TextBox ID="TxtCom" onblur="callserver()" CssClass="form-control text_300" runat="server"></asp:TextBox>
            </div>
            <asp:Label ID="LblNewMessage" runat="server" ForeColor="#FF3300"></asp:Label>
            <input type="hidden" id="HidCheck" value="<%=Request["Type"]%>"/>
            <asp:HiddenField ID="Hids" Value="0" runat="server" />
            <%--<asp:RequiredFieldValidator ID="ReqTxtUserName" runat="server" ControlToValidate="NodeID" Text="" SetFocusOnError="false"  ErrorMessage="栏目ID不能为空"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="ValgTextMaxLength" ControlToValidate="NodeID" ValidationExpression="^[0-9]*[1-9][0-9]*$" SetFocusOnError="false" ErrorMessage="请输入正确的栏目ID！" runat="server"></asp:RegularExpressionValidator> --%>
        </td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td class="tdbgleft"><strong>作者：</strong></td>
    <td><asp:TextBox ID="Author" class="form-control text_300" runat="server" /></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td style="width: 150px" class="tdbgleft"><strong>应用简介：</strong></td>
    <td><asp:TextBox ID="Description" TextMode="MultiLine" class="form-control text_300"  Height="87px" Width="300px" runat="server" />
    </td>
    </tr>
<tr>
        <td>
            <strong>颜色：</strong>
        </td>
        <td>
            <asp:TextBox ID="ColorDefault" CssClass="form-control text_300" runat="server" MaxLength="7" Columns="7"></asp:TextBox>
            <button type="button" onclick="SelectColor(this,'ColorDefault');" class="btn btn-primary">选择颜色</button>
        </td>
    </tr>
    <tr>
                        <td>
                            <strong>应用前置图：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Clearimg" runat="server" Width="300px" class="form-control text_300" /> 
                        </td>
                    </tr>
                    <tr class="tdbg" id="addsmallimg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft"  >
                            <strong>应用缩略图：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Thumbnails" runat="server" Width="300px" class="form-control text_300" />
                        </td>
                    </tr>
  </table>
  <div class="clearbox"></div>
  <div style="text-align:center;">
    <asp:Button ID="BtnCommit" runat="server" Text="提交"  class="btn btn-primary" OnClick="Button1_Click" />
    &nbsp;&nbsp; 
    <input type="button" value="返回" onclick="javascript: history.go(-1)"  class="btn btn-primary" />
  </div><asp:HiddenField ID="Furl" runat="server" />
<input type="hidden" id="HidTypes" value='<%=Request["Type"]%>'/>
</asp:Content>
