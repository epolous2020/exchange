<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-5 mx-auto login-pan">
                <div class="card login">
                    <div class="card-body">
                        <asp:Button runat="server" ID="enter_btn" PostBackUrl="~/login.aspx" CssClass="btn btn-default" Text="ورود به سامانه" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.min.js"></script>
</asp:Content>

