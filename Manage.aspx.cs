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
using System.IO;
using System.Text;
using System.Security.Cryptography;

public partial class Manage : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlDataAdapter sda;
    SqlCommandBuilder scb;
    DataSet ds;
    DataRow dr;
    private string Encrypt(string clearText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }
    private string Decrypt(string cipherText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        cipherText = cipherText.Replace(" ", "+");
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
    }
    
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] != null)
        {
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
        con = new SqlConnection(@"Server=.\sqlexpress;attachdbfilename=|datadirectory|\CrypTextDB.mdf;Integrated Security=true;User Instance=true");
        cmd = new SqlCommand("select * from message", con);
        sda = new SqlDataAdapter(cmd);
        scb = new SqlCommandBuilder(sda);
        ds = new DataSet();
        sda.Fill(ds);
        DataView dv = new DataView();
        dv.Table = ds.Tables[0];
        dv.RowFilter = "to in('" + Session["name"].ToString() + "')";
        GridView1.DataSource = dv;
        GridView1.DataBind();




       
        string com = "Select person2 from relation where person1 = '" + Session["name"].ToString() + "' and status = '" + 1 + "'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        DropDownList1.DataSource = dt;
        DropDownList1.DataBind();
        DropDownList1.DataTextField = "person2";
        //DropDownList1.DataValueField = "name";
        DropDownList1.DataBind();
        string com2 = "Select person1 from relation where person2 = '" + Session["name"].ToString() + "' and status = '" + 1 + "'";
        SqlDataAdapter adpt2 = new SqlDataAdapter(com2, con);
        DataTable dt2 = new DataTable();
        adpt2.Fill(dt2);
        DropDownList2.DataSource = dt2;
        DropDownList2.DataBind();
        DropDownList2.DataTextField = "person1";
        //DropDownList1.DataValueField = "name";
        DropDownList2.DataBind();

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string encryptext = TextBox1.Text;
            string passval = Encrypt(encryptext);
            SqlCommand cmd = new SqlCommand("insert into message values('" + Session["name"].ToString() + "','" + DropDownList1.Text + "','" + passval + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('MESSAGE SENT!!!');</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('UNSUCCESSFUL!!!');</script>");

        }

    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            string encryptext = TextBox2.Text;
            string passval = Encrypt(encryptext);
            SqlCommand cmd = new SqlCommand("insert into message values('" + Session["name"].ToString() + "','" + DropDownList2.Text + "','" + passval + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('MESSAGE SENT!!!');</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('UNSUCCESSFUL!!!');</script>");

        }



       
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            string decryptext = TextBox3.Text;
            string resultreturn = Decrypt(decryptext);
            Label1.Text = resultreturn;
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('UNSUCCESSFUL!!!');</script>");
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Server.Transfer("Welcome.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Server.Transfer("Login.aspx");
    }
}
