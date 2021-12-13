<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Professional's profile</title>
<%--    <link rel="stylesheet" href="./html/customer/resources/css/viewprofprofile.css">--%>
<%--    <link rel="stylesheet" href="./html/customer/resources/css/nav-bar-updated.css">--%>
    <link rel="stylesheet" href="../resources/css/viewprofprofile.css">
    <link rel="stylesheet" href="../resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<div class="container">
<%--    <%@include file="sidebar-customer.jsp"%>--%>
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
<%--            <img src="./html/customer/resources/images/viewprofile/cover.png">--%>
<%--            <img src="./html/customer/resources/images/viewprofile/user2.png" class="user">--%>
            <img src="../resources/images/viewprofile/cover.png">
            <img src="../resources/images/viewprofile/user2.png" class="user">
            <h2>Robert Johns</h2>
            <p>Expert Consultant:Upscale Commercial/Residential
                <br>Construction, Architectural Concreate, Masonry,Foundation
                Award Winner<br>Colombo District, Western, Sri Lanka.</p>
            <a href="#" class="button">Message</a>
            <a href="#" class="button">Appointments</a>
            <a href="#" class="button">Upload requirements</a>
        </div>

        <div class="box2">
            <h3>About</h3>
            <h3>Previous Projects</h3>
        </div>

        <div class="box3">
            <i class="fa fa-shopping-bag"></i>
            <h3>Experience</h3>
            <i class="fa fa-pencil-ruler"></i>
            <h3>Skills</h3>
        </div>

        <div class="box4">
            <h3>Contact</h3>
            <p>Email - <a href="wpsJohns456@gmail.com">wpsJohns456@gmail.com</a></p>
            <p>LinkedIn - <a href="htttps://www.linkedin.com/in/robert-john-466278a1a5">htttps://www.linkedin.com/in/robert-john-466278a1a5</a></p>
        </div>
    </div>
</div><br><br>
<%@include file="../../footer.jsp"%>
</body>

</html>
