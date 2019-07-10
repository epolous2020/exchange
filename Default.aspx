<%@ Page Title="ورود به سایت" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="col-md-4 login-form col-md-offset-1">
        <div class="col-md-12 text-center">
            <h1>ورود به سایت</h1>
        </div>

        <div class="col-md-12 margin-b20">
            <asp:TextBox runat="server" ID="username" placeholder="نام کاربری / ایمیل"></asp:TextBox>
        </div>
        <div class="col-md-12  margin-b20">
            <asp:TextBox runat="server" ID="pass" placeholder="رمز عبور" TextMode="Password"></asp:TextBox>
        </div>

        <asp:UpdatePanel ID="UP1" runat="server">
            <ContentTemplate>
                <div class="col-md-12  margin-b20">
                    <asp:TextBox ID="txtCaptcha" runat="server" CssClass="captcha-input" autocomplete="off" placeholder="عبارت امنیتی"></asp:TextBox>
                    <asp:Image ID="imgCaptcha" runat="server" CssClass="captcha" />
                    <asp:LinkButton runat="server" CssClass="button-circle btncolor-b" OnClick="btnRefresh_Click" ID="btnRefresh" Style="margin-left: 0; margin-top: -1px;">
                        <i class="glyphicon glyphicon-repeat"></i>
                    </asp:LinkButton>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="col-md-12  margin-b20">          
            <div class="text-center">
                <asp:Label runat="server" CssClass="alert-warning" ID="warning"></asp:Label>
            </div>

            <div class="col-md-12 padding-r0 padding-l0">
                <asp:LinkButton runat="server" CssClass="button-a btncolor-a" OnClick="enter_btn_Click" ID="enter_btn">
                    ورود               
                </asp:LinkButton>
            </div>

            <div class="col-md-12 box-reg text-center">
                <asp:LinkButton runat="server" CssClass="link-a" ID="register" OnClick="register_Click">
                ثبت نام در سایت
                </asp:LinkButton>
                <br />
                <asp:LinkButton runat="server" CssClass="link-a" ID="LinkButton3" style="color:#fff;font-size: 15px;font-weight:normal;">
               رمز عبور خود را فراموش کرده ام؟
                </asp:LinkButton>
            </div>
        </div>
    </div>
    <div class="col-md-8"></div>

    <script src="js/jquery.min.js"></script>
</asp:Content>
