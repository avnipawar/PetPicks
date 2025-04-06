<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="updateProduct.aspx.cs" Inherits="empty_website.Admin.updateProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="d-flex justify-content-center mt-5 p-5">
        <div class="card rounded bg-light" style="width: 24rem;">
            <div class="card-header h3 text-center">
                Update Product
            </div>
            <div class="card-body">
                <div>
                    <asp:DropDownList ID="ddltype" runat="server" CssClass="form-select">
                        <asp:ListItem>Food</asp:ListItem>
                        <asp:ListItem>Treats</asp:ListItem>
                        <asp:ListItem>Toys</asp:ListItem>
                        <asp:ListItem>Cloths</asp:ListItem>
                        <asp:ListItem>Bag</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="my-2">
                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Enter Product Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtname"
                        runat="server" CssClass="fw-bold text-danger" ErrorMessage="product name is required"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" ToolTip="Select Product Image" />
                   
                </div>
                <div class="my-2">
                    <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" ToolTip="Select Product Image" />
                   
                </div>
                <div>
                    <asp:TextBox ID="txtdescr" runat="server" CssClass="form-control" TextMode="MultiLine"
                        placeholder="Enter Description"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtdescr"
                        runat="server" CssClass="fw-bold text-danger" ErrorMessage="Description is required"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="my-2">
                    <asp:TextBox ID="txtprice" runat="server" CssClass="form-control" placeholder="Enter Price"
                        TextMode="Number">txtprice</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtprice"
                        runat="server" CssClass="fw-bold text-danger" ErrorMessage="price is required"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="my-2">
                    <asp:DropDownList ID="ddlstock" runat="server" CssClass="form-select">
                        <asp:ListItem>In Stock</asp:ListItem>
                        <asp:ListItem>Out Of Stock</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <asp:TextBox ID="txtexpiry" runat="server" CssClass="form-control" ToolTip="Select Expiry Date if food is selected"
                        TextMode="Date"></asp:TextBox>
                </div>
            </div>
            <div class="card-footer py-2 text-center">
                <asp:Button ID="btnadd" runat="server" Text="Update" CssClass="btn btn-warning" 
                    onclick="btnadd_Click" />
            </div>
        </div>
    </div>
</asp:Content>
