<%@ page language="C#" autoeventwireup="true" inherits="manage_QrCode, App_Web_ycbxry5x" enableviewstatemac="false" validaterequest="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>二维码</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    
<asp:HiddenField ID="contain" runat="server"/><%--页面保持--%>
   
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab0" data-toggle="tab" onclick="ShowCreate('crt1','TabTitle1')">文本二维码</a></li>
        <li><a href="#tab1" data-toggle="tab" onclick="ShowCreate('crt2','TabTitle2')">名片信息</a></li>
    </ul>

    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td style="padding-top: 10px;">
                <div class="CreateCk">
                    &nbsp;纠错等级:<asp:DropDownList ID="Level" CssClass="form-control"   runat="server"  Width="60px">
                        <asp:ListItem Selected="True">L</asp:ListItem>
                        <asp:ListItem>M</asp:ListItem>
                        <asp:ListItem>Q</asp:ListItem>
                        <asp:ListItem>H</asp:ListItem>
                    </asp:DropDownList>
                    版本:<asp:DropDownList ID="Version" CssClass="form-control" runat="server"  Width="60px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem Selected="True">7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                    大小:<asp:TextBox CssClass="form-control" ID="TxtSize" Text="4" runat="server"  Width="50px"></asp:TextBox>
                    <%--        背景颜色:<asp:DropDownList id="BackColor" CssClass="dropd1" runat="server" Height="20px" Width="50px">
            <asp:ListItem Value="蓝色">蓝色</asp:ListItem>
            <asp:ListItem Value="黄色">黄色</asp:ListItem>
            <asp:ListItem Value="绿色">绿色</asp:ListItem>
            <asp:ListItem Value="灰色">灰色</asp:ListItem>
            <asp:ListItem Value="白色">白色</asp:ListItem>
            <asp:ListItem Value="红色">红色</asp:ListItem>
        </asp:DropDownList>
        边框颜色:<asp:DropDownList id="ForeColor" CssClass="dropd1" runat="server" Height="20px" Width="50px">
            <asp:ListItem Value="红色">红色</asp:ListItem>
            <asp:ListItem Value="黑色">黑色</asp:ListItem>
            <asp:ListItem Value="棕色">棕色</asp:ListItem>
            <asp:ListItem Value="绿色">绿色</asp:ListItem>
        </asp:DropDownList>--%>
        <div class="clearfix"></div>
                </div>
                <div id="crt1" class="margintop10">
                    <asp:TextBox ID="TxtContent" class="form-control" runat="server"   TextMode="MultiLine" ></asp:TextBox>
                    <br />
                    <div id="img1div"></div>
                    <span style="color: #808000;">如需生成网址则须在开头加上http:// 如(http://www.baidu.com)</span>
                    <br />
                    <asp:Button ID="BtnCreate" CssClass="btn btn-primary" Text="创建并保存" runat="server" OnClick="BtnCreate_Click" />
                    &nbsp;
        <asp:Button ID="BtnSave" Text="下载到本地" CssClass="btn btn-primary" runat="server" OnClick="BtnSave_Click" />
                    &nbsp;
         <input name="Cancel" type="button" class="btn btn-primary" id="Button1" value="返回列表" onclick="javescript: history.go(-1)" />
                </div>
                <div id="crt2" style="display: none;">
                    <table>
                        <tr>
                            <td>姓名:</td>
                            <td>
                                <input class="form-control" runat="server" id="FN"></td>
                            <td>个人主页:</td>
                            <td>
                                <input class="form-control" id="URL" value="http://" runat="server"></td>
                            <td>邮箱:</td>
                            <td>
                                <input class="form-control" runat="server" id="EMAIL">
                               
                            </td>
                            <td> <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="请输入正确的邮箱格式" ControlToValidate="EMAIL" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>MSN:</td>
                            <td>
                                <input class="form-control" id="MSN" runat="server" ></td>
                            <td>QQ:</td>
                            <td>
                                <input class="form-control" id="QQ" runat="server" ></td>
                            <td>手机:</td>
                            <td>
                                <input class="form-control" runat="server" id="TEL">
                              
                            </td>
                            <td>  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="请输入正确的手机号码" ControlToValidate="TEL" ValidationExpression="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"></asp:RegularExpressionValidator></td>
                        </tr>
                    </table>
                    <div id="img2div"></div>
                    <span style="color: #808000;">注：当前内容总长度不能超过154个字符</span>
                    <br />
                    <asp:Button ID="BtnCreates" OnClick="BtnCreates_Click" CssClass="btn btn-primary" Text="创建并保存" runat="server" />
                    &nbsp;
        <asp:Button ID="BtnSaves" Text="下载到本地" CssClass="btn btn-primary" OnClick="Button1_Click" runat="server" />
                    &nbsp;
         <input name="Cancel" type="button" class="btn btn-primary" id="Cancel" value="返回列表" onclick="javescript: history.go(-1)" />
                </div>
                <div id="ShowImgs" runat="server" visible="false" style="display: none;">
                    <table class="table table-striped table-bordered table-hover">
                        <tr class="tdbg">
                            <td align="left" style="height: 30px; padding-left: 60px; padding-bottom: 20px; padding-top: 10px;">
                                <asp:Image ID="ImgCode" runat="server" /><br />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td align="left">
                                <asp:TextBox TextMode="MultiLine" ID="TxtZoneCode" runat="server" Rows="2" cols="20" class="x_input" Style="width: 435px; height: 30px; padding: 5px;"></asp:TextBox><br />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td align="left">
                                <input id="Button3" type="button" value="获取调用代码" class="btn btn-primary" onclick="copy()" />
                            </td>
                        </tr>
                        <tr class="tdbg">
                            <td align="left">
                                <span style="color: Grey">调用方法：点击按钮复制代码，粘贴到网页中的指定位置即可。</span></td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        window.onload = function () {
            var type = '<%=Request["Type"]%>';

            if (type != '') {
                if (type == '1') {
                    ShowCreate('crt2', 'TabTitle2');
                }
            }
            //页面状态保持
            if (document.getElementById("contain").value == "2") {
                ShowCreate('crt2', 'TabTitle2');
            }
        }

        //滑动门
        var tID = 0;
        var arrTabTitle = new Array("TabTitle1", "TabTitle2");
        function pload() {
            var ID = '<%=Request.QueryString["id"]%>';
        if (ID != tID) {
            if (document.getElementById(arrTabTitle[ID].toString()) != null) {
                document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
            }
            if (document.getElementById(arrTabTitle[tID].toString()) != null) {
                document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
            }
        }
        else {
            if (document.getElementById("TabTitle") != null) {
                document.getElementById("TabTitle").style.display = "";
                document.getElementById("TabTitle").className = "titlemouseover";
            }
            tID = ID;
        }
    }
    function ShowCreate(result, id) {
        document.getElementById("contain").value = id.substr(8, 1);
        HideCreate();
        document.getElementById(result).style.display = "";

        for (var i = 0; i < arrTabTitle.length; i++) {
            if (arrTabTitle[i] == id) {
                document.getElementById(arrTabTitle[i]).className = "titlemouseover";
            } else {
                document.getElementById(arrTabTitle[i]).className = "tabtitle";
            }
        }
    }
    function HideCreate() {
        for (i = 1; i < 3; i++) {
            document.getElementById("crt" + i).style.display = "none";
        }
    }
    if (document.getElementById("img1div"))
        document.getElementById("img1div").innerHTML = document.getElementById("ShowImgs").innerHTML;
    if (document.getElementById("img2div"))
        document.getElementById("img2div").innerHTML = document.getElementById("ShowImgs").innerHTML;
    function copy() {
        var innerHTML = "复制代码失败您的浏览器不支持复制，请手动复制代码。";
        if (window.clipboardData) {
            innerHTML = "复制代码成功您现在可以将代码粘贴（ctrl+v）到网页中预定的位置。";

            var str = $("#TxtZoneCode").html();
            while (str.indexOf("&lt;") >= 0) {
                str = str.replace("&lt;", "<");
            }
            while (str.indexOf("&gt;") >= 0) {
                str = str.replace("&gt;", ">");
            }

            window.clipboardData.setData("Text", str);
            alert(innerHTML);

        }
        else { alert(innerHTML); }
    }
</script>
</asp:Content>