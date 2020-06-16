<%@ page language="C#" autoeventwireup="true" inherits="manage_User_AddMailTemp, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>创建邮件模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td width="15%" align="right">模板名称：</td>
            <td style="text-align: left">
                <asp:TextBox ID="TxtTempName" class="form-control" runat="server" Style="max-width: 350px"></asp:TextBox></td>
        </tr>
        <tr>
            <td width="15%" align="right">上传缩略图：</td>
            <td style="text-align: left">
                <asp:TextBox ID="TxtPic" class="form-control pull-left" runat="server" Style="max-width: 350px" /><span style="color: #ff0000; float: left; padding-top: 8px;">*</span>
                <iframe id="smallimgs" style="top: 2px" src="../../shop/fileupload.aspx?menu=TxtPic" width="100%" height="30px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right"><strong>选择类型：</strong></td>
            <td style="text-align: left">
                <table>
                    <tr>
                        <asp:DropDownList ID="drType" class="form-control" Style="max-width: 100px" runat="server">
                            <asp:ListItem Value="0">请选择</asp:ListItem>
                            <asp:ListItem Value="1">普通信件</asp:ListItem>
                            <asp:ListItem Value="2">贺卡</asp:ListItem>
                        </asp:DropDownList>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right">模板内容：</td>
            <td style="text-align: left">
                <textarea id="TxtContent" class="form-control tarea_l" rows="10" runat="server"></textarea>
                <script id="headscript" type="text/javascript">
                    //<![CDATA[
                    CKEDITOR.replace('TxtContent',
                {
                });
                    //]]>
                </script>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right">邮件模板标签</td>
            <td>邮件内容支持HTML，邮件内容中可用标签说明如下：<br />
                <textarea class="form-control" rows="8" style="max-width: 500px;"> 

                    邮件标题：{$Title/} 

                    [以下是站点基本信息]
                    ======================================
                    网站名称{$SiteName/}   
                    网站地址{$SiteUrl/}  
                    网站标题{$SiteTitle/}     
                    网站Logo{$LogoUrl/}   
                    广告图：{$BannerUrl/}
                    网站版权：{$Copyright/}  
                    网站关键字{$MetaKeywords/}   
                    网站描述{$MetaDescription/}   
                    站长姓名：{$Webmaster/}
                    站长信箱：{$WebmasterEmail/}  

                    [以下是您在注册会员时填写的基本信息]
                    ======================================
                    <!-- personal -->
                    帐号: {$UserName/}
                    密码：{$password/}
                    公司名：{$Company/}
                    办公电话：{$OfficePhone/}  

                    昵称: {$HoneyName/}
                    头像: {$UserFace/}
                    性别：{$sex/} 
                    出生日期：{$BirthDay/}  
                    国家：{$Country/}
                    省份：{$Province/}
                    城市：{$City/}
                    县：{$County/}
                    地址：{$Address/} 
                    邮政编码：{$ZipCode/}
                    电话：{$Mobile/}
                    传真：{$Fax/}
                    E-mail地址：{$Email/}
                    个人主页：{$HomePage/}
                    QQ号：{$QQ/}
                    MSN地址：{$MSN/}   
                    签名档：{$Sign/} 
                    <!-- /personal -->
                    </textarea>
            </td>
        </tr>
        <tr class="tdbgbottom">
            <td colspan="2" style="text-align: center">
                <asp:HiddenField ID="HdnModelId" runat="server" />
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存" runat="server" OnClick="EBtnSubmit_Click" />
                <input name="Cancel" type="button" class="btn btn-primary" id="Cancel" value="取消" onclick="javescript: history.go(-1)" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/Plugins/Ckeditor/EditFile/sample.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
    <script>
        // parent.GV('TxtPic', 'UploadFiles/2012/9/15/2012915145154656591.bmp');
        function GV(id, value) {

            $("#" + id).val(value);
        }
    </script>
</asp:Content>







