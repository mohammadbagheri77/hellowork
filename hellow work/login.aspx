<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="hellow_work.login" %>

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
                                <input type="text" name="tshp-us" class="form-control" id="inputun" placeholder="نام كاربري" required />
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="inputPassword" class="col-lg-2 control-label">رمز عبور</label>
                            <div class="col-lg-10">
                                <input type="password" name="tshp-pass" class="form-control" id="inputPass" placeholder="رمز عبور" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="textArea" class="col-lg-2 control-label">عبارات را به درستی وارد کنید </label>
                            <div class="col-lg-12" id="imgcaptcha">
                                <img class="form-control" src="data:image/png;base64,url(Controllers/captcha.aspx)" />
                            </div>
                            <div class="col-12">
                                <input type="text" name="tshp-captcha" class="form-control" id="captcha" placeholder="متن تصویر را وارد نمایید!" required />
                            </div>
                        </div>

                        <div class="cal-12" id="show">
                        </div>

                        <div class="cal-12">
                            <button type="submit" onclick="return postToControll();" style="text-align: center;" class="btn btn-success w-100"  >ورود</button>
                        </div>

                    </fieldset>
                </div>

            </div>
        </div>


    </form>



    <script src="Assets/js/jquery.min.js"></script>
    <script src="Assets/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $.ajax({
                url: "./Controllers/captcha.aspx",
                type: "GET",
                success: function (res) {
                    $("#imgcaptcha").replaceWith(' <img  class="form-control"  style="width: 36%;height: 94px;margin: 12px;" src="data:image/png;base64,' + res + '" />');
                }
            });
        });
    </script>


    <script>
       
        function postToControll() {


            var JsonRequest = objectifyForm();
            var PostJson = { 'Posted': JsonRequest };
            $.ajax({
                url: "./Controllers/logincontrollers.aspx/submituser",
                type: "post",
                data: JSON.stringify(PostJson),
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                  //  alert(response.d);

                    if (response.d == "-1") {

                        $("#show").html('<div class="btn btn-danger w-100" style="margin-bottom: 12px;"><span id="ok">رمز ورود یا نام کاربری اشتباه است!!!</span></div>');

                    } else {
                        $("#show2").replaceWith('<div id="show2" class="alert alert-dismissible "style="background-color: orange;"> <button type ="button"  class="close" data-dismiss="alert">&times;</button > <h4> سلام</h4> <p id="name"> </p></div> ');
                        var x = document.getElementById("name");
                        x.innerHTML = response.d + "  خوش آمدید";
                        x.style.fontSize = "25px";
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {

                    $("#show").innerHTML = '<div class="btn btn-danger w-100" style="margin-bottom: 12px;">< span id="ok" >دوباره تلاش کنید</span ></div >';
                }
            });

            return false;

            //alert(objectifyForm());  onclick="return postToControll();
            //return false;
        }

        function objectifyForm() {
            var inp = $("#MAINPOSTERGETER :input");
            var rObject = {};
            for (var i = 0; i < inp.length; i++) {
                if (inp[i]['name'].substr(inp[i]['name'].length - 2) == "[]") {
                    var tmp = inp[i]['name'].substr(0, inp[i]['name'].length - 2);
                    if (Array.isArray(rObject[tmp])) {
                        if (inp[i]['name'].includes("tshp-"))
                            rObject[tmp].push(inp[i]['value']);
                    } else {
                        rObject[tmp] = [];
                        rObject[tmp].push(inp[i]['value']);
                    }
                } else {
                    if (inp[i]['name'].includes("tshp-"))
                        rObject[inp[i]['name'].replace("tshp-", "")] = inp[i]['value'];
                }
            }
            return JSON.stringify(rObject);
        }
    </script>




</body>
</html>
