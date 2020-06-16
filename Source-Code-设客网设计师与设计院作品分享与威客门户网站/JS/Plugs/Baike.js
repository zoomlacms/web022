//现在为直接在h标签上加id,后期可依需要,改为在其旁边加上<a href name="">的方式
var BaiKe = {
    config: { id: "mycontent", dirid: "baike_dir", navid: "baike_nav", level: ["h1", "h2", "h3", "h4"], tags: ["h1", "h2", "h3", "h4"], titleLen: 20 },
    Init: function () { this.GetDirs(); },
    GetNextTag: function (tag) {//返回下一级tag
        var dircof = this.config;
        tag = tag.toLowerCase();
        for (var i = 0; i < dircof.tags.length; i++) {
            if (tag == dircof.tags[i] && i < (dircof.tags.length - 1)) {
                return dircof.tags[(i + 1)];
            }
        }
        return "";
    },
    GetChilds: function ($node,tag) {
        var childTag = BaiKe.GetNextTag(tag);
        while (childTag != "") {
            //查找其的子元素
            if (childTag == "") { continue; }
            var child = ($node.nextUntil(tag, childTag));//查找两个同级元素之间的数据
            if (child && child.length > 0)
            {
                return child;
            }
            childTag = BaiKe.GetNextTag(childTag);
        }
        return [];
    },
    GetDirs: function () {//按层级递归获取目录
        var dircof = this.config;
        var list = this.CurList;
        var body = $("#" + dircof.id);
        var topNodes = [];
        for (var i = 0; i < dircof.tags.length; i++) {
            dircof.level[i] = body.find(dircof.tags[i]);
            if (topNodes.length < 1 && dircof.level[i].length > 0) {
                //赋值第一级节点
                topNodes = dircof.level[i];
            }
        }
        if (topNodes.length < 1) { return; }
        FillList(list, topNodes, 1);
        //父模型,子元素,深度
        function FillList(parent, children, dep) {
            var body = $("#" + dircof.id);
            for (var i = 0; i < children.length; i++) {
                var node = children[i], $node = $(children[i]);
                $node.attr("id", GetRanPass(6));
                //index序号
                var index = (parent.index == "" ? "" : parent.index + ".") + (i + 1);
                var model = { tag: node.tagName, "title": $node.text(), level: dep, "index": index, obj: $node, children: [] };
                parent.children.push(model);
                var child = BaiKe.GetChilds($node,model.tag);
                if (child.length > 0) {
                    FillList(model, child, (dep + 1));
                }
            }
        }
        BaiKe.CreateDirTree(list);
        BaiKe.CreateNavUI(list);
    },
    CreateDirTree: function (list) {//百科顶部目录UI
        var count = 7;//多少换一列
        var html = $("<div>"), ulitem = $('<ul class="dirul">');
        var $ul = (traveList(list, 1) || null);
        var $lis = $ul.find("li");
        //有没附加上的
        if ($lis.length <= count) {html.append($('<ul class="dirul">').append($lis)); }
        else //将其按数目分成UL
        {
            for (var i = 0; i < $lis.length; i++) {
                ulitem.append($lis[i]);
                if (i != 0 && i % count == 0) {
                    html.append(ulitem);
                    ulitem = "";
                    ulitem = $('<ul class="dirul">');
                }
            }//for end;
            if (ulitem.find("li").length > 0)
            { html.append(ulitem); }
        }
        //查找ul下li数量,对其进行平均划分
        $("#" + BaiKe.config.dirid).html(html.html());
        function traveList(section, dep) {
            var $list, $item, $itemContent, child, childList;
            if (section.children.length) {
                $list = $('<ul>');
                for (var i = 0; i < section.children.length; i++) {
                    child = section.children[i];
                    //设置目录节点内容标签
                    var title = getSubStr(child['title'], BaiKe.config.titleLen);
                    title = (dep == 1 ? child.index + " " + title : title);
                    $itemContent = $('<div class="sectionItem"></div>').html($('<a class="itemTitle level' + dep + '" href="#' + (child.obj.attr("id")) + '">' + title + '</a>'));
                    //$itemContent.attr('data-address', child['startAddress'].join(','));//其下子元素数量
                    //$itemContent.append($('<a href="#' + (child.obj.attr("id")) + '" class="selectIcon">测试</a>'));//操作
                    //dirmap[child['startAddress'].join(',')] = child;
                    //设置目录节点容器标签
                    $item = $('<li>');
                    $item.append($itemContent);//将其附加进li中
                    //继续遍历子节点
                    if ($item.children.length) {
                        childList = traveList(child, (dep + 1));
                        childList && $item.append(childList);
                    }
                    $list.append($item);
                }
            }
            return $list;
        }
    },
    CreateNavUI: function (list) {//百科边栏目录UI
        var html = traveList(list, 1).find("li");
        $("#" + BaiKe.config.navid).html(html);
        function traveList(section, dep) {
            var $list, $item, $itemContent, child, childList;
            if (section.children.length) {
                $list = $('<ul>');
                for (var i = 0; i < section.children.length; i++) {
                    child = section.children[i];
                    //设置目录节点内容标签
                    var title = getSubStr(child['title'], BaiKe.config.titleLen);
                    $itemContent = $('<a class="navTitle level' + dep + '" href="#' + (child.obj.attr("id")) + '">' + child.index + " " + title + '</a>');
                    //设置目录节点容器标签
                    $item = $('<li>');
                    $item.append($itemContent);//将其附加进li中
                    //继续遍历子节点
                    if ($item.children.length) {
                        childList = traveList(child, (dep + 1));
                        childList && $item.append(childList);
                    }
                    $list.append($item);
                }
            }
            return $list;
        }
    },
    CurList: { tag: "", title: "root", level: -1, index: "", obj: null, children: [] }
}
function getSubStr(s, l) {
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

////------------根据百科编辑器,生成层级树(disuse)
//var resetHandler = function () {
//    var dirmap = {}, dir = myue.execCommand('getsections');
//    var list = { tag: "", title: "root", level: -1, index: "", children: [] };
//    GetDirByUE(list, dir.children);
//    //console.log(JSON.stringify(dir));
//    // 更新目录树
//    $("#indexlist").html(traversal(dir, 1) || null);
//    // 选中章节按钮
//    $('.selectIcon').click(function (e) {
//        var $target = $(this),
//                address = $target.parent().attr('data-address');
//        myue.execCommand('selectsection', dirmap[address], true);
//    });
//    function traversal(section, dep) {
//        var $list, $item, $itemContent, child, childList;
//        if (section.children.length) {
//            $list = $('<ul>');
//            for (var i = 0; i < section.children.length; i++) {
//                child = section.children[i];
//                //设置目录节点内容标签
//                var title = getSubStr(child['title'], 18);
//                $itemContent = $('<div class="sectionItem"></div>').html($('<span class="itemTitle level' + dep + '">' + title + '</span>'));
//                $itemContent.attr('data-address', child['startAddress'].join(','));//其下子元素数量
//                $itemContent.append($('<input type="button" value="选择" class="selectIcon">'));//操作
//                dirmap[child['startAddress'].join(',')] = child;
//                //设置目录节点容器标签
//                $item = $('<li>');
//                $item.append($itemContent);//将其附加进li中
//                //继续遍历子节点
//                if ($item.children.length) {
//                    childList = traversal(child, (dep + 1));
//                    childList && $item.append(childList);
//                }
//                $list.append($item);
//            }
//        }
//        return $list;
//    }
//}
//function GetDir() {
//    var dirmap = {}, dir = myue.execCommand('getsections');
//    var list = { tag: "", title: "root", level: -1, children: [] };
//    GetDirByUE(list, dir.children);
//    CreateDirTree(list);
//}
////根据UE的层级生成目录Json,将其中的需要的数据拷过来即可
//function GetDirByUE(parent, children) {
//    for (var i = 0; i < children.length; i++) {
//        var dir = children[i];
//        var model = { tag: "", title: "", level: -1, index: "", children: [] };
//        model.tag = dir.tag;
//        model.title = dir.title;
//        model.level = dir.level;
//        model.index = GetRandomNum(6);
//        if (dir.children && dir.children.length > 0) {
//            GetDirByUE(model, dir.children);
//        }
//        parent.children.push(model);
//    }
//}

//------
//<nav id="baike_div">
//          <ul class="nav" id="baike_nav">
//          <%--<li><a href="#fat">@fat</a></li>--%>
//        </ul>
//</nav>
//此属性的值为任何Bootstrap中.nav组件的父元素的ID或class。