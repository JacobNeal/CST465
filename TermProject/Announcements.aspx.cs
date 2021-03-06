﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;

namespace TermProject
{
    public partial class Announcements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uxSubmit_Click(object sender, EventArgs e)
        {
            string title = ((TextBox)uxLoginView.FindControl("uxTitle")).Text;
            string body = ((TextBox)uxLoginView.FindControl("uxBody")).Text;

            string queryString = "INSERT INTO JacobNeal.Announcements (UserID, Title, Body) VALUES (@UserID, @Title, @Body);";
            
            using (SqlConnection connection = new SqlConnection("Server=aura.students.cset.oit.edu;database=JacobNeal;user id=JacobNeal; password=jacob;"))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.CommandType = System.Data.CommandType.Text;
                command.Parameters.AddWithValue("@UserID", Membership.GetUser().ProviderUserKey.ToString());
                command.Parameters.AddWithValue("@Title", title);
                command.Parameters.AddWithValue("@Body", body);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {

                    }
                }
                finally
                {
                    reader.Close();
                }
            }

            uxRepeater.DataBind();
        }

        protected void uxLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Announcements.aspx");
        }
    }
}