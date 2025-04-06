<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="empty_website.User.Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .table {
            width: 100%;
            border-collapse: collapse;
            color: white;
        }

            .table th, .table td {
                border: 1px solid #ddd;
                padding: 8px;
            }

            .table th {
                background-color: #f4f4f4;
                text-align: left;
            }
    </style>
    <script>
        function printInvoice() {
            const content = document.getElementById("invoiceContent").innerHTML;
            const printWindow = window.open("", "_blank");
            printWindow.document.open();
            printWindow.document.write(`
                <html>
                    <head>
                        <title>Invoice</title>
                        <style>
                            body { font-family: Arial, sans-serif; margin: 20px; }
                            table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                            th, td { border: 1px solid #ddd; padding: 12px; }
                            th { background-color: #f4f4f4; }
                            .total { text-align: right; font-weight: bold; margin-top: 20px; }
                        </style>
                    </head>
                    <body>
                        ${content}
                    </body>
                </html>
            `);
            printWindow.document.close();
            printWindow.print();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-light">

        <div id="invoiceContent">

            <h1 class="text-center mt-5">Order Invoice</h1>
            <div class="d-flex justify-content-between">
              <div><b>Billing Name:</b><asp:Label ID="lblunm" runat="server" Text="Label"></asp:Label></div>
                <div><b>Purchased On:</b><asp:Label ID="lbldt" runat="server" Text="Label"></asp:Label></div>
            </div>
            <table class="table mt-4 table-light">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ProdName") %></td>
                                <td>Rs. <%# Eval("ProdPrice") %></td>
                                <td><%# Eval("qty") %></td>
                                <td>Rs. <%# Eval("TotalPrice") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
            <div class="text-right mt-4">
                <asp:Label ID="lblGrandTotal" runat="server" CssClass="h4"></asp:Label>
            </div>
        </div>

        <div class="text-right mt-4">
            <asp:Button ID="btnPrintInvoice" runat="server" CssClass="btn btn-primary" Text="Generate Invoice" OnClick="btnPrintInvoice_Click" />
            <button ID="btnPrintInvoice1" class="btn btn-primary"  onclick="printInvoice()" >Generate Invoice as PDF</button>
        </div>
    </div>
</asp:Content>
