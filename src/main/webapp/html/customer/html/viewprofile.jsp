<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile_Customer</title>
    <link rel="stylesheet" href="./html/customer/resources/css/viewprofile-customer.css">
    <link rel="stylesheet" href="./html/customer/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<div class="container">
    <%@include file="sidebar-customer.jsp"%>

    <div class="content1">
        <form class="example" action="/action_page.java">
            <button type="submit"><i class="fa fa-search"></i></button>
            <input type="text" placeholder="Search.." name="search">
        </form>
        <div class="main">
            <a href="#"><i class="fa fa-home"></i></a>
            <a href="#"><i class="fa fa-mail-bulk"></i></a>
        </div>
    </div>
    <div class="content2">
        <div class="box1">
            <img src="./html/customer/resources/images/viewprofile/cover.png">
            <img src="./html/customer/resources/images/viewprofile/user3.jpg" class="user">
            <a href="<%=request.getContextPath()%>/editprofile"><i class="fa fa-pencil-alt"></i></a>
            <h2>Kalum Perera</h2>
            <p>Customer<br>Colombo District, Western, Sri Lanka.</p>
            <a href="#" class="button">Message</a>
        </div>
        <div class="box2">
            <a href="#"><i class="fa fa-camera"></i></a>
            <h3>Contact</h3>
            <p>Email - <a href="KalumPereras456@gmail.com">KalumPerera456@gmail.com</a></p>
            <p>Tele - 0765678934 </p>
        </div>
    </div>
</div><br><br>
<%@include file="../../footer.jsp"%>
</body>

</html>