<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title></title>
    <link href="~/css/bootstrap.css" rel="stylesheet" />
    <link href="~/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="css/myStyle.css" rel="stylesheet" />

    <link rel="stylesheet" href="css/bootstrap.css" />

</head>
<body>
    <form id="form1" runat="server">
        <%-- <div class="container-fluid">
            <nav class="navbar">
                <div class="container-fluid">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="login.aspx">ورود</a></li>
                    </ul>
                </div>
            </nav>
        </div>--%>
    <div class="container">
        <div class="row">
            <div class="col-md-5 mx-auto login-pan">
                <div class="card login">
                    <div class="card-body">
                        <h4 class="card-title">ورود</h4>
                        <div class="input-group">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class=" fas fa-user"></i></span>
                            </div>
                            <asp:TextBox runat="server" ID="username" CssClass="form-control" placeholder="نام کاربری/ایمیل شما"></asp:TextBox>

                        </div>
                        <div class="input-group">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class=" fas fa-lock"></i></span>
                            </div>
                            <asp:TextBox runat="server" ID="pass" CssClass="form-control" placeholder="رمز عبور" TextMode="Password"></asp:TextBox>

                        </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.min.js"></script>
    </form>
</body>
</html>
