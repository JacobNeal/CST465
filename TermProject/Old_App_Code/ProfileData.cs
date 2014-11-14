using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class ProfileData
{
    private string m_name;
    private string m_email_address;
    private string m_user_type;
    private string m_hobby;
    private string m_band;
    private string m_biography;
    private string m_course_prefix;
    private string m_course_number;
    private string m_course_description;

	public ProfileData()
	{
		
	}

    public string Name
    {
        get { return m_name; }
        set { m_name = value; }
    }

    public string EmailAddress
    {
        get { return m_email_address; }
        set { m_email_address = value; }
    }

    public string UserType
    {
        get { return m_user_type; }
        set { m_user_type = value; }
    }

    public string Hobby
    {
        get { return m_hobby; }
        set { m_hobby = value; }
    }

    public string Band
    {
        get { return m_band; }
        set { m_band = value; }
    }

    public string Biography
    {
        get { return m_biography; }
        set { m_biography = value; }
    }

    public string CoursePrefix
    {
        get { return m_course_prefix; }
        set { m_course_prefix = value; }
    }

    public string CourseNumber
    {
        get { return m_course_number; }
        set { m_course_number = value; }
    }

    public string CourseDescription
    {
        get { return m_course_description; }
        set { m_course_description = value; }
    }
}