<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Announcements.aspx.cs" Inherits="TermProject.Announcements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Announcements</title>

    <script type="text/javascript" src="JS/jquery-2.1.1.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Announcements</h1>

    <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:SqlSecurityDB%>" SelectCommand="SELECT * FROM JacobNeal.Announcements JOIN dbo.aspnet_Users ON JacobNeal.Announcements.UserID = dbo.aspnet_Users.UserID;" runat="server" />

    <asp:Label ID="uxRevealNewAnnouncement" Text="(+) Add New Announcement" runat="server" />
    <br />
    <br />

    <asp:UpdatePanel ID="uxUpdatePanel" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div id="AddNewAnnouncement">
                <asp:LoginView ID="uxLoginView" runat="server">
                    <AnonymousTemplate>
                        <asp:Login MembershipProvider="SqlMembership" CreateUserText="Register" CreateUserUrl="Announcements.aspx" runat="server" />
                    </AnonymousTemplate>

                    <LoggedInTemplate>
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
            </div>

            <asp:Repeater ID="uxRepeater" DataSourceID="SqlDataSource1" runat="server">
                <ItemTemplate>
                    <asp:HyperLink ID="uxTitle" Text='<%# Eval("Title") %>' CssClass="Announcements" NavigateUrl='<%# "~/Announcement.aspx?AnnID=" + Eval("Ann_ID") %>' runat="server" />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:Repeater>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#AddNewAnnouncement').hide();

            $('#<%= uxRevealNewAnnouncement.ClientID %>').click(function () {
                $('#<%= uxRevealNewAnnouncement.ClientID %>').hide();
                $('#AddNewAnnouncement').show('slow');
            });
        });
    </script>
</asp:Content>
