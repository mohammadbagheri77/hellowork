<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="show.aspx.cs" Inherits="hellow_work.show" %>

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

    
    <div  class="alert alert-dismissible " style="background-color: orange;">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
   <h4>سلام</h4>
        <p> 
            <%=obj.name %>
        </p></div>


    <div id="show2">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
       

    </div>

    <form id="form1" runat="server">
        <div>
        </div>
    </form>



    <script src="Assets/js/jquery.min.js"></script>
    <script src="Assets/js/bootstrap.min.js"></script>

    <script>

        $("#show2").replaceWith('');
        var x = document.getElementById("name");
        x.innerHTML = findGetParameter("showing") + "  خوش آمدید";
        x.style.fontSize = "25px";

    </script>

</body>
</html>
