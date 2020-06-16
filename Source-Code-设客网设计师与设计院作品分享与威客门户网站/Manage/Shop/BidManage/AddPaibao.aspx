<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_BidManage_AddPaibao, App_Web_g0x3iq3z" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>宝点套餐</title>
</asp:Content>
<asp:Content runat="server"  ContentPlaceHolderID="Content">
    <div id="nodeNav" class="col-lg-2 col-md-2 col-sm-2 col-xs-12 divBorder" style="padding:0 0 0 0;">
    <ZL:UserGuide runat="server" />
    </div>
    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
    <div class="clearbox">
    </div>
    <div>
        <table width="100%" cellpadding="2" cellspacing="1" border="0" class="table table-striped table-bordered table-hover">
            <tr align="center">
                <td colspan="2" class="spacingtitle">
                    <asp:Label ID="Label1" runat="server" Text="添加套餐"></asp:Label>
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td height="22" class="tdbgleft" align="right" style="width: 24%">
                    套餐名称：
                </td>
                <td>
                    <asp:TextBox ID="txt_Tname" class="form-control"   runat="server" Width="201px"></asp:TextBox>
                </td>
            </tr>
             <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td height="22" class="tdbgleft" align="right" style="width: 24%">
                    赠送玩点数：
                </td>
                <td>
                    <asp:TextBox ID="txtPoint" class="form-control"   runat="server" Width="201px"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td height="22" class="tdbgleft" align="right" style="width: 24%">
                    显示图片 ：
                </td>
                <td>
                    <asp:TextBox ID="txt_Timg" class="form-control"   runat="server" style="max-width:350px"></asp:TextBox>
                    <iframe id="bigimgs" style="top: 2px" src="../../../Shop/FileUpload.aspx?menu=txt_Timg" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td height="22" class="tdbgleft" align="right" style="width: 24%">
                    兑换比例(金钱/宝点)：
                </td>
                <td>
                    <asp:TextBox ID="txt_Tform" class="form-control pull-left"   runat="server" Width="68px">1</asp:TextBox><span style=" float:left;padding:5px;">/</span><asp:TextBox 
                        ID="txt_Ito" class="form-control pull-left"   runat="server" Width="66px">1</asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td height="22" class="tdbgleft" align="right" style="width: 24%">
                    套餐说明 ：
                </td>
                <td>
                    <asp:TextBox ID="txt_Tinfo" class="form-control"   runat="server" style="max-width:350px"
                        Height="143px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            
            <tr class="tdbg">
                <td height="22" class="tdbgleft" align="right" style="width: 24%">
                    <strong></strong>
                </td>
                <td>
                    <asp:Button ID="Button1" class="btn btn-primary" style="width:110px;"  runat="server" Text="添加套餐" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" class="btn btn-primary" style="width:110px;"  runat="server" 
                        Text="返回" CausesValidation="false" onclick="Button2_Click" />
                    <asp:HiddenField ID="txt_Tnum" runat="server" />
                </td>
            </tr>
        </table>
    </div>
<asp:HiddenField runat="server" ID="hiden" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/calendar.js"></script>
</asp:Content>

    


    

