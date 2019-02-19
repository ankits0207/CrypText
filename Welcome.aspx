<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Welcome" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style3
    {
        background-color: #CCFFFF;
    }
        .style4
        {
            background-color: #CCFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
        }
        .style5
        {
            text-align: center;
            font-weight: 700;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #FFCCCC;
        }
        .style6
        {
            background-color: #FFCCCC;
        }
        .style7
        {
            font-weight: bold;
            background-color: #FFCCCC;
        }
        .style8
        {
            background-color: #CCFFFF;
            font-weight: bold;
        }
        .style10
        {
            text-align: center;
            height: 30px;
            background-color: #003366;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td colspan="3" 
            style="font-size: x-large; text-align: center; font-weight: 700; font-family: Arial, Helvetica, sans-serif; color: #CC0000">
            WELCOME
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style8" colspan="3" 
            style="text-align: center; font-family: Arial, Helvetica, sans-serif">
            SEND REQUEST TO A CRYPTEXT BUDDY</td>
    </tr>
    <tr>
        <td class="style4">
            ENTER YOU FRIEND&#39;S NAME</td>
        <td class="style3">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td class="style4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*" 
                ValidationGroup="G1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style8">
            &nbsp;</td>
        <td class="style3">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                style="font-weight: 700" Text="SEARCH" ValidationGroup="G1" />
        </td>
        <td class="style8">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style4">
            SELECT YOUR BUDDY FROM THE LIST</td>
        <td class="style3">
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
        </td>
        <td class="style8">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="*" 
                ValidationGroup="G2"></asp:RequiredFieldValidator>
                                    </td>
    </tr>
    <tr>
        <td class="style8">
            <asp:DropDownList ID="DropDownList2" runat="server" Visible="False">
                <asp:ListItem>0</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="style3">
            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                style="font-weight: 700" Text="SEND" ValidationGroup="G2" />
        </td>
        <td class="style8">
            <asp:DropDownList ID="ddlhidden" runat="server" Visible="False">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style5" colspan="3">
            PENDING REQUESTS</td>
    </tr>
    <tr>
        <td class="style7">
            SELECT PENDING REQUESTS FOR APPROVAL</td>
        <td class="style6">
            <asp:DropDownList ID="DropDownList3" runat="server">
            </asp:DropDownList>
        </td>
        <td class="style7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="DropDownList3" Display="Dynamic" ErrorMessage="*" 
                ValidationGroup="G3"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style6">
            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                style="font-weight: 700" Text="APPROVE" ValidationGroup="G3" />
        </td>
        <td class="style7">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10" colspan="3">
            <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                style="text-align: center; font-weight: 700; background-color: #FFFFFF" 
                Text="VISIT CONTROL PAGE" />
        </td>
    </tr>
    <tr>
        <td class="style10" colspan="3">
            <asp:Button ID="Button6" runat="server" CausesValidation="False" 
                onclick="Button6_Click" style="font-weight: 700; background-color: #FFFFFF" 
                Text="CHANGE PASSWORD" />
        </td>
    </tr>
    <tr>
        <td class="style10" colspan="3">
            <asp:Button ID="Button5" runat="server" CausesValidation="False" 
                onclick="Button5_Click" style="font-weight: 700; background-color: #FFFFFF" 
                Text="LOGOUT" />
        </td>
    </tr>
    </table>
</asp:Content>

