<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Announcements.aspx.cs" Inherits="TermProject.Announcements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Announcements</title>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Announcements</h1>

    <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:SqlSecurityDB%>" SelectCommand="SELECT * FROM JacobNeal.Announcements JOIN dbo.aspnet_Users ON JacobNeal.Announcements.UserID = dbo.aspnet_Users.UserID;" runat="server" />

    <asp:LoginView ID="uxLoginView" runat="server">
        <AnonymousTemplate>
            <asp:Login MembershipProvider="SqlMembership" CreateUserText="Register" CreateUserUrl="Announcements.aspx" runat="server" />
        </AnonymousTemplate>

        <LoggedInTemplate>
            <asp:Label ID="uxAddNewAnnouncement" Text="Add New Announcement" runat="server" />

            <asp:Button ID="uxLogout" Text="Logout" OnClick="uxLogout_Click" runat="server" />
            <br />
            <br />

            <asp:Label ID="lblTitle" AssociatedControlID="uxTitle" Text="Announcement: " runat="server" />
            <br />
            <asp:TextBox ID="uxTitle" runat="server" />
            <br />
            <br />

            <asp:Label ID="lblBody" AssociatedControlID="uxBody" Text="Body: " runat="server" />
            <br />
            <asp:TextBox ID="uxBody" runat="server" />
            <br />
            <br />

            <asp:Button ID="uxSubmit" Text="Submit" OnClick="uxSubmit_Click" runat="server" />
            <br />
            <br />
        </LoggedInTemplate>
    </asp:LoginView>

    <asp:Repeater ID="uxRepeater" DataSourceID="SqlDataSource1" runat="server">
        <ItemTemplate>
            <asp:HyperLink ID="uxTitle" Text='<%# Eval("Title") %>' NavigateUrl='<%# "~/Announcement.aspx?AnnID=" + Eval("Ann_ID") %>' runat="server" />
            <br />
            <br />
        </ItemTemplate>
    </asp:Repeater>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= uxLoginView.FindControl("uxTitle").ClientID %>').hide();
            $('#<%= uxLoginView.FindControl("uxBody").ClientID %>').hide();
            $('#<%= uxLoginView.FindControl("uxSubmit").ClientID %>').hide();
            $('#<%= uxLoginView.FindControl("lblTitle").ClientID %>').hide();
            $('#<%= uxLoginView.FindControl("lblBody").ClientID %>').hide();
        });

        $('#<%= uxLoginView.FindControl("uxAddNewAnnouncement").ClientID %>').click(function () {
            $('#<%= uxLoginView.FindControl("uxAddNewAnnouncement").ClientID %>').hide('slow');
            $('#<%= uxLoginView.FindControl("uxTitle").ClientID %>').show('slow');
            $('#<%= uxLoginView.FindControl("uxBody").ClientID %>').show('slow');
            $('#<%= uxLoginView.FindControl("uxSubmit").ClientID %>').show('slow');
            $('#<%= uxLoginView.FindControl("lblTitle").ClientID %>').show('slow');
            $('#<%= uxLoginView.FindControl("lblBody").ClientID %>').show('slow');

            $('#<%= uxLoginView.FindControl("uxSubmit").ClientID %>').click(function () {
                $('#<%= uxLoginView.FindControl("uxAddNewAnnouncement").ClientID %>').show('slow');
                $('#<%= uxLoginView.FindControl("uxTitle").ClientID %>').hide('slow');
                $('#<%= uxLoginView.FindControl("uxBody").ClientID %>').hide('slow');
                $('#<%= uxLoginView.FindControl("uxSubmit").ClientID %>').hide('slow');
                $('#<%= uxLoginView.FindControl("lblTitle").ClientID %>').hide('slow');
                $('#<%= uxLoginView.FindControl("lblBody").ClientID %>').hide('slow');
            });
        });
    </script>
</asp:Content>
