using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace empty_website.User
{
    public partial class ViewFullProduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from productTAB where prodId=" + Request.QueryString["id"], conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                img1.Src = dt.Rows[0]["img1"].ToString();
                img2.Src = dt.Rows[0]["img2"].ToString();
                lblname.Text = dt.Rows[0]["prodname"].ToString();
                lblprice.Text = dt.Rows[0]["prodprice"].ToString();
                lbldescr.Text = dt.Rows[0]["prodDescr"].ToString();
                lbltype.Text = dt.Rows[0]["prodType"].ToString();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void lnk_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("cartsp", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("prodID", Request.QueryString["id"]);
            cmd.Parameters.Add("qty", txtqty.Text);
            cmd.Parameters.Add("CusID", Session["uid"]);
            cmd.Parameters.Add("opr", "ins");
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("YourCart.aspx");
        }
    }
}