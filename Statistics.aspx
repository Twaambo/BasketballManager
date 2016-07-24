<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="BasketballManager.About" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <script>
            $(function () {
                $("#<%= from.ClientID %>").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 2,
                    onClose: function (selectedDate) {
                        $("#<%= to.ClientID %>").datepicker("option", "minDate", selectedDate);
                    }
                });
                $("#<%= to.ClientID %>").datepicker({
                    defaultDate: "+1w",
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 2,
                    onClose: function (selectedDate) {
                        $("#<%= from.ClientID %>").datepicker("option", "maxDate", selectedDate);
                    }
                });
            });
    </script>
    <section class="featured">
        <div class="content-wrapper">
                <table style="width:91%; height: 15px; margin-bottom: 0px;">
    <tr>
        <td class="auto-style34"></td>
        <td class="auto-style32">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Please select the dates for the statistics:"></asp:Label>
        </td>
        <td class="auto-style33"></td>
    </tr>
    </table>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <table style="width: 96%; height: 62px;">
    <tr>
        <td class="auto-style25">&nbsp;</td>
        <td class="auto-style26">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Small" Text="From:"></asp:Label>
        </td>
        <td class="auto-style27">
            <asp:TextBox ID="from" runat="server" Width="121px"></asp:TextBox>
        </td>
        <td class="auto-style38">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Small" Text="To:"></asp:Label>
        </td>
        <td class="auto-style36">
            <asp:TextBox ID="to" runat="server" Width="121px" AutoPostBack="True"></asp:TextBox>
        </td>
        <td class="auto-style37">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search Statistics" />
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style25">&nbsp;</td>
        <td class="auto-style26">&nbsp;</td>
        <td class="auto-style27">&nbsp;</td>
        <td class="auto-style38">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            &nbsp;</td>
        <td colspan="2">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="Statistics" runat="server" ConnectionString="<%$ ConnectionStrings:obiwan.AL425 %>" ProviderName="<%$ ConnectionStrings:obiwan.AL425.ProviderName %>" SelectCommand="SELECT PLAYER.PFIRSTNAME, PLAYER.PLASTNAME, PERFORMANCE.TOTALP FROM GAME, PERFORMANCE, PLAYER WHERE GAME.GAMEID = PERFORMANCE.GAMEID AND PERFORMANCE.PLAYERID = PLAYER.PLAYERID AND (GAME.GAMEDATE BETWEEN to_date(:STARTDATE) AND to_date(:ENDDATE)) ORDER BY PERFORMANCE.TOTALP">
                <SelectParameters>
                    <asp:ControlParameter ControlID="from" Name="STARTDATE" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="to" Name="ENDDATE" PropertyName="Text" Type="DateTime" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td colspan="2">
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="6">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style25 {
            width: 213px;
        }
        .auto-style26 {
            width: 16px;
        }
        .auto-style27 {
            width: 55px;
        }
        .auto-style32 {
            height: 26px;
            width: 473px;
        }
        .auto-style33 {
            width: 115px;
            height: 26px;
        }
        .auto-style34 {
            width: 107px;
            height: 26px;
        }
        .auto-style36 {
            width: 112px;
        }
        .auto-style37 {
            width: 403px;
        }
        .auto-style38 {
            width: 24px;
        }
    </style>
</asp:Content>


