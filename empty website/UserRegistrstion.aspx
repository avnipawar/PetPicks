<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistrstion.aspx.cs"
    Inherits="empty_website.UserRegistrstion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pet Picks</title>
    <link rel="icon" href="img/dogicon.jpg"
        type="image/x-icon">
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body class="bg-warning">
    <form id="form1" runat="server">
        <div class="d-flex justify-content-center">
            <div class="card text-dark" style="margin-top: 5rem; width: 25rem;">
                <div class="card-header h4 text-center">
                    User Registration
                </div>
                <div class="card-body py-4">
                    <div class="row mb-3">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <asp:TextBox ID="txtunm" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtunm"
                                runat="server" CssClass="fw-bold text-danger" ErrorMessage="username is required"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <asp:TextBox ID="txtpwd" runat="server" CssClass="form-control" placeholder="Password"
                                TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtpwd"
                                runat="server" CssClass="fw-bold text-danger" ErrorMessage="password is required"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtemail"
                                runat="server" CssClass="fw-bold text-danger" ErrorMessage="email is required"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <asp:RadioButton ID="rdom" Text="Male" runat="server" GroupName="gen" CssClass="form-check-inline"
                                Checked="true" />
                            <asp:RadioButton ID="rdof" Text="Female" runat="server" GroupName="gen" CssClass="form-check-inline" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <asp:TextBox ID="txtcont" runat="server" CssClass="form-control" placeholder="Contact Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtcont"
                                runat="server" CssClass="fw-bold text-danger" ErrorMessage="contect number is required"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <asp:TextBox ID="txtaddr" runat="server" CssClass="form-control" placeholder="Address"
                                TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtaddr"
                                runat="server" CssClass="fw-bold text-danger" ErrorMessage="address is required"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                        <asp:Button ID="btnreg" runat="server" Text="Register" CssClass="btn btn-outline-dark"
                            OnClick="btnreg_Click" />
                        <p class="small fw-bold mt-2 pt-1 mb-0">
                            Already have an account? <a href="UserLogin.aspx"
                                class="link-danger">Login</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
