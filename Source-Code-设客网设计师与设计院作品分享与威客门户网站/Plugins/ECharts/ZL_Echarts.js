var myChart; 
var domMain = document.getElementById('main');
var iconResize = document.getElementById('icon-resize');
var needRefresh = false;
var curTheme;
function requireCallback(ec, defaultTheme) {
    curTheme = {};
    echarts = ec;
    refresh();
    window.onresize = myChart.resize;
}

function refresh(isBtnRefresh) {
    //if (isBtnRefresh) {
    //    needRefresh = true;
    //    return;
    //}
    needRefresh = false;
    if (myChart && myChart.dispose) {
        myChart.dispose();
    }
    myChart = echarts.init(domMain, curTheme);
    window.onresize = myChart.resize;
    (new Function(document.getElementById("code").value))();
    myChart.setOption(option, true)
}

function needMap() {
    var href = location.href;
    return href.indexOf('map') != -1
           || href.indexOf('mix3') != -1
           || href.indexOf('mix5') != -1
           || href.indexOf('dataRange') != -1;

}

var echarts;
var developMode = false;

if (developMode) {
    window.esl = null;
    window.define = null;
    window.require = null;
    (function () {
        var script = document.createElement('script');
        script.async = true;

        var pathname = location.pathname;

        var pathSegs = pathname.slice(pathname.indexOf('doc')).split('/');
        var pathLevelArr = new Array(pathSegs.length - 1);
        script.src = pathLevelArr.join('../') + 'asset/js/esl/esl.js';
        if (script.readyState) {
            script.onreadystatechange = fireLoad;
        }
        else {
            script.onload = fireLoad;
        }
        (document.getElementsByTagName('head')[0] || document.body).appendChild(script);

        function fireLoad() {
            script.onload = script.onreadystatechange = null;
            setTimeout(loadedListener, 100);
        }
        function loadedListener() {
            // for develop
            require.config({
                packages: [
                    {
                        name: 'echarts',
                        location: '../../src',
                        main: 'echarts'
                    },
                    {
                        name: 'zrender',
                        location: '../../../zrender/src',
                        main: 'zrender'
                    }
                ]
            });
            launchExample();
        }
    })();
}
else {
    require.config({
        paths: {
            echarts: '/Plugins/ECharts/build/source'
        }
    });
    launchExample();
}
var isExampleLaunched;
function launchExample() {
    if (isExampleLaunched) {
        return;
    }
    // 按需加载
    isExampleLaunched = 1;
    require(
        [
            'echarts',
            //'theme/macarons',
            'echarts/chart/line',
            'echarts/chart/bar',
            'echarts/chart/scatter',
            'echarts/chart/k',
            'echarts/chart/pie',
            'echarts/chart/radar',
            'echarts/chart/force',
            'echarts/chart/chord',
            'echarts/chart/gauge',
            'echarts/chart/funnel',
            'echarts/chart/eventRiver',
            'echarts/chart/venn',
            'echarts/chart/treemap',
            needMap() ? 'echarts/chart/map' : 'echarts/chart/map'
        ],
        requireCallback
    );

}
