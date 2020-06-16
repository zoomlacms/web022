var ZL_Regex = {
    isMinLen: function (str, len) {//字符长度是否小于len
        str = str.replace(/ /g, "");
        return str.length < len;
    },
    isEmpty: function () {
        for (var i = 0; i < arguments.length; i++) {
            if (!arguments[i]) { return true; }//传入为undefined也为false
            var s = arguments[i].replace(/ /g, ""); 
            if (s == "") return true;
        }
        return false;
    },
    //是否为pop或smtp地址
    isPop: function (s) {
        var patrn = /^(\w+)\.(\w+)\.(\w+)/g;
        return patrn.exec(s) ? true : false;
    },
    //是否包含中文
    isContainChina: function (s) {
        var patrn = /[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/gi;
        if (patrn.exec(s))
            return true;
        else
            return false;
    },
    //是否只有英文与数字,允许空格(不含特殊符号)
    isEngorNum: function (s) {
        var patrn = /^[A-Za-z0-9]*$/;
        return patrn.exec(s) ? true : false;
    },
    //是否为英文,数字或中文(不允许空格)
    isCharorNum: function (s) {
        var patrn = /^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[\w])*$/;
        return patrn.exec(s) ? true : false;
    },
    //是否为c#格式虚拟路径
    isVirtualPath: function (s) {
        return (s.indexOf("~/") == 0 && s.indexOf(".") > 0);
    },
    //验证http||https格式
    isUrl:function(s)
    {
        var patrn = /^((http)|(https)):\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/i;
        return patrn.exec(s) ? true : false;
    },
    //邮箱格式验证
    isEmail: function (s) {
        var patrn = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/gi;
        return patrn.exec(s)?true:false;
    },
    //是否为身份证
    isIDCard: function (s) {
        var patrn = /d{15}|\d{18}/;
        return patrn.exec(s);
    },
    //是否手机号码
    isMobilePhone:function(s){
        var patrn = /^(1(([35][0-9])|(47)|[8][012356789]))\d{8}$/;
            if (patrn.exec(s)) {
                return true;
            }
            else {
                return false;
            }
    },
    //是否邮编
    isZipCode: function (s) {
        s = $.trim(s);
        return(ZL_Regex.isInt(s) && s.length == 6)
    },
    isIP: function (s) {
        var patrn = /^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g;
        return patrn.exec(s) ? true : false;
    },
    //是否正或负整数
    isInt: function (s) {
        var patrn = /^\d+(\d+)?$/gi;
        if (patrn.exec(s)) {
            return true;
        }
        else {
            return false;
        }
    },
    //是否正浮点数或正整数,0也算,true:是
    isNum: function () {
        for (var i = 0; i < arguments.length; i++) {
            var val = parseFloat(arguments[i]);
            if (!(val >= 0)) { return false; }
        }
        return true;
    },
    domIsEng: function (s) {
        //---域名注册使用
        //---允许英文,数字,空格，不能有中文，英文中一定要带空格,注:传入的值用trim();,用于单位(英文名)等地方
        var patrn = /[^a-zA-Z0-9\s]+/gi;
        if (!patrn.exec(s)) {
            i = s.toString().indexOf(" ");
            return i > 0;
        }
        else {
            return false;
        }
    },
    //---------------文本框块
    //只允许输入正整数
     B_Num: function (filter) {
         $(filter).bind("keyup afterpaste", function () {
            this.value = this.value.replace(/\D/g, '');
        })
     },
    //允许小数位,允许两位
     B_Float: function (filter) {
         $(filter).bind("keyup afterpaste", function () {
             this.value = this.value.replace(/[^\d.]/g, "");  //清除“数字”和“.”以外的字符  
             this.value = this.value.replace(/^\./g, "");  //验证第一个字符是数字而不是. 
             this.value = this.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的.   
             this.value = this.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
             this.value = this.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3'); //只能输入两个小数
         })

     },
    //设定最大和最小值
     B_Value: function (filter, config) {
         //config = { min: 0, max: 200, overmin: function () { }, overmax: function () { }}
         $(filter).bind("keyup afterpaste", function () {
             var val = parseInt($(this).val());
             if (val > config.max) { $(this).val(config.max); if (config.overmax) { $(this).blur(); config.overmax(); } }
             if (val < config.min) { $(this).val(config.min); if (config.overmin) { $(this).blur(); config.overmin(); } }
         })
     }
}

var StrHelper = {};
//如未前带http,则补上
StrHelper.UrlDeal = function (url) {
    if (!url || url == "") { return ""; }
    url = url.toLowerCase();
    if (url.indexOf("http:") > -1 || url.indexOf("https:") > -1) {
    }
    else {
        url = "http://" + url;
    }
    return url;
}
//获取指定长度的字符串,区分中英文
StrHelper.getSubStr = function (s, l) {
    var i = 0, len = 0;
    for (i; i < s.length; i++) {
        if (s.charAt(i).match(/[^\x00-\xff]/g) != null) {
            len += 2;
        } else {
            len++;
        }
        if (len > l) { break; }
    } return s.substr(0, i);
};









