using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Server.Transfer("Register.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection scon = new SqlConnection(@"server=.\sqlexpress;attachdbfilename=|datadirectory|\CrypTextDB.mdf;integrated security=true;user instance=true");
            scon.Open();
            SqlCommand cmd = new SqlCommand("Select uid from login where uid='" + txtuname.Text + "' and pwd='" + txtpwd.Text + "'", scon);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                String N = reader.GetString(0);
                Session["name"] = reader.GetString(0);
                Server.Transfer("Welcome.aspx");
            }
            else
            {
                Response.Write("<script>alert('INVALID LOGIN ATTEMPT!!!');</script>");

            }
        }
        catch (Exception ex)
        {
            //Response.Write("<script>alert('UNSUCCESSFUL!!! CONTACT THE ADMIN');</script>");

        }

    }
}
