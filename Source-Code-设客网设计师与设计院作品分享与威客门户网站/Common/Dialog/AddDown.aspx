<%@ page language="C#" autoeventwireup="true" inherits="Manage_Content_Diag_AddDown, App_Web_dasombaf" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>自定义下载</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div  style="min-height:400px;"> <table class="table table-bordered table-striped table-hover">
        <tr><td>文件地址
            </td><td>文件名</td><td>货币类型</td><td>价格</td><td>有效期(分钟)</td><td>下载数</td></tr>
        <tbody id="downtb">

        </tbody>
    </table>
    <input type="button" value="再加一个" class="btn btn-primary" onclick="AddTr(1);" />
    <input type="button" value="保存修改" class="btn btn-primary" onclick="CallBack();"  />
    <div class="alert alert-info">价格为0则可免费下载,时间为0则购买永久有效</div>
      </div> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        //传入ID,获取值
        var pval =<%=Request.QueryString["pval"]%>;
        var trtlp="<tr>"
          +"<td><input type='button' class='btn btn-info' value='移除' onclick='RemoveTr(this);' /><input type='text' class='form-control text_300' name='url' /></td>"
          +"<td><input type='text' class='form-control text_x' name='fname' /></td>"
          +"<td><select name='ptype' class='form-control text_x'><option value='purse'>余额</option>"
          +"<option selected='selected' value='sicon'>银币</option>"
          +"<option value='point'>积分</option></select></td>"
          +"<td><input type='text' class='form-control text_x' onkeyup=\"this.value=this.value.replace(/\\D/g,'');\" value='0' name='price'/>"
          +"<input type='hidden' name='ranstr'/>"
          +"</td><td><input type='text' class='form-control text_x' value='0' onkeyup=\" this.value=this.value.replace(/\\D/g,'');\" name='hour'/></td>"
          +"<td><input type='text' class='form-control text_x' value='0' name='count' value='0'/></td></tr>";
;        $(function () {
            var str = parent.document.getElementById(pval.name).value;
            if(str&&str!="")
            {
                var json=JSON.parse(str);
                for (var i = 0; i < json.length; i++) {
                    var tr=$(trtlp); $("#downtb").append(tr);//返回的是tbody
                    SetVals(tr,json[i]);
                }
            }else{AddTr(1);}
        })
        function AddTr(num)
        {
            var tr=$(trtlp);
            tr.find("[name=ranstr]").val(GetRanPass(10));
            $("#downtb").append(tr);
        }
        function RemoveTr(obj)
        {
            $(obj).closest("tr").remove();
        }
        //------
        function GetValByName(tr,name)
        {
            var obj=  $(tr).find("[name="+name+"]")[0];
            return $(obj).val();
        }
        var downArr=[];
        function GetVals()
        {
            var trArr=$("#downtb").find("tr");
            for (var i = 0; i < trArr.length; i++) {
                var downMod={url:"",fname:"",ranstr:"",count:0,ptype:"sicon",price:0,hour:0};
                downMod.url=GetValByName(trArr[i],"url");
                downMod.fname=GetValByName(trArr[i],"fname");
                downMod.ranstr=GetValByName(trArr[i],"ranstr");
                downMod.count=GetValByName(trArr[i],"count");
                downMod.ptype=GetValByName(trArr[i],"ptype");
                downMod.price=GetValByName(trArr[i],"price");
                downMod.hour=GetValByName(trArr[i],"hour");
                if(downMod.url==""||downMod.fname=="")continue;
                downArr.push(downMod);
            }
            return downArr;
        }
        function SetVals(tr,model)
        {
            $($(tr).find("[name=url]")).val(model.url);
            $($(tr).find("[name=fname]")).val(model.fname);
            $($(tr).find("[name=ranstr]")).val(model.ranstr);
            $($(tr).find("[name=count]")).val(model.count);
            $($(tr).find("[name=ptype]")).val(model.ptype);
            $($(tr).find("[name=price]")).val(model.price);
            $($(tr).find("[name=hour]")).val(model.hour);
        }
        function CallBack()
        {
            var vals=GetVals();
            console.log(vals);
            parent.PageCallBack("adddown",vals,pval);
        }
    </script>
</asp:Content>