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

public partial class Register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Server=.\sqlexpress;attachdbfilename=|datadirectory|\CrypTextDB.mdf;Integrated Security=true;User Instance=true");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("insert into login values('" + txtname.Text + "','" + txtuid.Text + "','" + txtcpwd.Text + "','" + txteid.Text + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            Label1.Visible = true;
            Label1.Text = "Successfully Registered";
            txtname.Text = "";
            txtuid.Text = "";
            txtpwd.Text = "";
            txtcpwd.Text = "";
            txteid.Text = "";
        }
        catch (SqlException e1)
        {
            Response.Write("<script>alert('UserID already exists!!!');</script>");

        }
        catch (Exception e2)
        {
            Response.Write("<script>alert('INVALID LOGIN ATTEMPT!!!');</script>");

        }


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Server.Transfer("Login.aspx");
    }
}
