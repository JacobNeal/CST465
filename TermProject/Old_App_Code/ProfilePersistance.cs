using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Security;

public class ProfilePersistance
{
    ProfileData m_profile;

    public void SaveProfile(ProfileData profile)
    {
        m_profile = profile;

        string queryString = "UserProfile_InsertUpdate";
        using (SqlConnection connection = new SqlConnection("Server=aura.students.cset.oit.edu;database=JacobNeal;user id=JacobNeal; password=jacob;"))
        {
            SqlCommand command = new SqlCommand(queryString, connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@UserID", Membership.GetUser().ProviderUserKey.ToString());
            command.Parameters.AddWithValue("@Name", profile.Name);
            command.Parameters.AddWithValue("@Email", profile.EmailAddress);
            command.Parameters.AddWithValue("@UserType", profile.UserType);
            command.Parameters.AddWithValue("@Hobbies", profile.Hobby);
            command.Parameters.AddWithValue("@FavoriteBands", profile.Band);
            command.Parameters.AddWithValue("@Biography", profile.Biography);
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

            queryString = "INSERT INTO dbo.Courses (UserID, Prefix, Number, Description) VALUES ('" + Membership.GetUser().ProviderUserKey.ToString() + "', '" + profile.CoursePrefix + "', '" + profile.CourseNumber + "', '" + profile.CourseDescription + "');";
            command.CommandText = queryString;
            command.CommandType = System.Data.CommandType.Text;
            reader = command.ExecuteReader();

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
    }

    public ProfileData LoadProfile()
    {
        ProfileData profile = new ProfileData();

        string queryString = "SELECT Name, Email, UserType, Hobbies, FavoriteBands, Biography FROM dbo.UserProfile WHERE UserID='" + Membership.GetUser().ProviderUserKey.ToString() + "';";
        
        using (SqlConnection connection = new SqlConnection("Server=aura.students.cset.oit.edu;database=JacobNeal;user id=JacobNeal; password=jacob;"))
        {
            SqlCommand command = new SqlCommand(queryString, connection);
            command.CommandType = System.Data.CommandType.Text;
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    profile.Name = (string)reader[0];
                    profile.EmailAddress = (string)reader[1];
                    profile.UserType = (string)reader[2];
                    profile.Hobby = (string)reader[3];
                    profile.Band = (string)reader[4];
                    profile.Biography = (string)reader[5];
                }
            }
            finally
            {
                reader.Close();
            }

            queryString = "SELECT Prefix, Number, Description FROM dbo.Courses WHERE UserID='" + Membership.GetUser().ProviderUserKey.ToString() + "';";
            command.CommandText = queryString;
            reader = command.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    profile.CoursePrefix = (string)reader[0];
                    profile.CourseNumber = (string)reader[1];
                    profile.CourseDescription = (string)reader[2];
                }
            }
            finally
            {
                reader.Close();
            }
        }

        return profile;
    }
}