<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CloseProject</title>
  <link rel="stylesheet" href="../resources/css/closeproject-professional.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
    <%@include file="sidebar-professional.jsp"%>
  <div class="container">
    <div class="content1">
      <div class="name">
          <h3>Hi, Johns</h3>
          <p>Keep up the good work!</p>
      </div>
      
      <form class="example" action="/action_page.java">
        <button type="submit"><i class="fa fa-search"></i></button>
        <input type="text" placeholder="Search your project..." name="search">
      </form>
      <div class="img">
        <img src="../resources/images/viewprofile/user2.png" class="user">
        <h3>Johns Robert</h3>
        <p>Contractor</p>
      </div>
    </div>
    <div class="content2">
      <div class="home">
        <a href="#"><i class="fas fa-home"></i> Home</a>
        <a href="#" class="active"><i class="fas fa-tasks"></i> My tasks</a>
        <a href="#"><i class="fas fa-inbox"></i> Chatbox</a>
      </div>
      <div class="project">
        <h2>  Close Project </h2>
        <div class="form">
        <form action="/action_page.php">
          <label for="pname">Project Name</label>
          <input type="text" id="pname" name="pname" placeholder="project name..">
      
          <label for="area">Reason for close the project</label>
          <textarea id="area" name="area" rows="8" cols="69">  Type your reason...
          </textarea>
          <input type="submit" value="Submit">
        </form>
        </div>
      </div>

    </div>
  </div>
    <div class="footer">
      <p>All rights reserved &copy; 2020  Construct360deg.com<br>Design: Epic code</p>
    </div>
  </body>

</html>