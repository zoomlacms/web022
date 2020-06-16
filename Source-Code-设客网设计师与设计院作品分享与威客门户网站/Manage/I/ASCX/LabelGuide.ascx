<%@ control language="C#" autoeventwireup="true" inherits="Manage_I_ASCX_LabelGuide, App_Web_qant4ybz" %>
<div class="menu_tit"><span class="glyphicon glyphicon-globe"></span>标签管理</div>
<div class="tvNavDiv" style="height:auto;">
    <div class="left_ul">
        <ul>
            <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/TemplateSet.aspx');">方案设置</a></li>
            <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/TemplateManage.aspx')">模板管理</a></li>
            <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/LabelManage.aspx')">标签管理</a></li>
            <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/CSSManage.aspx')">风格管理</a></li>
            <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/TemplateSetOfficial.aspx')">云端下载</a></li>
            <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/LabelCallTab.aspx')">标签助手</a></li>
            <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/DSManage.aspx')">外部数据源</a></li>
            <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/GetPageHtml.aspx')">源码查看器</a></li>
        </ul>
        <div class="clearfix"></div>
    </div>
     <div class="input-group margintop10" >
        <input type="text" id="keyWord" class="form-control ascx_key" placeholder="请输入标签名称"  onkeydown="return ASCX.OnEnterSearch('<%:CustomerPageAction.customPath2+"Template/LabelManage.aspx?keyWord=" %>',this);"/>
        <span class="input-group-btn">
            <button class="btn btn-default" type="button" onclick="ASCX.Search('<%:CustomerPageAction.customPath2+"Template/LabelManage.aspx?keyWord=" %>','keyWord');"><span class="glyphicon glyphicon-search"></span></button>
        </span>
    </div>

</div>   
