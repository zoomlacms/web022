<%@ page language="C#" autoeventwireup="true" inherits="Common_Dialog_SelContent, App_Web_dasombaf" validaterequest="false" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>选择内容</title>
<style>
#AllID_Chk{display:none;}
.selected{background-color:#ccc !important;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="text_300">
        <div class="input-group">
            <asp:TextBox ID="Search_T" runat="server" CssClass="form-control" placeholder="请输入关键字"></asp:TextBox>
          <span class="input-group-btn">
            <asp:LinkButton ID="Search_L" runat="server" CssClass="btn btn-default" OnClick="Search_L_Click"><i class="glyphicon glyphicon-search"></i></asp:LinkButton>
          </span>
        </div>
    </div>
    
    <ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnPageIndexChanging="EGV_PageIndexChanging" class="table table-striped table-bordered table-hover margin_t5" PageSize="10" >
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="radio" name="GeneralID"  value="<%#Eval("GeneralID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="GeneralID" HeaderText="ID" />
            <asp:TemplateField HeaderText="标题">
                <ItemTemplate>
                    <%#Eval("Title") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Inputer" HeaderText="录入者" />
            <asp:BoundField DataField="Hits" HeaderText="点击数" />
        </Columns>
    </ZL:ExGridView>
    <asp:HiddenField ID="HtmlContent_Hid" runat="server" />
    <div class="text-center">
        <asp:Button ID="SelContent_B" runat="server" CssClass="btn btn-primary" Text="选择" OnClick="SelContent_B_Click" />
        <button type="button" class="btn btn-primary" onclick="parent.CloseDiag()">取消</button>
    </div>
    <script>
        $().ready(function () {
            $("#EGV tr").click(function () {
                var radio = $(this).find("input[name='GeneralID']")[0];
                if (radio) {
                    radio.checked = true;
                    $("#EGV tr").removeClass('selected');
                    $(this).addClass('selected');
                }
            });
        });
        function SetContent(title) {
            parent.GetContent($("#HtmlContent_Hid").val(),title);
        }
    </script>
</asp:Content>
