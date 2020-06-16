<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Guest_InfoList, App_Web_dbnpt1ot" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>词条列表</title>
</asp:Content>
<asp:Content  ContentPlaceHolderID="Content" Runat="Server">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab0" onclick="ShowTabss(0)" data-toggle="tab">所有词条</a></li>
        <li><a href="#tab1" data-toggle="tab" onclick="ShowTabss(1)"><%=lang.LF("待审核")%></a></li>
        <li><a href="#tab2" data-toggle="tab" onclick="ShowTabss(2)"><%=lang.LF("已审核")%></a></li>
        <li><a href="#tab3" data-toggle="tab" onclick="ShowTabss(3)">新版本待审</a></li>
    </ul>
<div class="user_t">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Lnk_Click" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据">
        <Columns>
		    <asp:TemplateField HeaderText="选择">
			    <HeaderStyle Width="5%" />
			    <ItemTemplate>
				    <input type="checkbox" name="idchk" title="" value='<%#Eval("ID") %>' />
			    </ItemTemplate>
			    <ItemStyle CssClass="tdbg" />
		    </asp:TemplateField>
            <asp:TemplateField HeaderText="" HeaderStyle-Width="0%" Visible="false">
                    <ItemTemplate>
                    </ItemTemplate>
                    <HeaderStyle Width="0%"></HeaderStyle>
                    <ItemStyle  CssClass="tdbg"></ItemStyle>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="ID" HeaderStyle-Width="5%" >
                <ItemTemplate>
                    <%#Eval("ID")%>
                </ItemTemplate>
                <HeaderStyle Width="5%"></HeaderStyle>
                <ItemStyle  CssClass="tdbg"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="词条" HeaderStyle-Width="12%" >
                <ItemTemplate>
                    <%#Eval("Tittle")%>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" class="l_input" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Tittle")%>'>'></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle Width="12%"></HeaderStyle>
                <ItemStyle CssClass="tdbg"></ItemStyle> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="修改人" HeaderStyle-Width="12%" >
                <ItemTemplate>
                    <%#Eval("UserName")%>
                </ItemTemplate>
                <HeaderStyle Width="12%"></HeaderStyle>
                <ItemStyle CssClass="tdbg"></ItemStyle> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="修改时间" HeaderStyle-Width="10%" >
                <ItemTemplate>
                    <%#Eval("EditTime")%>
                </ItemTemplate>
                <HeaderStyle Width="10%"></HeaderStyle>
                <ItemStyle CssClass="tdbg"></ItemStyle> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="修改原因" >
            <ItemTemplate>
                <%#Eval("Why") %>
            </ItemTemplate>
            <ItemStyle CssClass="tdbg"></ItemStyle> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="审核">
                <ItemTemplate>
                    <%#getcommend(Eval("status"))%>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg"></ItemStyle> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('确实要删除吗？');" CommandArgument='<%#Eval("ID") %>' CommandName="Del" CausesValidation="false">删除</asp:LinkButton>|
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="show" CausesValidation="false">设为显示</asp:LinkButton>
                    
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
	    </Columns>
        <PagerStyle HorizontalAlign="Center"  />
		<RowStyle HorizontalAlign="Center" />
    </ZL:ExGridView>
</div>
<asp:Button ID="Button1"   runat="server" Text="删除选定的词条" UseSubmitBehavior="False" OnClientClick="if(!confirm('确定要批量删除词条吗？')){return false;}" CssClass="btn btn-primary" OnClick="Button1_Click"/>
<asp:Button ID="Button2"   runat="server" Text="审核通过选定的词条" UseSubmitBehavior="False" CssClass="btn btn-primary" OnClick="Button2_Click" />
<asp:Button ID="Button3"  runat="server" Text="取消审核选定的词条" UseSubmitBehavior="False" CssClass="btn btn-primary" OnClick="Button3_Click" />
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript">
    var tID = 0;
    var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3");
    window.onload = function ()
    {
        pload();
    }
    function ShowTabss(ID)
    {
        location.href = 'InfoList.aspx?tittle=<%=Request.QueryString["tittle"] %>&id=' + ID + '&type=' + ID;
    }
    function pload()
    {
        var ID = '<%=Request.QueryString["id"]%>';
        if (ID != tID)
        {
            document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
            document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
            tID = ID;
        }
    }
    $().ready(function ()
    {
        
        if (getParam("type"))
        {
            $("li a[href='#tab" + getParam("type") + "']").parent().addClass("active").siblings("li").removeClass("active");;
        }
    })
</script>
</asp:Content>