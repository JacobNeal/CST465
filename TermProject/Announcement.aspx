<%@ Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Announcement.aspx.cs" Inherits="TermProject.Announcment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Announcement</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Announcement</h1>

    <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:SqlSecurityDB %>" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:SqlSecurityDB %>" runat="server" />

    <asp:FormView ID="FormView1" runat="server">
        <ItemTemplate>
            <asp:Label Text='<%# Eval("Title") %>' runat="server" />
            <br />

            <asp:Label Font-Bold="true" Text='<%# Eval("UserName") %>' runat="server" />
            <br /><br />

            <asp:Label Text='<%# Eval("Body") %>' runat="server" />
            <br />
        </ItemTemplate>
    </asp:FormView>
    <br /><br />

    <asp:Label AssociatedControlID="uxComment" Text="Comment: " runat="server" />
    <asp:TextBox ID="uxComment" runat="server" />
    <asp:Button ID="uxAddComment" OnClick="uxAddComment_Click" Text="Add Comment" runat="server" />
    <br /><br />

    <h3>Comments</h3>
    <asp:GridView ID="uxComments" runat="server" />
</asp:Content>
