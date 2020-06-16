<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Manage/I/Default.master" inherits="Manage_Shop_SetOrderStatus, App_Web_1lmqzdkx" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>自定义订单状态</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#orderstatus" aria-controls="orderstatus" role="tab" data-toggle="tab">订单状态</a></li>
    <li role="presentation"><a href="#ExpStatus" aria-controls="ExpStatus" role="tab" data-toggle="tab">物流状态</a></li>
    </ul>
    <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="orderstatus">
        <table class="table table-bordered table-hover margin_t5">
            <thead>
                <tr><th class="td_m">订单状态</th><th class="td_s">状态码</th><th class="td_l">编辑状态</th><th>预览效果</th></tr>
            </thead>
            <tbody>
                <tr>
                    <td class="text-center"><span class="gray_9">正常订单</span></td>
                    <td>0</td>
                    <td><asp:TextBox ID="OrderNormal_T" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="text-center"><span class="gray_9">已确认</span></td>
                    <td>1</td>
                    <td><asp:TextBox ID="OrderSured_T" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="text-center"><span class="gray_9">订单完结</span></td>
                    <td>99</td>
                    <td><asp:TextBox ID="OrderFinish_T" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="text-center"><span class="gray_9">已分成</span></td>
                    <td>100</td>
                    <td><asp:TextBox ID="UnitFinish_T" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="text-center"><span class="gray_9">申请退款</span></td>
                    <td>-1</td>
                    <td><asp:TextBox ID="DrawBack_T" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="text-center"><span class="gray_9">拒绝退款</span></td>
                    <td>-2</td>
                    <td><asp:TextBox ID="UnDrawBack_T" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="text-center"><span class="gray_9">确认退款</span></td>
                    <td>-3</td>
                    <td><asp:TextBox ID="CheckDrawBack_T" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="text-center"><span class="gray_9">取消订单</span></td>
                    <td>-5</td>
                    <td><asp:TextBox ID="CancelOrder_T" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="text-center"><span class="gray_9">已删除</span></td>
                    <td>-99</td>
                    <td><asp:TextBox ID="Recycle_T" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div role="tabpanel" class="tab-pane" id="ExpStatus">
        <table class="table table-bordered table-hover margin_t5">
            <thead>
                <tr><th class="td_m">订单状态</th><th class="td_s">状态码</th><th class="td_l">编辑状态</th><th>预览效果</th></tr>
            </thead>
            <tbody>
             <tr>
                <td class="text-center"><span class="gray_9">等待配送</span></td>
                <td>0</td>
                <td><asp:TextBox ID="UnDelivery_T" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
                <td></td>
            </tr>
            <tr>
                <td class="text-center"><span class="gray_9">已配送</span></td>
                <td>1</td>
                <td><asp:TextBox ID="Delivery_T" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
                <td></td>
            </tr>
            <tr>
                <td class="text-center"><span class="gray_9">已签收</span></td>
                <td>2</td>
                <td><asp:TextBox ID="Signed_T" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
                <td></td>
            </tr>
            <tr>
                <td class="text-center"><span class="gray_9">拒签收</span></td>
                <td>-1</td>
                <td><asp:TextBox ID="TextBox1" runat="server" CssClass="form-control text_300"></asp:TextBox></td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
  </div>
</asp:Content>

