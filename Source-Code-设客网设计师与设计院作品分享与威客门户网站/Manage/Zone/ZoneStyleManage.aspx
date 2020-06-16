<%@ page language="C#" autoeventwireup="true" inherits="manage_ZoneStyleManage_StoreStyleManage, App_Web_ikj1rj5m" validaterequest="false" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>空间模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td width="3%" class="text-center">
                </td>
            <td class="text-center td_s">ID</td>
            <td class="text-center td_l"><span>模板缩略图</span></td>
            <td class="text-center"><span>模板名称</span></td>
            <td class="text-center"><span>模板状态</span></td>
            <td class="text-center"><span>操作</span></td>
        </tr>
        <ZL:ExRepeater ID="Productlist" runat="server"  PageSize="10"  PagePre="<tr id='page_tr'><td class='text-center'><input type='checkbox' id='chkAll'/></td><td colspan='10' id='page_td'>" PageEnd="</td></tr>">
            <ItemTemplate>
                <tr>
                    <td class="text-center">
                        <input name="Item" type="checkbox" value='<%# Eval("ID")%>' /></td>
                    <td class="text-center"><%#Eval("ID") %></td>
                    <td class="text-center">
                        <asp:Image ID="img2" runat="server" Width="50" Height="50" onerror="this.src='/Images/nopic.gif';" ImageUrl='<%#GetImg(DataBinder.Eval(Container.DataItem, "ID").ToString())%>' /></td>
                    <td class="text-center"><%#DataBinder.Eval(Container.DataItem, "StyleName")%></td>
                    <td class="text-center"><%#GetState(DataBinder.Eval(Container.DataItem, "StyleState").ToString())%></td>
                    <td class="text-center">
                        <a href="ZoneStyleAdd.aspx?id=<%#Eval("ID")%>">修改</a>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName='<%#Eval("ID")%>' OnClick="Button1_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </ZL:ExRepeater>       
    </table>
     <div>
        <asp:Button ID="SaveBtn" runat="server" class="btn btn-primary" Text="设为启用" CommandName="1" OnClick="SaveBtn_Click" />
        <asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="设为停用" CommandName="0" OnClick="SaveBtn_Click" />
        <asp:Button ID="Button3" runat="server" class="btn btn-primary" Text="批量删除" CommandName="5" OnClick="SaveBtn_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" />
     </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>

    <script>
        $().ready(function () {
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "Item");
            });
        });
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
    </script>
</asp:Content>
