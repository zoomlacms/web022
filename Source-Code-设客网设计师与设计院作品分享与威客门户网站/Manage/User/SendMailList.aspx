<%@ page language="C#" autoeventwireup="true" inherits="manage_Qmail_SendMailList, App_Web_3vlddosr" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮件订阅</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
      <tr class="tdbg">
        <td align="center" class="spacingtitle"> 发送邮件列表</td>
      </tr>
      <tr>
        <td>
             <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="ID">
            <Columns>
            <asp:TemplateField HeaderText="标题">
              <ItemTemplate> <a href='MailShow.aspx?id=<%#DataBinder.Eval(Container.DataItem,"ID")%>'><%#DataBinder.Eval(Container.DataItem, "MailTitle")%></a> </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="发送时间" DataField="MailSendTime" />
            <asp:TemplateField HeaderText="邮件状态">
              <ItemTemplate> <%#GetState(DataBinder.Eval(Container.DataItem, "MailState").ToString())%> </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="center" />
            </Columns>
           <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center"  />
    </ZL:ExGridView>
                 
            </td>
      </tr>   
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
