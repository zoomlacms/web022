<%@ page language="C#" autoeventwireup="true" inherits="manage_User_ServiceSeat, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>客服信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
         <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" 
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" DataKeyNames="S_ID" >      
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="td_s">
                    <ItemTemplate><input type="checkbox" name="idchk" value="<%#Eval("S_ID") %>" /></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="客服名称" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "S_Name")%> </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="头像" ItemStyle-CssClass="td_m">
                    <ItemTemplate><img class="img_50" src="<%#Eval("S_FaceImg") %>" onerror="this.src='/Images/nopic.gif'" /></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="用户名" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="26px" HeaderStyle-Height="26px">
                    <ItemTemplate><%#Eval("S_Remrk")%> </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="显示位置" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "S_Index")%> </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="默认客服" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate><%#(DataBinder.Eval(Container.DataItem, "S_Default","{0}") == "1") ? "是" : "否"%> </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作" HeaderStyle-Width="200px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <a href="MsgEx.aspx?Uids=<%#Eval("S_AdminID") %>" title="查看该客服的聊天记录">聊天记录</a>
                        <asp:LinkButton ID="lbtEdit" runat="server" OnClick="lbtEdit_Click">修改</asp:LinkButton>
                        <asp:LinkButton ID="lbtDel" runat="server" OnClick="lbtDel_Click" OnClientClick="javascript:return confirm('你确定要删除这个客服席位吗？')">删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
        <asp:Button runat="server" ID="BatDel_Btn" CssClass="btn btn-primary" Text="批量删除" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定要删除吗?');"/>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
