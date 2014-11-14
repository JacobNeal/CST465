﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void uxSubmit_Click(object sender, EventArgs e)
    {
        ProfileData data = new ProfileData();

        data.Name = uxName.Text;
        data.EmailAddress = uxEmailAddress.Text;
        data.UserType = uxUserType.Text;
        data.Hobby = uxHobby.Text;
        data.Band = uxBand.Text;
        data.Biography = uxBiography.Text;
        data.CoursePrefix = uxCoursePrefix.Text;
        data.CourseNumber = uxCourseNumber.Text;
        data.CourseDescription = uxCourseDescription.Text;

        Session["profile_data"] = data;
        Response.Redirect("ViewProfile.aspx");
    }
}