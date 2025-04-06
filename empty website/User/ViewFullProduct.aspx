<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true"
    CodeBehind="ViewFullProduct.aspx.cs" Inherits="empty_website.User.ViewFullProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .img
        {
            height: 70vh;
            width: 70vh;
            border-radius: 20px;
            box-shadow: 0px 0px 10px 1px #000080;
            object-fit: cover;
            object-position: top;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center mt-5 p-5">
        <div class="p-5 d-flex gap-4 rounded rounded-5" style="width: 70em; background-color: rgba(0,0,0,0.3)">
            <div class="row">
            <div class="col-lg-6 col-md-12 col-sm-12">
                <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="" id="img1" runat="server" class="img" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img src="" id="img2" runat="server" class="img" alt="Second slide">
                        </div>
                    </div>
                </div>
            </div><div class="col-lg-6 col-md-12 col-sm-12">
                <div class="mb-1">
                    <asp:Label ID="lblname" Font-Bold="true" ForeColor="White" Font-Size="XX-Large" runat="server"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label3" Font-Bold="true" Font-Size="Large" ForeColor="White" runat="server"
                        Text="Category:"></asp:Label>
                    <asp:Label ID="lbltype" Font-Size="Large" ForeColor="White" runat="server"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label1" Font-Bold="true" Font-Size="Large" ForeColor="White" runat="server"
                        Text="Price: Rs."></asp:Label>
                    <asp:Label ID="lblprice" Font-Bold="true" Font-Size="Large" ForeColor="White" runat="server"></asp:Label>
                </div>
                <div class="mb-2">
                    <asp:Label ID="Label2" Font-Bold="true" Font-Size="Large" ForeColor="White" runat="server"
                        Text="Description:"></asp:Label><br />
                    <asp:Label ID="lbldescr" Font-Size="Large" ForeColor="White" runat="server"></asp:Label>
                </div>
                <div class="mb-2">
                    <asp:TextBox ID="txtqty" runat="server" Text="1" placeholder="select quantity" TextMode="Number"
                        CssClass="form-control w-50"></asp:TextBox>
                </div>
                <div>
                    <asp:LinkButton ID="lnk" runat="server" CssClass="btn btn-warning" OnClick="lnk_Click">Add to cart</asp:LinkButton>
                </div>
            </div>
            </div>
        </div>
    </div>
</asp:Content>
