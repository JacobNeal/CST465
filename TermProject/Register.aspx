<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TermProject.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:CreateUserWizard MembershipProvider="SqlMembership" ContinueDestinationPageUrl="~/Login.aspx" runat="server" />
    </div>
    </form>
</body>
</html>
