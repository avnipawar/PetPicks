<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" 
CodeBehind="ChangePassword.aspx.cs" Inherits="empty_website.User.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="d-flex justify-content-center mt-5 p-5">
        <div class="card rounded bg-light" style="width: 24rem;">
            <div class="card-header h3 text-center text-dark">
                Change Password
            </div>
            <div class="card-body">
                <div>
                    <asp:TextBox ID="txtold" runat="server" CssClass="form-control" placeholder="Old Password"
                        TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtold"
                        runat="server" CssClass="fw-bold text-danger" ErrorMessage="old password is required"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="my-2">
                    <asp:TextBox ID="txtnew" runat="server" CssClass="form-control" placeholder="New Password"
                        TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtnew"
                        runat="server" CssClass="fw-bold text-danger" ErrorMessage="new password is required"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:TextBox ID="txtcnf" runat="server" CssClass="form-control" placeholder="Confirm Password"
                        TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtcnf"
                        runat="server" CssClass="fw-bold text-danger" ErrorMessage="confirm password is required"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" CssClass="fw-bold text-danger" runat="server"
                        ErrorMessage="password do not match" ControlToCompare="txtnew" ControlToValidate="txtcnf" Display="Dynamic"></asp:CompareValidator>
                </div>
            </div>
            <div class="card-footer py-2 text-center">
                <asp:Button ID="btnadd" runat="server" Text="Change Password" CssClass="btn btn-warning" 
                    onclick="btnadd_Click" />
            </div>
        </div>
    </div>
</asp:Content>
