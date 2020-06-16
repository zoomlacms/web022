<%@ control language="C#" autoeventwireup="true" inherits="Manage_I_ASCX_UserShopNodeTree, App_Web_qant4ybz" %>
<div id="nodeNav" style="padding: 0 0 0 0;">
    <div class="input-group">
        <input type="text" ID="keyWord" class="form-control" onkeydown="return ASCX.OnEnterSearch('<%:CustomerPageAction.customPath2+"Shop/ProductManage.aspx?souchtype=1&keyWord=" %>',this);" placeholder="请输入需要搜索的内容" />
        <span class="input-group-btn">
            <button type="button" id="searchBtn" class="btn btn-default" onclick="ASCX.Search('<%:CustomerPageAction.customPath2+"Shop/ProductManage.aspx?souchtype=1&keyWord=" %>','keyWord');"><span class="glyphicon glyphicon-search"></span></button>
        </span>
    </div>
    <div>
        <div class="tvNavDiv">
            <div class="left_ul">
                <asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
            </div>
        </div>
        <span style="color: green;" runat="server" id="Span1" visible="false" />
    </div>
</div>