using System;
using System.Data;

namespace empty_website.User
{
    public partial class Invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve purchased products from session
                DataTable purchasedProducts = Session["purchasedProducts"] as DataTable;
                if (purchasedProducts != null && purchasedProducts.Rows.Count > 0)
                {
                    lbldt.Text = DateTime.Now.ToShortDateString();
                    lblunm.Text = Session["user"].ToString();
                    Repeater1.DataSource = purchasedProducts;
                    Repeater1.DataBind();

                    // Calculate the grand total
                    decimal grandTotal = 0;
                    foreach (DataRow row in purchasedProducts.Rows)
                    {
                        grandTotal += Convert.ToDecimal(row["TotalPrice"]);
                    }

                    lblGrandTotal.Text = "Grand Total: Rs. " + grandTotal.ToString("N2");
                }
                else
                {
                    lblGrandTotal.Text = "No products were purchased.";
                }
            }
        }

        protected void btnPrintInvoice_Click(object sender, EventArgs e)
        {
            // Retrieve purchased products from session
            DataTable purchasedProducts = Session["purchasedProducts"] as DataTable;

            if (purchasedProducts != null && purchasedProducts.Rows.Count > 0)
            {
                // Generate the HTML
                string htmlContent = "<html><body>";
                htmlContent += "<h1>Order Invoice</h1>";
                htmlContent += "<p>Date: " + DateTime.Now.ToString("dd/MM/yyyy") + "</p>";
                htmlContent += "<table border='1' style='width:100%; text-align:left;'>";
                htmlContent += "<tr><th>Product Name</th><th>Price</th><th>Quantity</th><th>Total</th></tr>";

                decimal grandTotal = 0;
                foreach (DataRow row in purchasedProducts.Rows)
                {
                    htmlContent += $"<tr><td>{row["ProdName"]}</td><td>Rs. {row["ProdPrice"]}</td><td>{row["qty"]}</td><td>Rs. {row["TotalPrice"]}</td></tr>";
                    grandTotal += Convert.ToDecimal(row["TotalPrice"]);
                }

                htmlContent += "</table>";
                htmlContent += "<h3>Grand Total: Rs. " + grandTotal.ToString("N2") + "</h3>";
                htmlContent += "</body></html>";

                // Send the HTML as a downloadable file
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("content-disposition", "attachment;filename=Invoice.html");
                Response.Write(htmlContent);
                Response.End();
            }
        }

        protected void btnPrintInvoice_Click1(object sender, EventArgs e)
        {

        }
    }
}
