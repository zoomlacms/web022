<%@ control language="C#" autoeventwireup="true" inherits="test_TlpDP, App_Web_qant4ybz" %>
    <div style="display:none;">
        <ul id="templist_ul">
            <asp:Repeater ID="TempList_RPT" runat="server" EnableViewState="false">
                <ItemTemplate>
                    <li><%#GetFileInfo() %></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>