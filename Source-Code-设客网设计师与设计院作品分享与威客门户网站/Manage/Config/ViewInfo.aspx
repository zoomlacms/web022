<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_ViewInfo, App_Web_v1q335j0" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>视图信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
      <table style="width: 100%;" cellpadding="2" cellspacing="1" class="table table-bordered table-hover table-striped">
            <tr class="tdbg"> 
                <td class="spacingtitle" colspan="2" align="center">
                <table  width="100%">
                    <tr>
                        <td  align="center"><label id="lbTag" runat="server">视图信息</label></td>
                        <td width="40"></td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px"><strong>视图名：</strong></td>
                <td>
                    ZL_V_<input type="text" id="txtVName"  class="form-control" runat="server" disabled="disabled" />
                    <label id="lbCheck" runat="server" visible="false"></label>
                </td>
            </tr>

            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 120px">
                    <strong>连接条件(可为空)：</strong>
                    <p></p>
                </td>
                <td>
                    <textarea runat="server" id="taWhere"  class="form-control" style="width: 800px;height:50px" disabled="disabled"></textarea>
                    <p>连接条件格式为： 表1.字段名=表2.字段名 and 表3.字段=表4.字段名，依次类推</p>
                </td>
            </tr>
            
            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px"><strong>SQL语句：</strong></td>
                <td>
                    <textarea runat="server" class="form-control" id="taSQL" readonly="readonly" style="width: 800px;height:100px"></textarea>
                </td>
            </tr>

            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px"><strong>视图说明(选填)：</strong></td>
                <td>
                    功能：<input type="text"  class="form-control" runat="server" id="explain" disabled="disabled" />二字查询关键字：<input  class="form-control" type="text" runat="server" id="secshort" />三字查询关键字：<input type="text"  class="form-control" runat="server" id="thrshort" />
                </td>
            </tr>

            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px"></td>
                <td>


                    <input type="button" class="btn btn-primary" onclick="window.location.href('ViewList.aspx');" value="返回" />

            </tr>
        </table>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>