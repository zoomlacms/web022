<%@ page language="C#" autoeventwireup="true" inherits="test_untitled_Camera, App_Web_hdxdrenl" enableEventValidation="false" viewStateEncryptionMode="Never" %><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>在线拍照</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script src="/JS/jquery-1.9.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
    <style>
        .photopadding{padding:20px; text-align:center; font-weight:700;}
        .testpro_div .selphoto_div{ padding:10px 70px;}
        .testpro_div .selphoto_div img{width:100%;height:408px;}
        .testpro_div .camera_div{margin-top:60px;width:530px; height:395px; background-color:#ccc;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="testpro_div container-fluid">
        <div class="row">
            <div class="col-md-6 photopadding">
                <span>正面拍照</span>
            <div class="selphoto_div">
                <img id="photo1" src="/Images/userface/noface.gif" onerror="this.scr='/Images/userface/noface.gif'" />
            </div>
            </div>
            <div class="col-md-6">
            <div class="camera_div">
                <video id="video" autoplay="autoplay" style="width:100%; padding:1px;text-align:center"></video>
            </div>
            </div>
            <div class="col-md-4 photopadding" style="display:none;">
                <span>侧面拍照</span>
                <div class="selphoto_div">
                    <img id="photo2" src="/Images/userface/noface.gif" onerror="this.scr='/Images/userface/noface.gif" />
                </div>
            </div>
        </div>
    </div>
    <script>
        var video = document.getElementById("video");
        var videostream;
        //开启摄像头
        function EnableCamera() {
            navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.msGetUserMedia;
            if (navigator.getUserMedia) //  
            {
                if (navigator.webkitURL)//  
                {
                    navigator.getUserMedia({ video: true }, function (stream) {
                        video.src = window.webkitURL.createObjectURL(stream);
                    }, function (error) { alert('没有检测到摄像头!请确认摄像头已插好或是否被浏览器禁用'); parent.ShowTab(0) });
                }
                else if (navigator.msURL) {
                    navigator.getUserMedia({ video: true }, function (stream) {
                        videostream = stream;
                        video.src = window.msURL.createObjectURL(stream);

                    }, function (error) { alert('没有检测到摄像头!请确认摄像头已插好或是否被浏览器禁用'); parent.ShowTab(0) });
                }
                else //  
                {
                    navigator.getUserMedia({ video: true }, function (stream) {
                        videostream = stream;
                        video.src = window.URL.createObjectURL(stream);
                    }, function (error) { alert('没有检测到摄像头!请确认摄像头已插好或是否被浏览器禁用');parent.ShowTab(0)});
                }
            }
            if (!navigator.getUserMedia) {
                alert('您的浏览器不支持在线拍照功能,请尝试切换chrome或edge浏览器以获得最佳体验!')
                parent.ShowTab(0);
                return;
            }
        }
        function StopCamera() {
            if (videostream)
            { videostream.stop(); }
            video.src = '';
        }
        //重置拍照
        function clearPhoto() {
            StopCamera();
            EnableCamera();
            $(".selphoto_div img").attr('src', "/Images/userface/noface.gif");
        }

        //從video元素抓取圖像到canvas
        function capture(video) {
            var canvas = document.createElement('canvas'); //建立canvas js DOM元素
            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;
            var ctx = canvas.getContext('2d');
            ctx.drawImage(video, 0, 0);
            return canvas;
        }
        //拍照操作
        function shoot(type) {
            var canvas = capture(video);
            var imgData = canvas.toDataURL("image/jpg");
            var base64String = imgData.substr(22); //取得base64字串
            $.post('camera.aspx', { action: 'getimgurl', imgdata: base64String }, function (url) {
                $(".selphoto_div #photo"+type).attr('src', url);
                parent.shootCallBack(url, type);
            });
        }
        $().ready(function () {
            parent.getCamara(window);
        });
    </script>
    </form>
</body>
</html>
