<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delete Account</title>
  <link rel="stylesheet" href="../resources/css/deleteaccount.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<!-- header area start -->
    <div class="container">
        <%@include file="sidebar-customer.jsp"%>
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
            <img src="../resources/images/viewprofile/user2.png">
            <a href="#"><i class="fa fa-camera"></i></a>
             <h3>Robert Johns</h3>
             <p>Your personal account</p>
             <div class="menu">
              <h4>Account Settings</h4>
              <a href="#">Account</a>
              <a href="#">Emails</a>
              <a href="#">Appointments</a>
              <a href="#">Feedbacks</a>
              <a href="#">Previous Projects</a>
              <a class="active" href="#">Account security</a>
             </div>
          </div>
          <div class="form">
            <h1>Delete Your Account</h1>
            <h3>We are sorry to see you go.</h3>
            <br>
            <h4>Before you go...</h4>
            <p>* If you're sick of getting email notifications from us, you can disable them here.
                <br><br>* If you want to change your username, you can do that here.
            <br><br>* Account deletion is final. There will be no way to restore your account. </p>
            <div class="btn">
                <a class="left-btn" href="#">
                    <span>Keep my account</span>
                </a>
                <a class="right-btn" href="#">
                    <span>Delete my account</span>
                </a>
            </div>

          </div>
    </div>
    </div>
    <div class="footer">
      <p>All rights reserved © 2020  Construct360<sup>0</sup>.com<br>Design: Epic code</p>
    </div>
</body>

</html>