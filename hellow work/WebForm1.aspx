<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="hellow_work.WebForm1" %>

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

        <div class="container">

            <div class="jumbotron">
                <h1>فرم ثبت نام</h1>
                <div class="form-horizontal" id="MAINPOSTERGETER">
                    <fieldset>
                        <legend>فرم شماره یک</legend>
                        <div class="form-group">
                            <label for="inputEmail" class="col-lg-2 control-label">نام کاربری</label>
                            <div class="col-lg-10">
                                <input type="text" name="tshp-un" class="form-control" id="inputun" placeholder="نام کاربری خود را وارد کنید">
                                <label class="control-label" id="error1" style="color: red" for="inputError"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail" class="col-lg-2 control-label">ادرس ایمیل</label>
                            <div class="col-lg-10">
                                <input type="text" name="tshp-email" class="form-control" id="inputEmail" placeholder="ادرس ایمیل">
                                <label class="control-label" id="error2" style="color: red" for="inputError"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputPassword" class="col-lg-2 control-label">رمز ورود</label>
                            <div class="col-lg-10">
                                <input type="password" name="tshp-password" class="form-control" id="inputPassword" placeholder="رمز ورود">
                                <label class="control-label" id="error3" style="color: red" for="inputError"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputPassword" class="col-lg-2 control-label">رمز ورود</label>
                            <div class="col-lg-10">
                                <input type="password" class="form-control" id="inputRePass" placeholder="رمز ورود">
                                <label class="control-label" id="errorRePass" style="color: red" for="inputError"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="textArea" class="col-lg-2 control-label">توضیحات</label>
                            <div class="col-lg-10">
                                <input class="form-control" name="tshp-destxt" id="textArea" placeholder="توضیحات خود را وارد کنید">
                                 <label class="control-label" id="error4" style="color: red" for="inputError"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-lg-2 col-md-4 col-xs-6 col-xl-6">
                                <button type="reset" onclick="return Cancel();" class="btn btn-danger w-100">Cancel</button>
                                <label class="control-label" id="ok" style="color: red" for="inputError"></label>
                            </div>
                            <div class="col-lg-10 col-md-8 col-xs-6 col-xl-6">
                                <button type="submit" onclick="return postToControll();" class="btn btn-primary w-100">Submit</button>
                            </div>


                        </div>
                    </fieldset>
                </div>
            </div>
        </div>

    </form>




    <script src="Assets/js/jquery.min.js"></script>
    <script src="Assets/js/bootstrap.min.js"></script>
    <script>

        function Cancel() {

            document.getElementById("error1").innerHTML = "";
            document.getElementById("error2").innerHTML = "";
            document.getElementById("error3").innerHTML = "";
            document.getElementById("errorRePass").innerHTML = "";
            document.getElementById("error4").innerHTML = "";
        }


        function postToControll() {

            var pass1 = document.getElementById("inputPassword").value;
            var pass2 = document.getElementById("inputRePass").value;
            var inputun = document.getElementById("inputun").value;
            var inputEmail = document.getElementById("inputEmail").value;
            var textArea = document.getElementById("textArea").value;

            if (inputun == "")
            {
                document.getElementById("error1").innerHTML = "پر کنید!!";
            }

            if (inputEmail == "")
            {
                document.getElementById("error2").innerHTML = "پر کنید!!";
            }

            if (pass1 == "")
            {
                document.getElementById("error3").innerHTML = "پر کنید!!";
            }

            if (pass2 == "")
            {
                document.getElementById("errorRePass").innerHTML = "پر کنید!!";
            }

            if (textArea == "")
            {
                document.getElementById("error4").innerHTML = "پر کنید!!";
                return false;
            }

            if (pass1 == pass2) {

                var JsonRequest = objectifyForm();
                var PostJson = { 'Posted': JsonRequest };

                $.ajax({
                    url: "./Controllers/maincontrollers.aspx/submituser",
                    type: "post",
                    data: JSON.stringify(PostJson),
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        //  alert(response.d);
                        document.getElementById("ok").innerHTML = "با موفقیت ثبت شد";
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //  alert(textStatus);
                        document.getElementById("ok").innerHTML = "دوباره تلاش کنید";
                    }
                });

                return false;

            }
            else {

                document.getElementById("errorRePass").innerHTML = "رمز ورود اشتباه است!!";
                return false;

            }
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
