<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Exam_PublishDesc, App_Web_apw4n2f5" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="/App_Themes/V3.css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" 
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID"><ItemStyle Width="60px" /></asp:BoundField>
                    <asp:TemplateField HeaderText="报纸名">
                        <ItemTemplate>
                          <a href="/Rss/News/ViewPublish.aspx?Pid=<%#Eval("ID") %>" target="_blank" title="前台浏览"><%#Eval("NewsName") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="版面数">
                        <ItemTemplate>
                            <a href="NewsDiv.aspx?Pid=<%#Eval("ID") %>"><%#Eval("TitleNum") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Title" HeaderText="备注" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="/Rss/News/ViewPublish.aspx?Pid=<%#Eval("ID") %>" target="_blank" title="前台浏览">浏览</a><span class="sperspan">|</span>
                            <a href="NewsDiv.aspx?Pid=<%#Eval("ID") %>" title="修改">版面管理</a><span class="sperspan">|</span>
                            <asp:LinkButton runat="server" CommandName="Edit2" CommandArgument='<%#Eval("ID") %>'>修改</asp:LinkButton><span class="sperspan">|</span>
                            <asp:LinkButton runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">删除</asp:LinkButton>
                            <asp:Button runat="server" data-id="EditBtn" CommandName="Edit2" CommandArgument='<%#Eval("ID") %>' style="display:none;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
         <PagerStyle HorizontalAlign="Center" />
         <RowStyle Height="24px" HorizontalAlign="Center" />
     </ZL:ExGridView>
        <script type="text/javascript">
            $().ready(function () {
                $("#EGV tr").dblclick(function () {
                    $(this).find("[data-id=EditBtn]").click();
                });
            });
            function ShowParent(id, title) {
                $obj = $(parent.document);
                $obj.find("#CurID_Hid").val(id);
                $obj.find("#NewsName_T").val(title);
                parent.ShowModal();
            }
        </script>
    </form>
</body>
</html>
