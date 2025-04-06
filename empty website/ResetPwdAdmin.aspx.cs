using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace empty_website
{
    public partial class ResetPwdAdmin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        static string otp;
        public void Email(string htmlString)
        {
            try
            {
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                message.From = new MailAddress("jyotiodedra77@gmail.com");
                message.To.Add(new MailAddress(txtemail.Text));
                message.Subject = "OTP";
                message.IsBodyHtml = true; //to make message body as html
                message.Body = htmlString;
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com"; //for gmail host
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("jyotiodedra77@gmail.com", "vkby qxko tfdh hiez");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);
                Response.Write("<script>alert('OTP Sent')</script>");
                hometab.Visible = false;
                home.Visible = false;
                profile.Visible = true;
                profiletab.Visible = true;
            }
            catch (Exception exc)
            {
            }
        }
        static string email;
        protected void btngetotp_Click(object sender, EventArgs e)
        {
            email = txtemail.Text;
            SqlDataAdapter da = new SqlDataAdapter("select * from AdminTAB where Email='"+txtemail.Text+"'",conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Random r = new Random();
                otp = r.Next(1000, 9999).ToString();
                Email(@"<html>
                    <body>
                        <h1 align='center'> Reset Your Email through following OTP</h1>  
                        <center><h3>your OTP is: <b>" +
                       otp +
                      "</b></h3></center> </body></html> ");
            }
            else
            {
                Response.Write("<script>alert('This emai is not registered')</script>");
            }
        }

        protected void btnverify_Click(object sender, EventArgs e)
        {
            if (txtotp.Text == otp)
            {
                contacttab.Visible = true;
                profiletab.Visible = false;
            }
            else
                Response.Write("<script>alert('Invalid OTP')</script>");
        }

        protected void btnupd_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("update AdminTAB set Pwd='" + txtcnf.Text + "' where Email='" + email + "'", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Password has been changed');"+
                    "function test1(){     sleep(3000);   window.location.href='AdminLogin.aspx';}test1();</script>");
                Response.Redirect("UserLogin.aspx");
                
            }
            catch (Exception exc)
            {

                throw;
            }
        }
    }
}