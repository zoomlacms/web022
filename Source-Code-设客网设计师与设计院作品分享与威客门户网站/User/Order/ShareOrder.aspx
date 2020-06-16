<%@ page language="C#" autoeventwireup="true" masterpagefile="~/User/Empty.master" inherits="User_Order_ShareOrder, App_Web_ivqqslkk" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>晒单评价</title>
    <style>
        .shareorder .staricon{font-size:20px; color:#ccc; cursor:pointer;}
        .shareorder .type_div{padding:0 10px;cursor:pointer; margin:0 5px 5px 0;border:1px solid #ddd; float:left; line-height:30px; font-size:13px;}
        .shareorder .row{margin-top:10px;}
        .shareorder .td_left{line-height:30px;}
        .shareorder #star_div{line-height:30px;}
        .shareorder .addimg_a{display:inline-block; border:1px solid #ddd;text-align:center; padding:25px 10px;color:#999;}
        .shareorder .tips{font-size:12px;color:#999;}
    </style>
</asp:Content>
<asp:Content  ContentPlaceHolderID="Content" Runat="Server">
    <div class="container-fluid shareorder">
        <div class="row">
            <div class="col-md-3 td_left text-right"><span class="color_red">*</span> 标题：</div>
            <div class="col-md-9">
                <div>
                <asp:TextBox ID="Title_T" placeholder="描述一下评价的主要内容" runat="server" CssClass="form-control text_300"></asp:TextBox>
                </div>
                <div class="text-right text_300 tips">4-20字</div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 td_left text-right"><span class="color_red">*</span> 评分：</div>
            <div class="col-md-9" id="star_div">
                <span class="staricon fa fa-star-o"></span>
                <span class="staricon fa fa-star-o"></span>
                <span class="staricon fa fa-star-o"></span>
                <span class="staricon fa fa-star-o"></span>
                <span class="staricon fa fa-star-o"></span>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 td_left text-right"><span class="color_red">*</span> 标签：</div>
            <div class="col-md-9"><div class="type_div"><span class="glyphicon glyphicon-pencil"></span> 自定义</div></div>
        </div>
        <div class="row">
            <div class="col-md-3 td_left text-right"><span class="color_red">*</span> 心得：</div>
            <div class="col-md-9"><asp:TextBox ID="Deail_T" placeholder="商品是否给力?快分享你的购买心得吧" runat="server" CssClass="form-control text_300" TextMode="MultiLine" Height="200"></asp:TextBox></div>
        </div>
        <div class="row">
            <div class="col-md-3 td_left text-right">晒单：</div>
            <div class="col-md-9">
                <a class="addimg_a" href="#">添加图片</a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-9">
                <asp:Button ID="Save_Btn" runat="server" CssClass="btn btn-primary" Text="评价并继续" /> <asp:CheckBox ID="IsHideName" runat="server" /> 匿名评价
            </div>
        </div>
    </div>
    <script>
        function InitStarEvent() {
            
        }
    </script>
</asp:Content>


