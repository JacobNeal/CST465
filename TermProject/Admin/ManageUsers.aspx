<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="TermProject.Admin.ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Users</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Manage Users</h1>

    <fieldset>
        <legend>Add Roles</legend>

        <asp:Label AssociatedControlID="uxRoleName" Text="Role Name" runat="server" />
        <asp:TextBox ID="uxRoleName" runat="server" />
        <br />

        <asp:Button ID="uxCreateRole" OnClick="uxCreateRole_Click" Text="Create Role" runat="server" />
    </fieldset>

    <fieldset>
        <legend>Role Membership</legend>

        <asp:Label AssociatedControlID="uxUsers" Text="Users" runat="server" />
        <asp:DropDownList ID="uxUsers" runat="server" />
        <br />

        <asp:Label AssociatedControlID="uxRoles" Text="Roles" runat="server" />
        <asp:DropDownList ID="uxRoles" runat="server" />
        <br />

        <asp:Button ID="uxAddToGroup" OnClick="uxAddToGroup_Click" Text="Add User to Role" runat="server" /> 
    </fieldset>
</asp:Content>
