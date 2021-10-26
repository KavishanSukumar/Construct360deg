<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile_ProductCompany</title>
<<<<<<< HEAD
    <link rel="stylesheet" href="./html/productcompany/resources/css/viewprofile-productcompany.css">
=======
    <link rel="stylesheet" href="./html/productcompany/resources/css/viewprofile.css">
>>>>>>> 476a775152af17b88f54abb979444e4a93482763
    <link rel="stylesheet" href="./html/productcompany/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<div class="container">
<<<<<<< HEAD
    <%@include file="../../productcompany/html/sidebar-productcompany.jsp"%>
=======
    <%@include file="sidebar-productcompany.jsp"%>
>>>>>>> 476a775152af17b88f54abb979444e4a93482763

    <div class="content1">
        <form class="example" action="/action_page.java">
            <button type="submit"><i class="fa fa-search"></i></button>
            <input type="text" placeholder="Search.." name="search">
        </form>
        <div class="main">
            <a href="#"><i class="fa fa-home"></i></a>
            <a href="#"><i class="fa fa-bell"></i></a>
            <a href="#"><i class="fa fa-mail-bulk"></i></a>
        </div>
    </div>
    <div class="content2">
        <div class="box1">
            <img src="./html/productcompany/resources/images/viewprofile/cover.png">
            <img src="./html/productcompany/resources/images/viewprofile/user2.png" class="user">
            <a href="<%=request.getContextPath()%>/editprofile"><i class="fa fa-pencil-alt"></i></a>
            <h2>UpWork</h2>
            <p>Product Company<br>Colombo District, Western, Sri Lanka.</p>
            <a href="#" class="button">Message</a>
        </div>
        <div class="box2">
            <a href="#"><i class="fa fa-camera"></i></a>
            <h3>About</h3>
            <p>+ Add summary</p>
            <h3>Featured</h3>
            <span>Add external documents, photos and links.</span>
            <p>+ Add featured</p>
            <h3>Contact</h3>
            <p>Email - <a href="Upwork456@gmail.com">Upwork456@gmail.com</a></p>
            <p>LinkedIn - <a href="htttps://www.linkedin.com/in/UpWork-466278a1a5">htttps://www.linkedin.com/in/Upwork-466278a1a5</a></p>
        </div>
    </div>
</div>
</body>
<%@include file="../../footer.jsp"%>
</html>