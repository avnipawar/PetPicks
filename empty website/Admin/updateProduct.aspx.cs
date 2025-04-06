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
    public partial class updateProduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        static string img1, img2;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                if (Request.QueryString["id"] == null)
                {
                    Response.Redirect("displayProducts.aspx");
                }
                else
                {
                    SqlDataAdapter da = new SqlDataAdapter("select * from productTAB where ProdId=" + Request.QueryString["id"], conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    ddltype.SelectedValue = dt.Rows[0][2].ToString();
                    txtname.Text = dt.Rows[0][2].ToString();
                    img1 = dt.Rows[0][3].ToString();
                    img2 = dt.Rows[0][4].ToString();
                    txtdescr.Text = dt.Rows[0][5].ToString();
                    txtprice.Text = dt.Rows[0][6].ToString();
                    ddlstock.SelectedValue = dt.Rows[0][7].ToString();
                    txtexpiry.Text = dt.Rows[0][8].ToString();

                }
            }
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            try
            {


                conn.Open();
                SqlCommand cmd = new SqlCommand("productsp", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("prodType", ddltype.SelectedItem.ToString());
                cmd.Parameters.Add("prodName", txtname.Text);

                if (FileUpload1.FileName == "" || FileUpload2.FileName == "")
                {

                    if (FileUpload1.FileName == "")
                    {
                        cmd.Parameters.Add("img1", img1);
                    }
                    if (FileUpload2.FileName == "")
                    {
                        cmd.Parameters.Add("img2", img2);
                    }
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("../Images/") + FileUpload1.FileName);
                    FileUpload2.SaveAs(Server.MapPath("../Images/") + FileUpload2.FileName);
                    cmd.Parameters.Add("img1", "../Images/" + FileUpload1.FileName);
                    cmd.Parameters.Add("img2", "../Images/" + FileUpload2.FileName);
                }

                cmd.Parameters.Add("prodDescr", txtdescr.Text);
                cmd.Parameters.Add("prodPrice", txtprice.Text);
                cmd.Parameters.Add("prodStock", ddlstock.SelectedItem.ToString());
                if (txtexpiry.Text != null)
                {
                    cmd.Parameters.Add("prodexpiry", txtexpiry.Text);
                }
                cmd.Parameters.Add("prodId", Request.QueryString["id"]);
                cmd.Parameters.Add("opr", "upd");
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>window.location.href='DisplayProducts.aspx';</script>");

            }
            catch (Exception exc) { }
        }
    }
}