<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_BidComplete_Modify, App_Web_g0x3iq3z" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>编辑竞拍商品</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="nodeNav" class="col-lg-2 col-md-2 col-sm-2 col-xs-12 divBorder" style="padding:0 0 0 0;">
    <ZL:UserGuide runat="server" />
    </div>
    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
 <div class="r_navigation">
<span>后台管理</span> &gt;&gt; <span>商城管理</span> &gt;&gt; <span><a href="BidComplete_Manage.aspx">竞拍管理</a></span>&gt;&gt; 
<asp:Label ID="txttitle" runat="server" Text="添加竞拍商品"></asp:Label></div><div class="clearbox"></div>
 <table id="Guess2" width="100%" border="0" cellpadding="0" cellspacing="0" class="table table-striped table-bordered table-hover">
    <tr align="center">
            <td colspan="2" class="spacingtitle">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
      </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td width="34%" height="22" class="tdbgleft">
                <strong>商品选择：</strong>
            </td>
            <td height="22" valign="middle">
                <asp:DropDownList ID="productid" class="form-control pull-left"  style="width:auto" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="productid_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:Label ID="proname" runat="server" Visible="false"></asp:Label>
                <asp:HiddenField ID="cids" runat="server" />
                <asp:HiddenField ID="NodeID" runat="server" />
                <asp:HiddenField ID="ModeID" runat="server" />
                <asp:HiddenField ID="hfType" runat="server" />
                <asp:HiddenField ID="hffilename" runat="server" />
            </td>
        </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td  width="20%" style="width:auto;"><strong>竞拍时间段：</strong></td>
        <td style="height: 19px">
            <span style="float:left;padding:5px">从</span><asp:TextBox ID="txtStime" onclick="WdatePicker()" runat="server" class="form-control pull-left" style="width:auto;"></asp:TextBox>
            <span style="float:left;padding:5px">到</span><asp:TextBox ID="txtEtime" onclick="WdatePicker()" runat="server" class="form-control pull-left" style="width:auto;"></asp:TextBox><span style="float:left;padding:5px">为止</span>
        </td>
    </tr>
    <asp:HiddenField ID="stock" runat="server" />
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>是否自动进入竞拍：</strong></td>
        <td><select id="autoCom" runat="server" onchange="autoChange(this.value)">
                <option value="0" selected="selected">是</option>
                <option value="1">否</option>
            </select>
        </td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>商品参与竞拍数量：</strong></td>
        <td><input id="txtBidNum" runat="server" class="form-control pull-left"  style="width:auto;" onchange="TChange(this.value)" value="1" /><div id="Tips" style="display:inline"></div>
        </td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong id="tiptime" runat="server">竞拍结束后商品在前台显示时间数：</strong></td>
        <td><asp:TextBox ID="txtSpTime" runat="server" class="form-control pull-left"  style="width:auto;" Text="0.5"></asp:TextBox>小时
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3"  runat="server" ControlToValidate="txtSpTime" ErrorMessage="间隔时间必须是数字!"
                ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft" width="20%" style="height: 19px"><strong>竞拍类型：</strong></td>
        <td><asp:DropDownList ID="ddlAucType" runat="server">
            <asp:ListItem Value="0">交易区</asp:ListItem>
            <asp:ListItem Value="1">体验区</asp:ListItem>
            </asp:DropDownList></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>邮寄费用：</strong></td>
        <td><asp:TextBox ID="txtPostPrice" runat="server" class="form-control pull-left"  style="width:auto;" Text="20"></asp:TextBox><span style="float:left;padding:5px">(为零竞拍用户免邮费)</span>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5"  runat="server" ControlToValidate="txtPostPrice" ErrorMessage="邮寄费用格式不正确!"
                ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>时间封顶：</strong></td>
        <td><asp:TextBox ID="txtTimeTop" runat="server" class="form-control pull-left"  style="width:auto;"></asp:TextBox><span style="float:left;padding:5px">秒(为零不封顶)</span>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2"  runat="server" ControlToValidate="txtTimeTop" ErrorMessage="时间封顶格式不正确!"
                ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>赠送宝点数：</strong></td>
        <td><asp:TextBox ID="txtPru" runat="server" class="form-control pull-left"  style="width:auto;"></asp:TextBox><span style="float:left;padding:5px">点</span>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4"  runat="server" ControlToValidate="txtPru" ErrorMessage="宝点数格式不正确!"
                ValidationExpression="^-?\d+$" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>排列序号：</strong></td>
        <td><asp:TextBox ID="txtOrderBy" runat="server" class="form-control pull-left"  style="width:auto;" Text="1"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
    ControlToValidate="txtOrderBy" ErrorMessage="排列序号必须是数字!" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>出价消耗宝点数量：</strong></td>
        <td><asp:TextBox ID="txtDepVal" runat="server" class="form-control pull-left"  style="width:auto;" Text="100"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
    ControlToValidate="txtDepVal" ErrorMessage="宝点数量必须是数字!" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>出价商品价格增加：</strong></td>
        <td><asp:TextBox ID="txtAddPrice" runat="server" class="form-control pull-left"  style="width:auto;" Text="1"></asp:TextBox><span style="float:left;padding:5px">元</span>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator6"  runat="server" ControlToValidate="txtAddPrice" ErrorMessage="出价价格格式不正确!"
                ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>出价时间反弹秒数：</strong></td>
        <td><asp:TextBox ID="txtTimedown" runat="server" class="form-control pull-left"  style="width:auto;" Text="10"></asp:TextBox><span style="float:left;padding:5px">秒</span>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator19"  runat="server" ControlToValidate="txtTimedown" ErrorMessage="反弹秒数格式不正确!"
                ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
    </tr>
     <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft" width="20%" style="height: 19px"><strong>开启秘书处理：</strong></td>
        <td><asp:RadioButtonList ID="rdo" runat="server" RepeatDirection="Horizontal">
             <asp:ListItem Value="1">开启</asp:ListItem>
             <asp:ListItem Value="0">停用</asp:ListItem>
            </asp:RadioButtonList></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft" width="20%" style="height: 19px"><strong>竞拍机制：</strong></td>
        <td><select id="ddlAucExecType" runat="server" onchange="SelCh(this.value)">
                <option value="0">固定机制</option>
                <option value="1">加码机制</option>
            </select></td>
    </tr>
    <tbody id="addma" style="display:none">
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>加码的起始次数：</strong></td>
        <td><asp:TextBox ID="txtAmaNum" runat="server" class="form-control pull-left"  style="width:auto;"></asp:TextBox>(竞拍多少次开始加码)
        <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server"
    ControlToValidate="txtAmaNum" ErrorMessage="起始次数必须是数字!" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator></td>
        </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>加码的次数增倍：</strong></td>
        <td><asp:TextBox ID="TextBox13" runat="server" class="form-control pull-left"  style="width:auto;"></asp:TextBox>倍(开始加码后竞拍次数以多少倍增加后继续加码)
        <asp:RegularExpressionValidator ID="RegularExpressionValidator20" runat="server"
    ControlToValidate="TextBox13" ErrorMessage="次数增倍必须是数字!" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator></td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>拍品加码价格：</strong></td>
        <td><asp:TextBox ID="txtAddMShPrice" runat="server" class="form-control pull-left"  style="width:auto;" Text="1"></asp:TextBox>元(即加码后每次出价商品价格增加数)
        <asp:RegularExpressionValidator ID="RegularExpressionValidator7"  runat="server" ControlToValidate="txtAddMShPrice" ErrorMessage="加码价格格式不正确!"
                ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>加码宝点数：</strong></td>
        <td><asp:TextBox ID="TextBox12" runat="server" class="form-control pull-left"  style="width:auto;" Text="10"></asp:TextBox>(即加码后每次出价消耗宝点增加数量)
        <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server"
    ControlToValidate="TextBox12" ErrorMessage="加码宝点数必须是数字!" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator></td>
        </tr>
    </tbody>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" style="display:none">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>提前多少小时进行预告：</strong></td>
        <td><asp:TextBox ID="txtNoticeTime" runat="server" class="form-control pull-left"  style="width:auto;" Text="24"></asp:TextBox>小时
            <asp:RegularExpressionValidator ID="RegularExpressionValidator18"  runat="server" ControlToValidate="txtNoticeTime" ErrorMessage="预告时间格式不正确!"
                ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>参与竞拍会员：</strong></td>
        <td><asp:DropDownList ID="usertype" runat="server">
        </asp:DropDownList></td>
    </tr>
     <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>干扰最高价格：</strong></td>
        <td><asp:TextBox ID="txtgumaxprice" runat="server" class="form-control pull-left"  style="width:auto;"></asp:TextBox><span style="float:left;padding:5px">(即干扰达到该价格就停止干扰)</span></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>商品状态：</strong></td>
        <td>
        <asp:RadioButtonList ID="rbstate" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Value="3" Selected="True">即将竞拍</asp:ListItem>
            <asp:ListItem Value="1">正在竞拍</asp:ListItem>
            <asp:ListItem Value="2">结束竞拍</asp:ListItem>
        </asp:RadioButtonList>
        </td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>起拍价格：</strong></td>
        <td style="height: 19px"><asp:TextBox ID="TextBox11" runat="server" Width="51px" class="form-control pull-left"  style="width:auto;">0</asp:TextBox><span style="float:left;padding:5px">(默认为0开始)</span>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator8"  runat="server" ControlToValidate="TextBox11" ErrorMessage="起拍价格格式不正确!"
                ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
    </tr>
     <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" width="20%" style="height: 19px"><strong>干扰设置：</strong></td>
        <td> <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="0" Selected="True">关闭干扰</asp:ListItem>
                <asp:ListItem Value="1">商品干扰设置</asp:ListItem>
                <asp:ListItem Value="2">全局干扰设置</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
     <tr>
        <td align="center" colspan="2" style="height: 59px" >&nbsp; &nbsp;
            <asp:Button ID="EBtnSubmit" class="btn btn-primary"  Text="保存竞拍商品" runat="server" OnClick="EBtnSubmit_Click" />
            <input type="button" class="btn btn-primary" value="返回列表" onclick="location.href = 'BidComplete_Manage.aspx'" id="Button2" />
        </td>
    </tr> 
