<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Pub_FormManage, App_Web_5ka2xlr0" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>互动表单管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
      <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" 
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="PubID"/>
                    <asp:TemplateField HeaderText="表单名">
                        <ItemTemplate><a href="FormDesign.aspx?ID=<%#Eval("PubID") %>" target="_blank"><%#Eval("PubName") %></a></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="数据表" DataField="PubTableName" />
                    <asp:BoundField HeaderText="创建时间" DataField="PubCreateTime" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="Pubinfo.aspx?menu=edit&ID=<%#Eval("PubID") %>" title="修改配置">配置</a>
                            <a href="FormDesign.aspx?ID=<%#Eval("PubID") %>" target="_blank" title="设计表单">设计</a>
                            <a href="/Rss/FormView.aspx?Pid=<%#Eval("PubID") %>" target="_blank" title="前台浏览">浏览</a>
                            <a href="FormResult.aspx?ID=<%#Eval("PubID") %>" title="查看统计">统计</a>
                            <asp:LinkButton runat="server" CommandName="Del2" CommandArgument='<%#Eval("PubID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">删除</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                   </Columns>
                    <PagerStyle HorizontalAlign="Center" />
                    <RowStyle Height="24px" HorizontalAlign="Center"  />
            </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        $("body").ready(function () {
            $("#EGV").find("tr").dblclick(function () {
                var id = $(this).children().first().text();
                window.location = "Pubinfo.aspx?menu=edit&ID=" + id;
            });
        });
    </script>
</asp:Content>