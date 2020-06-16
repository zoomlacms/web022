<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Content_AddMap, App_Web_q5rpj2um" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>标注地图</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">标注地图</li>
</ol>
</div>
<input type="hidden" id="hlngx" name="hlngx" />
<input type="hidden" id="hlngy" name="hlngy" />
<input type="hidden" id="hlngz" name="hlngz" />
<input type="hidden" id="hmid" name="hmid" />
<input type="hidden" runat="server" id="haddtxt" name="haddtxt" value="您的位置" />
<div class="container">
<div style=" margin-bottom:10px; text-align: left;">
地区选择：<input value="放大" id="maxmap" class="btn btn-primary" type="button" />
<input id="minmap" class="btn btn-primary" type="button" value="缩小" />
<asp:DropDownList runat="server" ID="drop" CssClass="form-control" Width="150"></asp:DropDownList>
<asp:DropDownList runat="server" ID="drop1" CssClass="form-control" Width="150">
<asp:ListItem Value="" Text="请选择"></asp:ListItem>
</asp:DropDownList>
</div>
<div id="map" style="height: 400px">
</div>
<br />
<p class="tips">
提示：鼠标在地图区拖动可以创建您的标注
</p>
<div style="margin: auto; margin-top: 20px; width: 90%; height: 50px; line-height: 50px; text-align: center;">
<asp:Button Text="保存地图" CssClass="btn btn-primary" ID="Save" runat="server" OnClick="Save_Click" />
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=" type="text/javascript"></script>
    <script type="text/javascript" src="http://fw.qq.com/ipaddress" charset="gb2312"></script>
    <script src="/JS/GoogleMap.js" type="text/javascript"></script>
    <script type="text/javascript"> 
        window.onload = function () {
            ShowMap(<%=uid %>,'',<%=mid %>);
            $.get('GoogleMap.ashx?mt=' + new Date().getTime() + "&v2=select&mid=<%=mid %>", function (data) {
                var tr=data.split(',');
                $("#hlngy").val(tr[0]);
                $("#hlngx").val(tr[1]);
                $("#hlngz").val(tr[2]);
                $("#haddtxt").val(tr[3]);
            }); 
        } 
    </script>
    <script type="text/javascript"> 
        function Getvs() {
            $("#hmid").val($("#addtxt").val());
        }
        $("#drop").change(function () {
            ShowMap('<%=uid %>',$("#drop").val(),'<%=mid %>');
            $.get('GoogleMap.ashx?mt=' + new Date().getTime() + "&v2=xml&Xname=" + escape($("#drop").val()), function (data) {
                var tr=data.split(',');
                var gm;
                for(var i=0;i<tr.length;i++)
                {
                    gm +="<option value=\""+tr[i]+"\" >"+tr[i]+"</option>";
                }
                $("#drop1").html(gm);
            });
        });
            $("#drop1").change(function () {
                if($("#drop1").val().replace(" ","").length>0)
                {
                    ShowMap('<%=mid %>',$("#drop1").val());  
        }
            });  
    $().ready(function(){
        ShowMap('<%=uid %>','','<%=mid %>');
    })
    </script>
</asp:Content>
