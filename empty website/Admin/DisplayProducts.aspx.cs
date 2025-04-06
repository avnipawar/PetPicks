using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace empty_website.Admin
{
    public partial class DisplayProducts : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            bindData();
        }
        public void bindData()
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from productTAB", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
            catch (Exception exc)
            {

            }
        }
        static int id;
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            id = int.Parse(e.CommandArgument.ToString());
        }

        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("productSP",conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("prodId",id);
            cmd.Parameters.Add("opr","del");
            cmd.ExecuteNonQuery();
            conn.Close();
            bindData();
        }
    }
}