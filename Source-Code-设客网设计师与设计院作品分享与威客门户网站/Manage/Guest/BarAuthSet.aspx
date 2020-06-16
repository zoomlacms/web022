<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Guest_BarAuthSet, App_Web_dbnpt1ot" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>权限设置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="input-group pull-left" style="display:block;"><asp:TextBox ID="Search_T" placeholder="用户名" CssClass="form-control text_md" runat="server"></asp:TextBox>
        <span class="input-group-btn"><asp:Button ID="Search_B" OnClick="Search_B_Click" CssClass="btn btn-default pull-left" runat="server" Text="搜索" /></span>
    </div>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="15" EnableTheming="False"
        CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!"
        OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" onclick="RowChk(this);" />
                    <asp:HiddenField runat="server" ID="Uid_Hid" Value='<%#Eval("UserID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="用户名" DataField="UserName" HeaderStyle-Width="120px" />
                  <asp:TemplateField HeaderText="访问">
                      <HeaderTemplate>
                           <label><input type="checkbox"  onclick="ColChk('Look');" />访问</label>
                      </HeaderTemplate>
                      <ItemTemplate>
                          <input type="checkbox" data-auth="Look" runat="server" ID="Look"/>
                      </ItemTemplate>
                  </asp:TemplateField>
            <asp:TemplateField >
                <HeaderTemplate>
                    <label><input type="checkbox" onclick="ColChk('Send');" />发贴</label>
                </HeaderTemplate>
                <ItemTemplate>
                    <input type="checkbox" runat="server" data-auth="Send" ID="Send" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <label><input type="checkbox" onclick="ColChk('Reply');" />回贴</label>
                </HeaderTemplate>
                <ItemTemplate>
                     <input type="checkbox" runat="server" data-auth="Reply" ID="Reply" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                 <%--   <a href="AddShop.aspx?ID=<%#Eval("ID") %>" title="修改">修改</a>
                    <asp:LinkButton runat="server" CommandName="Del2" CommandArgument='<%#Eval("UserID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">
                                删除</asp:LinkButton>--%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
    <asp:Button runat="server" ID="Save_Btn" Text="保存" CssClass="btn btn-primary" OnClick="Save_Btn_Click" />
    <a href="GuestCateMana.aspx?Type=1" class="btn btn-primary">返回</a>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function RowChk(obj) {
            $(obj).closest("tr").find(":checkbox").each(function () { this.checked = obj.checked; });
        }
        function ColChk(name) {
            obj = event.srcElement;
            $(":checkbox[data-auth=" + name + "]").each(function () { this.checked = obj.checked; });
        }
    </script>
</asp:Content>