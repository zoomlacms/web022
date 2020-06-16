<%@ page language="C#" autoeventwireup="true" inherits="manage_User_MailTemplist, App_Web_3vlddosr" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮件模板</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="divbox" id="nocontent" runat="server">
        <div style="width: 100%; height: 19px; text-align: center;" class="title">邮件模板</div>
        暂无模板
    </div>
    <ZL:ExGridView ID="EGV" runat="server" Width="100%" AllowPaging="true" OnPageIndexChanging="EGV_PageIndexChanging" AutoGenerateColumns="False" OnRowCommand="Row_Command" class="table table-striped table-bordered table-hover">
        <Columns>
            <asp:TemplateField>
                <ItemStyle CssClass="tdbg" Width="5%" HorizontalAlign="Center" />
                <ItemTemplate>
                    <input type="checkbox" name="idchk" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="模板名称">
                <ItemTemplate><a href="AddMailTemp.aspx?id=<%#Eval("ID")%>" title='<%# Eval("TempName")%>'><%# Eval("TempName")%></a> </ItemTemplate>
                <ItemStyle CssClass="tdbg" Width="20%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="缩略图">
                <ItemTemplate>
                    <img src="<%# Eval("Pic")%>" alt="缩略图" width="50" height="50" onerror="this.src='/UploadFiles/nopic.gif';" />
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" Width="10%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="模板类型">
                <ItemTemplate><a href="MailTemplist.aspx?type=<%#Eval("Type")%>" title='<%# Eval("TempName")%>'><%# GetType(Convert.ToInt32(Eval("Type")))%> </a></ItemTemplate>
                <ItemStyle CssClass="tdbg" Width="8%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="创建人">
                <ItemTemplate><%# Eval("AddUser")%> </ItemTemplate>
                <ItemStyle CssClass="tdbg" Width="8%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="创建日期">
                <ItemTemplate><%# Eval("CreateTime", "{0:yyyy-MM-dd}")%> </ItemTemplate>
                <ItemStyle CssClass="tdbg" Width="13%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="View" runat="server" CommandName="View" CommandArgument='<%# Eval("ID")%>'>预览</asp:LinkButton>
                    <asp:LinkButton ID="update" runat="server" CommandName="update" CommandArgument='<%# Eval("ID")%>'>修改</asp:LinkButton>
                    <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteMsg" OnClientClick="if(!this.disabled) return confirm('确实要删除此模板吗？');" CommandArgument='<%# Eval("ID")%>' Text="删除"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" Width="9%" HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <input type="button" id="submit" value="批量删除" class="btn btn-primary" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        $().ready(function () {
            
        });
        function SelecteAllByName(obj,name) {
            var input = document.getElementsByName(name);
            var len = input.length;
            for (var i = 0; i < len; i++) {
                if(input[i].type=="checkbox"){
                    input[i].checked = obj.checked;
                }
            }
        };

    </script>
</asp:Content>
