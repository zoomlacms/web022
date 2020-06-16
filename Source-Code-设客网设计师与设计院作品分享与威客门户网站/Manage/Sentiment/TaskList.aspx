<%@ page language="C#" autoeventwireup="true" inherits="Manage_Sentiment_Source, App_Web_acot4puy" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ID="ContentID1" ContentPlaceHolderID="head">
<title>监测来源</title>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<style>
.addbox{ display:none;}
</style>
</asp:Content>
<asp:Content runat="server"  ContentPlaceHolderID="Content">
<div> 
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging"  OnRowCommand="EGV_RowCommand" >
            <Columns>
                <asp:TemplateField HeaderText="" ItemStyle-CssClass="td_m" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" data-skey="<%#Eval("Condition") %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_m" />
                <asp:BoundField HeaderText="标题" DataField="Title" />
                <asp:BoundField HeaderText="来源" DataField="Source" />
                <asp:BoundField HeaderText="关键字" DataField="Condition" /> 
                <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                <a href="AddTask.aspx?ID=<%#Eval("ID") %>">修改</a>
                <a href="GetReport.aspx?Skey=<%#Eval("Condition") %>">查看报告</a>
                <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del" OnClientClick="return confirm('确定要删除吗');">删除</asp:LinkButton>                
                </ItemTemplate>
                </asp:TemplateField>            
            </Columns>
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
    <input type="button" value="生成报表" class="btn btn-primary" onclick="GetReport();" />
    <asp:Button runat="server" ID="BatDel_Btn" OnClick="BatDel_Btn_Click" Text="批量删除" OnClientClick="return confirm('确定要删除吗');" CssClass="btn btn-primary" />       
</div>     
</asp:Content> 
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function GetReport() {
            var skey = "";
            var $chkarr = $("input[name=idchk]:checked");
            if ($chkarr.length < 1) { alert("请先选择关键词"); return false; }
            $chkarr.each(function () {
                skey += $(this).data("skey") + ",";
            })
            location = "GetReport.aspx?Skey=" + escape(skey);
        }
    </script>
</asp:Content>