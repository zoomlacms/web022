<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_ShowProduct, App_Web_1lmqzdkx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>商品预览</title>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/JavaScript">
        var diag = new ZL_Dialog();
        function opentitle(url, title) {
            diag.title = title;
            diag.url = url;
            diag.ShowModal();
        }
        var aid = 0;
        var showID = 0;
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4", "TabTitle5", "TabTitle6", "TabTitle7");
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2", "Tabs3", "Tabs4", "Tabs5", "Tabs6", "Tabs7");
        function ShowTabss(SID) {
            if (SID != tID) {
                if (document.getElementById(arrTabTitle[tID].toString()) != null)
                    document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                if (document.getElementById(arrTabTitle[SID].toString()) != null)
                    document.getElementById(arrTabTitle[SID].toString()).className = "titlemouseover";
                if (document.getElementById(arrTabs[tID].toString()) != null)
                    document.getElementById(arrTabs[tID].toString()).style.display = "none";
                if (document.getElementById(arrTabs[SID].toString()) != null)
                    document.getElementById(arrTabs[SID].toString()).style.display = "";
                tID = SID;
                aid = SID;
                $(".nav-tabs li").each(function () {
                    $(this).removeClass("active");
                    if ($(this).find("a").attr("href") == "#tab" + SID) {$(this).addClass("active") }
                });
                if (aid <= 0) {
                    document.getElementById("upbutton").style.display = "none";
                }
                if (aid <= 7)
                { document.getElementById("Editdown").style.display = ""; }
                if (aid >= 7) {
                    document.getElementById("Editdown").style.display = "none";
                    document.getElementById("upbutton").style.display = "";
                }
                if (aid >= 1) {
                    document.getElementById("upbutton").style.display = "";
                }

            }

        
        }


        window.onload = function() {
            document.getElementById("upbutton").style.display = "none";
        }

        function ShowTable() {
            aid = aid + 1;
            if (aid < 8) {
                ShowTabss(aid);
            }
            if (aid >= 7) {
                document.getElementById("Editdown").style.display = "none";
                document.getElementById("upbutton").style.display = "";
            }
            if (aid >= 1) {
                document.getElementById("upbutton").style.display = "";
            }

        }

        function showup() {
            aid = aid - 1;
            if (aid >= 0 && aid < 8) {
                ShowTabss(aid);
            }
            if (aid <= 0) {
                document.getElementById("upbutton").style.display = "none";
            }
            if (aid <= 7)
            { document.getElementById("Editdown").style.display = ""; }
        }

        function deleteRow(tableID, rowIndex, rowsid) {
            var ccd = confirm('你确定将此绑定的商品删除吗？');
            if (ccd) {
                var table = document.all[tableID]
                var bindstr = "," + document.getElementById("Hiddenbind").value + ",";
                rowsid = "," + rowsid + ",";
                var reg = new RegExp(rowsid, "g")
                bindstr = bindstr.replace(reg, ",");
                reg = new RegExp(",,", "g")
                bindstr = bindstr.replace(reg, ",");
                document.getElementById("Hiddenbind").value = bindstr;
                table.deleteRow(rowIndex);
                document.getElementById("Hiddenbind").value = document.getElementById("Hiddenbind").value.replace(reg, ",");
                if (document.getElementById("Hiddenbind").value == "" || document.getElementById("Hiddenbind").value == ",") {
                    document.getElementById("Span1").innerHTML = "";
                    document.getElementById("Hiddenbind").value = "";
                }
            }
        }

        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id && elm[i].id.indexOf("Item", false) > -1) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }

        function SelectProducer() {
            window.open('Producerlist.aspx', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        }

        function OpenSelect() {

            window.open('AddbindPro.aspx?id=<%=Mid %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        return false;
    }

    function ProductsSelect(act) {
        window.open('ProductsSelect.aspx?act=' + act, '', 'width=600,height=450,resizable=0,scrollbars=yes');
    }

    function OpenprojectSelect() {

        window.open('projectSelect.aspx', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        return false;
    }

    function ClearSelect() {
        document.getElementById("Span1").innerHTML = "";
        document.getElementById("Hiddenbind").value = "";
    }

    function SelectBrand() {
        window.open('Brandlist.aspx?producer=' + document.getElementById('Producer').value + '', '', 'width=600,height=450,resizable=0,scrollbars=yes');

    }

    function SetDisabled(checked) {
        document.getElementById('ProCode').disabled = checked;
    }


    function show(checked) {
        if (checked.value == 1) {
            document.getElementById("pifaji").style.display = "";
        }
        else {
            document.getElementById("pifaji").style.display = "none";
        }
    }

    function showpf() {
        if (document.getElementById("Wholesales_0").checked == true) {
            document.getElementById("pifaji").style.display = "";
        } else {
            document.getElementById("pifaji").style.display = "none";
        }
    }

    function Clearoption() {
        var hiddenidvalue = document.getElementById("OtherProject"); //获取已经存在的ID值

        for (var i = hiddenidvalue.options.length - 1; i >= 0; i--) {
            if (hiddenidvalue[i].selected == true) {
                hiddenidvalue[i] = null;
            }
        }

    }

    function ShowGuess(obj) {
        switch (obj) {
            case 1:
                document.getElementById("Guess1").style.display = "none";
                document.getElementById("Guess2").style.display = "none";
                break;
            case 2:
                document.getElementById("Guess1").style.display = "";
                document.getElementById("Guess2").style.display = "none";
                break;
            case 3:
                document.getElementById("Guess1").style.display = "none";
                document.getElementById("Guess2").style.display = "";
                break;
        }

        
    }

    function ShowInterference(i) {
        switch (i) {
            case 1:
                document.getElementById("tableInterference").style.display = "none";
                break;
            case 2:
                document.getElementById("tableInterference").style.display = "";
                document.getElementById("Panel1").style.display = "";
                document.getElementById("Panel2").style.display = "none";

                break;
            case 3:
                document.getElementById("tableInterference").style.display = "";
                document.getElementById("Panel2").style.display = "";
                document.getElementById("Panel1").style.display = "none";
                break;
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
    function deldata(userid) {
        var objlist = document.getElementById("ListBox1");
        for (i = objlist.length - 1; i >= 0; i--) {
            if (objlist.options[i].value == userid) {
                objlist.remove(i);
            }
        }
    }   


    </script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab0" data-toggle="tab" onclick="ShowTabss(0)">基本信息</a></li>
        <li><a href="#tab1" data-toggle="tab" onclick="ShowTabss(1)">介绍及图片</a></li>
        <li><a href="#tab2" data-toggle="tab" onclick="ShowTabss(2)">其他信息</a></li>
        <li><a href="#tab3" data-toggle="tab" onclick="ShowTabss(3)">价格设置</a></li>
        <li><a href="#tab4" data-toggle="tab" onclick="ShowTabss(4)">促销设置</a></li>
        <li><a href="#tab5" data-toggle="tab" onclick="ShowTabss(5)">商品属性</a></li>
        <li><a href="#tab7" runat="server" id="Share_A"  data-toggle="tab" onclick="ShowTabss(7)">商品评论</a></li>
        </ul>
                <table class="table table-striped table-bordered table-hover">
                    <tbody id="Tabs0">
                        <tr>
                            <td class="td_l">
                                <strong>所属节点：</strong>
                            </td>
                            <td>
                                <asp:Label ID="nodename" runat="server"></asp:Label>
                                <asp:HiddenField ID="HdnNode" runat="server" />
                                <asp:HiddenField ID="HdnModel" runat="server" />
                                <asp:HiddenField ID="ClickType" runat="server" />
                                <asp:HiddenField ID="I_tem" runat="server" />
                                <asp:HiddenField ID="ComModelID" runat="server" />
                                <asp:HiddenField ID="Hiddenbind" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>所属专题：</strong>
                            </td>
                            <td>
                                <asp:HiddenField ID="HdnSpec" runat="server" />
                                <asp:Label ID="Categoryname" runat="server"></asp:Label>
                                <div id="lblSpec" runat="server">
                                </div>
                                <asp:HiddenField ID="Categoryid" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td><strong>录入者：</strong></td>
                            <td><asp:Label runat="server" ID="AddUser_L"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="height: 26px">
                                <strong>商品编号：</strong>
                            </td>
                            <td style="width: 592px; height: 26px;">
                                <asp:Label ID="ProCode" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>自选数量：</strong>
                            </td>
                            <td>
                                 <asp:Label ID="Propeid" runat="server" Text="Label"></asp:Label>
                                <font color="red">(0为不允许自选购买;如果捆绑商品为空,则此数值为无效)</font>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>条形码：</strong>
                            </td>
                            <td>
                                <asp:Label ID="BarCode" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>商品名称：</strong>
                            </td>
                            <td>
                                <asp:Label ID="Proname" runat="server" Text="Label"></asp:Label>
                                </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>关键字：</strong>
                            </td>
                            <td>
                                 <asp:Label ID="Kayword" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>商品单位：</strong>
                            </td>
                            <td>
                                 <asp:Label ID="ProUnit" runat="server" Text="Label"></asp:Label>
                                </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>商品重量：</strong>
                            </td>
                            <td>
                                <asp:Label ID="Weight" runat="server" Text="Label"></asp:Label>
                                千克（Kg）
                                </td>
                        </tr>
                        <tr>
                            <td style="height: 26px">
                                <strong>服务期限：</strong>
                            </td>
                            <td style="height: 26px">
                                <asp:Label ID="ServerPeriod" runat="server" Text="Label"></asp:Label>
                                </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>商品类型：</strong>
                            </td>
                            <td>
                                <asp:Label ID="ProClass1" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>销售状态：</strong>
                            </td>
                            <td>
                                 <asp:Label ID="Sales1" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    <tr>
                            <td><strong>属性设置：</strong></td>
                            <td><asp:Label ID="istrue1" runat="server" Text="Label"></asp:Label></td>
                        </tr> 
                        <tr>
                            <td>
                                <strong>点击数：</strong>
                            </td>
                            <td>
                            <asp:Label ID="lblCountHits" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <td width="20%" style="height: 24px">
                                <strong>更新时间：</strong>
                            </td>
                            <td style="height: 24px; width: 592px;">
                                <asp:Label ID="UpdateTime" runat="server" Text="Label"></asp:Label>
                                </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <strong>内容页模板：</strong>
                            </td>
                            <td>
                                <asp:Label ID="ModeTemplate" runat="server" Text="Label"></asp:Label>
                               </td>
                        </tr>                       
                    </tbody>
                    <tbody id="Tabs1" style="display: none">
                        <tr>
                            <td width="20%">
                                <strong>商品简介：</strong></td>
                                <td>
                                    <asp:Label ID="Proinfo" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%" style="height: 24px">
                                <strong>详细介绍：</strong>
                            </td>
                            <td style="height: 24px; width: 592px;">                                    
                                    <asp:Label ID="Procontent" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <strong>商品清晰图：</strong>
                            </td>
                            <td>
                                <asp:Label ID="Clearimg" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr id="addsmallimg">
                            <td width="20%">
                                <strong>商品缩略图：</strong>
                            </td>
                            <td>
                                <asp:Label ID="Thumbnails" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                    <tbody id="Tabs2" style="display: none">
                        <tr>
                            <td width="20%">
                                <strong>生 产 商：</strong>
                            </td>
                            <td>
                                <asp:Label ID="Producer" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>品牌/商标：</strong>
                            </td>
                            <td>
                                <asp:Label ID="Brand" runat="server" Text="Label"></asp:Label>
                               </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>缺货时允许购买:</strong>
                            </td>
                            <td>
                                 <asp:Label ID="Allowed" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>限购数量:</strong>
                            </td>
                            <td>
                                 <asp:Label ID="Quota" runat="server" Text="Label"></asp:Label>
                                -1为不限制数量 0为不允许购买
                                </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>最低购买数量:</strong>
                            </td>
                            <td>
                                <asp:Label ID="DownQuota" runat="server" Text="Label"></asp:Label>
                                -1为不限制数量 0为不允许购买
                                </td>
                        </tr>
                        <tr>
                            <td >
                                <strong>秒杀时间段:(限制购买时间)</strong>
                            </td>
                            <td>
                                 <asp:Label ID="TextBox1" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 24px">
                                <strong>库存数量:</strong>
                            </td>
                            <td style="height: 24px">
                                <asp:Label ID="Stock" runat="server" Text="10"></asp:Label>
                               </td>
                        </tr>
                        <tr>
                            <td style="height: 24px">
                                <strong>库存报警下限:</strong>
                            </td>
                            <td style="height: 24px; width: 592px;">
                                <asp:Label ID="StockDown" runat="server" Text="1"></asp:Label>
                                </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>前台库存计算方式:</strong>
                            </td>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="25%">
                                            <asp:Label ID="JisuanFs1" runat="server" Text="Label"></asp:Label>
                                        </td>
                                        <td width="89%">
                                            （实际库存－已订购数）
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>税率设置:</strong>
                            </td>
                            <td>
                                <asp:Label ID="Rateset1" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>商品税率:</strong>
                            </td>
                            <td>
                                 <asp:Label ID="Rate" runat="server" Text="Label"></asp:Label>
                                %
                               </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>商品推荐等级:</strong>
                            </td>
                            <td>
                                <asp:Label ID="Dengji1" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                    <tbody id="Tabs3" style="display: none">
                        <tr>
                            <td width="20%">
                                <strong>市场参考价：</strong>
                            </td>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="width: 23%; height: 21px;">
                                               <asp:Label ID="ShiPrice" runat="server" Text="Label"></asp:Label>
                                            元 
                                        </td>
                                        <td width="76%" style="height: 21px">
                                            购买时参考的市场零售价，可以比当前零售价高。
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>当前零售价：</strong>
                            </td>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="width: 23%; height: 20px;">
                                             <asp:Label ID="LinPrice" runat="server" Text="Label"></asp:Label>元 
                                        </td>
                                        <td width="78%" style="height: 20px">商店销售此商品时的价格。</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>打折优惠率:</strong>
                            </td>
                            <td>
                                <asp:Label ID="txtRecommend" runat="server" Text="Label"></asp:Label> %
                               </td>
                        </tr>
                        <tr>
                            <td><strong>积分价格:</strong></td>
                            <td><asp:Label ID="lblpoint" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <strong>允许批发：</strong>
                            </td>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Wholesales1" runat="server" Text="否"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr id="pifaji" style="display: none" runat="server">
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td style="height: 24px">
                                                        ① 一次性购买此商品数量满
                                                         <asp:Label ID="s1" runat="server" Text="Label"></asp:Label>
                                                        时，批发价为
                                                        <asp:Label ID="j1" runat="server" Text="0"></asp:Label>
                                                        元
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="24">
                                                        ② 一次性购买此商品数量满
                                                         <asp:Label ID="s2" runat="server" Text="Label"></asp:Label>
                                                        时，批发价为
                                                         <asp:Label ID="j2" runat="server" Text="0"></asp:Label>
                                                        元
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="24">
                                                        ③ 一次性购买此商品数量满
                                                        <asp:Label ID="s3" runat="server" Text="Label"></asp:Label>
                                                        时，批发价为
                                                        <asp:Label ID="j3" runat="server" Text="0"></asp:Label>
                                                        元
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr >
                            <td  >
                                <strong>允许单独销售：</strong>
                            </td>
                            <td>
                                 <asp:Label ID="Wholesaleone1" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>设置为礼品：</strong>
                            </td>
                            <td>
                                <div style="float: left">
                                    <asp:Label ID="Largess1" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div style="float: left; width: auto">
                                    <font color="red">(自选数量大于0时设为礼品无效)</font></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>礼品价格：</strong>
                            </td>
                            <td>
                                 <asp:Label ID="Largesspirx" runat="server" Text="0"></asp:Label>
                                元 
                            </td>
                        </tr>
                    </tbody>
                    <tbody id="Tabs4" style="display: none">
                        <tr>
                            <td width="20%">
                                <strong>促销方案：</strong>
                            </td>
                            <td>
                                    <asp:Label ID="ProjectType1" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="HiddenField3" runat="server" />
                                    <asp:HiddenField ID="HiddenField5" runat="server" />
                                    <asp:HiddenField ID="HiddenField6" runat="server" />
                                    <asp:HiddenField ID="HiddenField7" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td width="20%" style="height: 19px">
                                <strong>其他促销方案：</strong>
                            </td>
                            <td style="height: 19px">
                                <asp:Label ID="OtherProject" runat="server" Text="0" /></td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <strong>购物积分：</strong>
                            </td>
                            <td>
                                购买&nbsp;
                                 <asp:Label ID="IntegralNum" runat="server" Text="1" /> &nbsp;件此商品可以得到
                                <asp:Label ID="Integral" runat="server" Text="1" />
                                积分
                             </td>
                        </tr>
                    </tbody>
                    <tbody id="Tabs5" style="display: none">
                        <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
                    </tbody>
                    <tbody id="Tabs6" style="display: none;">
                        <tr>
                            <td width="20%" style="height: 19px">
                                <strong>功能启用：</strong>
                            </td>
                            <td style="height: 19px" >
                             <asp:Label ID="radios" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellpadding="0" id="Guess1" style="display: none" cellspacing="0" border="0"
                                    width="100%" runat="server">
                                    <tr>
                                        <td>
                                            <strong>秒杀时间段:(限制购买时间)</strong>
                                        </td>
                                        <td>
                                            从
                                             <asp:Label ID="TextBox3" runat="server" Text=""/>
                                            &nbsp;到
                                            <asp:Label ID="TextBox4" runat="server" Text=""/>
                                            &nbsp;为止
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>购买数量:(每次购买数量)</strong>
                                        </td>
                                        <td>
                                            <asp:Label ID="TextBox7" runat="server" Text="1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>开放秒杀商品数量:</strong>
                                        </td>
                                        <td>
                                            <asp:Label ID="TextBox8" runat="server" Text="1"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                    <tbody id="Tabs7" style="border-top:none;display: none">
                        <tr>
                            <td colspan="2">
                                <iframe style="width:100%;height:800px;border:none;" src="/User/Order/ShareList.aspx?ProID=<%=Mid %>&mode=admin"></iframe>
                            </td>
                        </tr>
                    </tbody>             
                </table>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="TABLE1">
        <tr>
            <td align="left" style="height: 59px">
                &nbsp; &nbsp;
                <input type="button" class="btn btn-primary" id="upbutton" name="upbutton" value="上一项" onclick="showup()" />
                <input type="button" class="btn btn-primary" id="Editdown" name="Editdown" value="下一项" onclick="ShowTable()" />
              
                <asp:Button ID="EBtnSubmit" class="btn btn-primary"  Text="修改商品信息" runat="server" onclick="EBtnSubmit_Click" />
                <a href="ProductManage.aspx?<%:"NodeID="+NodeID+"&StoreID="+StoreID %>" class="btn btn bg-primary">返回列表</a>
            </td>
        </tr> 
    </table>
</asp:Content>



