<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="manage_Shop_OrderDeliverinfo, App_Web_p5upeauk" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>发货状态修改</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="server">
    <ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">发货状态修改</li>
    </ol>
    <table class="table table-striped table-bordered table-hover" align="center">
        <tr>
            <td width="35%">请选择状态：<asp:HiddenField ID="hforderid" runat='server' />
            </td>
            <td>
                <asp:DropDownList ID="ddstate" CssClass="form-control" Width="150" runat='server' AutoPostBack="True"
                    OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                    <asp:ListItem Value="0">未安排</asp:ListItem>
                    <asp:ListItem Value="1">已安排,待发货</asp:ListItem>
                    <asp:ListItem Value="2">已发货,待签收</asp:ListItem>
                    <asp:ListItem Value="3">本人签收</asp:ListItem>
                    <asp:ListItem Value="4">他人签收</asp:ListItem>
                    <asp:ListItem Value="5">未签收,未送出</asp:ListItem>
                </asp:DropDownList><span id="tips" style="color: Red" runat="server"></span>
            </td>
        </tr>
        <tbody id="fahuo" runat="server">
            <tr>
                <td>物流信息</td>
                <td>物流公司：<asp:DropDownList runat="server" ID="DR_Company" AppendDataBoundItems="True" onchange="showtxt(this)">
                    <asp:ListItem Value="0">请选择快递公司</asp:ListItem>
                    <asp:ListItem Value="77">其他</asp:ListItem>
                </asp:DropDownList>&nbsp;&nbsp; 
                            <input id="kdgs" class="l_input" style="display: none;" type="text" runat="server" /><br />
                    快递单号：<asp:TextBox ID="txtMSnoAlipay" runat="server" CssClass="l_input"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ErrorMessage="快递单号最少为五位" ControlToValidate="txtMSnoAlipay"
                        ValidationExpression="^.{5,}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>送货人：</td>
                <td>
                    <asp:DropDownList ID="ddSender" runat="server"></asp:DropDownList></td>
            </tr>
        </tbody>
        <tbody id="sign" runat="server" visible="false">
            <tr>
                <td>代签人：</td>
                <td>
                    <asp:TextBox ID="txtSignUser" runat="server" class="l_input" Height="19px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>代签人手机：</td>
                <td>
                    <asp:TextBox ID="txtMobile" runat="server" class="l_input" Height="19px"></asp:TextBox></td>
            </tr>
        </tbody>
        <tr>
            <td style="line-height: 119px">备注：</td>
            <td>
                <asp:TextBox ID="txtRemark" CssClass="form-control" style="max-width:400px;"  runat="server" TextMode="MultiLine" Height="119px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>短信发送：</td>
            <td>
                <input id="nock" runat="server" type="checkbox" onclick="onchan()" />手机短信和E_Mail通知</td>
        </tr>
        <tbody id="con">
            <tr>
                <td>通知内容：</td>
                <td>
                    <asp:TextBox ID="txtContent" CssClass="form-control" runat="server" TextMode="MultiLine" style="max-width:"></asp:TextBox>
                    <font color="red">{$UserName}订货人姓名;{$SiteName}网站名称;{$Remark}为上面的备注信息; {$OrderCode}为订单号;{$DeliveryUser}送货员;{$DeliUserMobile}送货手机</font>
                </td>
            </tr>
        </tbody>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btn" runat="server" Text="保存" OnClick="btn_Click" class="btn btn-primary" /><span id="sptip" runat="server" style="color: Red"></span>
            </td>
        </tr>
    </table>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function onchan() {
            if (document.getElementById("nock").checked) {
                document.getElementById("con").style.display = "";
            } else {
                document.getElementById("con").style.display = "none";
            }
        }
        function showtxt(obj) {
            if (obj.options[obj.selectedIndex].value == "77") {
                var txt = document.getElementById("kdgs");
                txt.style.display = "";

            } else {
                var txt = document.getElementById("kdgs");
                txt.style.display = "none";
            }
        }
    </script>
</asp:Content>
