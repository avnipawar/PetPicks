using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace empty_website.Admin
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from AdminTab where AdminId=" + Session["aid"] + " and pwd='" + txtold.Text + "'", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("update admintab set pwd='" + txtnew.Text + "' where AdminId=" + Session["aid"], conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Session["aid"] = null;
                    Session["admin"] = null;
                    Response.Redirect("../AdminLogin.aspx");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}