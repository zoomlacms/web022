<%@ page language="C#" autoeventwireup="true" inherits="manage_Pub_ViewSmallPub, App_Web_5ka2xlr0" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript" src="/JS/Common.js"></script>
    <title>回复管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="r_navigation"> 
<asp:HiddenField ID="HdnModelID" runat="server" />
	<asp:HiddenField ID="HiddenType" runat="server" />
	<asp:HiddenField ID="HiddenPubid" runat="server" />
	<asp:HiddenField ID="HdnID" runat="server" />
	<asp:HiddenField ID="HiddenNode" runat="server" />
</div> 
   <table width="" border="0" cellpadding="0" class="table table-bordered table-hover table-striped" cellspacing="0">
        <tr  align="center">
            <td id="TabTitle0" onclick="ShowTabs(0,1)"  >所有信息 </td>
            <td id="TabTitle1" onclick="ShowTabs(1,3)"> 待审核信息 </td>
            <td id="TabTitle2" onclick="ShowTabs(2,2)"> 已审核信息 </td>
        </tr>
    </table> 
    <ZL:ExGridView ID="Egv" runat="server" AllowPaging="True"  AutoGenerateColumns="False" DataKeyNames="ID" class="table table-bordered table-hover table-striped" PageSize="20" OnRowDataBound="Egv_RowDataBound"  OnPageIndexChanging="Egv_PageIndexChanging"
        OnRowCommand="Lnk_Click" Width="100%" ShowFooter="False">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <HeaderStyle Width="5%"   HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:CheckBox ID="chkSel" runat="server" />
                </ItemTemplate>
                <ItemStyle    HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <%#Eval("ID") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="标题">
                <HeaderStyle Width="30%"   HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="View" CommandArgument='<%# Eval("ID") %>'><%# Eval("PubTitle", "{0}")%></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle  HorizontalAlign="left"   />
            </asp:TemplateField>
            <asp:BoundField DataField="PubIP" HeaderText="IP地址">
                <HeaderStyle Width="15%"   HorizontalAlign="Center" />
                <ItemStyle  HorizontalAlign="Center"   />
            </asp:BoundField>
            <asp:BoundField DataField="Pubnum" HeaderText="参与人数">
                <HeaderStyle Width="10%"   HorizontalAlign="Center" />
                <ItemStyle    HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="发表日期">
                <HeaderStyle Width="10%"   HorizontalAlign="Center" />
                <ItemTemplate>
                    <%# Eval("PubAddTime", "{0:yyyy-MM-dd}")%>
                </ItemTemplate>
                <ItemStyle  HorizontalAlign="Center"   />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
                <HeaderStyle Width="10%"   HorizontalAlign="Center" />
                <ItemTemplate>
                    <%# shenhe(Eval("Pubstart", "{0}"))%>
                </ItemTemplate>
                <ItemStyle  HorizontalAlign="Center"   />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <HeaderStyle   HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ID") %>'>修改</asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("ID") %>'  OnClientClick="return confirm('你确定将该数据彻底删除吗？')">删除</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Audit" CommandArgument='<%# Eval("ID") %>'>审核</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle  HorizontalAlign="Center"   />
            </asp:TemplateField>
        </Columns>
        <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px"/>
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
        <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
        <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="" PreviousPageText="" Visible="False" />
    </ZL:ExGridView>
    <div class="clearbox">
    </div>
    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged"  Text="全选" />
    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="批量删除" UseSubmitBehavior="False" OnClientClick="if(!confirm('确定要批量删除评论吗？')){return false;}" OnClick="Button1_Click" />
    <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="审核通过" UseSubmitBehavior="False" OnClick="Button2_Click" />
    <asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="取消审核" UseSubmitBehavior="False" OnClick="Button3_Click" />
          <asp:Button ID="DownExcel_Btn" CssClass="btn btn-info" runat="server" Text="下载Excel" UseSubmitBehavior="false" OnClick="DownExcel_Btn_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function OpenLink(lefturl, righturl) {
            if (lefturl != "") {
                parent.frames["left"].location = lefturl;
            }
            try {
                parent.MDIOpen(righturl); return false;
            } catch (Error) {
                parent.frames["main_right"].location = righturl;
            }
        }
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2");
        window.onload = function () {
            pload();
        }
        function ShowTabs(ID, type) {
            location.href = 'ViewSmallPub.aspx?Pubid=<%=Request.QueryString["Pubid"] %>&ID=<%=Request.QueryString["ID"] %>&type=' + type + '&ids=' + ID;
    }
    function pload() {
        var ID = '<%=Request.QueryString["ids"]%>';
        if (ID != tID) {
            tID = ID;
            document.getElementById(arrTabTitle[tID].toString()).style.color = "black";
            document.getElementById(arrTabTitle[ID].toString()).style.color = "red";
        }
    }
</script>   
</asp:Content>