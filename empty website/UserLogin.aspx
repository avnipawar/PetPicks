<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="empty_website.UserLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Pet Picks</title>
       <link rel="icon" href="img/dogicon.jpg"
          type="image/x-icon">
    <link href="bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <section class="vh-100 mt-5 pt-5">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="img/dogcat.jpg"
          class="img-fluid" alt="Sample image" style="border-radius:50px 0px">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        <form>
          <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start mb-2">
            <p class="lead fw-bold mb-0 me-3 fs-3">User Sign in</p>
          </div>        
          <!-- Email input -->
          <div class="form-outline my-4">
            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control form-control-lg" placeholder="Enter a valid email address" required TextMode="Email"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is required field." CssClass="text-danger fw-bold" ControlToValidate="txtemail" Display="Dynamic"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                  ErrorMessage="Please enter a valid email address."  
                  CssClass="text-danger fw-bold" ControlToValidate="txtemail" Display="Dynamic" 
                  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
             <asp:TextBox ID="txtpwd" runat="server" CssClass="form-control form-control-lg" placeholder="Enter a password" required TextMode="Password"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required field." CssClass="text-danger fw-bold"  ControlToValidate="txtpwd" Display="Dynamic"></asp:RequiredFieldValidator>
          </div>

          <div class="d-flex justify-content-between align-items-center">
            <a href="ResetPwdUser.aspx" class="link-primary text-decoration-none fw-bold">Forgot password?</a>
          </div>

          <div class="text-center text-lg-start mt-4 pt-2">
            <asp:Button CssClass="btn btn-warning btn-lg"
              style="padding-left: 2.5rem; padding-right: 2.5rem;" runat="server" 
                  ID="btnlogin"  Text="Login" onclick="btnlogin_Click"/>
            <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="UserRegistrstion.aspx"
                class="link-danger">Register</a></p>
          </div>

        </form>
      </div>
    </div>
  </div>
  
</section>
    </form>
    <script src="bootstrap/dist/js/bootstrap.js" type="text/javascript"></script>
    <script src="bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
