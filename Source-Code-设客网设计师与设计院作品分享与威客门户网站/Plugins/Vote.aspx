<%@ page language="C#" autoeventwireup="true" inherits="Common_Vote, App_Web_r4rxvhca" enableviewstatemac="false" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>投票调查</title>
    <link href="../App_Themes/Guest/Survey.css" rel="stylesheet" />
    <script src="../JS/Verify.js"></script>
    <script src="../manage/Common/Common.js"></script>
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        //检查答题情况， 假定每个都是必填的
        var goto = false;
        var vflag = true;
        function CheckAns() {
            var flag = false;
            var tables = document.getElementsByTagName("table");
            preview(1);
            for (var i = 0; i < tables.length; i++) {
                var options = document.getElementsByName("vote_" + i);
                flag = false;
                if (options.length > 1) {
                    for (var j = 0; j < options.length; j++) {
                        if (options[j].checked) {
                            flag = true;
                            break;
                        }
                    }
                }
                else if (options.length == 1) {
                    if (options.value.length > 0)
                        flag = true;
                }
                if (flag == false || vflag == false) {
                    alert('问卷未完成， 请继续答题。。。');
                    // document.getElementById("mao_" + i).focus();
                    // GotoAnchor(i);
                    return false;
                }
            }
            return true;
        }
        //跳转到指定位置
        function GotoAnchor(pos) {
            var url = location.href;
            if (url.indexOf("#mao_") > 0) {
                url = url.substring(0, url.lastIndexOf('_') + 1);
                url = url + pos;
            }
            else {
                url = url + "&#mao_" + pos;
            }
            location.href = url;
        }
        //特殊文本的验证
        function IsLegalValue(id, type) {
            var value = document.getElementById("txt_" + id).value;
            switch (type) {
                case 0:
                    vflag = CheckEmail(value);
                    break;
                case 1:
                    vflag = CheckMobile(value);
                    break;
                case 2:
                    vflag = CheckPhone(value);
                    break;
                case 3:
                    vflag = CheckIdCard(value);
                    break;
                case 4:
                    vflag = CheckSchCard(value);
                    break;
            }
            if (vflag == false) {
                document.getElementById("span_" + id).style.display = 'block';
                //document.getElementById("txt_" + id).focus();
                // document.getElementById("txt_" + id).select();
            }
            else
                document.getElementById("span_" + id).style.display = 'none';
        }
    </script>
    <script>
        function preview(oper) {
            if (oper < 10) {
                bdhtml = document.getElementById("divContent").innerHTML;//获取当前页的html代码  
                sprnstr = "<!--startprint" + oper + "-->";//设置打印开始区域  
                eprnstr = "<!--endprint" + oper + "-->";//设置打印结束区域  
                prnhtml = bdhtml.substring(bdhtml.indexOf(sprnstr) + 18); //从开始代码向后取html  

                prnhtmlprnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));//从结束代码向前取html  
                document.getElementById("divContent").innerHTML = prnhtml;
                window.print();
                document.getElementById("divContent").innerHTML = bdhtml;
            } else {
                window.print();
            }
        }

        function ShowflaUp(id) {
            if (document.getElementById("viewid_" + id).style.display != 'none')
                document.getElementById("viewid_" + id).style.display = 'none';
            else document.getElementById("viewid_" + id).style.display = '';
        }
    </script>
    <script type="text/javascript">
        function CheckIsNull()
        {
            var flag = true;
            if ($("#IsNull_H").val())
            {
                var nullArr = $("#IsNull_H").val().split(',');
                for (var i = 0; i < nullArr.length && flag; i++) {
                    if ($("input[name=" + nullArr[i] + "]:checked").length < 1)
                        flag = false;
                }
                if (!flag)
                    alert('有必填项尚未填写！！');
            }
            return flag;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="head">
            <!--  <div id="htop">
<div class="qlink">
    <div class="left">
        <a href="http://www.zoomla.cn" target="_blank">逐浪网微博</a> &nbsp; 
    <a href="http://www.zoomla.cn" target="_blank">更多应用</a>
    </div>
    <div class="right">
        <a href="http://www.zoomla.cn" target="_blank">逐浪网——华中排名第一的IDC服务商</a>
    </div>
</div>
</div>
end head-->
            <div class="clear"></div>
            <div class="banner"></div>
        </div>
        <div class="clear"></div>
        <div id="main">
            <div id="divContent" class="content" runat="server">
                <div class="title">
                    <asp:Literal ID="ltlSurveyName" runat="server" Text="Label"></asp:Literal>
                    <div class="date">
                        发布时间:
                        <asp:Literal ID="ltlDate" runat="server"></asp:Literal>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="desp">
                    <p>
                        <asp:Literal ID="ltlDesp" runat="server" Text="Label"></asp:Literal>
                    </p>
                </div>
                <%--<hr class="compart" />--%>
                <div class="list">
                    <ul>
                        <asp:Literal ID="ltlResultHtml" runat="server"></asp:Literal>
                    </ul>
                </div>
                <div id="regVcodeRegister" class="list" runat="server" visible="false">
                    <table width='100%' align='center' class='border votetab'>
                        <tr>
                            <th width="10%" align="left">验证码：</th>
                            <td>
                                <div class="reg_put">
                                    <asp:TextBox ID="SendVcode" MaxLength="6" runat="server" Style="width: 60px; border: #CCC solid 1px;"
                                        CssClass="input_out" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};"
                                        onmousemove="this.className='input_move'" onmouseout="this.className='input_out'"></asp:TextBox>
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/ValidateCode.aspx" Height="20px"
                                        ToolTip="点击刷新验证码" Style="cursor: pointer; border: 0; vertical-align: middle;"
                                        onclick="this.src='/Common/ValidateCode.aspx?t='+Math.random()" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SendVcode"
                                        Display="Dynamic" ErrorMessage="验证码不能为空!"></asp:RequiredFieldValidator>
                                    <asp:Label ID="Validateinfo" runat="server" Text=""></asp:Label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--/content-->
            <div class="bottom">
                <asp:Button ID="btnSubmit" runat="server" Text="提交" CssClass="btn" OnClick="btnSubmit_Click" OnClientClick="return CheckIsNull()" />
                <input type="button" class="btn" value="打印" onclick=" CheckAns();" />
                <asp:Button ID="Button2" runat="server" Text="保存" OnClick="Button2_Click" CssClass="btn" />
                <asp:Button ID="btnExport" runat="server" Text="导 出" CssClass="btn" OnClick="btnExport_Click" />
            </div>
            <asp:HiddenField ID="IsNull_H" runat="server" />
            <div id="foot">
                当前页面执行时间：
                <script type="text/javascript"> 
<!-- 
    var startTime, endTime;
    var d = new Date();
    startTime = d.getTime();
    //--> 
                </script>
                <script type="text/javascript">
                    d = new Date();
                    endTime = d.getTime();
                    document.write((endTime - startTime) / 1000);
                </script>
            </div>
        </div>
        <asp:HiddenField ID="HdnSID" runat="server" />
        <asp:HiddenField runat="server" ID="Random_Hid" />
    </form>
</body>
</html>
