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
    public partial class UserLogin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from CustomerTAB where CusEmail='" + txtemail.Text + "' and CusPwd='" + txtpwd.Text + "'", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Session["uid"] = dt.Rows[0][0].ToString();
                    Session["user"] = txtemail.Text;
                    Response.Redirect("user/UserHome.aspx");
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