<%@ page language="C#" autoeventwireup="true" inherits="User_Content_Recyle, App_Web_n12dq2lj" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>黄页回收站</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <link type="text/css" rel="stylesheet" href="/App_Themes/User.css" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/SelectCheckBox.js"></script>
</head>
<body>
    <ol class="breadcrumb">
        <li><a href="MyContent.aspx" style="color: blue;">返回黄页管理</a></li>
        <li class="active">回收站
        </li>
    </ol>
    <form id="form1" runat="server">
        <div>
            <div class="us_seta">
            <ZL:ExGridView runat="server" ID="EGV" DataKeyNames="GeneralID" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
                    <Columns>
                        <asp:TemplateField HeaderText="选择">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSel" runat="server" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="GeneralID" HeaderText="ID">
                            <HeaderStyle Width="6%" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="标题">
                            <HeaderStyle Width="50%" />
                            <ItemTemplate>
                                <a href="<%# GetUrl(Eval("GeneralID", "{0}"))%>" target="_blank"><%# GetModel(Eval("GeneralID", "{0}"))%><%# Eval("Title")%></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="状态">
                            <ItemTemplate>
                                <%# GetStatus(Eval("Status", "{0}")) %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="已生成">
                            <ItemTemplate>
                                <%# GetCteate(Eval("IsCreate", "{0}"))%>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作">
                            <ItemTemplate>
                                <asp:LinkButton ID="Btn_Rec" runat="server" CommandName="Rec" CommandArgument='<%# Eval("GeneralID") %>'>还原</asp:LinkButton>
                                <asp:LinkButton ID="Btn_Del" runat="server" CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' OnClientClick="return confirm('你确定将该数据彻底删除吗？')">彻底删除</asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" />
                    <RowStyle Height="24px" HorizontalAlign="Center"  />
            </ZL:ExGridView>
                <div>
                    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged" Text="选中本页显示的所有项目" />
                    <asp:Button ID="Button1" runat="server" Text="批量还原" OnClick="btnRecAll_Click" OnClientClick="if(!IsSelectedId()){alert('请选择还原项');return false;}else{return confirm('你确定要将所选中的项还原吗？')}" CssClass="btn btn-primary" UseSubmitBehavior="true" />
                    <asp:Button ID="Bat_Del" Text="批量删除" runat="server" OnClick="Bat_Del_Click" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所选中的项删除吗？')}" CssClass="btn btn-primary" />
                    <input type="text" runat="server" id="TxtSearchTitle" class="form-control text_md" style="color: #666;" value="请输入标题" onclick="if (this.value == '请输入标题') { this.value = ''; this.style.color = 'black'; }" onblur="if(this.value==''){this.value='请输入标题';this.style.color='#666';}">
                    <asp:Button ID="Btn_Search" runat="server" Text="搜索" CssClass="btn btn-primary" OnClick="Btn_Search_Click" />
                    <script>
                        document.getElementById("TxtSearchTitle").value.trim();
                    </script>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    <asp:HiddenField ID="HiddenField2" runat="server" />
                    <asp:HiddenField ID="HiddenField3" runat="server" />
                    <asp:HiddenField ID="HiddenField4" runat="server" />
                </div>
            </div>
        </div>
        <asp:HiddenField ID="hdid" runat="server" />
        <asp:HiddenField ID="hdflag" runat="server" />
        <asp:HiddenField ID="hdnoid" runat="server" />
        <asp:HiddenField ID="hdmdid" runat="server" />
    </form>
</body>
</html>
