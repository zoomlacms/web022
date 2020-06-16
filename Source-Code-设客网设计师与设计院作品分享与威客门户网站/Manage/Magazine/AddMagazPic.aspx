<%@ page language="C#" autoeventwireup="true" inherits="User_Magazine_AddMagazPic, App_Web_npolburt" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>创建电子杂志</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-striped table-bordered table-hover">
      <td class="spacingtitle" colspan="2" style="height: 26px; text-align:center;"><strong>
        <asp:Label ID="Label1" runat="server" Text="修改电子杂志"></asp:Label>
        </strong>
       </td>
    <tr>
        <td  class="tdbgleft" style="width:200px;" align="left"><strong>杂志名称：</strong> </td>
        <td>
            <asp:TextBox ID="txtCategName" runat="server"  class="l_input" Width="320"></asp:TextBox>
            <span style="color: #FF0000">(必填)</span>
        </td>
    </tr>
    <tr>
      <td  class="tdbgleft" align="left"><strong>杂志类别：</strong></td> 
      <td><asp:RadioButtonList RepeatDirection="Horizontal" runat="server" ID="Magclass" AutoPostBack="true">
      <asp:ListItem Value="娱乐" Selected="True">娱乐</asp:ListItem>
      <asp:ListItem Value="体育">体育</asp:ListItem>
      <asp:ListItem Value="新闻">新闻</asp:ListItem>
      </asp:RadioButtonList></td> 
    </tr>
    <tr>
        <td  class="tdbgleft" align="left"><strong>杂志介绍：</strong></td>
        <td><asp:TextBox runat="server" ID="TB_Introduction" TextMode="MultiLine"  Height="50px" Width="320"  class="l_input" ></asp:TextBox></td>
    </tr>
     <tr>
       <td class="tdbgleft"  align="left">背景音乐：</td>
       <td><asp:TextBox ID="musicurl" runat="server" class="l_input" Width="320px"></asp:TextBox>请添加网络地址。如:http://网址</td>
    </tr>
     <tr>
       <td class="tdbgleft" align="left">是否开放游客浏览：</td>
       <td>
         <asp:RadioButtonList ID="isOpen" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
            <asp:ListItem Value="0">否</asp:ListItem>
         </asp:RadioButtonList>
       </td>
    </tr>
    
     <tr>
       <td class="tdbgleft" align="left">设置杂志背景：</td>
       <td >
         <%--  <input type="text" id="imgPic1" runat="server" class="l_input"  style=" width:320px;" /><br />
           <input id="File2" runat="server" type="file" Style=" width:280px; height: 20px"/> &nbsp;&nbsp;
           <asp:Button ID="Button2" runat="server" Text="上 传" Style="height: 20px"  onclick="Button2_Click" /><br />--%>
            选择背景图片:<asp:DropDownList ID="DrpItemIcon" runat="server" AutoPostBack="true" onselectedindexchanged="DrpItemIcon_SelectedIndexChanged" /> <asp:Label ID="bgTip" runat="server" Visible="false">“/ClientBin/mediaBG/”目录有异或此目录暂无背景图</asp:Label> <span style="position:absolute;width:140px;heigth:140px">
           <img runat="server" id="bgImg" alt="背景图片预览" style="width:140px;heigth:140px"/>
         </span></br></br>
          循环方向 <asp:RadioButtonList ID="isRepeat" runat="server" RepeatDirection="Vertical">
            <asp:ListItem Value="0" >不循环</asp:ListItem>
            <asp:ListItem Value="1" Selected="True">循环</asp:ListItem>
            <asp:ListItem Value="2">x轴循环</asp:ListItem>
            <asp:ListItem Value="3">y轴循环</asp:ListItem>
         </asp:RadioButtonList>
       </td>
    </tr>
    <tr class="tdbg">
        <td colspan="2" align="center"><asp:Button ID="butEnter" runat="server" Text="保存" CssClass="btn btn-primary" onclick="butEnter_Click"  />&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
            <asp:Button ID="Button1" runat="server" Text="取 消" onclick="Button1_Click" CssClass="btn btn-primary"  />
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>