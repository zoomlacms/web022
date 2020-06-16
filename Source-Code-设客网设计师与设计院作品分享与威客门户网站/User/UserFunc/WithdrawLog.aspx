<%@ page language="C#" autoeventwireup="true" inherits="User_UserFunc_WithdrawLog, App_Web_jaigsi5h" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="/JS/DatePicker/WdatePicker.js"></script>
    <title>提现日志</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
      <ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/User/UserFunc/Moneyconver.aspx">币值转换</a></li>
        <li class="active"><a href="<%=Request.RawUrl %>">提现日志</a></li>
    </ol>
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="input-group margin_l5" style="width:439px;">
                <asp:TextBox runat="server" ID="STime_T" placeholder="起始时间" CssClass="form-control text_md" onclick="WdatePicker({})" />
                <asp:TextBox runat="server" ID="ETime_T" placeholder="结束时间" CssClass="form-control text_md" onclick="WdatePicker({})"/>
                <span class="input-group-btn">
                    <asp:LinkButton runat="server" ID="Skey_Btn" CssClass="btn btn-default" OnClick="Skey_Btn_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                </span>
            </div>
        </div>
    </div>
  <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="无提现记录!!" 
                OnPageIndexChanging="EGV_PageIndexChanging">
      <Columns>
          <asp:TemplateField>
              <ItemTemplate>
                  <input type="checkbox" name="idchk" value="<%#Eval("Y_ID") %>" />
              </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="申请日期"><ItemTemplate><%#Eval("sTime","{0:yyyy年MM月dd日 HH:mm}") %></ItemTemplate><ItemStyle  Width="200"/></asp:TemplateField>
          <asp:TemplateField HeaderText="提现金额"><ItemTemplate><%#Eval("money","{0:f2}") %></ItemTemplate></asp:TemplateField>
          <asp:TemplateField HeaderText="手续费"><ItemTemplate><%#GetCost() %></ItemTemplate></asp:TemplateField>
          <asp:TemplateField HeaderText="状态"><ItemTemplate><%#GetStatus() %></ItemTemplate></asp:TemplateField>
          <asp:BoundField HeaderText="拒绝理由" DataField="Result" />
          <asp:BoundField HeaderText="备注" DataField="Remark" />
      </Columns>
      </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
