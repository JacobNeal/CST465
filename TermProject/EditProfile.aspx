<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="EditProfile" Codebehind="EditProfile.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Edit Your Profile</title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Edit Your Profile</h1>
    
    <asp:Label AssociatedControlID="uxName" Text="Name" runat="server" />
    <asp:TextBox ID="uxName" runat="server" />
    <asp:RequiredFieldValidator ControlToValidate="uxName" Text="*" ErrorMessage="Name" runat="server" />

    <br />

    <asp:Label AssociatedControlID="uxEmailAddress" Text="Email Address" runat="server" />
    <asp:TextBox ID="uxEmailAddress" runat="server" />
    <asp:RequiredFieldValidator ControlToValidate="uxEmailAddress" Text="*" ErrorMessage="Email Address" runat="server" />

    <br />

    <asp:Label AssociatedControlID="uxUserType" Text="User Type" runat="server" />
    <asp:DropDownList ID="uxUserType" runat="server">
        <asp:ListItem Value="0">--Select</asp:ListItem>
        <asp:ListItem Value="Student">Student</asp:ListItem>
        <asp:ListItem Value="Faculty">Faculty / Staff</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ControlToValidate="uxUserType" InitialValue="0" Text="*" ErrorMessage="User Type" runat="server" />

    <br />

    <asp:Label AssociatedControlID="uxHobby" Text="Hobby" runat="server" />
    <asp:TextBox ID="uxHobby" runat="server" />
    <asp:RequiredFieldValidator ControlToValidate="uxHobby" Text="*" ErrorMessage="Hobby" runat="server" />

    <br />

    <asp:Label AssociatedControlID="uxBand" Text="Band" runat="server" />
    <asp:TextBox ID="uxBand" runat="server" />
    <asp:RequiredFieldValidator ControlToValidate="uxBand" Text="*" ErrorMessage="Band" runat="server" />

    <br />

    <asp:Label AssociatedControlID="uxBiography" Text="Biography" runat="server" />
    <asp:TextBox ID="uxBiography" TextMode="MultiLine" Rows="3" runat="server" />
    <asp:RequiredFieldValidator ControlToValidate="uxBiography" Text="*" ErrorMessage="Biography" runat="server" />

    <br />

    <asp:Label AssociatedControlID="uxCourse" Text="Course Info" runat="server" />
    <asp:Table ID="uxCourse" runat="server">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>
                <asp:Label AssociatedControlID="uxCoursePrefix" Text="Course Prefix" runat="server" />
            </asp:TableHeaderCell>

            <asp:TableHeaderCell>
                <asp:Label AssociatedControlID="uxCourseNumber" Text="Course Number" runat="server" />
            </asp:TableHeaderCell>

            <asp:TableHeaderCell>
                <asp:Label AssociatedControlID="uxCourseDescription" Text="Course Description" runat="server" />
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="uxCoursePrefix" runat="server" />
                <asp:RequiredFieldValidator ControlToValidate="uxCoursePrefix" Text="*" ErrorMessage="Course Prefix" runat="server" />
            </asp:TableCell>

            <asp:TableCell>
                <asp:TextBox ID="uxCourseNumber" runat="server" />
                <asp:RequiredFieldValidator ControlToValidate="uxCourseNumber" Text="*" ErrorMessage="Course Number" runat="server" />
            </asp:TableCell>

            <asp:TableCell>
                <asp:TextBox ID="uxCourseDescription" runat="server" />
                <asp:RequiredFieldValidator ControlToValidate="uxCourseDescription" Text="*" ErrorMessage="Course Description" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <br />

    <asp:HiddenField ID="uxNickname" Value="PigmanNeal" runat="server" />

    <asp:Button ID="uxSubmit" Text="Save" OnClick="uxSubmit_Click" runat="server" />

    <br />

    <asp:ValidationSummary HeaderText="You must enter the following:" DisplayMode="BulletList" EnableClientScript="true" runat="server" />

</asp:Content>

