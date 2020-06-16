<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_AuthorManage, App_Web_jzh2rzwp" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>添加来源</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
    <div class="btn-group marginbot10">
<a href="AddSource.aspx" class="btn btn-primary" >添加来源</a>
<a href="Author.aspx"  class="btn btn-primary" >添加作者</a>
<a href="AddKeyWord.aspx"  class="btn btn-primary" >添加关键字</a>
    </div>
    <div class="clearfix"></div>
    <ZL:ExGridView RowStyle-HorizontalAlign="Center"  CssClass="table table-striped table-bordered table-hover" ID="EGV" DataKeyNames="ID" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" Width="100%" EnableTheming="False" GridLines="None" CellPadding="2" CellSpacing="1" OnPageIndexChanging="GridView1_PageIndexChanging" EmptyDataText="当前没有信息">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" title="" value='<%#Eval("ID") %>' />
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" />
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="序号">
                <ItemStyle CssClass="authid" HorizontalAlign="Center" />
                </asp:BoundField>                  
            <asp:TemplateField HeaderText="作者名称">
                <ItemTemplate>
                    <a href="Author.aspx?Action=Modify&AUId=<%#Eval("ID")%>">
                        <%# DataBinder.Eval(Container.DataItem,"Name")%>
                    </a>
                </ItemTemplate>
                    <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="作者分类">
            <HeaderStyle/>
                <ItemTemplate>
                    <%#DataBinder.Eval(Container.DataItem, "Type")%>
                </ItemTemplate>
                    <ItemStyle CssClass="tdbg" />
            </asp:TemplateField>                     
            <asp:TemplateField HeaderText="操作">
            <HeaderStyle Width="19%" />
            <ItemTemplate>
                <a href='Author.aspx?Action=Modify&AUId=<%# Eval("ID")%>' >修改</a>
                <a href="javascript:if(confirm('你确定要删除吗?')) window.location.href='AuthorManage.aspx?AUId=<%# Eval("ID")%>';">删除</a> 
            </ItemTemplate>
                <ItemStyle CssClass="tdbg" />
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
    </ZL:ExGridView>
    <div class="clearfix"></div>                   
    <table  class="TableWrap"  border="0" cellpadding="0" cellspacing="0" width="100%" id="sleall">
        <tr>
            <td class="text-center">
                <asp:Button ID="btndelete" class="btn btn-primary" style="width:110px;"  runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" Text="删除选定作者" OnClick="btndelete_Click" />
                <input name="Cancel" type="button" style="width:127px;"  class="btn btn-primary" id="Cancel" value="添加一个新作者" onclick="javascript: window.location.href = 'Author.aspx'" />
            </td>
        </tr>
    </table>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $().ready(function () {
            $("#EGV tr").dblclick(function () {
                var id = $(this).find(".authid").text();
                if (id) {
                    location = "Author.aspx?Action=Modify&AUId=" + id;
                }
            });
        });
    </script>
    <style>
        th{ text-align:center;}
    </style>        
</asp:Content>