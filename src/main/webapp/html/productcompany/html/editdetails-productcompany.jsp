<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Details ProductCompany</title>
  <link rel="stylesheet" href="./html/productcompany/resources/css/editdetails-productcompany.css">
  <link rel="stylesheet" href="./html/productcompany/resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="./resources/js/jquery-3.6.0.js"></script>
  <script>
    $(document).ready(function (){
          $("#email-btn").click(function (){
            $(this).addClass("active");
            $("#preference-btn").removeClass("active");
            $("#account-btn").removeClass("active");
            $("#account").css("display","none");
            $("#emails").css("display","block");
            $("#preference").css("display","none");
          });
          $("#preference-btn").click(function (){
            $(this).addClass("active");
            $("#email-btn").removeClass("active");
            $("#account-btn").removeClass("active");
            $("#account").css("display","none");
            $("#emails").css("display","none");
            $("#preference").css("display","block");
          });
          $("#account-btn").click(function (){
            $(this).addClass("active");
            $("#email-btn").removeClass("active");
            $("#preference-btn").removeClass("active");
            $("#account").css("display","block");
            $("#emails").css("display","none");
            $("#preference").css("display","none");
          });
    });
  </script>
</head>
<body>
  <div class="container">
     <%@include file="sidebar-productcompany.jsp"%>

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
        <img src="./html/productcompany/resources/images/viewprofile/user2.png">
        <a href="#"><i class="fa fa-camera"></i></a>
        <h3>Robert Johns</h3>
        <p>Your personal account</p>
        <div class="menu">
          <h4>Account Settings</h4>
          <a id="account-btn" class="active" href="#">Account</a>
          <a id="email-btn" href="#">Emails</a>
          <a id="preference-btn" href="#">Account preferences</a>
        </div>

      </div>
      <div class="middle-content" id="account">
        <form action="/action_page.java">
          <label for="fname">First Name: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="fname" name="firstname" value="Upwork">

          <label for="lname">Last Name: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="lname" name="lastname" >

          <label for="bio">Bio: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="bio" name="bio" value="Product Compny, Colombo District, Western, Sri Lanka">

          <label for="nic">Nic Number: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="nic" name="nic">

          <label for="email">E-mail: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="email" name="email" value="Upwork456@gmail.com">

          <label for="address">Address: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="address" name="address" value="No.228/15 migamuwa road, Colombo.">

          <label for="contactnum">Contact Number: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="contactnum" name="contactnum" value="0472341578">

          <input type="submit" id="submit" value="Save changes">
        </form>
      </div>
      <div class="middle-content" id="emails">
        <h3>Emails</h3>
      </div>

      <div id="preference">
        <div class="middle-content">
          <h2>Delete Your Account</h2>
          <h3>We are sorry to see you go.</h3>
          <br>
          <h4>Before you go...</h4>
          <p>* If you're sick of getting email notifications from us, you can disable them here.
            <br><br>* If you want to change your username, you can do that here.
            <br><br>* Account deletion is final. There will be no way to restore your account. </p>
          <div class="btn">
            <a class="left-btn" href="<%=request.getContextPath()%>/viewprofile">
              <span>Keep my account</span>
            </a>
            <a class="right-btn" href="#">
              <span>Delete my account</span>
            </a>
          </div>

        </div>
      </div>
    </div>

  </div>
  <div class="footer">
    <p>All rights reserved � 2020  Construct360<sup>0</sup>.com<br>Design: Epic code</p>
  </div>
</body>

</html>