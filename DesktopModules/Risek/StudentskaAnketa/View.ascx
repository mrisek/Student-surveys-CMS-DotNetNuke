<%@ Control Language="C#" AutoEventWireup="false" Inherits="Risek.StudentskaAnketa.View" CodeFile="View.ascx.cs" %>

Hello world!



    <script type="text/javascript" src="js/OIB.js"></script>
    <p><strong>Podaci o studentu</strong></p>
    <hr />
    <div>
        <table>
            <tr>
                <td align="right">
                    Ime i prezime
                </td>
                <td class="style1">
                    <asp:TextBox ID="tbImeIPrezime" runat="server" Columns="30"
                        ToolTip="Upišite ime i prezime" AutoPostBack="False"
                        OnTextChanged="tbImeIPrezime_TextChanged"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="vlImeIPrezime" runat="server" 
                            ControlToValidate="tbImeIPrezime" 
                            ErrorMessage="Ime i prezime su obavezni" ForeColor="Red" Display="Dynamic" 
                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    E-mail
                </td>
                <td>
                    <asp:TextBox ID="tbEmail" runat="server" Columns="30"
                        ToolTip="Upišite e-mail"></asp:TextBox>
                    &nbsp;<asp:RegularExpressionValidator ID="vlEmail" runat="server"
                        ControlToValidate="tbEmail" ErrorMessage="Pogrešan e-mail" ForeColor="Red"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    OIB
                </td>
                <td class="style1">
                    <asp:TextBox ID="tbOIB" runat="server" Columns="11" MaxLength="11" ></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="OIB je obavezan podatak" ControlToValidate="tbOIB"
                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="vlOIB" runat="server" ControlToValidate="tbOIB"
                    ErrorMessage="Pogrešan OIB" ForeColor="Red"
                    ClientValidationFunction="OIBValidator" Display="Dynamic"
                    OnServerValidate="vlOIB_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Spol
                </td>
                <td class="style1">
                    <asp:RadioButtonList ID="rbSpol" runat="server" RepeatDirection="Horizontal" AutoPostBack="false" OnSelectedIndexChanged="rbSpol_SelectedIndexChanged">
                        <asp:ListItem Value="Z">Ženski</asp:ListItem>
                        <asp:ListItem Value="M">Muški</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Adresa stanovanja
                </td>
                <td class="style1">
                    <asp:TextBox ID="tbAdresa" runat="server" Columns="25" MaxLength="11" Rows="3"
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Godina studija
                </td>
                <td class="style1">
                    <asp:DropDownList ID="ddGodina" runat="server">
                        <asp:ListItem Selected="True" Value="1">Prva</asp:ListItem>
                        <asp:ListItem Value="2">Druga</asp:ListItem>
                        <asp:ListItem Value="3">Treća</asp:ListItem>
                        <asp:ListItem Value="4">Četvrta</asp:ListItem>
                        <asp:ListItem Value="5">Peta</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<asp:RangeValidator ID="vlGodina" runat="server"
                        ControlToValidate="ddGodina" ErrorMessage="Samo prva, druga i treća godina mogu sudjelovati" ForeColor="Red"
                        MaximumValue="3" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Omiljeni hobiji
                </td>
                <td class="style1">
                    <asp:ListBox ID="lbHobiji" runat="server" Rows="6" SelectionMode="Multiple" AutoPostBack="false" OnSelectedIndexChanged="lbHobiji_SelectedIndexChanged">
                        <asp:ListItem>Plivanje</asp:ListItem>
                        <asp:ListItem>Trčanje</asp:ListItem>
                        <asp:ListItem>Biciklizam</asp:ListItem>
                        <asp:ListItem>Planinarenje</asp:ListItem>
                        <asp:ListItem>Čitanje</asp:ListItem>
                        <asp:ListItem>Muzika</asp:ListItem>
                        <asp:ListItem>Film</asp:ListItem>
                    </asp:ListBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Preferirane boje
                </td>
                <td class="style1">
                    <asp:CheckBoxList ID="cbBoje" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Plava</asp:ListItem>
                        <asp:ListItem>Crvena</asp:ListItem>
                        <asp:ListItem>Žuta</asp:ListItem>
                        <asp:ListItem>Zelena</asp:ListItem>
                        <asp:ListItem>Crna</asp:ListItem>
                        <asp:ListItem>Bijela</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
        </table>
        <hr />
        <asp:RadioButtonList ID="rbSuglasnost" runat="server"
            RepeatDirection="Horizontal">
            <asp:ListItem Value="1">Suglasan sam</asp:ListItem>
            <asp:ListItem Value="0" Selected="True">Nisam suglasan da se moji podaci koriste za statističke obrade i druge potrebe fakulteta</asp:ListItem>
        </asp:RadioButtonList>
        <asp:CompareValidator ID="CompareValidator1" runat="server"
            ControlToValidate="rbSuglasnost" Display="Dynamic"
            ErrorMessage="Niste prihvatili uvjete" ForeColor="Red" ValueToCompare="1"
            EnableClientScript="false"></asp:CompareValidator>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Obrada"
            OnClick="Button1_Click" />
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
            HeaderText="Prije spremanja potrebno je popraviti sljedeće:" />
        <hr />
        <asp:TextBox ID="tbNapomena" runat="server" BorderStyle="None" Columns="50"
            Rows="10" TextMode="MultiLine"></asp:TextBox>
    </div>


