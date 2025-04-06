<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true"
    CodeBehind="YourCart.aspx.cs" Inherits="empty_website.User.YourCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .img {
            height: 250px;
            width: 250px;
            border-radius: 20px;
            box-shadow: 0px 0px 10px 1px #000080;
            object-fit: cover;
            object-position: top;
        }

        .main-card {
            border-radius: 20px 0px;
            width: 22.5em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex align-items-center mt-5 text-light">
        <div class="container rounded py-5 text-dark" style="overflow: auto">
            <h1 class="text-center mb-5 text-light">Your Cart</h1>
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="3"
                OnDeleteCommand="DataList1_DeleteCommand"
                OnItemCommand="DataList1_ItemCommand" OnEditCommand="DataList1_EditCommand">
                <ItemTemplate>
                    <div class="mx-4 border border-2 p-5 bg-light main-card">
                        <img src='<%#Eval("img1") %>' class="img mb-3" />

                        <div class="mb-1">
                            <asp:Label ID="lblname" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#Eval("prodName") %>'></asp:Label>
                        </div>
                        <div class="mb-1 text-center">
                            <asp:Label ID="lblprice" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#"Rs. "+Eval("prodprice") %>'></asp:Label>
                        </div>
                        <div class="mb-1 text-center">
                            <asp:Label ID="Label1" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#"Quantity: "+Eval("qty") %>'></asp:Label>
                        </div>
                        <div class="mb-3 text-center">
                            <asp:Label ID="Label2" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#"Total: "+Eval("tot") %>'></asp:Label>
                        </div>

                        <div class="mb-1 d-flex  justify-content-between">
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger" CommandName="delete" CommandArgument='<%#Eval("CartId") %>'>Remove <i class="fa fa-trash"></i></asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <div class="text-center mt-3">
                <asp:Label ID="lblTotal" runat="server" CssClass="h4 text-primary"></asp:Label>
            </div>

            <div class="text-center mt-5">
                <asp:Button ID="btnCheckout" runat="server" CssClass="btn btn-success btn-lg" Text="Proceed to Checkout" OnClick="btnCheckout_Click" />
            </div>
        </div>
    </div>
</asp:Content>
