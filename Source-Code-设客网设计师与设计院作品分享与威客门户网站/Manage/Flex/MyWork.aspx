<%@ page language="C#" autoeventwireup="true" inherits="manage_Flex_MyWork, App_Web_nw2myhlo" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>我的作品</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div style="margin: auto;">
        <div>
            <ul class="dUl">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <li class="rpli" style="width:200px;float:left; margin-right:5px;">
                            <div>
                                <img class="img-thumbnail" src='<%# userUrl+"/"+myName+myWork+"/"+Eval("Name") %>' style="cursor: pointer;" onmouseover="showImg(this)" onmouseout="hiddleImg(this)" />
                            </div>
                            <div style="text-align: center;">
                                <input type="checkbox" name="chkImg" value='<%#Eval("Name") %>' />&nbsp;&nbsp;
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div class="clearfix"></div>
        <div class="pageDiv text-center">
            <span style="text-align: center">共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />页次：
                <asp:Label ID="Nowpage" runat="server" Text="" />/
                <asp:Label ID="PageSize" runat="server" Text="" />页
                <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" Height="22px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                条数据/页 转到第
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnTextChanged="DropDownList1_TextChanged"></asp:DropDownList>
                页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
            </span>
        </div>
        <div class="pageDiv" style="text-align: left;">
            <input type="checkbox" id="chkAll" name="chkAll" />全选
            <asp:Button ID="btnDel" CssClass="btn btn-primary" runat="server" Text="删除" OnClick="btnDel_Click" />
        </div>
    </div>
    <div id='boxCover' style="position: absolute; top: 0px; left: 0px; z-index: 99; width: auto; height: auto; display: none; border: 1px solid #c7e0f6;">
        <img src="" alt="" id="Magnifying" style="border: 0px;" />
    </div>
    <div style="width: 100%; height: 300px; display: block;"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Popup.js" type="text/javascript"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script>
        $().ready(function ()
        {
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "chkImg");
            });
        })
        function showImg(obj)
        {

            var evt = getEvent();
            var btop = document.body.scrollTop + evt.clientY + 5 + "px";
            var bleft = document.body.scrollLeft + evt.clientX + 5 + "px";
            $("#Magnifying").attr("src", $(obj).attr("src"));
            $("#boxCover").css({ "top": btop, "left": bleft }).show();

        }
        function hiddleImg(obj)
        {
            $("#boxCover").hide();
        }
    </script>
</asp:Content>
