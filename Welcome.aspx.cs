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

public partial class Welcome : System.Web.UI.Page
   
{
    SqlConnection con;

    
   
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(@"Server=.\sqlexpress;attachdbfilename=|datadirectory|\CrypTextDB.mdf;Integrated Security=true;User Instance=true");

        if (Session["name"] != null)
        {
            Label1.Text = Session["name"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
        //cmd = new SqlCommand("select uid from login", con);
        //sda = new SqlDataAdapter(cmd);
        //scb = new SqlCommandBuilder(sda);
        //ds = new DataSet();
        //sda.Fill(ds);

        string com = "Select person1 from relation where person2 = '" + Session["name"].ToString() + "' and status = '" + 0 +"'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        DropDownList3.DataSource = dt;
        DropDownList3.DataBind();
        DropDownList3.DataTextField = "person1";
        //DropDownList1.DataValueField = "name";
        DropDownList3.DataBind();
       
        
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        //string var = "login";
        //DataView dv = new DataView();
        //dv.Table = ds.Tables[var];
        //dv.RowFilter = "name in('" + TextBox1.Text + "')";
        //DropDownList1.DataSource = dv;
        //DropDownList1.DataBind();

        string com = "Select uid from login where name = '" + TextBox1.Text + "'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        DropDownList1.DataSource = dt;
        DropDownList1.DataBind();
        DropDownList1.DataTextField = "uid";
        //DropDownList1.DataValueField = "name";
        DropDownList1.DataBind();
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
        string com = "select person1 from relation where person1 = '" + DropDownList1.Text + "' and person2 = '" + Session["name"].ToString() + "' and status = '" + 1 + "'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        ddlhidden.DataSource = dt;
        ddlhidden.DataBind();
        ddlhidden.DataTextField = "person1";
        //DropDownList1.DataValueField = "name";
        ddlhidden.DataBind();

            if(ddlhidden.SelectedItem!=null)
            {
             Response.Write("<script>alert('ALREADY FRIENDS!!!');</script>");
            }
            else
            {
             SqlCommand cmd = new SqlCommand("insert into relation values('" + Session["name"].ToString() + "','" + DropDownList1.Text + "','" + DropDownList2.Text + "')", con);
             con.Open();
             cmd.ExecuteNonQuery();
             Response.Write("<script>alert('REQUEST SENT!!!');</script>");
            }
        }
        catch (SqlException ex1)
        {
            Response.Write("<script>alert('ALREADY FRIENDS or REQUEST ALREADY SENT!!!');</script>");

        }
        catch (Exception ex2)
        {
            Response.Write("<script>alert('UNSUCCESSFUL,CONTACT THE ADMIN!!!');</script>");
        }

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("update relation set status = '" + 1 + "' where person1 = '" + DropDownList3.Text + "' and person2 = '" + Session["name"].ToString() + "' and status = '" + 0 + "'", con);
        con.Open();
        cmd.ExecuteNonQuery();
        Server.Transfer("Welcome.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Server.Transfer("Manage.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Server.Transfer("Login.aspx");
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Server.Transfer("changepass.aspx");
    }
}

