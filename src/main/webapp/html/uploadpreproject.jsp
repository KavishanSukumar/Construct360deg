<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Upload Previous Project</title>
  <link rel="stylesheet" href="../resources/css/uploadpreproject.css">
  <link rel="stylesheet" href="../resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
  <div class="container">
    <header class="menu_bar"> 
    <div class="left_area">
      <!--<h2 class="logoname">Construct360</h2>-->
      <img src="../resources/images/navbar/LoginLogo.png" id="logopic" sizes="100px">
    </div>
    <div class="right_area">
      <!-- <a href="#" id="logout_btn">Logout</a> -->
      <ul>
        <li><a href="#">HOME</a></li>
        <li><a href="#">SERVICES</a></li>
        <li><a href="#">PROJECT</a></li>
        <li><a href="#">CONTACT US</a></li>
        <li> <i class="fas fa-bars" id="sidebar_btn" onclick="document.querySelector('#nav').classList.toggle('hidden')"></i></li>
      </ul>
    </div>
    <div class="nav-panel hidden" id="nav">
      <ul>
        <div>
          <img src="../resources/images/navbar/sidebarpro.jpg" id="profile_image" alt="" onclick="click">
          <h4 id="profile_name" style="margin-top: -5px;">Reena</h4>
        </div>
        <!-- <a href="#"><i class="fas fa-laptop-house" id="house"></i><h4>Available Projects</h4></a> -->
        <a href="#"><i class="fas fa-hard-hat" id="hat"></i><h4>Projects</h4></a>
        <a href="#"><i class="fab fa-product-hunt" id="hunt"></i><h4>Products</h4></a>
        <a href="#"><i class="fas fa-user" id="user"></i><h4>Professionals</h4></a>
        <a href="#"><i class="fas fa-flag-checkered" id="chek"></i><h4>Report</h4></a>
        <a href="#"><i class="fas fa-headset" id="head"></i><h4>Help and Support</h4></a>
        <a href="#"><i class="fas fa-sign-out-alt" id="logout"></i><h4>Logout</h4></a>
      </ul>
    </div>
    </header>
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
          <a href="#" class="active">Previous Projects</a>
          <a href="#">Account security</a>
          </div>
      </div>
      <div class="form">
        <form action="/action_page.java">
          <h3>Upload Previous Project</h3><br>
          <label for="Homeno">House Number: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="Homeno" name="HouseNumber">

          <label for="area">Area: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="area" name="area">

          <label for="city">City: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="city" name="city">

          <label for="district">District: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="district" name="district">

          <label for="province">Province: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="province" name="province">

          <label for="Rname">Reference Name: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="Rname" name="Rname">

          <label for="Rnum">Reference Number: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="Rnum" name="Rnum">

          <label for="img">Upload images:</label>
          <input type="file" id="img" name="img">
          <input type="submit" value="Submit">
        </form>
      </div>
    </div>
  </div><br>
  <div class="footer">
    <p>All rights reserved © 2020  Construct360<sup>0</sup>.com<br>Design: Epic code</p>
  </div>
</body>

</html>