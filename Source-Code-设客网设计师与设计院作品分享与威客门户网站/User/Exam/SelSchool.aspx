<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/Common.master" inherits="User_Exam_SelSchool, App_Web_nzoqprnw" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>选择学校</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="input-group text_300">
        <asp:TextBox ID="Search_T" CssClass="form-control" runat="server" placeholder="学校名"></asp:TextBox>
      <span class="input-group-btn">
          <asp:LinkButton ID="Search_Btn" runat="server" OnClick="Search_Btn_Click" CssClass="btn btn-primary"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
      </span>
    </div>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" CssClass="table table-bordered table-striped table-hover margin_t10" EnableTheming="False" 
                OnPageIndexChanging="EGV_PageIndexChanging" EmptyDataText="没有相关学校">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" data-name="<%#Eval("SchoolName") %>" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
                <ItemStyle CssClass="td_s" />
            </asp:TemplateField>
            <asp:BoundField DataField="SchoolName" HeaderText="学校名称" />
            <asp:TemplateField HeaderText="学校微标">
                <ItemTemplate>
                    <%#GetIcon(Eval("Country").ToString()) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="类型">
                <ItemTemplate>
                    <%#GetSchoolType(ZoomLa.Common.DataConverter.CLng(Eval("SchoolType"))) %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <div class="text-center"><button type="button" onclick="GetSchoolName()" class="btn btn-primary">确定</button> <button type="button" class="btn btn-primary" onclick="parent.CloseDiag()">取消</button></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <style>.allchk_l{display:none;}</style>
    <script>
        $(function () {
            $("input[name=idchk]").click(function () {
                $("input[name = idchk]").each(function () { $(this)[0].checked = false; });
                $(this)[0].checked = true;
            });
        });
        function GetSchoolName() {
            parent.GetSchoolName($("input[name=idchk]:checked").data('name'));
        }
    </script>
</asp:Content>


