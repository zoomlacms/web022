/*
 * artDialog iframeTools
 * Date: 2011-07-09 19:27
 * http://code.google.com/p/artdialog/
 * (c) 2009-2010 TangBin, http://www.planeArt.cn
 *
 * This is licensed under the GNU LGPL, version 2.1 or later.
 * For details, see: http://creativecommons.org/licenses/LGPL/2.1/
 */
;(function ($, window, artDialog, undefined) {

var _parentDialog, _proxyDialog, _zIndex,
	_data = '_ARTDIALOG.DATA',
	_open = '_ARTDIALOG.OPEN',
	_origin = '_ARTDIALOG.ORIGIN',
	_winName = window.name = window.name || '_ARTDIALOG.WINNAME' + (new Date).getTime();


/** 获取 artDialog 可跨级调用的最高层的 window 对象 */
var _parent = artDialog.parent = function () {
	var parent = window,
	test = function (name) {
		try {
			var doc = window[name].document;	// 跨域|无权限
			doc.getElementsByTagName; 			// chrome 本地安全限制
		} catch (e) {
			return false;
		};
		// 框架集无法显示第三方元素
		return doc.getElementsByTagName('frameset').length === 0;
	};
	
	if (test('top')) {
		parent = window.top;
	} else if (test('parent')) {
		parent = window.parent;
	};
	
	return parent;
}();


_parentDialog = _parent.artDialog;


// 获取顶层页面对话框叠加值
_zIndex = function () {
	return _parentDialog.defaults.zIndex;
};



/**
 * 跨框架数据共享接口
 * @param	{String}	存储的数据名
 * @param	{Any}		将要存储的任意数据(无此项则返回被查询的数据)
 */
artDialog.data = function (name, value) {
	var parent = artDialog.parent,
		cache = parent[_data] || {};
	parent[_data] = cache;
	
	if (value) {
		cache[name] = value;
	} else {
		return cache[name];
	};
	return cache;
};


/**
 * 数据共享删除接口
 * @param	{String}	删除的数据名
 */
artDialog.removeData = function (name) {
	var cache = artDialog.parent[_data];
	if (cache && cache[name]) delete cache[name];
};


/** 跨框架普通对话框 */
artDialog.through = _proxyDialog = function () {
	var api = _parentDialog.apply(this, arguments);
		
	// 缓存从当前window（可能为iframe）调出所有跨框架对话框，window卸载后全部关闭这些对话框
	// 因为iframe注销后也会从内存中删除其创建的对象，可以防止回调函数报错
	if (_parent !== window) artDialog.list[api.config.id] = api;
	return api;
};

// 框架页面卸载前关闭所有穿越的对话框
_parent !== window && $(window).bind('unload', function () {
	var list = artDialog.list;
	for (var i in list) {
		if (list[i]) {
			list[i].close();
			delete list[i];
		};
	};
});


/**
 * 弹窗 (iframe)
 * @param	{String}	地址
 * @param	{Object}	配置参数. 这里传入的回调函数接收的第1个参数为iframe内部window对象
 * @param	{Boolean}	是否允许缓存. 默认true
 */
artDialog.open = function (url, options, cache) {
	options = options || {};
	
	var api, titleWrap, loadInit, oldLocation,
		iframe, $iframe, $idoc, iwin, ibody,
		parent = artDialog.parent,
		iframeCss = 'width:'+options.width+'px;height:100%;border:0',
		title = options.title,
		$content, $main;
		
	if (cache === false) {
		var ts = (new Date()).getTime(),
			ret = url.replace(/([?&])_=[^&]*/, "$1_=" + ts );
		url = ret + ((ret === url) ? (/\?/.test(url) ? "&" : "?") + "_=" + ts : "");
	};
		
	var load = function () {
		var iWidth, iHeight, newLocation,
			loading = iframe.previousSibling,
			aConfig = api.config;
		titleWrap.style.display = 'block';
		$content.addClass('aui_contentFull');
		
		if (!loadInit && loading) loading.parentNode.removeChild(loading);
		
		iwin = iframe.contentWindow;
		try {
			ibody = iwin.document.body;// 检测跨域
		} catch (e) {
			$iframe.unbind('load', load);
			loadInit = true;
			iframe.style.cssText = iframeCss;
			api.position(aConfig.left, aConfig.top);
			return;
		};
		
		$(iwin).bind('unload', unload);
		newLocation = iwin.location.href;
		if (newLocation === oldLocation) return;
		oldLocation = newLocation;
		$idoc = $(iwin.document);
		
		iWidth = aConfig.width === 'auto' ?
			$idoc.width() + parseInt($(ibody).css('marginLeft')) : aConfig.width;
		iHeight = aConfig.height === 'auto' ?
			$idoc.height() : aConfig.height;
			
		if (!loadInit) {
			setTimeout(function () {
				iframe.style.cssText = iframeCss;
			}, 0);// setTimeout: 防止IE6~7导致对话框样式渲染异常
		};
		
		api.size(iWidth, iHeight);
		aConfig.follow ?
			api.follow(aConfig.follow) :
			api.position(aConfig.left, aConfig.top);
		
		!loadInit && options.initFn && options.initFn.call(api, iwin, parent);
		loadInit = true;
	};
	
	var unload = function () {
		loadInit = false;
	};
		
	var config = {
		zIndex: _zIndex(),
		tmpl: null,
		initFn: function () {
			api = this;
			var DOM = api.DOM;
			$main = DOM.main;
			$content = DOM.content;
			titleWrap = DOM.titleWrap[0];
			!title && (titleWrap.style.display = 'none');
			
			iframe = api.iframe = parent.document.createElement('iframe');
			iframe.src = url;
			iframe.name = 'Open' + api.config.id;
			iframe.style.cssText = 'position:absolute;left:-9999em;top:-9999em;border:none 0';
			iframe.setAttribute('frameborder', 0, 0);
			iframe.setAttribute('allowtransparency', true);
			$iframe = $(iframe);
			api.content().appendChild(iframe);
			
			iwin = iframe.contentWindow;
			
			try {
				iwin.name = iframe.name;
				artDialog.data(iframe.name + _open, api);
				artDialog.data(iframe.name + _origin, window);
				$(iwin).bind('unload', unload);
			} catch (e) {};
			
			$iframe.bind('load', load);
			
			// 如果从iframe内创建了新open，如果提前iframe被卸载而导致对象从内存中移除
			// 启用遮罩可以避免用户触发关闭动作
			api.lock();
		},
		closeFn: function () {
			$iframe.css('display', 'none').unbind('load', load);
			
			options.closeFn && options.closeFn.call(this, iframe.contentWindow, parent);
			$content.removeClass('aui_contentFull');
			
			// 重要！需要重置iframe地址，否则下次出现的对话框在IE6、7无法聚焦input
			// IE删除iframe后，iframe仍然会留在内存中出现上述问题，置换src是最容易解决的方法
			$iframe[0].src = 'about:blank';
			$iframe.remove();
			$.get("CloudManage.aspx?Delexml=t", function (dat) {
                //alert(dat);
             })
			try {
				artDialog.removeData(iframe.name + _open);
				artDialog.removeData(iframe.name + _origin);
				$(iwin).unbind('unload', unload);
			} catch (e) {};
		}
	};
	
	// 回调函数第一个参数指向iframe内部window对象
	if (typeof options.yesFn === 'function') config.yesFn = function () {
		return options.yesFn.call(api, iframe.contentWindow, parent);
	};
	if (typeof options.noFn === 'function') config.noFn = function () {
		return options.noFn.call(api, iframe.contentWindow, parent);
	};
	
	delete options.content;

	for (var i in options) {
		if (config[i] === undefined) config[i] = options[i];
	};
	
	return _proxyDialog(config);
};


/** 获取open方法控制接口(在open打开的iframe内部私有方法) */
artDialog.open.api = artDialog.data(_winName + _open);


/** 获取open方法触发来源页面window(在open打开的iframe内部私有方法) */
artDialog.open.origin = artDialog.data(_winName + _origin) || window;


/** artDialog.open 打开的iframe页面里关闭对话框快捷方法 */
artDialog.close = function () {
	var api = artDialog.data(_winName + _open);
	api && api.close();
	return false;
};


/**
 * Ajax填充内容
 * @param	{String}			地址
 * @param	{Object, String}	配置参数. 传入字符串表示使用模板引擎解析JSON生产内容
 * @param	{Boolean}			是否允许缓存. 默认true
 */
artDialog.load = function(url, options, cache){
	cache = cache || false;
	var opt = options || {},
		tmpl = typeof opt === 'string' ? opt : null;
		
	var config = {
		zIndex: _zIndex(),
		initFn: function(here){
			var api = this,
				aConfig = api.config;
			
			$.ajax({
				url: url,
				success: function (content) {
					if (tmpl) content = 'JSON' in window && JSON.parse ?
						JSON.parse(content) : eval('(' + content + ')');
						
					api.content(content, tmpl);
					aConfig.follow ?
						api.follow(aConfig.follow) :
						api.position(aConfig.left, aConfig.top);
	
					opt.initFn && opt.initFn.call(api, here);				
				},
				cache: cache
			});
			
		}
	};
		
	if (opt.tmpl) {
		tmpl = opt.tmpl;
		opt.tmpl = null;
	};
	
	delete options.content;
	
	for (var i in opt) {
		if (config[i] === undefined) config[i] = opt[i];
	};
	
	return _proxyDialog(config);
};


/**
 * 警告
 * @param	{String}	消息内容
 */
artDialog.alert = function (content) {
	return _proxyDialog({
		id: 'Alert',
		zIndex: _zIndex(),
		icon: 'alert',
		fixed: true,
		lock: true,
		content: content,
		yesFn: true
	});
};


/**
 * 确认
 * @param	{String}	消息内容
 * @param	{Function}	确定按钮回调函数
 * @param	{Function}	取消按钮回调函数
 */
artDialog.confirm = function (content, yes, no) {
	return _proxyDialog({
		id: 'Confirm',
		zIndex: _zIndex(),
		icon: 'confirm',
		fixed: true,
		content: content,
		yesFn: function (here) {
			return yes.call(this, here);
		},
		noFn: function (here) {
			return no && no.call(this, here);
		}
	});
};


/**
 * 提问
 * @param	{String}	提问内容
 * @param	{Function}	回调函数. 接收参数：输入值
 * @param	{String}	默认值
 */
artDialog.prompt = function (content, yes, value) {
	value = value || '';
	var input;
	
	return _proxyDialog({
		id: 'Prompt',
		zIndex: _zIndex(),
		icon: 'prompt',
		fixed: true,
		content: [
			'<div style="marginBottom:5px;font-size:12px">',
				content,
			'</div>',
			'<div>',
				'<input value="',
					value,
				'" type="txt" style="width:16em;padding:6px 4px" />',
			'</div>'
			].join(''),
		initFn: function () {
			input = this.DOM.content.find('input')[0];
			input.select();
			input.focus();
		},
		yesFn: function (here) {
			return yes && yes.call(this, input.value, here);
		},
		noFn: true
	});
};


/** 提示
 * @param	{String}	提示内容
 * @param	{Number}	显示时间 (默认1.5秒)
 */
artDialog.tips = function (content, time) {
	return _proxyDialog({
		id: 'Tips',
		zIndex: _zIndex(),
		title: false,
		content: '<div style="padding: 0 1em;">' + content + '</div>',
		time: time || 1.5,
		fixed: true
	});
};


// 增强artDialog拖拽体验 - 防止鼠标落入iframe导致不流畅
$(function () {
	var $document = $(document),
		dragEvent = artDialog.dragEvent.prototype,
		mask = document.createElement('div'),
		style = mask.style;
		
	style.cssText = 'display:none;position:absolute;left:0;top:0;width:100%;height:100%;'
	+ 'cursor:move;filter:alpha(opacity=0);opacity:0;background:#FFF';
		
	document.body.appendChild(mask);
	dragEvent._start = dragEvent.start;
	dragEvent._stop = dragEvent.stop;
	
	dragEvent.start = function () {
		dragEvent._start.apply(this, arguments);
		style.display = 'block';
		style.zIndex = artDialog.defaults.zIndex + 3;
		style.left = $document.scrollLeft() + 'px';
		style.top = $document.scrollTop() + 'px';
	};
	
	dragEvent.stop = function () {
		dragEvent._stop.apply(this, arguments);
		style.display = 'none';
	};
});

})(window.jQuery || window.art, this, this.artDialog);