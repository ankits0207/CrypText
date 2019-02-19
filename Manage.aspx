<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Manage" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            color: #FFFFFF;
            font-size: xx-large;
        }
        .style4
        {
            font-weight: bold;
            background-color: #FFFFFF;
        }
        .style5
        {
            text-align: center;
            background-color: #FF9933;
        }
        .style6
        {
            font-weight: bold;
            text-align: center;
            background-color: #FF9933;
        }
        .style7
        {
            text-align: center;
            background-color: #99FFCC;
        }
        .style8
        {
            font-weight: bold;
            text-align: center;
            background-color: #99FFCC;
        }
        .style9
        {
            height: 23px;
        }
        .style12
        {
            font-weight: bold;
            height: 7px;
            background-color: #FFFFFF;
        }
        .style13
        {
            font-weight: bold;
            text-align: center;
            height: 7px;
            background-color: #99FFCC;
        }
        .style14
        {
            font-weight: bold;
            text-align: center;
            height: 7px;
            background-color: #FF9933;
        }
        .style15
        {
            height: 23px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style3" colspan="3" 
                style="text-align: center; background-color: #990099">
                CRYPTEXT CONTROL PAGE</td>
        </tr>
        <tr>
            <td class="style4">
                TYPE YOUR MESSAGE</td>
            <td class="style6">
                <asp:TextBox ID="TextBox1" runat="server" ontextchanged="TextBox1_TextChanged" 
                    ValidationGroup="G1"></asp:TextBox>
            </td>
            <td class="style8">
                <asp:TextBox ID="TextBox2" runat="server" ontextchanged="TextBox2_TextChanged" 
                    ValidationGroup="G2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style12">
            </td>
            <td class="style14">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*" 
                    ValidationGroup="G1"></asp:RequiredFieldValidator>
            </td>
            <td class="style13">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*" 
                    ValidationGroup="G2"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                SELECT YOUR FRIEND FROM ANY ONE DROP DOWN LIST</td>
            <td class="style6">
                <asp:DropDownList ID="DropDownList1" runat="server" ValidationGroup="G2">
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="*" 
                    ValidationGroup="G1"></asp:RequiredFieldValidator>
            </td>
            <td class="style8">
                <asp:DropDownList ID="DropDownList2" runat="server" ValidationGroup="G3">
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="DropDownList2" Display="Dynamic" ErrorMessage="*" 
                    ValidationGroup="G2"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style5">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    style="font-weight: 700" Text="SEND" ValidationGroup="G1" />
            </td>
            <td class="style7">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                    style="font-weight: 700" Text="SEND" ValidationGroup="G2" />
            </td>
        </tr>
        <tr>
            <td colspan="3" 
                style="text-align: center; font-weight: 700; background-color: #FFCCFF">
                DATABASE CONTAINING ENCRYPTED VALUES</td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:GridView ID="GridView1" runat="server" BackColor="LightGoldenrodYellow" 
                    BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
                    GridLines="None" Width="730px">
                    <FooterStyle BackColor="Tan" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                        HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center; background-color: #66FF66">
                CRYPTEXT DECRYPTION ENGINE</td>
        </tr>
        <tr>
            <td class="style15">
                ENTER CIPHER TEXT</td>
            <td class="style9">
                <b>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </b>
            </td>
            <td class="style15">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="*" 
                    ValidationGroup="DG"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                    style="font-weight: 700" Text="DECRYPT" ValidationGroup="DG" Width="93px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center; background-color: #FFFFCC">
                <asp:Button ID="Button4" runat="server" CausesValidation="False" 
                    onclick="Button4_Click" style="font-weight: 700" Text="BACK" />
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center; background-color: #FFFFCC">
                <asp:Button ID="Button5" runat="server" CausesValidation="False" 
                    onclick="Button5_Click" style="font-weight: 700" Text="LOGOUT" />
            </td>
        </tr>
    </table>
</asp:Content>

