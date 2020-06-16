<%@ page language="C#" autoeventwireup="true" inherits="Manage_Exam_SelQuestion, App_Web_bsieufqv" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title></title>
    <style>
        #AllID_Chk{display:none;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid">
    <ul class="nav nav-tabs hidden-xs hidden-sm">
        <li id="tab_-1"><a href="#tab-1" data-toggle="tab" onclick="ShowTabs(-1)"><%:lang.LF("所有内容") %></a></li>
        <li id="tab_0"><a href="#tab0" data-toggle="tab" onclick="ShowTabs(0)">单选题</a></li>
        <li id="tab_1"><a href="#tab1" data-toggle="tab" onclick="ShowTabs(1)">多选题</a></li>
        <li id="tab_2"><a href="#tab2" data-toggle="tab" onclick="ShowTabs(2)">填空题</a></li>
        <li id="tab_3"><a href="#tab3" data-toggle="tab" onclick="ShowTabs(3)">解析题</a></li>
    </ul>
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"   EnableTheming="False" IsHoldState="false"
                class="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!"  OnPageIndexChanging="EGV_PageIndexChanging" >
        <Columns>
            <asp:TemplateField HeaderText="选择" ItemStyle-CssClass="td_m">
                    <ItemTemplate>
                        <%#GetCheck() %>
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="试题标题">
                    <ItemTemplate>
                        <asp:LinkButton CssClass="p_title" runat="server" CommandName="Upd" CommandArgument='<%#Eval("p_id") %>'><%# Eval("p_title")%></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="类别" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#GetClass(Eval("p_Class","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="题型" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#GetType(Eval("p_Type", "{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:HiddenField ID="SelIds_Hid" runat="server" />
</div>
<div class="container-fluid text-center">
    <asp:Button ID="Sel_B" runat="server" CssClass="btn btn-primary" OnClick="Sel_B_Click" Text="确定" />
    <asp:Button ID="LargeSel_B" visible="false" runat="server"  class="btn btn-primary" OnClick="LargeSel_B_Click" Text="确定" />
     <button class="btn btn-primary" type="button" onclick="CloseDiag()">取消</button>
</div>
<script>
    $().ready(function () {
        $("input[name=idchk]").click(function () {
            var $tr = $(this).closest("tr");
            if ($(this)[0].checked) {
                $("#SelIds_Hid").val($("#SelIds_Hid").val() + "," + $(this).val() + ",");
            } else {
                $("#SelIds_Hid").val($("#SelIds_Hid").val().replace("," + $(this).val() + ",", ","));
            }
        });
        $("#AllID_Chk").click(function () {
            $("input[name=idchk]").each(function (i,v) {
                var $tr = $(v).closest("tr");
                if ($(v)[0].checked) {
                    if ($("#SelIds_Hid").val().indexOf("," + $(v).val() + ",")<0)//判断是否存在该id
                        $("#SelIds_Hid").val($("#SelIds_Hid").val() + "," + $(v).val() + ",");
                } else {
                    $("#SelIds_Hid").val($("#SelIds_Hid").val().replace("," + $(v).val() + ",", ","));
                }
            });
        });
    });
    function ActiveTab(id) {
        $("#tab_" + id).addClass("active");
    }
    function ShowTabs(id) {
        location.href = "SelQuestion.aspx?qtype=" + id + "&pid=<%=Pid %>&selids=" + $("#SelIds_Hid").val()+"&type=<%=Type %>";
    }
    function SelQuestion(qids,qtitle) {
        parent.GetQuestion(qids,qtitle);
    }
    function CloseDiag() {
        parent.CloseComDiag();
    }
    
</script>
</asp:Content>
