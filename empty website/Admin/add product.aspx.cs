using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace empty_website.Admin
{
    public partial class add_product : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
                FileUpload1.SaveAs(Server.MapPath("../Images/") + FileUpload1.FileName);
                FileUpload2.SaveAs(Server.MapPath("../Images/") + FileUpload2.FileName);

                conn.Open();
                SqlCommand cmd = new SqlCommand("productsp", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("prodType", ddltype.SelectedItem.ToString());
                cmd.Parameters.Add("prodName", txtname.Text);
                cmd.Parameters.Add("img1", "../Images/" + FileUpload1.FileName);
                cmd.Parameters.Add("img2", "../Images/" + FileUpload2.FileName);
                cmd.Parameters.Add("prodDescr", txtdescr.Text);
                cmd.Parameters.Add("prodPrice", txtprice.Text);
                cmd.Parameters.Add("prodStock", ddlstock.SelectedItem.ToString());
                if (txtexpiry.Text != null)
                {
                    cmd.Parameters.Add("prodexpiry", txtexpiry.Text);
                }
                cmd.Parameters.Add("addedOn", DateTime.Now.ToShortDateString());
                cmd.Parameters.Add("opr", "ins");
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Product added successfully...')</script>");

            }
            catch (Exception exc) { }
        }



    }
}