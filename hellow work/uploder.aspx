<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploder.aspx.cs" Inherits="hellow_work.uploder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="Assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Assets/css/bootstrap-rtl.min.css" rel="stylesheet" />
    <link href="Assets/css/costum.css" rel="stylesheet" />

</head>
<body>

    <form name="myform1" id="form1" runat="server">

        <div class="container">

            <div class="jumbotron">
                <div class="form-horizontal" id="MAINPOSTERGETER">
                    <fieldset>
                        <label>
                            <span class="btn btn-danger"><i class="fa fa-pen"><span>آپلود عکس</span></i> </span>
                        </label>
                        <input id="uploderInput" onchange="Uploding_uploder()" type="file" name="profile" class="form-control" accept=".png,.jpg,.jpeg" />
                        <div class="row" id="UploderImages"></div>
                    </fieldset>
                </div>
            </div>
        </div>
    </form>

    <script src="Assets/js/jquery.min.js"></script>
    <script src="Assets/js/bootstrap.min.js"></script>
    <script>    

        function Uploding_uploder() {

            var fileUpload = $("#uploderInput").get(0);
            var files = fileUpload.files;
            var fileData = new FormData();

            for (var i = 0; i < files.length; i++) {
                fileData.append(files[i].name, files[i]);
            }
            fileData.append('action', 'New');  

            $.ajax({
                url: './Controllers/up_loder.aspx',
                data: fileData,
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                success: function (response) {

                    $("#UploderImages").html(response);
                   
                },
                error: function () {
                    alert("عدم توانایی در بارگیری فایل")
                }
            });
            return false;
        }

    </script>


</body>
</html>
