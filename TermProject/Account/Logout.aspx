<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="TermProject.Account.Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Logout</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Logout</h1>
    <asp:Literal Text="Logging you out..." ID="uxLogOut" runat="server" />
</asp:Content>
