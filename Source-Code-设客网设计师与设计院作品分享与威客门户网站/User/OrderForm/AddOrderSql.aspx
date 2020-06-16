<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_AddOrderSql, App_Web_xtlk0k3d" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>添加订单申请</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="shop"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title='网站首页' href='/'><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="OrderSql.aspx">账单申请</a></li>
        <li class="active">添加申请账单</li> 
    </ol>
</div>
<div class="container btn_green"> 
        <table class="table table-bordered table-striped table-hover">
            <tr>
                <td align="right">帐单类型：</td>
                <td>
                    <asp:DropDownList CssClass="form-control text_300" ID="OrderType" runat="server">
                        <asp:ListItem Value="1">新开返利</asp:ListItem>
                        <asp:ListItem Value="2">消费上报</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">报价商家用户ID:</td>
                <td>
                    <asp:TextBox ID="UserName" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
            </tr>
            <tr>
                <td width="15%" align="right">订单金额:</td>
                <td>
                    <asp:TextBox ID="money" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
            </tr>
            <tr>
                <td width="15%" align="right">再次确认返分会员ID:</td>
                <td>
                    <asp:TextBox ID="PuserID" runat="server" CssClass="form-control text_300" AutoPostBack="True" OnTextChanged="PuserID_Changed"></asp:TextBox>*请再次录入会员ID：<%Call.Label("{$GetRequest(UID)$}"); %>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="PuserID" ErrorMessage="用户ID只能为数字！" ValidationExpression="^\+?[1-9][0-9]*$"></asp:RegularExpressionValidator></td>
            </tr>
            <!--onkeyup="value=value.replace(/[^\d\.]/g,'')"  -->
            <tr>
                <td width="15%" align="right">会员名校验：</td>
                <td>
                    <asp:TextBox ID="PuserName" runat="server" CssClass="form-control text_300"></asp:TextBox>
                    <asp:Label ID="UserTip" runat="server" Style="color: #f00;">无此会员!</asp:Label>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">脚本:</td>
                <td>
                    <asp:TextBox ID="Sqlstr" runat="server" CssClass="form-control text_300" TextMode="MultiLine" Rows="20" Style="max-width:500px; height: 150px;" Text=" "></asp:TextBox></td>
            </tr>
            <tr>
                <td width="15%" align="right">备注:</td>
                <td>
                    <asp:TextBox ID="remark" runat="server" CssClass="form-control text_300"></asp:TextBox>
                </td>
            </tr> 
            <tr>
                <td colspan="2" class="text-center">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" class="btn btn-primary" />
                    <input type="button" id="Button2" value="返回" class="btn btn-primary" onclick="javascript: history.back();" />
                </td>
            </tr>
        </table>
        <div class="alert alert-success">
             <h4>提示</h4>
                <p>*您可以更改源码中的SQL数据脚本提交模板。</p> 
        </div>
        <!--下面的代码用于被脚本引用，默认隐藏属性-->
        <textarea name="str" rows="20" cols="20" id="str" style="width: 200px; height: 80px; display: none;"> 
/*开始传钱*/

Declare @分成级别 int,@传入会员消费额 int,@传入商家会员ID int,@传入商家会员名 nvarchar(255),@传入商家应得金额 money,@程序上的实际上级商家名 nvarchar(255),@程序上的实际上级商家应得金额 money,@导购员应得金额 money,@市县代理应得金额 money,@省代分成 money,@会员ID int

set @分成级别=
(
	select rebaterate from ZL_Group
	where GroupID=
	(
	select GroupID from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserName=(
	select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserID=<%Call.Label("{$GetRequest(UID)$}"); %>
	)
	)--查出所属商家的分成点数（有三种比例）
)
set @传入会员消费额=<%Call.Label("{$GetRequest(Money)$}"); %> --由GET传入
set @传入商家会员ID=<%Call.Label("{$GetRequest(PayNameID)$}"); %>--由GET传入
set @传入商家会员名=(Select username from ZL_User where UserID=<%Call.Label("{$GetRequest(PayNameID)$})"); %>
set @传入商家应得金额=
(
	@传入会员消费额*(select RebateRate from ZL_Group
	where GroupID=(
	select GroupID from ZL_User where  UserName=@传入商家会员ID
	))/100
)


set @程序上的实际上级商家名=
(
	select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserID=<%Call.Label("{$GetRequest(UID)$}"); %> --查出上一级代理，三种商家
)
set @程序上的实际上级商家应得金额=
(
	@传入会员消费额*(select RebateRate from ZL_Group
	where GroupID=(
	select GroupID from ZL_User where  UserName=@程序上的实际上级商家名
	))/100
)
set @导购员应得金额=(@传入会员消费额*0.01)
set @市县代理应得金额=(@传入会员消费额*0.02)
set @省代分成=(@传入会员消费额*0.005)
set @会员ID=<%Call.Label("{$GetRequest(UID)$}"); %>

--select @分成级别 as 分成级别,@传入商家会员ID as 传入商家会员ID,@传入商家会员名 as 传入商家会员名,@传入商家应得金额 as 传入商家应得金额,@程序上的实际上级商家名 as 程序上的实际上级商家会员名,@传入会员消费额 as 传入会员消费额,@程序上的实际上级商家应得金额 as 程序上的实际上级商家应得金额,@导购员应得金额 as 导购员应得金额,@市县代理应得金额 as 市县代理应得金额,@省代分成 as 省代分成,@会员ID as 会员ID

if
 @传入商家会员名=@程序上的实际上级商家名
 begin

update zl_user set Purse=Purse+@程序上的实际上级商家应得金额 where  UserName=@程序上的实际上级商家名
--会员实际消费且按8%、12%、16%级别分成

update zl_user set Purse=Purse+@导购员应得金额 where  UserName=(
	select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where UserName=(
	select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserID=<%Call.Label("{$GetRequest(UID)$}"); %>
	)
)--查出三种商家上的级别,如购导员，并按1%分成

update zl_user set Purse=Purse+@市县代理应得金额 where  UserName=(
	select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserName=(
	select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserName=
		(
		select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserID=<%Call.Label("{$GetRequest(UID)$})"); %>
	)
)--查出区县代理商，按2%分成

update zl_user set Purse=Purse+@省代分成 where  UserName=(
	select Username from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where GroupID=2 and Province=(
	select province from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserID=<%Call.Label("{$GetRequest(UID)$}"); %>
	)
)--查出唯一的省代,并按0.5%分成

end
else
begin

update zl_user set Purse=Purse+@传入商家应得金额 where  UserID=@传入商家会员ID

end     
 </textarea>
        <script>
            document.getElementById("Sqlstr").value = document.getElementById("str").value;
        </script>
        <!--引用结束-->
    </div>
</asp:Content>
