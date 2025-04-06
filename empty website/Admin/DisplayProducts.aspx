<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="DisplayProducts.aspx.cs" Inherits="empty_website.Admin.DisplayProducts" %>

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
            color:#000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex align-items-center mt-5">
        <div class="container rounded py-5" style="overflow: auto">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" OnDeleteCommand="DataList1_DeleteCommand"
                OnItemCommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <div class="mx-4 border border-2 p-5 bg-light main-card">
                        <%-- modelID--%>
                        <a href='ViewFullProduct.aspx?id=<%#Eval("prodId") %>'>
                            <img src='<%#Eval("img1") %>' class="img mb-3" /></a>
                        <div class="mb-1">
                            <asp:Label ID="lblname" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#Eval("prodName") %>'></asp:Label>
                        </div>
                        <div class="mb-3 text-center">
                            <asp:Label ID="lblprice" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#"Rs. "+Eval("prodprice") %>'></asp:Label>
                        </div>
                        <div class="text-center">
                            <a href='updateProduct.aspx?id=<%#Eval("ProdID") %>' class="btn btn-warning">Edit <i class="fa fa-pen"></i></a>
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger" CommandName="delete"
                                CommandArgument='<%#Eval("ProdID") %>'> Delete <i class="fa fa-trash"></i></asp:LinkButton>
                           
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
