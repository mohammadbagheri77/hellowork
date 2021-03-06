﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="hellow_work.login" %>

<!DOCTYPE html lang ="fa">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title></title>
    <link href="Assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Assets/css/bootstrap-rtl.min.css" rel="stylesheet" />
    <link href="Assets/css/costum.css" rel="stylesheet" />
</head>

<body>

    <nav class="navbar navbar-default">
        <div class="container-fluid" style="background-color: black">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Brand</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">Link</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                            <li class="divider"></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                </ul>
                <div class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Link</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <form name="myform1" id="form1" runat="server">

        <div id="show2">
        </div>

        <div class="container" style="width: 612px;">
            <div class="jumbotron">
                <p style="text-align: center;">ورود به حساب کاربری</p>
                <div class="form-horizontal" id="MAINPOSTERGETER">
                    <fieldset>

                        <div class="form-group">
                            <label for="inputun" class="col-lg-2 control-label">نام كاربري</label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="inputun" type="text" CssClass="form-control" placeholder="نام كاربري" runat="server"></asp:TextBox>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="inputPassword" class="col-lg-2 control-label">رمز عبور</label>
                            <div class="col-lg-10">
                                <asp:TextBox type="password" CssClass="form-control" ID="inputPass" runat="server" placeholder="رمز عبور"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="textArea" class="col-lg-2 control-label">عبارات را به درستی وارد کنید </label>
                            <div class="col-lg-12" id="imgcaptcha">
                                <img class="form-control" src="data:image/png;base64,url(Controllers/captcha.aspx)" />
                            </div>
                            <div class="col-12">

                                <asp:TextBox ID="captcha" CssClass="form-control" placeholder="متن تصویر را وارد نمایید!" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="cal-12" id="show">
                        </div>

                        <div class="cal-12">
                            <asp:Button ID="Button2" runat="server" Text="ورود" CssClass="btn btn-success w-100" OnClick="Button1_Click" />
                        </div>
                    </fieldset>
                </div>

            </div>
        </div>
    </form>


    <script src="Assets/js/jquery.min.js"></script>
    <script src="Assets/js/bootstrap.min.js"></script>

    <script>
        /*  
             <form action="show.aspx" method="get" name="form1" id="form2">
              <input type="text" name="showing">
              <input type="submit" name="submit">
             </form>
        */
        $(document).ready(function () {
            $.ajax({
                url: "./Controllers/captcha.aspx?CaptchaKey=loginform",
                type: "GET",
                success: function (res) {
                    $("#imgcaptcha").replaceWith(' <img  class="form-control"  style="width: 36%;height: 94px;margin: 12px;" src="data:image/png;base64,' + res + '" />');
                }
            });
        });
    </script>


    <script>

        function postToControll() {

            var inputun = document.getElementById("inputun").value;
            var inputPass = document.getElementById("inputPass").value;
            var captcha = document.getElementById("captcha").value;


            if (inputun == "" || inputPass == "" || captcha == "") {
                $("#show").html('<div class="btn btn-danger w-100" style="margin-bottom: 12px;"><span id="ok">فیلد خالی است !!!</span></div>');
                return false;
            }

            var JsonRequest = objectifyForm();
            var PostJson = { 'Posted': JsonRequest };
            $.ajax({
                url: "./Controllers/logincontrollers.aspx/submituser",
                type: "post",
                data: JSON.stringify(PostJson),
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    // alert(response.d);

                    if (response.d == "-1") {

                        $("#show").html('<div class="btn btn-danger w-100" style="margin-bottom: 12px;"><span id="ok">رمز ورود یا نام کاربری اشتباه است!!!</span></div>');

                    } else if (response.d == "0") {

                        $("#show").html('<div class="btn btn-danger w-100" style="margin-bottom: 12px;"><span id="ok">متن تصویر را درست وارد نشده است!!!</span></div>');

                    } else {

                        window.location.href = "show.aspx?showing=" + response.d + "&submit=Submit+Query";
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {

                    $("#show").innerHTML = '<div class="btn btn-danger w-100" style="margin-bottom: 12px;">< span id="ok" >دوباره تلاش کنید</span ></div >';
                }
            });

            return false;

            
        }

       
    </script>




</body>
</html>
