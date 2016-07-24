<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BasketballManager._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <script>
                $(function () {
                    $("#<%= datepicker.ClientID %>").datepicker({
                    changeMonth: true,
                    changeYear: true
                });
            });
    </script>
    <section class="featured">
        <div class="content-wrapper">
            <table style="width:100%;">
                <tr>
                    <td class="auto-style24" colspan="2">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Players Details:"></asp:Label>
                    </td>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style25" colspan="2">
                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PLAYERID" DataSourceID="Players" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="PLAYERID" HeaderText="Player ID" ReadOnly="True" SortExpression="PLAYERID" />
                                <asp:BoundField DataField="PFIRSTNAME" HeaderText="First Name" SortExpression="PFIRSTNAME" />
                                <asp:BoundField DataField="PLASTNAME" HeaderText="Last Name" SortExpression="PLASTNAME" />
                                <asp:BoundField DataField="PDOB" HeaderText="DoB" SortExpression="PDOB" DataFormatString="{0:d}" />
                                <asp:BoundField DataField="PWHEIGHT" HeaderText="Wheight" SortExpression="PWHEIGHT" />
                                <asp:BoundField DataField="PHAIGHT" HeaderText="Height" SortExpression="PHAIGHT" />
                                <asp:BoundField DataField="TNAME" HeaderText="Team" SortExpression="TNAME" />
                            </Columns>
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
                        <asp:SqlDataSource ID="Players" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:obiwan.AL425 %>" DeleteCommand="DELETE FROM &quot;PLAYER&quot; WHERE &quot;PLAYERID&quot; = :original_PLAYERID AND ((&quot;PFIRSTNAME&quot; = :original_PFIRSTNAME) OR (&quot;PFIRSTNAME&quot; IS NULL AND :original_PFIRSTNAME IS NULL)) AND ((&quot;PLASTNAME&quot; = :original_PLASTNAME) OR (&quot;PLASTNAME&quot; IS NULL AND :original_PLASTNAME IS NULL)) AND ((&quot;PDOB&quot; = :original_PDOB) OR (&quot;PDOB&quot; IS NULL AND :original_PDOB IS NULL)) AND ((&quot;PWHEIGHT&quot; = :original_PWHEIGHT) OR (&quot;PWHEIGHT&quot; IS NULL AND :original_PWHEIGHT IS NULL)) AND ((&quot;PHAIGHT&quot; = :original_PHAIGHT) OR (&quot;PHAIGHT&quot; IS NULL AND :original_PHAIGHT IS NULL)) AND ((&quot;TEAMID&quot; = :original_TEAMID) OR (&quot;TEAMID&quot; IS NULL AND :original_TEAMID IS NULL))" InsertCommand="INSERT INTO &quot;PLAYER&quot; (&quot;PLAYERID&quot;, &quot;PFIRSTNAME&quot;, &quot;PLASTNAME&quot;, &quot;PDOB&quot;, &quot;PWHEIGHT&quot;, &quot;PHAIGHT&quot;, &quot;TEAMID&quot;) VALUES (:PLAYERID, :PFIRSTNAME, :PLASTNAME, :PDOB, :PWHEIGHT, :PHAIGHT, :TEAMID)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:obiwan.AL425.ProviderName %>" SelectCommand="SELECT PLAYER.PLAYERID, PLAYER.PFIRSTNAME, PLAYER.PLASTNAME, PLAYER.PDOB, PLAYER.PWHEIGHT, PLAYER.PHAIGHT, TEAM.TNAME FROM PLAYER, TEAM WHERE PLAYER.TEAMID = TEAM.TEAMID ORDER BY PLAYER.PLAYERID" UpdateCommand="UPDATE &quot;PLAYER&quot; SET &quot;PFIRSTNAME&quot; = :PFIRSTNAME, &quot;PLASTNAME&quot; = :PLASTNAME, &quot;PDOB&quot; = :PDOB, &quot;PWHEIGHT&quot; = :PWHEIGHT, &quot;PHAIGHT&quot; = :PHAIGHT, &quot;TEAMID&quot; = :TEAMID WHERE &quot;PLAYERID&quot; = :original_PLAYERID AND ((&quot;PFIRSTNAME&quot; = :original_PFIRSTNAME) OR (&quot;PFIRSTNAME&quot; IS NULL AND :original_PFIRSTNAME IS NULL)) AND ((&quot;PLASTNAME&quot; = :original_PLASTNAME) OR (&quot;PLASTNAME&quot; IS NULL AND :original_PLASTNAME IS NULL)) AND ((&quot;PDOB&quot; = :original_PDOB) OR (&quot;PDOB&quot; IS NULL AND :original_PDOB IS NULL)) AND ((&quot;PWHEIGHT&quot; = :original_PWHEIGHT) OR (&quot;PWHEIGHT&quot; IS NULL AND :original_PWHEIGHT IS NULL)) AND ((&quot;PHAIGHT&quot; = :original_PHAIGHT) OR (&quot;PHAIGHT&quot; IS NULL AND :original_PHAIGHT IS NULL)) AND ((&quot;TEAMID&quot; = :original_TEAMID) OR (&quot;TEAMID&quot; IS NULL AND :original_TEAMID IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_PLAYERID" Type="Decimal" />
                                <asp:Parameter Name="original_PFIRSTNAME" Type="String" />
                                <asp:Parameter Name="original_PLASTNAME" Type="String" />
                                <asp:Parameter Name="original_PDOB" Type="DateTime" />
                                <asp:Parameter Name="original_PWHEIGHT" Type="Decimal" />
                                <asp:Parameter Name="original_PHAIGHT" Type="Decimal" />
                                <asp:Parameter Name="original_TEAMID" Type="Decimal" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="fid" Name="PLAYERID" PropertyName="Text" Type="Int16" />
                                <asp:ControlParameter ControlID="fName" Name="PFIRSTNAME" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="lName" Name="PLASTNAME" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="datepicker" Name="PDOB" PropertyName="Text" Type="DateTime" />
                                <asp:ControlParameter ControlID="weight" Name="PWHEIGHT" PropertyName="Text" Type="Int16" />
                                <asp:ControlParameter ControlID="height" Name="PHAIGHT" PropertyName="Text" Type="Int16" />
                                <asp:ControlParameter ControlID="drop1" Name="TEAMID" PropertyName="SelectedValue" Type="Int16" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="PFIRSTNAME" Type="String" />
                                <asp:Parameter Name="PLASTNAME" Type="String" />
                                <asp:Parameter Name="PDOB" Type="DateTime" />
                                <asp:Parameter Name="PWHEIGHT" Type="Decimal" />
                                <asp:Parameter Name="PHAIGHT" Type="Decimal" />
                                <asp:Parameter Name="TEAMID" Type="Decimal" />
                                <asp:Parameter Name="original_PLAYERID" Type="Decimal" />
                                <asp:Parameter Name="original_PFIRSTNAME" Type="String" />
                                <asp:Parameter Name="original_PLASTNAME" Type="String" />
                                <asp:Parameter Name="original_PDOB" Type="DateTime" />
                                <asp:Parameter Name="original_PWHEIGHT" Type="Decimal" />
                                <asp:Parameter Name="original_PHAIGHT" Type="Decimal" />
                                <asp:Parameter Name="original_TEAMID" Type="Decimal" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="auto-style23">
                        &nbsp;</td>
                    <td class="auto-style21"></td>
                </tr>
                <tr>
                    <td class="auto-style24" colspan="2">
                        &nbsp;</td>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style26">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Text="Inser Player details:"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        &nbsp;</td>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style26">
                        &nbsp;</td>
                    <td class="auto-style24">
                        &nbsp;</td>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style26">
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Medium" Text="PlayerID:"></asp:Label>
                    </td>
                    <td class="auto-style24">
                <asp:TextBox ID="fid" runat="server" Width="176px"></asp:TextBox>
                    </td>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style26">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" Text="First Name:"></asp:Label>
                    </td>
                    <td class="auto-style24">
                <asp:TextBox ID="fName" runat="server" Width="176px"></asp:TextBox>
                    </td>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style26">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" Text="Last Name:"></asp:Label>
                    </td>
                    <td class="auto-style24">
                <asp:TextBox ID="lName" runat="server" Width="176px"></asp:TextBox>
                    </td>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style26">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text="Date of Birth:"></asp:Label>
                    </td>
                    <td class="auto-style24">
                <asp:TextBox runat="server" ID="datepicker" Width="176px"></asp:TextBox>
                    </td>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style26">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" Text="Wheight:"></asp:Label>
                    </td>
                    <td class="auto-style24">
                <asp:TextBox ID="weight" runat="server" Width="176px"></asp:TextBox>
                    </td>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style26">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" Text="Height:"></asp:Label>
                    </td>
                    <td class="auto-style24">
                <asp:TextBox ID="height" runat="server" Width="176px"></asp:TextBox>
                    </td>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style26">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text="Select team:"></asp:Label>
                    </td>
                    <td class="auto-style24">
                <asp:DropDownList ID="drop1" runat="server" DataSourceID="Teams" DataTextField="TNAME" DataValueField="TEAMID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Teams" runat="server" ConnectionString="<%$ ConnectionStrings:obiwan.AL425 %>" ProviderName="<%$ ConnectionStrings:obiwan.AL425.ProviderName %>" SelectCommand="SELECT &quot;TEAMID&quot;, &quot;TNAME&quot; FROM &quot;TEAM&quot;"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style26">
                        &nbsp;</td>
                    <td class="auto-style24">
                <asp:Button ID="Button1" runat="server" Text="Add Player" OnClick="Button1_Click" />
                    </td>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style26">
                        &nbsp;</td>
                    <td class="auto-style24">
                        &nbsp;</td>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <table style="width:100%;">
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        </table>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style5 {
            width: 240px;
        }
        #Text1 {
            width: 175px;
        }
    #datepicker {
        width: 176px;
    }
        .auto-style21 {
            height: 352px;
        }
        .auto-style22 {
            width: 803px;
            margin-left: 320px;
        }
        .auto-style23 {
            height: 352px;
            width: 803px;
        }
        .auto-style24 {
            width: 601px;
            margin-left: 320px;
        }
        .auto-style25 {
            height: 352px;
            width: 601px;
        }
        .auto-style26 {
            width: 197px;
            margin-left: 320px;
        }
    </style>
</asp:Content>

