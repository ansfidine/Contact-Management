
<!--Project Name CONTACT MANAGEMENT 

    //@Author
    Name : Ansfidine Youssouf
    ID : 184203800110
    
    
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactStorage.aspx.cs" Inherits="DataStorage.ContactStorage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Management System</title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }  

    #header{
         position:relative;
         padding:25px;
         background:#6e7bd9;
         color :white;

    }
    #div1{
        float:left;
        margin-left:90px;
        width:300px;
        padding:25px;
    }
        #div2 {
            margin-right: 460px;
            margin-left: 460px;
            margin-top: 50px;
            width: 300px;
            padding: 25px;
        }
    body {
        width: 100%;
        margin: 10px;
    }

    .table-condensed tr th {
        border: 0px solid #6e7bd9;
        color: white;
        background-color: #6e7bd9;
    }

    .table-condensed, .table-condensed tr td {
        border: 0px solid #000;
    }
    tr:nth-child(even) {
        background: #f8f7ff
    }
    footer{
        clear: both;
        position: relative;
        height: 70px;
        margin-top:300px;
        background:#6e7bd9;  
    }
    span{
        color:white;
    }
    #messages{
        padding-top :100px;
    }
    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"/>
</head>
<body>
    <form id="form1" runat="server">

        <div id ="header">
            <h1>Contact Management</h1>
        </div>

            <div id ="div1">
            <asp:HiddenField ID="hfContactID" runat="server" />
           
                    
                        <asp:Label ID="Label1" runat="server" Text="Name" ForeColor="#333333"></asp:Label><br />
                   
                   
                        <asp:TextBox ID="txtName" runat="server" OnTextChanged="txtName_TextChanged"></asp:TextBox><br />
                 
                        <asp:Label ID="Label2" runat="server" Text="Mobile" ForeColor="Black"></asp:Label><br />
                   
                        <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox><br />
               
                        <asp:Label ID="Label3" runat="server" Text="Address" ForeColor="Black"></asp:Label><br />
                 
                        <asp:TextBox ID="txtAddress" runat="server" TextMode ="MultiLine"></asp:TextBox><br />
                
                         <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="Button3_Click" /><br />
                       
                        <div id="messages">

                            <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label><br />
               
                            <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>

                        </div>
                        
             
            </div>
             <div id="div2">
            <asp:GridView ID="gvContact" runat="server" AutoGenerateColumns ="false" UseAccessibleHeader="true" CssClass="table table-condensed table-hover" Width="250%">
                <Columns>
                    <asp:BoundField DataField ="Name" HeaderText="Name" />
                    <asp:BoundField DataField ="Mobile" HeaderText="Mobile" />
                    <asp:BoundField DataField ="Address" HeaderText="Address" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkView" runat="server" CommandArgument ='<%# Eval ("ContactID") %>' OnClick="lnk_OnClick">View</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>        
            </asp:GridView>
             </div>
    </form>
    <!-- Footer -->
<footer class="page-footer font-small blue">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2020 Copyright 
    <a href="https://www.instagram.com/ansfidine_youssouf/"> <span>Ansfidine Tech</span> </a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->
</body>
</html>
