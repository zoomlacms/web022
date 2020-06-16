<%@ page language="C#" autoeventwireup="true" inherits="CloudCart, App_Web_ebbjt21n" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>加入购物车</title>
<link href="../App_Themes/UserThem/style.css"rel="stylesheet" type="text/css" />
<link href="../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/JS/ajaxrequest.js"></script>
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    var ajax = new AJAXRequest();
    function keydo(ids) {
        var num = document.getElementById("num" + ids).value;
        var prolists = document.getElementById("prolists").value;
        ajax.get(
    "/prompt/ShopCart/UpdateShopCar.aspx?cid=" + ids + "&num=" + num + "&menu=update&prolist=" + prolists,
    function (obj) {
        var pri = obj.responseText;//第一个值为了:总金额
        if (pri != null) {
            var prics = pri.split('|');
            if (prics != null && prics.length > 1) {
                document.getElementById("alljiage").innerText = prics[0];
                document.getElementById("price" + ids).innerText = prics[1];
                document.getElementById("currentpri" + ids).innerText = prics[2];  
                document.getElementById("num" + ids).innerText = prics[3];
                document.getElementById("alljifen").innerText = prics[4]; 
            }
        }
    }
    );
    }
</script>
</head>
<body> 
<form id="form1" runat="server">
<div id="main" class="rg_inout">
    <h1>第一步:加入购物车<span>[<asp:Label ID="Label1" runat="server"></asp:Label>]</span><img src="/user/images/regl1.gif" /></h1>
    <div class="cart_lei">
    <ul>
        <li class="i0">图片</li>
        <li class="i1">商品名称</li>
        <li class="i2">商品属性</li>                   
        <li class="i3">数量</li>
        <li class="i4">单位</li>
        <li class="i5">市场价</li>
        <li class="i6">当前价格</li>
        <li class="i7">折扣</li>
        <li class="i8">金额</li>
        <li class="i9">操作</li>
     </ul>
    </div>
    
    <div class="cart_con">
    <asp:Repeater ID="cartinfo" runat="server" OnItemDataBound="cartinfo_ItemDataBound">
        <ItemTemplate>
            <ul <%#(Eval("Bindpro","{0}")=="")?"":"style=background-color:#E6E6E6"%> >
                <li class="i0"><a href='Shop.aspx?ID=<%#Eval("proid")%>' target="_blank"><%#getproimg(Eval("proid","{0}"))%></a></li>
                <li class="i1" ><%#GetProtype(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%><a href='Shop.aspx?ID=<%#Eval("proid")%>' target="_blank"><%#Eval("proname")%></a></li>
                <li class="i2" ><%#Eval("Attribute")%></li>
                <li class="i3">
               <a href="javascript:;" class="J_minus" onblur="keydo('<%#Eval("id") %>')">-</a>    <input onkeydown="if(event.keyCode==13){ keydo('<%#Eval("id") %>');return false;}" id='num<%#Eval("id") %>' value='<%#DataBinder.Eval(Container, "DataItem.pronum", "{0}")%>'  style="width: 30px; height:20px" onblur="keydo('<%#Eval("id") %>')" class="J_input"  /><a href="javascript:;" class="J_add" onblur="keydo('<%#Eval("id") %>')">+</a></li>
                <li class="i4">
                    <%#getProUnit(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%></li>                            
                <li class="i5">
                    <%#getjiage(Eval("proclass", "{0}"), "1", DataBinder.Eval(Container, "DataItem.proid", "{0}"), DataBinder.Eval(Container, "DataItem.pronum", "{0}"))%></li>
                <li class="i6"><span id='currentpri<%#Eval("id") %>'>
                    <%#getjiage(Eval("proclass", "{0}"), "2", DataBinder.Eval(Container, "DataItem.proid", "{0}"), DataBinder.Eval(Container, "DataItem.pronum", "{0}"))%></span></li>
                <li class="i7">
                    <%#getproscheme(Eval("ID","{0}"))%></li>
                <li class="i8"><span id='price<%#Eval("id") %>'>
                    <%#getprojia(Eval("ID", "{0}"), DataBinder.Eval(Container, "DataItem.pronum", "{0}"))%></span></li>
                <li class="i9"><a href="CloudCart.aspx?menu=del&cid=<%#Eval("id")%>"  onclick="return confirm('确定？移除后您要从商城重新添加商品!');">移除</a></li>
                <div class="clear"></div>
            </ul>
        </ItemTemplate>
    </asp:Repeater>
    </div>
    <asp:HiddenField ID="prolists" runat="server" />
    <div style="margin-left: 170px;">
     共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>个商品
    <asp:Label ID="Toppage" runat="server" Text="" />
    <asp:Label ID="Nextpage" runat="server" Text="" />
    <asp:Label ID="Downpage" runat="server" Text="" />
    <asp:Label ID="Endpage" runat="server" Text="" />
    页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
    <asp:Label ID="pagess" runat="server" Text="" />个商品/页 转到第
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>页
    </div>
    <div id="tejia" runat="server">
    <div id="Div1" runat="server" visible="false">特价商品:</div>
    <div id="Div3" class="cart_lei" runat="server">
        <ul>
            <li class="i0">图片</li>
            <li class="i1">商品名称</li>
            <li class="i2">数量</li>
            <li class="i3">单位</li>
            <li class="i4">市场价</li>
            <li class="i5">优惠价</li>
            <li class="i6">金额</li>
            <li class="i7">操作</li>
        </ul>
        </div>
        
    <div class="cart_con">
        <asp:Repeater ID="cartinfo2" runat="server">
            <ItemTemplate>
                <ul <%#(Eval("Bindpro","{0}")=="")?"":"style=background-color:#E6E6E6"%>>
                <li class="i0"><%#getproimg(Eval("proid","{0}"))%></li>
                <li class="i1"><%#GetProtype(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%><a href='Shop.aspx?ID=<%#Eval("proid")%>' target="_blank"><%#Eval("proname")%></a></li>
                <li class="i2"><input onkeydown="if(event.keyCode==13){ keydo('<%#Eval("id") %>');return false;}" id='num<%#Eval("id") %>' value='<%#DataBinder.Eval(Container, "DataItem.pronum", "{0}")%>' style="width: 30px; height:20px" onblur="keydo('<%#Eval("id") %>')" /></li>
                <li class="i3"><%#getProUnit(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%></li>                            
                <li class="i4"><%#getjiage(Eval("proclass", "{0}"), "1", DataBinder.Eval(Container, "DataItem.proid", "{0}"), DataBinder.Eval(Container, "DataItem.pronum", "{0}"))%></li>
                <li class="i5"><span id='currentpri<%#Eval("id") %>'><%#getjiage(Eval("proclass", "{0}"), "2", DataBinder.Eval(Container, "DataItem.proid", "{0}"), DataBinder.Eval(Container, "DataItem.pronum", "{0}"))%></span></li>                            
                <li class="i6"><span id='price<%#Eval("id") %>'><%#getprojia(Eval("ID", "{0}"), DataBinder.Eval(Container, "DataItem.pronum", "{0}"))%></span></li>
                <li class="i7"><a href="CloudCart.aspx?menu=del&cid=<%#Eval("id")%>" onclick="return confirm('确定？移除后您要从商城重新添加商品!');">移除</a></li>
                <div class="clear"></div>
            </ul>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </div>
  
    <div id="tuangou" runat="server" visible="false">
    <div id="Div5" runat="server" >团购商品:</div>
    <div id="Div2" class="cart_lei" runat="server">
        <ul>
            <li class="i0">图片</li>
            <li class="i1">商品名称</li>
            <li class="i2">数量</li>
            <li class="i5">单位</li>
            <li class="i6">市场价</li>
            <li class="i7">团购价</li>
            <li class="i8">金额</li>
            <li class="i9">操作</li>
        </ul>
        </div>
    <div class="cart_con">
        <asp:Repeater ID="cartinfo3" runat="server">
            <ItemTemplate>
             <ul <%#(Eval("Bindpro","{0}")=="")?"":"style=background-color:#E6E6E6"%>>
                <li class="i0"><%#getproimg(Eval("proid","{0}"))%></li>
                <li class="i1"><%#GetProtype(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%><a href='Shop.aspx?ID=<%#Eval("proid")%>' target="_blank"><%#Eval("proname")%></a></li>
                <li class="i2"><input onkeydown="if(event.keyCode==13){ keydo('<%#Eval("id") %>');return false;}" id='num<%#Eval("id") %>' value='<%#DataBinder.Eval(Container, "DataItem.pronum", "{0}")%>' style="width: 30px; height:20px" onblur="keydo('<%#Eval("id") %>')" /></li>
                <li class="i3"><%#getProUnit(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%></li>                            
                <li class="i4"><%#getjiage(Eval("proclass", "{0}"), "1", DataBinder.Eval(Container, "DataItem.proid", "{0}"), DataBinder.Eval(Container, "DataItem.pronum", "{0}"))%></li>
                <li class="i5"><span id='currentpri<%#Eval("id") %>'><%#getjiage(Eval("proclass", "{0}"), "2", DataBinder.Eval(Container, "DataItem.proid", "{0}"), DataBinder.Eval(Container, "DataItem.pronum", "{0}"))%></span></li>                            
                <li class="i6"><span id='price<%#Eval("id") %>'><%#getprojia(Eval("ID", "{0}"), DataBinder.Eval(Container, "DataItem.pronum", "{0}"))%></span></li>
                <li class="i7"><a href="CloudCart.aspx?menu=del&cid=<%#Eval("id")%>" onclick="return confirm('确定？移除后您要从商城重新添加商品!');">移除</a></li>
                <div class="clear"></div>
            </ul>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </div>

    <div id="jifensp" runat="server" visible="false">
    <div id="Div4" runat="server">积分商品:</div>
    <div id="Div6" class="cart_lei" runat="server">
    <ul >
            <li class="i0">图片</li>
            <li class="i1">商品名称</li>
            <li class="i2">数量</li>
            <li class="i3">单位</li>
            <li class="i4">市场价</li>
            <li class="i5">积分价</li>
            <li class="i6">积分</li>
            <li class="i7">操作</li>
        </ul>
    </div>
    
    <div class="cart_con">
      <asp:Repeater ID="cartinfo4" runat="server">
            <ItemTemplate>
             <ul <%#(Eval("Bindpro","{0}")=="")?"":"style=background-color:#E6E6E6"%>>
                <li class="i0"><%#getproimg(Eval("proid","{0}"))%></li>
                <li class="i1"><%#GetProtype(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%><a href='Shop.aspx?ID=<%#Eval("proid")%>' target="_blank"><%#Eval("proname")%></a></li>
                <li class="i2"><input onkeydown="if(event.keyCode==13){ keydo('<%#Eval("id") %>');return false;}" id='num<%#Eval("id") %>' value='<%#DataBinder.Eval(Container, "DataItem.pronum", "{0}")%>' style="width: 30px; height:20px" onblur="keydo('<%#Eval("id") %>','3')" /></li>
                <li class="i3"><%#getProUnit(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%></li>                            
                <li class="i4"><%#getjiage("proclass", "1", DataBinder.Eval(Container, "DataItem.proid", "{0}"), DataBinder.Eval(Container, "DataItem.pronum", "{0}"))%></li>
                <li class="i5"><span id='currentpri<%#Eval("id") %>'><%#getjiage("3", "type", DataBinder.Eval(Container, "DataItem.proid", "{0}"), DataBinder.Eval(Container, "DataItem.pronum", "{0}"))%></span></li>   
                <li class="i6"><span id='price<%#Eval("id") %>'><%#getprojia(Eval("ID", "{0}"), DataBinder.Eval(Container, "DataItem.pronum", "{0}"))%></span></li>
                <li class="i7"><a href="CloudCart.aspx?menu=del&cid=<%#Eval("id")%>" onclick="return confirm('确定？移除后您要从商城重新添加商品!');">移除</a></li>
                <div class="clear"></div>
            </ul>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </div>


    <div class="jia">
    <ul>
        <li>总金额合计：<asp:Label ID="alljiage" runat="server" Text=""></asp:Label></li>
        <li><input  id="btn_ck"  type="button" value="确认订单"  class="i_bottom" onclick="btnview()" /> <input id="btn_fh" type="button" value="返回购物"  class="i_bottom" onclick="    btnbck()"  /> 
            <asp:Button ID="Button1" CssClass="i_bottom" runat="server" Text="去结算" OnClick="Button1_Click" /></li>
        <asp:HiddenField ID="project" runat="server" />
        <asp:HiddenField ID="jifen" runat="server" />
        <asp:HiddenField ID="hfproclass" runat="server" />
        </ul>

    </div>
        
    <div id="Label2" runat="server"></div>
        
 <div class="clear"></div>
 </div>

