using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
namespace empty_website
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from AdminTAB where Email='" + txtemail.Text + "' and Pwd='" + txtpwd.Text + "'", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Session["aid"] = dt.Rows[0][0].ToString();
                    Session["admin"] = txtemail.Text;
                    Response.Redirect("Admin/WebForm1.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Incorrect user')</script>");
                }
            }
            catch (Exception exc)
            {

            }
        }
    }
}