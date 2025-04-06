<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPwdUser.aspx.cs" Inherits="empty_website.ResetPwdUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Pet Picks</title>
       <link rel="icon" href="img/dogicon.jpg"
          type="image/x-icon">
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
  <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100 mt-5 pt-5">
            <div class="col-md-9 col-lg-6 col-xl-5">
                <img src="img/dog.jpg" class="img-fluid" alt="Sample image" style="border-radius: 50px 0px">
            </div>
            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                <form>
                <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start mb-2">
                    <p class="lead fw-bold mb-0 me-3 fs-3 mb-4">
                        Forgot Password</p>
                </div>
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="hometab" data-bs-toggle="tab" data-bs-target="#home"
                            type="button" role="tab" aria-controls="home" aria-selected="true" runat="server">
                            Get OTP</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="profiletab" data-bs-toggle="tab" data-bs-target="#profile"
                            type="button" role="tab" aria-controls="profile" aria-selected="true" runat="server"
                            visible="false">
                            Enter OTP</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contacttab" data-bs-toggle="tab" data-bs-target="#contact"
                            type="button" role="tab" aria-controls="contact" aria-selected="true" runat="server"
                            visible="false">
                            Update Password</button>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="hometab"
                        runat="server">
                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control my-4" placeholder="example@gmail.com"></asp:TextBox>
                        <asp:Button ID="btngetotp" runat="server" Text="Get OTP" CssClass="btn btn-warning"
                            OnClick="btngetotp_Click" />
                    </div>
                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profiletab"
                        runat="server">
                        <asp:TextBox ID="txtotp" runat="server" CssClass="form-control my-4" placeholder="Enter OTP"></asp:TextBox>
                        <asp:Button ID="btnverify" runat="server" Text="Verify OTP" 
                            CssClass="btn btn-warning" onclick="btnverify_Click"
                           />
                    </div>
                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contacttab"
                        runat="server">
                        <asp:TextBox ID="txtnew" runat="server" CssClass="form-control my-4" placeholder="New Password"></asp:TextBox>
                        <asp:TextBox ID="txtcnf" runat="server" CssClass="form-control my-4" placeholder="Confirm Password"></asp:TextBox>
                        <asp:Button ID="btnupd" runat="server" Text="Update Password" 
                            CssClass="btn btn-warning" onclick="btnupd_Click" />
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    </form>
    <script src="bootstrap/dist/js/bootstrap.js" type="text/javascript"></script>
    <script src="bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
