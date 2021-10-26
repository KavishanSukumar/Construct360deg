<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Upload requirements</title>
  <link rel="stylesheet" href="./html/customer/resources/css/upload-req-final.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<!-- <input type="checkbox" id="check"> -->
<!-- header area start -->
<%@include file="sidebar-customer.jsp"%>
<div class="container">
<!--  <header class="menu_bar">-->

<!--    <div class="left_area">-->
<!--      &lt;!&ndash;<h2 class="logoname">Construct360</h2>&ndash;&gt;-->
<!--      <img src="../resources/images/navbar/LoginLogo.png" id="logopic" sizes="100px">-->
<!--    </div>-->
<!--    <div class="right_area">-->
<!--      &lt;!&ndash; <a href="#" id="logout_btn">Logout</a> &ndash;&gt;-->
<!--      <ul>-->
<!--        <li><a href="#">HOME</a></li>-->
<!--        <li><a href="#">SERVICES</a></li>-->
<!--        <li><a href="#">PROJECT</a></li>-->
<!--        <li><a href="#">CONTACT US</a></li>-->
<!--        <li> <i class="fas fa-bars" id="sidebar_btn" onclick="document.querySelector('#nav').classList.toggle('hidden')"></i></li>-->
<!--      </ul>-->
<!--    </div>-->
<!--    <div class="nav-panel hidden" id="nav">-->
<!--      <ul>-->
<!--        <div>-->
<!--          <img src="../resources/images/navbar/sidebarpro.jpg" id="profile_image" alt="" onclick="click">-->
<!--          <h4 id="profile_name" style="margin-top: -5px;">Reena</h4>-->
<!--        </div>-->
<!--        &lt;!&ndash; <a href="#"><i class="fas fa-laptop-house" id="house"></i><h4>Available Projects</h4></a> &ndash;&gt;-->
<!--        <a href="#"><i class="fas fa-hard-hat" id="hat"></i><h4>Projects</h4></a>-->
<!--        <a href="#"><i class="fab fa-product-hunt" id="hunt"></i><h4>Products</h4></a>-->
<!--        <a href="#"><i class="fas fa-user" id="user"></i><h4>Professionals</h4></a>-->
<!--        <a href="#"><i class="fas fa-flag-checkered" id="chek"></i><h4>Report</h4></a>-->
<!--        <a href="#"><i class="fas fa-headset" id="head"></i><h4>Help and Support</h4></a>-->
<!--        <a href="#"><i class="fas fa-sign-out-alt" id="logout"></i><h4>Logout</h4></a>-->
<!--      </ul>-->
<!--    </div>-->
<!--  </header>-->



  <div class="content">
    
    <div class="filling">
            <form class="details" action="<%=request.getContextPath()%>/uploadrequirement" method="post" enctype="multipart/form-data">

                <label for="description">Description</label><br>
                <textarea id="description" name="description" rows="5" cols="10"></textarea><br><br>
                <label for="type">Type</label>
                <select name="type" id="type">
                  <option value="none" disabled >Select</option>
                  <option value="building">Building</option>
                  <option value="landscapeDesigning">Landscape design</option>
                  <option value="Both">Both Building and Landscape design</option>
                </select><br><br>
                <label for="con-num">Contact Number</label>
                <input type="tel" id="con-num" name="contactnum" pattern="[0-9]{10}" required><br><br><br>
                <label for="reqfile">Requirement</label>
                <input type="file" id="reqfile" name="reqfile" ><br>
                <label id="filetype">(Choose pdf or zip file)</label>
                <h4>Construction area</h4>
                <label for="street">Street</label>
                <input type="text" id="street" name="street"><br><br>
                <label for="city">City</label>
                <input type="text" id="city" name="city"><br><br>
                <label for="dis">District</label>
                <input type="text" id="dis" name="district"><br><br>
                <label for="provin">Province</label>
                <input type="text" id="provin" name="province"><br><br>
                <div class="uploadFile">
                    <input type="submit" value="Upload">
                  <!-- <input type="submit" value="Uplaod" style="float: right;"> -->
                </div>
            </form>
      </div>
  </div>
  <input type="submit">

  <script src="./resources/js/upload-req.js"></script>
</div>
<%@include file="../../footer.jsp"%>
</body>
</html>