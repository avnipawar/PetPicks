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
    public partial class YourCart : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            FillCart();
        }
        public void FillCart()
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT ProductTAB.ProdID, ProductTAB.ProdType, ProductTAB.ProdName, ProductTAB.img1, ProductTAB.img2, ProductTAB.ProdDescr, ProductTAB.ProdPrice, ProductTAB.ProdStock, ProductTAB.ProdExpiry, ProductTAB.AddedOn, CartTAB.CartID, CartTAB.CusID, CartTAB.qty, CartTAB.qty * ProductTAB.ProdPrice as [tot] FROM CartTAB INNER JOIN ProductTAB ON CartTAB.ProdID = ProductTAB.ProdID WHERE CartTAB.CusID=" + Session["uid"], conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Bind data to DataList
                DataList1.DataSource = dt;
                DataList1.DataBind();

                // Calculate total
                decimal total = 0;
                foreach (DataRow row in dt.Rows)
                {
                    total += Convert.ToDecimal(row["tot"]);
                }
                if (total == 0)
                    lblTotal.Text = "You cart is empty";
                else
                    lblTotal.Text = "Grand Total: Rs. " + total.ToString("N2");


                btnCheckout.Visible = dt.Rows.Count > 0;
            }
            catch (Exception exc)
            {

                lblTotal.Text = "Error calculating total: " + exc.Message;
            }
        }

        static int cartId, qty, prodId;
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                string[] data = e.CommandArgument.ToString().Split(',');
                cartId = int.Parse(data[0]);
                prodId = int.Parse(data[1]);
                qty = int.Parse(data[2]);
            }
            else
                cartId = int.Parse(e.CommandArgument.ToString());
        }

        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("cartsp", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CartID", cartId);
                cmd.Parameters.Add("opr", "del");
                cmd.ExecuteNonQuery();
                conn.Close();
                FillCart();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SellingSP", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("ProdID", prodId);
                cmd.Parameters.Add("Qty", qty);
                cmd.Parameters.Add("CusID", Session["uid"]);
                cmd.Parameters.Add("soldOn", DateTime.Now.ToString("dd/MM/yyyy h:mm tt"));
                cmd.Parameters.Add("opr", "ins");
                cmd.ExecuteNonQuery();
                conn.Close();

                conn.Open();
                cmd = new SqlCommand("cartsp", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CartID", cartId);
                cmd.Parameters.Add("opr", "del");
                cmd.ExecuteNonQuery();
                conn.Close();
                FillCart();
            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            try
            {
                // Fetch the products from the cart
                SqlDataAdapter da = new SqlDataAdapter("SELECT ProductTAB.ProdID,ProductTAB.ProdName, ProductTAB.ProdPrice, CartTAB.qty, (CartTAB.qty * ProductTAB.ProdPrice) as TotalPrice FROM CartTAB INNER JOIN ProductTAB ON CartTAB.ProdID = ProductTAB.ProdID WHERE CartTAB.CusID=" + Session["uid"], conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Store product details in session
                Session["purchasedProducts"] = dt;

                // Save the order details (insert into SellingTAB)
                foreach (DataRow row in dt.Rows)
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SellingSP", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("CusID", Session["uid"]);
                    cmd.Parameters.AddWithValue("ProdID", row["ProdID"]);
                    cmd.Parameters.AddWithValue("Qty", row["qty"]);
                    cmd.Parameters.AddWithValue("SoldOn", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                    cmd.Parameters.AddWithValue("opr", "ins");
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                // Clear the cart
                conn.Open();
                SqlCommand clearCartCmd = new SqlCommand("DELETE FROM CartTAB WHERE CusID=" + Session["uid"], conn);
                clearCartCmd.ExecuteNonQuery();
                conn.Close();

                // Redirect to the invoice page
                Response.Redirect("Invoice.aspx");
            }
            catch (Exception ex)
            {
                // Handle exceptions
            }
        }


    }
}