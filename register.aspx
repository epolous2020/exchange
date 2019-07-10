<%@ Page Title="ثبت نام" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="col-md-3"></div>
    <div class="col-md-6 register-form" style="">
        <div class="col-md-12 text-center">
            <h1>ثبت نام در سایت</h1>
        </div>

        <div class="col-md-12 margin-b15">
            <div class="col-md-6 margin-b15-sm">
                <asp:TextBox runat="server" ID="name" placeholder="نام" required="required"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:TextBox runat="server" ID="family" placeholder="نام خانوادگی" required="required"></asp:TextBox>
            </div>
        </div>

        <div class="col-md-12 margin-b15">
            <div class="col-md-6 margin-b15-sm">
                <asp:TextBox runat="server" ID="email" placeholder="پست الکترونیک"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" ErrorMessage="آدرس صحیح نیست" ForeColor="Red" Visible="false"></asp:RegularExpressionValidator>
            </div>
            <div class="col-md-6">
                <asp:DropDownList runat="server" ID="mem_cnt" DataSourceID="cntrs" DataValueField="id_cnt" DataTextField="country_name_prs"></asp:DropDownList>
            </div>
        </div>

        <div class="col-md-12 margin-b15">
            <div class="col-md-6 margin-b15-sm">
                <asp:TextBox runat="server" ID="password" placeholder="رمز عبور" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:TextBox runat="server" ID="repassword" placeholder="کلمه عبور مجدد" TextMode="Password"></asp:TextBox>
            </div>
        </div>

        <div class="col-md-12 margin-b15">
            <div class="col-md-6 margin-b15-sm">
                <asp:TextBox runat="server" ID="phone" placeholder="شماره تماس"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:Button runat="server" ID="save_btn" OnClick="save_btn_Click" class="button-a btncolor-a" Text=" ثبت درخواست عضویت" />
            </div>
            <div class="col-md-12 margin-b15">
                <div class="text-center">
                    <asp:Label runat="server" CssClass="alert-warning" ID="lblMessage"></asp:Label>
                    <asp:Label runat="server" ID="warning" CssClass="alert-warning"></asp:Label>
                    <asp:Label runat="server" ID="success" CssClass="alert-success"></asp:Label>
                </div>
            </div>

            <div class="col-md-12 margin-b15">
                آیا قبلا عضو شده اید؟
                <a href="default.aspx">ورود به سامانه</a>
            </div>
        </div>
    </div>
    <div class="col-md-3"></div>

    <asp:SqlDataSource runat="server" ID="cntrs" ConnectionString="<%$ ConnectionStrings:exchngConnectionString %>" SelectCommand="SELECT * FROM [Countries]"></asp:SqlDataSource>
</asp:Content>
