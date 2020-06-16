<%@ page language="C#" autoeventwireup="true" inherits="User_Exam_QuestList, App_Web_nzoqprnw" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>试题管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="edu" data-ban="ke"></div>
    <div class="container margin_t5">
        <ol class="breadcrumb">
            <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
            <li><a href="/user">用户中心</a></li>
            <li>试题管理<a href='AddEnglishQuestion.aspx'>[添加试题]</a></li>
        </ol>
    </div>
    <div class="container">
        <div class="input-group text_300">
            <asp:TextBox ID="Skey_T" runat="server" CssClass="form-control" placeholder="试题名"></asp:TextBox>
            <span class="input-group-btn">
                <asp:LinkButton ID="Search_B" runat="server" OnClick="Search_B_Click" CssClass="btn btn-default"><i class="glyphicon glyphicon-search"></i></asp:LinkButton>
            </span>
        </div>
        <ul class="nav nav-tabs margin_t5">
            <li id="tab_99"><a href="javascript:;" onclick="ShowTabs(99)">所有试题</a></li>
            <li id="tab_0"><a href="javascript:;" onclick="ShowTabs(0)">单选题</a></li>
            <li id="tab_1"><a href="javascript:;" onclick="ShowTabs(1)">多选题</a></li>
            <li id="tab_2"><a href="javascript:;" onclick="ShowTabs(2)">填空题</a></li>
            <li id="tab_4"><a href="javascript:;" onclick="ShowTabs(4)">完型填空题</a></li>
            <li id="tab_3"><a href="javascript:;" onclick="ShowTabs(3)">解析题</a></li>
            <li id="tab_10"><a href="javascript:;" onclick="ShowTabs(10)">大题</a></li>
        </ul>
        <div>
            <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false"
                class="table table-striped table-bordered table-hover margin_t5" EmptyDataText="暂无试题信息" OnPageIndexChanging="EGV_PageIndexChanging"
                OnRowCommand="gvCard_RowCommand">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="50">
                        <ItemTemplate>
                            <input type="checkbox" name="idchk" value="<%#Eval("p_id") %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="ID" DataField="p_id" />
                    <asp:TemplateField HeaderText="试题标题">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Upd" CommandArgument='<%#Eval("p_id") %>'><%# Eval("p_title")%></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="p_Inputer" HeaderText="作者" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" />
                    <asp:TemplateField HeaderText="难度" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <%#GetDifficult() %>
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
                    <asp:BoundField HeaderText="关键字" DataField="TagKey" />
                    <asp:BoundField DataField="p_CreateTime" HeaderText="创建时间"/>
                    <asp:TemplateField HeaderText="相关操作" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <a href="QuestShow.aspx?id=<%#Eval("p_id") %>" target="_blank">预览</a>
                            <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Upd" CommandArgument='<%#Eval("p_id") %>'>修改</asp:LinkButton>
                            <asp:Button data-name="id" runat="server" CommandName="Upd" CommandArgument='<%#Eval("p_id") %>' Style="display: none;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </ZL:ExGridView>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function ShowTabs(qtype) {
            var url = "QuestList.aspx?qtype=" + qtype + "&skey=<%:Skey%>";
            location = url;
        }
        $(function () {
            $("#tab_<%:QType%>").addClass("active");
        })
    </script>
</asp:Content>
