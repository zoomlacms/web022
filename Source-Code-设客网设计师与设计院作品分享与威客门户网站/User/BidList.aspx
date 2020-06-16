<%@ page language="C#" autoeventwireup="true" inherits="User_BidList, App_Web_kh00etpl" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>我的竞标</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="group" data-ban="sub"></div>
<div class="container margin_t10">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active"><%= str %></li>
    </ol>
</div>
<div class="container">
    <div class="us_seta">
        <div class="btn_green">
            <span lang="zh-cn">&nbsp;&nbsp; </span>
            <div style="float: left">
                <asp:DropDownList ID="DDList" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">所有</asp:ListItem>
                    <asp:ListItem Value="1">我的中标</asp:ListItem>
                    <asp:ListItem Value="2">我的达标</asp:ListItem>
                </asp:DropDownList>
            </div>
            <ZL:ExGridView ID="EGV" OnPageIndexChanging="EGV_PageIndexChanging" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="选择" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="center">
                        <ItemTemplate>
                            <asp:CheckBox ID="cheCk" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle Width="5%"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="主题">
                        <ItemTemplate>
                            <asp:HyperLink ID="Title" ToolTip='<%# Eval("PubContentid")%>' NavigateUrl='<%#GetUrl(Eval("PubContentid","{0}"),Eval("pubupid","{0}"))%>' runat="server"><%#GetTitle(Eval("PubContentid","{0}"))%></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="40%" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="参与人数">
                        <ItemTemplate><%#GetPeoCount(Eval("pubupid","{0}"))%> </ItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="PubAddTime" HeaderText="日期" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="center">
                        <HeaderStyle Width="15%"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="状态">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# GetBid(Eval("Optimal","{0}")) %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Optimal") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
                <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious"
                    NextPageText="" PreviousPageText="" Visible="False" />
            </ZL:ExGridView>
            <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" Text="全选" OnCheckedChanged="CheckBox2_CheckedChanged" />
            <asp:Button ID="Button1" runat="server" class="btn btn-primary" Font-Size="9pt" Text="取消" OnClick="Button1_Click" />
        </div>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Drag.js"></script>
    <script type="text/javascript" src="/JS/Dialog.js"></script>
</asp:Content>
