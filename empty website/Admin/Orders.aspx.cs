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
    public partial class Orders : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT ProductTAB.ProdID, ProductTAB.ProdType, ProductTAB.ProdName, ProductTAB.img1, ProductTAB.img2, ProductTAB.ProdDescr, ProductTAB.ProdPrice, ProductTAB.ProdStock, ProductTAB.ProdExpiry, ProductTAB.AddedOn, SellingTAB.SellingID, SellingTAB.CusID, SellingTAB.SoldOn, SellingTAB.SellingQty, ProductTAB.ProdPrice * SellingTAB.SellingQty AS tot, CustomerTAB.CusName FROM     ProductTAB INNER JOIN                   SellingTAB ON ProductTAB.ProdID = SellingTAB.ProdID INNER JOIN CustomerTAB ON SellingTAB.CusID = CustomerTAB.CusID", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
            catch (Exception exc)
            {
            }
        }
    }
}