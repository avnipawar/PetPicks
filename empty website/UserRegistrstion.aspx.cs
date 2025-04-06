using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace empty_website
{
    public partial class UserRegistrstion : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnreg_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Customersp", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("CusName", txtunm.Text);
            cmd.Parameters.Add("CusEmail", txtemail.Text);
            cmd.Parameters.Add("CusPwd", txtpwd.Text);
            cmd.Parameters.Add("CusContact", txtcont.Text);
            cmd.Parameters.Add("CusAddr",txtaddr.Text);
            cmd.Parameters.Add("opr", "ins");
            cmd.ExecuteNonQuery();
            Response.Redirect("UserLogin.aspx");
        }
    }
}