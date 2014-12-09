using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;

namespace TermProject
{
    public partial class Announcment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT JacobNeal.Announcements.Ann_ID, dbo.aspnet_Users.UserName, Title, Body FROM JacobNeal.Announcements JOIN dbo.aspnet_Users ON JacobNeal.Announcements.UserID = dbo.aspnet_Users.UserID WHERE Ann_ID=" + Request.QueryString[0].ToString();
            FormView1.DataSourceID = "SqlDataSource1";
            FormView1.DataBind();

            SqlDataSource2.SelectCommand = "SELECT dbo.aspnet_Users.UserName, Comment FROM JacobNeal.Comments JOIN dbo.aspnet_Users ON JacobNeal.Comments.UserID = dbo.aspnet_Users.UserID WHERE JacobNeal.Comments.Ann_ID=" + Request.QueryString[0].ToString();
            uxComments.DataSourceID = "SqlDataSource2";
            uxComments.DataBind();
        }

        protected void uxAddComment_Click(object sender, EventArgs e)
        {
            string queryString = "INSERT INTO JacobNeal.Comments (Ann_ID, UserID, Comment) VALUES (@Ann_ID, @UserID, @Comment);";
            using (SqlConnection connection = new SqlConnection("Server=aura.students.cset.oit.edu;database=JacobNeal;user id=JacobNeal; password=jacob;"))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.CommandType = System.Data.CommandType.Text;
                command.Parameters.AddWithValue("@Ann_ID", Request.QueryString[0].ToString());
                command.Parameters.AddWithValue("@UserID", Membership.GetUser().ProviderUserKey.ToString());
                command.Parameters.AddWithValue("@Comment", uxComment.Text);
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
                    connection.Close();
                }
            }

            Response.Redirect("Announcement.aspx?AnnID=" + Request.QueryString[0].ToString());
        }
    }
}