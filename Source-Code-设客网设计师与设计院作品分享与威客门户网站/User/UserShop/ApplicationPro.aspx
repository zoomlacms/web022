<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_ApplicationPro, App_Web_0mdweblp" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>商品交换</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">交换商品</li>
    </ol>
    <asp:HiddenField ID="HiddenUserID" runat="server" />
    <asp:HiddenField ID="HiddenPUserID" runat="server" />
    <div style="width: 950px; margin-left: auto; margin-right: auto; margin-top: 50px;">
        <div class="r_navigation">
            <span>商品交换</span>
        </div>
    </div>
    <div>
        <div style="width: 50%; padding: 5px;" class="pull-left">
            <div class="border" style="margin-top: 8px; margin-bottom: 5px;">
                <span>申请方所拥有的商品</span> &gt;&gt; 
                <span>
                    <asp:Label ID="LabelU1" runat="server" Text=""></asp:Label>
                </span>
            </div>
            <ZL:ExGridView ID="GridView1" CssClass="table table-bordered" DataKeyNames="ID" Width="100%" runat="server" AllowPaging="True" PageSize="10" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" EmptyDataText="暂无数据" OnPageIndexChanging="Egv_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="选择交换商品">
                        <HeaderStyle Width="15%" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSel1" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" CssClass="tdbg" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="编号" ItemStyle-Width="12%">
                        <ItemTemplate>
                            <asp:Label ID="Label1a" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" CssClass="tdbg" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="商品名称" ItemStyle-Width="20%">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="Label2a" runat="server" Text='<%# Bind("Proname") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="50%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="价格">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="Label3a" runat="server" Text='<%# Bind("LinPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
            </ZL:ExGridView>
            <div class="border" style="margin-top: 8px; text-align: center">
                <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary" Text="添加商品" OnClick="Button3_Click" />
            </div>
            <div class="border" style="margin-top: 5px;">
                <span>你要交换的商品</span><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
            <div>
                <ZL:ExGridView ID="GridView2" CssClass="table table-striped table-bordered table-hover" DataKeyNames="prodID" Width="100%" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="10%">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSel2" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="编号" ItemStyle-Width="8%">
                            <ItemTemplate>
                                <asp:Label ID="Label2a" runat="server" Text='<%# Bind("prodID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="商品名称">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="Label2b" runat="server" Text='<%# Bind("prodName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="价格" ItemStyle-Width="15%">
                            <ItemTemplate>
                                <asp:Label ID="Label2c" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="数量" ItemStyle-Width="15%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Num") %>' Width="20px"></asp:TextBox>
                                <asp:Button ID="Button5" runat="server" Text="提 交" OnClick="Button5_Click" UseSubmitBehavior="False" />
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" ToolTip="点击校正修改邮址" runat="server" OnClick="LinkButton2_Click"><%#DataBinder.Eval(Container.DataItem, "Num")%></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="280px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="数量" ItemStyle-Width="12%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" OnClientClick="return confirm('你确定将该数据彻底删除吗？')">删除</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </ZL:ExGridView>
            </div>
        </div>
        <div style="float: right; width: 50%; padding: 5px;">
            <div class="border" style="margin-top: 8px; margin-bottom: 5px">
                <span>被申请方所拥有的商品</span> &gt;&gt; <span>
                    <asp:Label ID="LabelU2" runat="server" Text=""></asp:Label></span>
            </div>
            <ZL:ExGridView ID="GridView3" CssClass="table table-bordered" DataKeyNames="ID" Width="100%" runat="server" AllowPaging="True" PageSize="10" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" EmptyDataText="暂无数据" OnPageIndexChanging="GridView3_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="选择交换商品">
                        <HeaderStyle Width="15%" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSel3" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" CssClass="tdbg" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="编号" ItemStyle-Width="12%">
                        <ItemTemplate>
                            <asp:Label ID="Label1a" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" CssClass="tdbg" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="商品名称" ItemStyle-Width="20%">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="Label2a" runat="server" Text='<%# Bind("Proname") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="50%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="价格">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="Label3a" runat="server" Text='<%# Bind("LinPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
            </ZL:ExGridView>
            <div class="border" style="margin-top: 8px; text-align: center">
                <asp:Button ID="Button4" CssClass="btn btn-primary" runat="server" Text="添加商品" OnClick="Button4_Click" />
            </div>
            <div class="border" style="margin-top: 5px;">
                <span>你想要交换的商品</span>
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </div>
            <div>
                <ZL:ExGridView ID="GridView4" CssClass="table table-striped table-bordered table-hover" DataKeyNames="prodID" Width="100%" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="10%">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSel2" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="编号" ItemStyle-Width="8%">
                            <ItemTemplate>
                                <asp:Label ID="Label2a" runat="server" Text='<%# Bind("prodID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="商品名称">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="Label2b" runat="server" Text='<%# Bind("prodName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="价格" ItemStyle-Width="15%">
                            <ItemTemplate>
                                <asp:Label ID="Label2c" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="数量" ItemStyle-Width="15%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Num") %>' Width="20px"></asp:TextBox>
                                <asp:Button ID="Button5" runat="server" Text="提 交" OnClick="Button6_Click" UseSubmitBehavior="False" />
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" ToolTip="点击校正修改邮址" runat="server" OnClick="LinkButton4_Click"><%#DataBinder.Eval(Container.DataItem, "Num")%></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="280px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="数量" ItemStyle-Width="12%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton5_Click" OnClientClick="return confirm('你确定将该数据彻底删除吗？')">删除</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </ZL:ExGridView>
            </div>
        </div>
    </div>
    <div style="clear: both"></div>
    <div style="text-align: center">
        <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="提交申请" UseSubmitBehavior="False" OnClick="Button2_Click" />
        <asp:CheckBox ID="CheckBox1" runat="server" Text="交谈是否可见" />
    </div>
    <div style="clear: both"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript">
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
    </script>
</asp:Content>
