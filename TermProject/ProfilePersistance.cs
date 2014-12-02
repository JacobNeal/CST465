using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Security;

namespace TermProject
{
    public class ProfilePersistance
    {
        public void SaveProfile(ProfileData profile)
        {
            string queryString = "UserProfile_InsertUpdate";
            using (SqlConnection connection = new SqlConnection("Server=aura.students.cset.oit.edu;database=JacobNeal;user id=JacobNeal; password=jacob;"))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@UserID", Membership.GetUser().ProviderUserKey.ToString());
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
                    // Always call Close when done reading.
                    reader.Close();
                }
            }
        }

        public void LoadProfile(ProfileData profile)
        {

        }
    }
}