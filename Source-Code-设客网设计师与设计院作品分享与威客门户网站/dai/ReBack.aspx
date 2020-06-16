<%@ page language="C#" autoeventwireup="true" inherits="try_ReBack, App_Web_hdxdrenl" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>在线眼镜试戴</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script src="/JS/jquery-1.9.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="/dist/css/font-awesome.min.css" />
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
    <style>
        body{ FONT-FAMILY:"STHeiti","Microsoft YaHei","黑体","arial";}
        .margin_t10{margin-top:10px;}
        .padding20{padding:20px;}
        .photo_padding{padding:20px 100px;}
        .testpro_div #main_tab{padding:10px; border:1px solid #ddd; border-top:none;}
        .testpro_div .form-control{display:inline-block;}
        .testpro_div .tab_div{border:1px solid #ddd;border-top:none; padding:10px;}
        .testpro_div .tab_div .tips{color:#d80909;}
        .testpro_div #tablist .active a{color:#d80909!important;}
        .testpro_div #tablist li a{font-size:12px;}
        .testpro_div .container_3d{-webkit-perspective:1400px;perspective:1400px;}
        .testpro_div .div_3d{ -webkit-transform-style: preserve-3d;transform-style: preserve-3d;transition:1s ease}
        .testpro_div .rote_left{-webkit-transform:rotateY(30deg);-moz-transform:rotateY(30deg); -ms-transform:rotateY(30deg);-o-transform:rotateY(30deg);transform:rotateY(30deg); }/* -moz-transform:rotateY(100deg); -ms-transform:rotateY(100deg);-o-transform:rotateY(100deg);transform:rotateY(100deg);*/
        .testpro_div .rote_right{-webkit-transform:rotateY(-30deg);-moz-transform:rotateY(-30deg); -ms-transform:rotateY(-30deg);-o-transform:rotateY(-30deg);transform:rotateY(-30deg);}
        .testpro_div .center_div{-webkit-transform:scale(.92,.92);transform:scale(.92,.92)}
        .testpro_div .upimg_title{font-weight:900;}
        .testpro_div .imgmodel_div{border:10px solid #ccc; height:300px; border-radius:5px; cursor:pointer;text-align:center;padding-top:30%;font-size:16px;color:#999;position:relative;}
        .testpro_div .imgmodel_div .img_icon{font-size:80px;}
        .testpro_div .imgmodel_div:hover{border-color:#999;}
        .testpro_div .photo_div .photo_img_div{background-color:#eee; height:400px; cursor:pointer;}
         .testpro_div .photo_div .photo_img_div img{width:100%;height:100%;}
        .testpro_div .photolist_div{height:410px;border-top:none; padding:10px; overflow:auto;}
        .testpro_div .camera_div{border:1px solid #ddd;}
        .testpro_div .photoview{border:1px solid #ddd; position:relative;padding:0px;padding-bottom:10px; position:relative;}
        .testpro_div .glasslist_div{height:540px;overflow:auto;}
        .photoview .nophoto_div{position:absolute;background-color:#999;color:#fff;width:100%; height:100%; z-index:9999;text-align:center; font-size:16px;padding-top:25%;cursor:pointer;}
        .nophoto_div .nophoto_ico{font-size:150px;}
        .photoview .photo_bar{background-color:#000; opacity:.5;height:30px;bottom:54px;left:0px; z-index:9000; position:absolute; width:100%;padding:5px;padding-left:50px;}
        .photo_bar div{float:left;margin-left:10px;margin-right:10px; color:#fff;}
        .photo_bar .toolbtn{cursor:pointer;}
        .photo_bar .leftGrip:hover{background-color:#337ab7;}
        .photo_bar .toolbtn:hover{color:#337ab7;}
        .photo_bar .leftLabel{width:38px;}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container testpro_div" style="margin-top:40px;">
            <ul class="nav nav-tabs" id="nav_dai" role="tablist">
            <li role="presentation"><a href="/dai" ><span class="glyphicon glyphicon-user"></span> 模特试镜</a></li>
            <li role="presentation" class="active"><a href="#main_tab" aria-controls="main_tab" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-camera"></span> 拍照试戴</a></li>
            <li role="presentation"><a href="/Class_2/Default.aspx" target="_blank"><span class="glyphicon glyphicon-shopping-cart"></span> 在线商城</a></li>
            </ul>
            <div class="tab-content main_div">
            <div role="tabpanel" class="tab-pane active" id="main_tab">
                <ul class="nav nav-tabs" id="tablist" role="tablist">
                <li role="presentation" class="active"><a href="#testpro" aria-controls="testpro" role="tab" data-toggle="tab">选择产品试戴</a></li>
                <li role="presentation"><a href="#setphone" aria-controls="setphone" role="tab" data-toggle="tab">设置获取照片</a></li>
                <li role="presentation"><a href="#selobject" aria-controls="selobject" role="tab" data-toggle="tab">选择试戴对象照片</a></li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane tab_div text-center" id="selobject">
                        <div class="tips">我们承诺不会将照片用于其他任何用途!</div>
                        <div class="margin_t10 " >
                            <div class="row">
                                <div class="col-md-4 padding20 container_3d">
                                <div class="imgmodel_div rote_left" data-target="upimg_div" onclick="SetPhoto(this);">
                                    <span class="glyphicon glyphicon-floppy-open img_icon"></span><br />
                                    <span>本地上传</span>
                                </div>
                                </div>
                                <div class="col-md-4 padding20">
                                     <div class="imgmodel_div center_div" onclick="location.href='/dai';" data-target="selimg_div">
                                         <span class="glyphicon glyphicon-picture img_icon"></span><br />
                                         <span>在线选择</span>
                                    </div>
                                </div>
                                <div class="col-md-4 padding20 container_3d">
                                     <div class="imgmodel_div rote_right" data-target="cameraimg_div" onclick="SetPhoto(this)">
                                         <span class="glyphicon glyphicon-camera img_icon"></span><br />
                                         <span>在线拍照</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane tab_div" id="setphone">
                        <div id="upimg_div" class="imgaction">
                            <div class="row">
                                <div class="col-md-3"></div>
                            <div class="col-md-6 photo_padding">
                                <div class="photo_div">
                                    <div class="text-center upimg_title">正面试戴</div>
                                    <div class="photo_img_div" onclick="UpImg(1)">
                                        <img src="/Images/userface/noface.gif" id="upphoto_1" style="display:none;" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3"></div>
                            </div>
                        
                            <%--<div class="col-md-6 photo_padding">
                                <div class="photo_div">
                                    <div class="text-center upimg_title">侧面试戴</div>
                                    <div class="photo_img_div">
                                        <img src="/Images/userface/noface.gif" id="upphoto_2" style="display:none;" />
                                    </div>
                                     <div class="margin_t10 text-center"><button type="button" onclick="UpImg(2)" class="btn btn-primary">上传照片</button></div>
                                </div>
                            </div>--%>
                            <input type="file" style="display:none;" data-type="1" />
                            <input type="file" style="display:none;" data-type="2" />
                        </div>
                        <div id="cameraimg_div" class="imgaction" style="display:none;">
                            <iframe id="camera_ifr" src="Camera.aspx" style="border:none;width:100%; height:500px;"></iframe>
                        </div>
                        <div class="text-center margin_t10">
                            <button type="button" class="btn btn-primary camera_btn" style="display:none;" onclick="shoot(1)">拍摄正面</button>
                           <%-- <button type="button" class="btn btn-primary camera_btn" onclick="shoot(2)">拍摄侧面</button>--%>
                            <button type="button" class="btn btn-primary camera_btn" style="display:none;" onclick="clearPhoto()">重置拍照</button>
                            <button type="button" class="btn btn-primary" onclick="StartTest()">开始试戴</button>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane tab_div active" id="testpro">
                        <div class="row" style="margin:5px;">
                        <div class="col-lg-6 col-md-6 padding20 photoview">
                        <div class="nophoto_div" data-target="cameraimg_div" onclick="SetPhoto(this)">
                            <span class="glyphicon glyphicon-picture nophoto_ico"></span><br />
                            您还没有照片,点此拍张照吧!
                        </div>
                        <div class="photo_bar">
                            <div><a href="javascript:;" onclick="ShowStyleMan()"><span class="glyphicon glyphicon-user"></span></a></div>
                            <div class="leftLabel">100%</div>
                            <div class="nstSlider"
                                 data-range_min="-50" data-range_max="100"
                                 data-cur_min="0" data-cur_max="0">
                                <div class="nst_bar"></div>
                                <div class="leftGrip"></div>              
                            </div>
                            <div>
                                <span onclick="RotePhoto(-90)" title="左转" class="fa fa-rotate-left toolbtn"></span>
                            </div>
                            <div>
                                <span onclick="RotePhoto(90)" title="右转" class="fa  fa-rotate-right toolbtn"></span>
                            </div>
                        </div>
                        <canvas id="gameCanvas" width="500"  height="550"></canvas>
                            <div class="text-center margin_t10">
                            <%--<button type="button" onclick="TestPhoto(2)" class="btn btn-primary">侧面</button>--%>
                            <asp:Button ID="DownImg_Btn" runat="server" OnClick="DownImg_Btn_Click" OnClientClick="return GetImgData()" Text="保存下载" CssClass="btn btn-primary" />
                             <button type="button" onclick="SetPhoto(this)" data-target="cameraimg_div" class="btn btn-primary">重新选择</button>
                             
                            <asp:HiddenField ID="DownImg_Hid" runat="server" />
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 padding20">
                            <div>
                                <asp:DropDownList CssClass="form-control" Width="100" runat="server">
                                    <asp:ListItem>品牌</asp:ListItem>
                                </asp:DropDownList> 
                                 <asp:DropDownList CssClass="form-control" Width="100" runat="server">
                                    <asp:ListItem>款式</asp:ListItem>
                                </asp:DropDownList>
                                 <asp:DropDownList CssClass="form-control" Width="100" runat="server">
                                    <asp:ListItem>框形</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList CssClass="form-control" Width="100" runat="server">
                                    <asp:ListItem>尺码</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button CssClass="btn btn-default" style="margin-bottom:5px;" OnClientClick="return false;"  runat="server" Text="搜索" />
                            </div>
                            <div class="glasslist_div">
                                <ul id="glass_ul" class="list-unstyled margin_t10">
                                <asp:Repeater runat="server" ID="RPT" EnableViewState="false">
                                    <ItemTemplate>
                                        <li class="glassimg">
                                            <img src="<%#Eval("sptp") %>" data-sub="<%#Eval("sptp2") %>" class="img50" />
                                            <div class="item_name"><%#Eval("spm") %></div>
                                            <div class="item_price">￥<%#Eval("price") %></div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                            </div>
                        </div>
                        </div>
                    
                    </div>
                </div>
                </div>
            </div>
            
        </div>
        <asp:HiddenField ID="TempData_Hid" Value="[{&quot;ID&quot;:12,&quot;price&quot;:200.0,&quot;sptp&quot;:&quot;res/20120608glass_12.png&quot;,&quot;spm&quot;:&quot;蝙蝠侠_BM97004 B1(透明黑)&quot;,&quot;sptp2&quot;:null},{&quot;ID&quot;:11,&quot;price&quot;:300.0,&quot;sptp&quot;:&quot;res/20120608glass_11.png&quot;,&quot;spm&quot;:&quot;蝙蝠侠_BM97004 B6(绅士银)&quot;,&quot;sptp2&quot;:null},{&quot;ID&quot;:10,&quot;price&quot;:600.0,&quot;sptp&quot;:&quot;res/20120608glass_10.png&quot;,&quot;spm&quot;:&quot;蝙蝠侠_BM95002 C9D(绅士黑)&quot;,&quot;sptp2&quot;:null},{&quot;ID&quot;:9,&quot;price&quot;:300.0,&quot;sptp&quot;:&quot;res/20120608glass_9.png&quot;,&quot;spm&quot;:&quot;沙漠之鹰_R5137 C16(绅士黑)&quot;,&quot;sptp2&quot;:null},{&quot;ID&quot;:8,&quot;price&quot;:120.0,&quot;sptp&quot;:&quot;res/20120608glass_8.png&quot;,&quot;spm&quot;:&quot;沙漠之鹰_R5152 CCG(绅士银)&quot;,&quot;sptp2&quot;:&quot;/Plugins/tryin/res/glass_7_2.png&quot;},{&quot;ID&quot;:7,&quot;price&quot;:150.0,&quot;sptp&quot;:&quot;res/20120608glass_7.png&quot;,&quot;spm&quot;:&quot;沙漠之鹰_R5152 C16(绅士黑)&quot;,&quot;sptp2&quot;:null},{&quot;ID&quot;:6,&quot;price&quot;:200.0,&quot;sptp&quot;:&quot;res/20120608glass_6.png&quot;,&quot;spm&quot;:&quot;毕加索_55-2051 C11(荧光红)&quot;,&quot;sptp2&quot;:null},{&quot;ID&quot;:5,&quot;price&quot;:100.0,&quot;sptp&quot;:&quot;res/20120608glass_5.png&quot;,&quot;spm&quot;:&quot;毕加索_55-2068 C11(荧光红)&quot;,&quot;sptp2&quot;:null},{&quot;ID&quot;:4,&quot;price&quot;:120.0,&quot;sptp&quot;:&quot;res/20120608glass_4.png&quot;,&quot;spm&quot;:&quot;毕加索_55-2001 C6(绅士黑)&quot;,&quot;sptp2&quot;:null},{&quot;ID&quot;:3,&quot;price&quot;:150.0,&quot;sptp&quot;:&quot;res/20120608glass_2.png&quot;,&quot;spm&quot;:&quot;佐腾樱花_ZTYH-010(蓝色)&quot;,&quot;sptp2&quot;:null},{&quot;ID&quot;:2,&quot;price&quot;:200.0,&quot;sptp&quot;:&quot;res/20120608glass_3.png&quot;,&quot;spm&quot;:&quot;毕加索_55-2062 C6(绅士黑)&quot;,&quot;sptp2&quot;:null},{&quot;ID&quot;:1,&quot;price&quot;:100.0,&quot;sptp&quot;:&quot;res/20120608glass_1.png&quot;,&quot;spm&quot;:&quot;佐腾樱花_ZTYH-001(豹纹色)&quot;,&quot;sptp2&quot;:&quot;&quot;}]" runat="server" />
        <style type="text/css">
            /*#Cocos2dGameContainer {display:inline-block;float:left;width:500px;}*/
            #glass_ul li {float:left;margin-right:10px;margin-bottom:10px;width:30%;border:1px solid #ddd;padding:10px;cursor:pointer; height:145px;}
            #glass_ul li:hover{border:1px solid #2e6da4;}
            .item_name {margin-top:5px;margin-bottom:5px;}
            .item_price {color:#f00;}
            .img50 {width:100px;height:50px;}
           
        </style>
<%--        <script src="frameworks/cocos2d-html5/CCBoot.js"></script>--%>
        <link type="text/css" rel="stylesheet" href="src/jquery.nstSlider.css">
         <script src="src/jquery.nstSlider.min.js"></script>
        <script src="src/cocos2d-js-v3.8-lite.js" charset="UTF-8"></script>
        <script src="src/resource.js"></script>
        <script>
            var GameCanvas;
            var curLayer;
            var timeflag = 0;//延迟标记
            var rageflag = 0;//旋转标记
            $(function () {
                cc.game.onStart = function () {
                    cc.LoaderScene.preload(g_resources, function () {
                        cc.director.runScene(new PlayScene());
                    }, this);
                };
                cc.game.run();
                //滑动条插件
                $('.nstSlider').nstSlider({
                    "left_grip_selector": ".leftGrip",
                    "value_bar_selector": ".nst_bar",

                    "value_changed_callback": function (cause, leftValue, rightValue) {
                        $('.leftLabel').text(100 + leftValue + "%");
                        var tempval = (100 + leftValue) / 100;
                        clearTimeout(timeflag);
                        timeflag = setTimeout(function () {
                            if (!curLayer) { return; }
                            curLayer.bgSprite.runAction(
                                cc.sequence(
                                    cc.scaleTo(0.3, tempval, tempval)
                                )
                            );
                        }, 100);
                    },
                });
            })
            
            //旋转图片
            function RotePhoto(flag) {
                rageflag += flag;
                if (rageflag > 360) { rageflag = 90; }
                if (rageflag < -360) { rageflag = -90; }
                if (!curLayer) { return; }
                curLayer.bgSprite.runAction(
                    cc.sequence(
                        cc.rotateTo(0.3, rageflag)
                    )
                );
            }
            var cur_photo_front = "";//正面照片
            var cur_photo_back = "";//侧面照片
            var isback = false;
            var cur_glass_front = "";
            var cur_glass_back = "";
            //拍照子页对象
            var cameraiframe;
            //显示对应获取图片的方式
            function SetPhoto(obj) {
                $(".imgaction").hide();
                $("#" + $(obj).data('target')).show();

                ShowTab(1);
                if ($(obj).data('target') == "cameraimg_div")
                {
                    //启动子页面相机功能
                    cameraiframe.EnableCamera();
                    $(".camera_btn").show();
                }
            }
            //得到子窗口对象(通过子窗口回调)
            function getCamara(obj) {
                cameraiframe = obj;
            }
            //切换区域
            function ShowTab(index) {
                $(".camera_btn").hide();
                //关闭相机功能
                try {
                    cameraiframe.StopCamera();
                } catch (e) {}
                $("#tablist li:eq(" + index + ") a").tab('show');
            }
            $().ready(function () {
                
                //绑定上传图片事件
                $("[type='file']").change(function (e) {
                    var $inputfile = $(this);
                    var file = e.target.files[0];
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        console.log(e.target.result);
                        $.post('camera.aspx', { action: 'getimgurl', imgdata: e.target.result.split(',')[1] }, function (url) {
                            var type = $inputfile.data('type');
                            $("#upphoto_" + type).attr('src', url);
                            $("#upphoto_" + type).show();
                            if (type == "1")
                            { cur_photo_front = url;}
                            else
                            { cur_photo_back = url; }
                        });
                    }
                    reader.readAsDataURL(file);
                });
                //绑定选择眼睛事件
                $(".glassimg").click(function () {
                    if (isback) {
                        cur_glass_back = $(this).find('img').data('sub');
                        curLayer.addGlass(cur_glass_back);
                    }
                    else {
                        cur_glass_front = $(this).find('img').attr('src')
                        curLayer.addGlass(cur_glass_front);
                    }
                    
                });

                $('a[aria-controls="testpro"]').on('shown.bs.tab', function (e) {
                    if (!cur_photo_front)
                    {
                        return;
                    }
                    $('.nophoto_div').hide();
                    cameraiframe.StopCamera();
                    StartTest();
                })
            });

            //上传照片 1:正面,2:侧面
            function UpImg(type) {
                $("[type='file'][data-type='" + type + "']").click();
            }

            //拍照操作；1:正面,2:侧面
            function shoot(type) {
                cameraiframe.shoot(type);
            }
            //重置拍照
            function clearPhoto() {
                cameraiframe.clearPhoto();
                cur_photo_back = "";
                cur_photo_front = "";
            }
            //拍照之后的回调
            function shootCallBack(url, type) {
                if (type == 1)
                { cur_photo_front = url; }
                else
                { cur_photo_back = url; }
            }
            //开始试戴
            function StartTest() {
                if (!cur_photo_front&&!cur_photo_back)
                { alert('必须选择一张照片!'); return; }
                TestPhoto(1);
            }
            //试戴区展示照片
            function TestPhoto(type) {
                var imgurl = type == 1 ? cur_photo_front : cur_photo_back;
                var glassurl = type == 1 ? cur_glass_front : cur_glass_back;
                var tip = type == 1 ? "正面" : "侧面";
                isback = type != 1;
                if (!imgurl)
                { alert('您还没有选择'+tip+'照片!'); return;}
                curLayer.changeBG(imgurl);
                if (glassurl!="")
                {curLayer.addGlass(glassurl); }
                $("#tablist li:eq(" + 0 + ") a").tab('show');
            }
            function GetImgData() {
                $("#DownImg_Hid").val($("#gameCanvas")[0].toDataURL().split(',')[1]);
                return true;
            };
            
        </script>
    </form>
</body>
</html>