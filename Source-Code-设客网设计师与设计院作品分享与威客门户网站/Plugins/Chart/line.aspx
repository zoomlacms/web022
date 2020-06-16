<%@ page language="C#" autoeventwireup="true" inherits="Skin_line, App_Web_fsgyr20g" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    var chart;
    $(document).ready(function () {
        InitDatas();
    });
    //初始化图表
    function InitImg(xdata,ydata) {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                defaultSeriesType: 'spline'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: '<%=BiaoS.Title %>'
            },
            xAxis: {
                categories: ydata
            },
            yAxis: {
                title: {
                    text: ''
                },
                labels: {
                    formatter: function () {
                        return this.value;
                    }
                }
            },
            tooltip: {
                crosshairs: true,
                shared: true
            },
            plotOptions: {
                spline: {
                    marker: {
                        radius: 2,
                        lineColor: '#666666',
                        lineWidth: 1
                    }
                }
            },
            series: xdata
        });
    }
    //初始化数据
    function InitDatas() {
        var hid = "<%=Request.QueryString["hid"] %>";//父框架控件id
        var datas = [];
        var datay = [];
        if (hid!="") {
            var Coordinate = $(parent.document).find("#" + hid).val().split('^');
            
            for (var i = 0; i < Coordinate.length; i++) {
                var ys = Coordinate[i].trim().replace(/{/, '').replace(/}/, '').split('|');
                datas.push({ name: ys[0], marker: { symbol: 'square' }, data: JSON.parse("[" + ys[1] + "]") });
                var tempdata = ys[2].split(',');
                for (var j = 0; j < tempdata.length; j++) {
                    datay.push(tempdata[j]);
                }
            }
        }
        else {
            datas = [<%=BiaoS.X %>];
            datay = [<%=BiaoS.Y %>];
        }
        InitImg(datas, datay);
    }

		</script>
<script src="Js/highcharts.js" type="text/javascript"></script>
<script src="Js/exporting.js" type="text/javascript" charset="gb2312"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container" style="width:<%=BiaoS.Width %>px; height:<%=BiaoS.Height %>px; margin:0;float:left"></div>
    </form>
</body>
</html>
