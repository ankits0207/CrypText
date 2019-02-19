<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style5
    {
        background-color: #FFFF99;
    }
    .style6
    {
        background-color: #FFFF99;
        font-weight: bold;
        font-family: Arial, Helvetica, sans-serif;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td colspan="3" style="text-align: center; background-color: #FFFFFF">
            <asp:Image ID="Image1" runat="server" Height="125px" 
                ImageUrl="~/Img/Login Image.gif" Width="150px" />
        </td>
    </tr>
    <tr>
        <td class="style6">
            ENTER USER-ID</td>
        <td class="style6">
            <asp:TextBox ID="txtuname" runat="server" Height="25px" Width="150px"></asp:TextBox>
        </td>
        <td class="style6">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtuname" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            ENTER PASSWORD</td>
        <td class="style6">
            <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" Height="25px" 
                Width="150px"></asp:TextBox>
        </td>
        <td class="style6">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtpwd" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            <asp:Button ID="Button2" runat="server" CausesValidation="False" 
                onclick="Button2_Click" 
                style="font-weight: 700; font-family: Arial, Helvetica, sans-serif" 
                Text="Register Now!!" />
        </td>
        <td class="style6">
            <asp:Button ID="Button1" runat="server" style="font-weight: 700" 
                Text="LOGIN" onclick="Button1_Click" />
        </td>
        <td class="style6">
            PLEASE LOGOUT AFTER USE</td>
    </tr>
    <tr>
        <td class="style5">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

