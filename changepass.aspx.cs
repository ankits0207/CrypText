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

public partial class changepass : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Server=.\sqlexpress;attachdbfilename=|datadirectory|\CrypTextDB.mdf;Integrated Security=true;User Instance=true");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Server.Transfer("Welcome.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        try
        {
            SqlConnection scon = new SqlConnection(@"server=.\sqlexpress;attachdbfilename=|datadirectory|\CrypTextDB.mdf;integrated security=true;user instance=true");
            scon.Open();
            SqlCommand cmd = new SqlCommand("Select uid from login where uid='" + TextBox1.Text + "' and pwd='" + TextBox2.Text + "'", scon);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                SqlCommand cmdnew = new SqlCommand("Update login SET pwd='" + TextBox3.Text + "' where uid='" + TextBox1.Text + "' and pwd='" + TextBox2.Text + "'", con);
                con.Open();
                cmdnew.ExecuteNonQuery();
                Response.Write("<script>alert('NEW PASSWORD SET!!!');</script>");

            }
            else
            {
                Response.Write("<script>alert('INCORRECT DETAILS!!!');</script>");

            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('UNSUCCESSFUL!!! CONTACT THE ADMIN');</script>");

        }
        
      
    }
}
