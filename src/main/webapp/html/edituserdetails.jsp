<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Details</title>
  <link rel="stylesheet" href="./resources/css/adddetails.css">
  <link rel="stylesheet" href="./resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
  <div class="container">
    <%@include file="sidebar.jsp"%>
    
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
      <div class="setting">
        <img src="./resources/images/viewprofile/user2.png">
        <a href="#"><i class="fa fa-camera"></i></a>
        <h3>Robert Johns</h3>
        <p>Your personal account</p>
        <div class="menu">
          <h4>Account Settings</h4>
          <a class="active" href="#">Account</a>
          <a href="#">Emails</a>
          <a href="#">Feedbacks</a>
          <a href="#">Previous Projects</a>
          <a href="#">Account Security</a>
        </div>
      </div>
      <div class="form">
        <form action="/action_page.java">
          <label for="fname">First Name: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="fname" name="firstname" value="Robert">

          <label for="lname">Last Name: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="lname" name="lastname" value="Johns">

          <label for="bio">Bio: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="bio" name="bio" value="Expert Consultant:Upscale Commercial/ResidentialConstruction, Architectural Concreate, Masonry,Foundation Award Winner Colombo District, Western, Sri Lanka">

          <label for="nic">Nic Number: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="nic" name="nic" value="708240370v">

          <label for="email">E-mail: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="email" name="email" value="wpsJohns456@gmail.com">

          <label for="address">Address: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="address" name="address" value="No.22 boralasgamuwa road, Kaluthara North, Colombo.">

          <label for="contactnum">Contact Number: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="contactnum" name="contactnum" value="0763452789">

          <input type="submit" id="submit" value="Save">
        </form>
      </div>
    </div>
  </div>
  <div class="footer">
    <p>All rights reserved © 2020  Construct360<sup>0</sup>.com<br>Design: Epic code</p>
  </div>
</body>

</html>