<div id="bottom">
<a href="/"><img src="<%=Call.Logo %>" alt="<%=Call.SiteName %>" /></a>
<p>
<script language="javascript" type="text/javascript"> 

    document.getElementById("Button1").style.display="none";
    document.getElementById("btn_fh").style.display="none";
    function btnview(){ 
        document.getElementById("Button1").style.display="";
        document.getElementById("btn_fh").style.display=""; 
        document.getElementById("btn_ck").style.display="none"; 
        $(".J_minus").css("display","none");
        $(".J_add").css("display","none");  
        
        $(document).ready(function(){   $(".J_input").each(function(){      this.disabled=true;   }); });
    }
    function btnbck(){
        document.getElementById("Button1").style.display="none";
        document.getElementById("btn_fh").style.display="none";  
        document.getElementById("btn_ck").style.display=""; 
        $(".J_minus").css("display","");
        $(".J_add").css("display","");  
        $(document).ready(function(){   $(".J_input").each(function(){      this.disabled=false;   }); });
    }
    
    

    <!-- 
    var year="";
    mydate=new Date();
    myyear=mydate.getYear();
    year=(myyear > 200) ? myyear : 1900 + myyear;
    document.write(year); 
    --> 
</script>&copy;&nbsp;Copyright&nbsp; <%=Call.SiteName %> All rights reserved.</p>
</div>
</form>
<script>
    /*商品加减*/
    $.fn.iVaryVal=function(iSet){
        /*
         * Minus:点击元素--减小
         * Add:点击元素--增加
         * Input:表单元素
         * Min:表单的最小值，非负整数
         * Max:表单的最大值，正整数
         * Fun:回调函数
         */
        iSet=$.extend({Minus:$('.J_minus'),Add:$('.J_add'),Input:$('.J_input'),Min:0,Max:20,Fun:null},iSet);
        var C=null,O=null;
        //输出值全局对象[若担心全局对象污染，可定义一个hidden表单，向其传值]
        $GLOBAL={};
        //增加
        iSet.Add.each(function(i){
            $(this).click(function(){
                O=parseInt(iSet.Input.eq(i).val());
                (O+1<=iSet.Max) || (iSet.Max==null) ? iSet.Input.eq(i).val(O+1) : iSet.Input.eq(i).val(iSet.Max);
                //输出当前改变后的值
                $GLOBAL.val=iSet.Input.eq(i).val();
                $GLOBAL.index=i;
                //回调函数
                if (typeof iSet.Fun == 'function') {
                    iSet.Fun.call(this);
                }
            });
        });
        //减少
        iSet.Minus.each(function(i){
            $(this).click(function(){
                O=parseInt(iSet.Input.eq(i).val());
                O-1<iSet.Min ? iSet.Input.eq(i).val(iSet.Min) : iSet.Input.eq(i).val(O-1);
                $GLOBAL.val=iSet.Input.eq(i).val();
                $GLOBAL.index=i;
                //回调函数
                if (typeof iSet.Fun == 'function') {
                    iSet.Fun.call(this);
                }
            });
        });
        //手动
        iSet.Input.bind({
            'click':function(){
                O=parseInt($(this).val());
                $(this).select();
            },
            'keyup':function(e){
                if($(this).val()!=''){
                    C=parseInt($(this).val());
                    //非负整数判断
                    if(/^[1-9]\d*|0$/.test(C)){
                        $(this).val(C);
                        O=C;
                    }else{
                        $(this).val(O);
                    }
                }
                //键盘控制：上右--加，下左--减
                if(e.keyCode==38 || e.keyCode==39){
                    iSet.Add.eq(iSet.Input.index(this)).click();
                }
                if(e.keyCode==37 || e.keyCode==40){
                    iSet.Minus.eq(iSet.Input.index(this)).click();
                }
                //输出当前改变后的值
                $GLOBAL.val=$(this).val();
                $GLOBAL.index=iSet.Input.index(this);
                //回调函数
                if (typeof iSet.Fun == 'function') {
                    iSet.Fun.call(this);
                }
            },
            'blur':function(){
                $(this).trigger('keyup');
                if($(this).val()==''){
                    $(this).val(O);
                }
                //判断输入值是否超出最大最小值
                if(iSet.Max){
                    if(O>iSet.Max){
                        $(this).val(iSet.Max);
                    }
                }
                if(O<iSet.Min){
                    $(this).val(iSet.Min);
                }
                //输出当前改变后的值
                $GLOBAL.val=$(this).val();
                $GLOBAL.index=iSet.Input.index(this);
                //回调函数
                if (typeof iSet.Fun == 'function') {
                    iSet.Fun.call(this);
                }
            }
        });
    }
    //调用
    $( function() {
	
        $('.i_box').iVaryVal({Fun:function(){
		
        }});
	
    });
</script>

</body>
</html>
