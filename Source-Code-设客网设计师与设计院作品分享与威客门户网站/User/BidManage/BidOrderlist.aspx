<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_BidManage_BidOrderlist, App_Web_m3pk103q" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>竞拍订单提交</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="shop" data-ban="shop"></div>
    <div class="container margin_t5">
        <ol class="breadcrumb">
            <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
            <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
            <li><a href="Default.aspx">竞拍管理</a></li>
            <li class="active">竞拍订单提交</li>
        </ol>
    </div>
    <div class="container">
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        <asp:HiddenField ID="hftype" runat="server" />
        <asp:HiddenField ID="hfcid" runat="server" />
        <asp:HiddenField ID="hfid" runat="server" />
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="2" class="text-center">请填写您的商品信息</td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">第二步：确认订单
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>市价：</b>
                </td>
                <td>
                    <asp:Label ID="lbllinkpri" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>您使用的宝点：</b>
                </td>
                <td>
                    <asp:Label ID="lblbaodian" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>您需支付的价格：</b>
                </td>
                <td>
                    <asp:Label ID="lblshijia" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>收货人姓名：</b>
                </td>
                <td>
                    <asp:TextBox ID="Receiver" CssClass="form-control text_md" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Receiver"
                        ErrorMessage="收货人姓名不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>收货人地址：</b>
                </td>
                <td>
                    <asp:DropDownList ID="dddizhi" CssClass="form-control text_md" runat="server" OnSelectedIndexChanged="dddizhi_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                    <br />
                    <asp:TextBox ID="Jiedao" runat="server" CssClass="form-control text_md"></asp:TextBox><asp:CheckBox ID="ckdizhi" runat="server" />保存到地址薄
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Jiedao"
                        ErrorMessage="收货人地址不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>收货人邮箱：</b>
                </td>
                <td>
                    <asp:TextBox ID="Email" runat="server" CssClass="form-control text_md"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Email"
                        ErrorMessage="收货人邮箱不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>付款方式：</b>
                </td>
                <td>
                    <asp:DropDownList ID="Payment" CssClass="form-control text_md" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <b>发票信息：</b>
                </td>
                <td>
                    <asp:TextBox ID="Invoice" CssClass="form-control text_md" runat="server" Rows="10"></asp:TextBox>
                    <asp:CheckBox ID="Invoiceneeds" runat="server" Text="需开发票 " />
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>要求送货时间：</b>
                </td>
                <td>
                    <asp:DropDownList ID="Deliverytime" runat="server" CssClass="form-control text_md">
                        <asp:ListItem Value="1">对送货时间没有特殊要求</asp:ListItem>
                        <asp:ListItem Value="2">双休日或者周一至周五的晚上送达</asp:ListItem>
                        <asp:ListItem Value="3">周一至周五的白天送达</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>联系电话：</b>
                </td>
                <td>
                    <asp:TextBox ID="Phone" CssClass="form-control text_md" runat="server"></asp:TextBox>
                    格式:区号-号码
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Phone"
                            Display="Dynamic" ErrorMessage="联系电话不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Phone"
                        ErrorMessage="联系电话格式不正确!" SetFocusOnError="True" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{8}|(\(\d{4}\)|\d{4}-)?\d{8}|(\(\d{4}\)|\d{4}-)?\d{8}|(\(\d{4}\)|\d{4}-)?\d{7}|(\(\d{4}\)|\d{4}-)?\d{7}" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>邮政编码：</b>
                </td>
                <td>
                    <asp:TextBox ID="ZipCode" CssClass="form-control text_md" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ZipCode"
                        Display="Dynamic" ErrorMessage="邮政编码不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ZipCode"
                        ErrorMessage="邮政编码格式不正确!" ValidationExpression="^\d{6}$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>收货人手机：</b>
                </td>
                <td>
                    <asp:TextBox ID="Mobile" runat="server" CssClass="form-control text_md"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Mobile"
                        Display="Dynamic" ErrorMessage="收货人手机不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Mobile"
                        ErrorMessage="手机号码格式不正确!" ValidationExpression="^(\d{2}|\d{3})?[\-]?(\d{11})$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>收货人所属地区：</b>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control text_md" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList1"
                        ErrorMessage="收货人所属城市不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>送货方式：</b>
                </td>
                <td>
                    <asp:DropDownList ID="Delivery" CssClass="form-control text_md" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Delivery_SelectedIndexChanged1"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Delivery" ErrorMessage="送货方式不能为空!" SetFocusOnError="True">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <b><font color="#FF0000">*</font>运费：</b>
                </td>
                <td>
                    <asp:Label ID="lblYunFei" runat="server"></asp:Label>
                    <asp:HiddenField ID="projiect" runat="server" />
                    <asp:HiddenField ID="prodectid" runat="server" />
                    <asp:HiddenField ID="projectjiage" runat="server" />
                    <asp:HiddenField ID="jifen" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="提交订单" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
