<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="Orders.aspx.cs" Inherits="empty_website.Admin.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .img
        {
            height: 250px;
            width: 250px;
            border-radius: 20px;
            box-shadow: 0px 0px 10px 1px #000080;
            object-fit: cover;
            object-position: top;
        }
        .main-card
        {
            border-radius: 20px 0px;
            width: 22.5em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex align-items-center mt-5">
        <div class="container rounded py-5" style="overflow: auto">
            <h1 class="text-center mb-5">
                &nbsp;Orders</h1>
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
                <ItemTemplate>
                    <div class="mx-4 border border-2 p-5 bg-light main-card">
                        <div class="mb-1">
                            <asp:Label ID="lblname" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#Eval("prodName") %>'></asp:Label>
                        </div>
                        <img src='<%#Eval("img1") %>' class="img mb-3" />
                        <div class="mb-3 text-center">
                            <asp:Label ID="Label4" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#"Purchased By: "+Eval("CusName") %>'></asp:Label>
                        </div>
                         <div class="mb-3 text-center">
                            <asp:Label ID="Label3" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#"Purchased On: "+Eval("SoldOn") %>'></asp:Label>
                        </div>
                       
                        <div class="mb-1 text-center">
                            <asp:Label ID="lblprice" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#"Rs. "+Eval("prodprice") %>'></asp:Label>
                        </div>
                        <div class="mb-1 text-center">
                            <asp:Label ID="Label1" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#"Quantity: "+Eval("sellingQty") %>'></asp:Label>
                        </div>
                        <div class="mb-3 text-center">
                            <asp:Label ID="Label2" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#"Total: "+Eval("tot") %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