</table>
</form>
</body>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/ajaxrequest.js"></script>
<script type="text/javascript">
    function TChange(obj) {
        var Stock = document.getElementById("stock").value;
        var sel = document.getElementById("tiptime");
        var Tips = document.getElementById("Tips");
        var autoCom = document.getElementById("autoCom");
        if (parseInt(Stock) < parseInt(obj)) {
            sel.innerHTML = "竞拍结束后商品在前台显示时间数：";
            Tips.innerHTML = "<font color='red'>竞拍商品数量大于库存数量</font>";
        } else if (obj < 2) {
            sel.innerHTML = "竞拍结束后商品在前台显示时间数：";
            Tips.innerHTML = "";
        } else if (autoCom.value == "0") {
            sel.innerHTML = "下一期进入竞拍间隔时间：";
            Tips.innerHTML = "";
        } else {
            sel.innerHTML = "竞拍结束后商品在前台显示时间数：";
            Tips.innerHTML = "";
        }
    }

    function autoChange(obj) {
        var sel = document.getElementById("tiptime");
        var txtBidNum = document.getElementById("txtBidNum").value;

        if (obj == 0 && parseInt(txtBidNum) > 1) {
            sel.innerHTML = "下一期进入竞拍间隔时间：";
        } else {
            sel.innerHTML = "竞拍结束后商品在前台显示时间数：";
        }
    }

    function SelCh(obj) {
        var addma = document.getElementById("addma");
        if (obj == 1) {
            addma.style.display = "";
        } else {
            addma.style.display = "none";
        }
    }
    function deldata(userid) {
        var objlist = document.getElementById("ListBox1");
        for (i = objlist.length - 1; i >= 0; i--) {
            if (objlist.options[i].value == userid) {
                objlist.remove(i);
            }
        }
    }
    function buttonclick(username, userid) {
        var objlist = document.getElementById("ListBox1");
        node = document.createElement("<option   value='" + userid + "'>");
        text = document.createTextNode(username);
        node.appendChild(text);
        objlist.appendChild(node);

        for (var i = 0; i < objlist.length; i++) {
            objlist.options[i].selected = true;
        }
    }

</script>
</asp:Content>