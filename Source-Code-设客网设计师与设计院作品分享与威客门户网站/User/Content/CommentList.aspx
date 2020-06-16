﻿<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Content_CommentList, App_Web_q5rpj2um" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>添加商品</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="index" data-ban="pub"></div>
    <div class="container margin_t10">
        <ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">我的评论</li>
    </ol>
    </div>
    <div class="container">
    <div id="Comment_List">
        <div class="for_nav">
            <ul class="us_Nav">
                <li>评论总数：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></li>
                <li>支持：<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></li>
                <li>反对：<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></li>
            </ul>
        </div>
        <div class="clear"></div>
        <div class="btn_green">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <div class="div_bot">
                    <div class="SideBar">
                        <asp:TextBox ID="txtID" Text='<%# Eval("UserID") %>' Visible="false" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtCommentID" Text='<%# Eval("CommentID") %>' Visible="false" runat="server"></asp:TextBox>
                        <asp:CheckBox ID="chkSel" Checked="false" runat="server" Visible='<%# IsHimself(Eval("UserID")) %>' />评论人：<%# GetUserName(Eval("UserID","{0}")) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;评论意见：<span><%# GetPK(Eval("PK","{0}")) %></span>
                    </div>
                    <div class="ListText">
                        <%# Eval("Contents")%>
                    </div>
                    <div style="width: 100%; height: 40px;">
                        <span style="width: 80%;"></span><span id="Span1" style="float: right; margin-right: 80px;">
                            <%# GetImg(Eval("status","{0}")) %>
                        </span>
                    </div>
                    <div style="width: 100%; height: 20px;">
                        <span style="width: 80%;"></span><span id="" style="float: right; margin-right: 30px;">
                            <asp:LinkButton ID="lbFj" CommandArgument='<%#Eval("Files") %>' CommandName="upload" Visible='<%# !string.IsNullOrEmpty(Eval("Files","{0}"))  %>' Enabled='<%# !string.IsNullOrEmpty(Eval("Files","{0}"))  %>' runat="server">附件下载</asp:LinkButton>
                        </span>
                    </div>

                    <div class="ListTime">
                        评论时间：<%# Convert.ToDateTime(Eval("CommentTime")).ToString("yyyy-MM-dd HH:mm:ss") %> &nbsp;&nbsp;评分：<%# Eval("Score")%>
                    </div>
                </div>
                <div class="clear"></div>
            </ItemTemplate>
        </asp:Repeater>
        <div>
            <div class="tdbg">
                <div align="center" class="tdbgleft">
                    共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    个信息
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
                    <asp:Label ID="pagess" runat="server" Text="" />个信息/页 转到第<asp:DropDownList ID="DropDownList1"
                        runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    页<asp:HiddenField ID="HdnItemID" runat="server" />
                    <asp:HiddenField ID="HdnTitle" runat="server" />
                </div>
                <div>
                    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged" Text="全选" />&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="批量中标" class="btn btn-primary" OnClientClick="if(!IsSelectedId()){alert('请选择中标项');return false;}else{return confirm('你确定要将所有选择项中标吗？')}" UseSubmitBehavior="true" OnClick="Button2_Click" />
                </div>
            </div>
        </div>
            </div>
    </div>
        </div>
</asp:Content>
