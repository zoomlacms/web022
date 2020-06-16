<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.I.Pay.AddPayPlat, App_Web_nbndfeoy" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>编辑在线支付平台</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
 <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td class="text-center" colspan="2">
                        <asp:Label ID="LblTitle" runat="server" Text="添加在线支付平台" />
                    </td>
                </tr>
                <tr >
                    <td class="td_l" >接口类型：</td>
                    <td id="payplat_td"> 
                        <asp:RadioButtonList ID="DDLPayPlat" runat="server" Height="83px" RepeatColumns="6" RepeatDirection="Horizontal"></asp:RadioButtonList>                        
                    </td>
                </tr>
                <tr>
                    <td>支付名称：</td>
                    <td>
                        <asp:TextBox ID="DDLPayName" runat="server" class="form-control text_300"></asp:TextBox>
                        <span style="color: red" class="tips">*</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="支付名称为空！" CssClass="tips" ForeColor="Red" ControlToValidate="DDLPayName" Display="Dynamic" SetFocusOnError="True" />
                    </td>
                </tr>
                <tr >
                    <td>商户ID：</td>
                    <td>
                        <asp:TextBox ID="TxtAccountID" runat="server" class="form-control text_300" />
                        <span style="color: red" class="tips">*</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="商户ID不能为空！" CssClass="tips" ForeColor="Red" ControlToValidate="TxtAccountID" Display="Dynamic" SetFocusOnError="True" />
                    </td>
                </tr>
                <tr id="trMD5Key" runat="server" >
                    <td >安全校验码|Key|密钥：</td>
                    <td>
                        <asp:TextBox ID="TxtMD5Key" runat="server" class="form-control text_300" />
                        <span style="color: red" class="tips">*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="安全校验码不能为空!" CssClass="tips" ControlToValidate="TxtMd5Key" Display="Dynamic" ForeColor="Red" SetFocusOnError="true">  </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>卖家Email|：帐户</td>
                    <td>
                        <asp:TextBox ID="TxtSellerEmail" runat="server" class="form-control text_300" />
                        <span class="rd_green">如支付宝接口必须填写卖家Email,否则会出错,其他接口填写帐户名即可</span>
                       <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtSellerEmail" CssClass="tips" ForeColor="Red" Display="Dynamic" ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">邮箱格式不正确</asp:RegularExpressionValidator>--%>
                    </td>
                </tr>
                <tbody id="cert_body" style="display:none;">
                <tr><td>证书(私钥)：</td><td>
                    <asp:TextBox runat="server" ID="PrivateKey_T" CssClass="form-control text_300" />
                    <span class="rd_green">(.key文件路径,示例:/Cert/my.key)</span></td></tr>
                <tr><td>证书(公钥)：</td><td>
                    <asp:TextBox runat="server" ID="PublicKey_T" CssClass="form-control text_300" />
                    <span class="rd_green">(.cer|.crt文件路径)</span>
                </td></tr>
                <tr><td>银行证书(公钥)</td><td><asp:TextBox runat="server" ID="Other_T" CssClass="form-control text_300"></asp:TextBox>
                     <span class="rd_green">(.cer|.crt文件路径),银行的公钥,用于验证回调</span>
                                     </td></tr>
                </tbody>
                <tr>
                    <td >备注：</td>
                    <td>
                        <asp:TextBox ID="txtRemark" runat="server" class="form-control text_300" TextMode="MultiLine" style="height:60px;"/>
                    </td>
                </tr>
                 <tr>
                     <td></td>
                     <td>
                         <asp:Button ID="EBtnSubmit" Text="保存" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-primary" />
                         <a href="PayPlatManage.aspx" class="btn btn-primary">返回</a>
                     </td>
                 </tr>
            </table>
           <script>
               $(function () {
                   //微信支付跳转
                   $("#DDLPayPlat [value='21']").click(function () {
                       window.location.href = "../WeiXin/PayWeiXin.aspx";
                   });
                   $("#payplat_td input[type=radio]").click(function () {
                       CertCheck(this.value);
                   });
                   CertCheck($("input[type=radio]:checked").val());
               });
               function CertCheck(val) {
                   if (val == "23") { $("#cert_body").show(); }
                   else { $("#cert_body").hide(); }
               }
           </script>
</asp:Content>
