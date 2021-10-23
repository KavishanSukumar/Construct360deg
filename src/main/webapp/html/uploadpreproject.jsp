<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Upload Previous Project</title>
  <link rel="stylesheet" href="./resources/css/uploadpreproject.css">
  <link rel="stylesheet" href="./resources/css/nav-bar-updated.css">
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
            <a href="#">Account</a>
            <a href="#">Qualifications</a>
            <a href="#">Emails</a>
            <a href="#">Appointments</a>
            <a href="#">Feedbacks</a>
            <a href="#" class="active">Previous Projects</a>
            <a href="#">Account security</a>
          </div>
      </div>
      <div class="form">
        <form action="<%=request.getContextPath()%>/uploadapreviousproject" method="post" enctype="multipart/form-data">
          <h3>Upload Previous Project</h3><br>
          <label for="Homeno">House Number: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="Homeno" name="HouseNumber">

          <label for="street">Street: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="street" name="street">

          <label for="city">City: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="city" name="city">

          <label for="district">District: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="district" name="district">

          <label for="province">Province: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="province" name="province">

          <label for="Rname">Reference Name: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="Rname" name="Rname">

          <label for="Rnum">Reference Contact Number: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="Rnum" name="Rnum">

          <label for="Remail">Reference Email: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="Remail" name="Remail">

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