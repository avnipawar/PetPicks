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
    public partial class Orders : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT ProductTAB.ProdID, ProductTAB.ProdType, ProductTAB.ProdName, ProductTAB.img1, ProductTAB.img2, ProductTAB.ProdDescr, ProductTAB.ProdPrice, ProductTAB.ProdStock, ProductTAB.ProdExpiry, ProductTAB.AddedOn,SellingTAB.*,ProductTAB.ProdPrice*SellingTAB.SellingQty as [tot] FROM  ProductTAB INNER JOIN  SellingTAB ON ProductTAB.ProdID = SellingTAB.ProdID where SellingTAB.CusID=" + Session["uid"], conn);
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