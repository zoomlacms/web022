<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_ModelManage, App_Web_ckin0fxz" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
<title>模型管理</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
    <div class="text-center"></div>
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" DataKeyNames="ModelID" PageSize="20" OnRowDataBound="Egv_RowDataBound" 
        OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" 
        AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" 
        EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无模型信息！！">
        <Columns>
            <asp:TemplateField HeaderText="操作">
                <HeaderStyle Width="5%" />
                <ItemTemplate>
                    <div class="option_area dropdown" >
                    <a class="option_style" href="javascript:;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bars"></i>操作<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu"> 
                    <li><asp:LinkButton runat="server" CssClass="option_style" CommandName="Field" CommandArgument='<%# Eval("ModelID") %>'><i class="glyphicon glyphicon-align-justify"></i>字段</asp:LinkButton></li>
                    <li><asp:LinkButton runat="server" CssClass="option_style" CommandName="Edit1" CommandArgument='<%# Eval("ModelID") %>'><i class="glyphicon glyphicon-pencil" title="编辑"></i>编辑</asp:LinkButton></li>
                    <li><asp:LinkButton runat="server" CssClass="option_style" CommandName="Copy" CommandArgument='<%# Eval("ModelID")%>' Enabled='<%#GetEnabled(Eval("SysModel").ToString()) %>'><i class="fa fa-paste" title="复制"></i>复制</asp:LinkButton></li>  
                    <li><asp:LinkButton runat="server" CssClass="option_style" CommandName="Del2" CommandArgument='<%# Eval("ModelID") %>' OnClientClick="return confirm('确实要删除此模型吗？');"><i class="glyphicon glyphicon-trash"></i>删除</asp:LinkButton></li>                      
                    </ul>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID">
                <HeaderStyle Width="5%" />
                <ItemTemplate>
                    <strong><%# Eval("ModelID") %></strong>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="模型名称">
                <HeaderStyle Width="15%" />
                <ItemTemplate>
                    <span class="<%#Eval("ItemIcon") %>"></span>
                    <strong><%# Eval("ModelName")%></strong>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="表名">
                <HeaderStyle Width="15%" />
                <ItemTemplate>
                    <strong><%# Eval("TableName")%></strong>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="项目名称">
                <HeaderStyle Width="10%" />
                <ItemTemplate>
                    <strong><%# Eval("ItemName")%></strong>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="模型描述" DataField="Description" HeaderStyle-Width="30%" />           
        </Columns>
        
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
        #AllID_Chk {display:none;}
    </style>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript">
	function getinfo(id) {
		location.href = "AddEditModel.aspx?ModelID=" + id + '&ModelType=<%=ModelType %>';
	}
	HideColumn("1,4,5");
</script>
</asp:Content>