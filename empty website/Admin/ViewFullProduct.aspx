<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="ViewFullProduct.aspx.cs" Inherits="empty_website.Admin.ViewFullProduct" %>

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
            <div class="left">
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
            </div>
            <div class="right">
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
                <div>
                    <asp:Label ID="Label2" Font-Bold="true" Font-Size="Large" ForeColor="White" runat="server"
                        Text="Description:"></asp:Label><br />
                    <asp:Label ID="lbldescr" Font-Size="Large" ForeColor="White" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
