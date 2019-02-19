<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style3
    {
        font-family: Arial, Helvetica, sans-serif;
        font-weight: bold;
        background-color: #FFFF99;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td colspan="4" 
            style="font-weight: 700; text-align: center; font-family: Arial, Helvetica, sans-serif; font-size: x-large; background-color: #FFFFCC">
            REGISTRATION FORM</td>
    </tr>
    <tr>
        <td class="style3">
            ENTER YOUR NAME</td>
        <td class="style3">
            <asp:TextBox ID="txtname" runat="server" Height="25px" Width="150px"></asp:TextBox>
        </td>
        <td class="style3" colspan="2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtname" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            ENTER YOUR USER ID</td>
        <td class="style3">
            <asp:TextBox ID="txtuid" runat="server" Height="25px" Width="150px"></asp:TextBox>
        </td>
        <td class="style3" colspan="2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtuid" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            ENTER PASSWORD</td>
        <td class="style3">
            <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" Height="25px" 
                Width="150px"></asp:TextBox>
        </td>
        <td class="style3" colspan="2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtpwd" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            CONFIRM PASSWORD</td>
        <td class="style3">
            <asp:TextBox ID="txtcpwd" runat="server" TextMode="Password" Height="25px" 
                Width="150px"></asp:TextBox>
        </td>
        <td class="style3">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtcpwd" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
        <td class="style3">
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtpwd" ControlToValidate="txtcpwd" Display="Dynamic" 
                ErrorMessage="Passwords do not match"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            ENTER YOUR EMAIL ID</td>
        <td class="style3">
            <asp:TextBox ID="txteid" runat="server" Height="25px" Width="150px"></asp:TextBox>
        </td>
        <td class="style3">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txteid" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
        <td class="style3">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txteid" Display="Dynamic" ErrorMessage="Invalid Email ID" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Button ID="Button2" runat="server" CausesValidation="False" 
                onclick="Button2_Click" style="font-weight: 700" Text="Login" />
        </td>
        <td class="style3">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                style="font-weight: 700" Text="Register" />
        </td>
        <td class="style3" colspan="2">
            <asp:Label ID="Label1" runat="server" Text="Message from Admin"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

