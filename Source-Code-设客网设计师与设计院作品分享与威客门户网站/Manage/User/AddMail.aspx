<%@ page language="C#" autoeventwireup="true" inherits="manage_Qmail_AddMail, App_Web_1jbandww" enableviewstatemac="false" validaterequest="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮件发送</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <!--<div id="nodeNav" class="col-lg-2 col-md-2 col-sm-2 col-xs-12 divBorder" style="padding:0 0 0 0;">
    <ZL:UserGuide runat="server" />
    </div>
    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">-->
<div id="nav_box">
</div>
<div class="h_30"></div>
  <div>
    <table class="table table-striped table-bordered table-hover">
      <tr>
        <td width="" align="right" class="tdbgleft"><strong>收件人：</strong></td>
        <td><table>
            <tr>
              <td>
                  <table>
                      <tr>
                          <td>来源：</td>
                          <td>
                              <asp:DropDownList ID="DropDownList2" class="btn btn-default dropdown-toggle" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                  <asp:ListItem>按全部</asp:ListItem>
                                  <asp:ListItem>按字母查询</asp:ListItem>
                                  <asp:ListItem>按数字查询</asp:ListItem>
                                  <asp:ListItem>按加入日期查询</asp:ListItem>
                                  <asp:ListItem>按最后发送时间查询</asp:ListItem>
                                  <asp:ListItem>按邮箱后缀查询</asp:ListItem>
                                  <asp:ListItem>按订阅类型</asp:ListItem>
                              </asp:DropDownList></td>
                          <td align="left">
                              <asp:DropDownList ID="DropDownList3" class="form-control" runat="server" Visible="false" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"></asp:DropDownList>
                          </td>
                          <td align="left">
                              <asp:TextBox ID="txtType" class="form-control" runat="server"></asp:TextBox></td>
                          <td align="left">
                              <asp:Panel ID="Panel1" Visible="false" runat="server">
                                  <asp:TextBox ID="txtStartTime" onfocus="setday(this)" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' });" class="form-control"></asp:TextBox>
                                  <asp:TextBox ID="txtEndTime" onfocus="setday(this)" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' });" class="form-control"></asp:TextBox>
                                  &nbsp;<br />
                                  &nbsp;
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtStartTime" ErrorMessage="请输入正确的日期" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtEndTime" ErrorMessage="请输入正确的日期" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                              </asp:Panel>
                          </td>
                          <td align="left" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                              <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CausesValidation="false" Text="查 询" /></td>
                      </tr>
                  </table>
              </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtSend" TextMode="MultiLine" Rows="4" Width="760px" runat="server" Enabled="False" class="form-control" Style="display: inline;"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSend" ErrorMessage="没有收件人信息。"></asp:RequiredFieldValidator></td>
            </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td align="right" class="tdbgleft"><strong>邮件主题：</strong></td>
        <td><asp:TextBox ID="TxtSubject" runat="server"   class="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="ValrSubject" runat="server" ControlToValidate="TxtSubject" Display="None" ErrorMessage="邮件主题不能为空！"></asp:RequiredFieldValidator></td>
      </tr>
      <tr>
        <td align="right" class="tdbgleft"><strong>邮件内容：</strong></td>
        <td>
            <textarea runat="server" id="HiddenField1" rows="15" style="width:760px;;height:300px;" ></textarea>
            </td>
      </tr>
      <tr>
        <td align="right" class="tdbgleft" width=""><strong>签  名：</strong></td>
        <td><asp:DropDownList ID="ddlMailIdiograph" class="form-control" width="150px" runat="server" DataTextField="Name" DataValueField ="Context"></asp:DropDownList></td>
      </tr>
      <tr>
        <td align="right" class="tdbgleft"><strong>发送方式：</strong></td>
        <td><table>
            <tr>
              <td><asp:RadioButtonList ID="rblSendType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblSendType_SelectedIndexChanged">
                  <asp:ListItem Selected="True">立即发送</asp:ListItem>
                  <asp:ListItem>定时发送</asp:ListItem>
                </asp:RadioButtonList></td>
              <td id="td1" runat ="server" visible="false"><asp:TextBox ID="txtSendTime" onfocus="setday(this)" Width="60px" runat="server"></asp:TextBox>
                <asp:DropDownList ID="ddlHour" runat="server"> </asp:DropDownList>
                时
                <asp:DropDownList ID="ddlMinute" runat="server"> </asp:DropDownList>
                分</td>
            </tr>
          </table></td>
      </tr >
      <tr>
        <td colspan="2" style="text-align:center;"><asp:Button ID="BtnSend" class="btn btn-primary" runat="server" Text="发送" Width="60px" OnClick="BtnSend_Click" />
          &nbsp;&nbsp; &nbsp;
          <input id="Reset1" class="btn btn-primary" type="reset" value=" 清除 " width="60px"  /></td>
      </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"  ShowSummary="False" />
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
     <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script> 
     <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
     <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script> 
     <script type="text/javascript">UE.getEditor('HiddenField1');</script>
</asp:Content>