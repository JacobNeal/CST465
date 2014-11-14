using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ProfileData data = (ProfileData) Session["profile_data"];

        uxName.Text = data.Name;
        uxEmailAddress.Text = data.EmailAddress;
        uxUserType.Text = data.UserType;
        uxHobby.Text = data.Hobby;
        uxBand.Text = data.Band;
        uxBiography.Text = data.Biography;
        uxCoursePrefix.Text = data.CoursePrefix;
        uxCourseNumber.Text = data.CourseNumber;
        uxCourseDescription.Text = data.CourseDescription;
    }
}