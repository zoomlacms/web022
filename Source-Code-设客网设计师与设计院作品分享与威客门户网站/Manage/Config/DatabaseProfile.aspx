<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_Database_profile, App_Web_wtoe0kjd" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<script type="text/javascript" src="/js/Common.js"></script>
    <title>运行库概况</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#tab0" data-toggle="tab" onclick="ShowCreate('crt1','TabTitle1')">整体概况</a></li>
        <li><a href="#tab1" data-toggle="tab" onclick="ShowCreate('crt2','TabTitle2')">数据详情</a></li>
    </ul>
<table class='table table-striped table-bordered table-hover' id="crt1" name="crt1">
<tr>
<td><div id="Div1" runat="server"  style="text-align: center; font-size: 15px;font-weight: bold;"><asp:Label ID="tableTotal"  runat="server"></asp:Label></div></td></tr>
</table>
<div id="Div2" runat="server" ></div>
<table class="table table-striped table-bordered table-hover" id="crt2" name="crt2" style="display: none;">
<tr>
<td><div id="Top" runat="server"  style="text-align: center; font-size: 15px;
    font-weight: bold;"><asp:Label ID="Label1" Text="当前数据库所有表空间详情（按表占用量从大到小排序）" runat="server"></asp:Label><br /></div></td></tr>
<tr> <td><div id="RunOK" runat="server" >
 
</div></td> </tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        //滑动门门
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
        } else {
            if (document.getElementById("TabTitle") != null) {
                document.getElementById("TabTitle").style.display = "";
                document.getElementById("TabTitle").className = "titlemouseover";
            }
            tID = ID;
        }
    }
    function ShowCreate(result, id) {
        HideCreate();
        document.getElementById(result).style.display = "";

        for (var i = 0; i < arrTabTitle.length; i++) {
            if (arrTabTitle[i] == id) {
                document.getElementById(arrTabTitle[i]).style.display = "";
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
</script>
</asp:Content>





