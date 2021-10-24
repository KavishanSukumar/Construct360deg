<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Project</title>
  <link rel="stylesheet" href="../resources/css/viewproject.css">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<div class="container">
      <%@include file="sidebar-professional.jsp"%>

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
      <a href="#" class="active"><i class="fas fa-home"></i> Home</a>
      <a href="#"><i class="fas fa-tasks"></i> My tasks</a>
      <a href="#"><i class="fas fa-inbox"></i> Inbox</a>
    </div>
    <div class="project">
      <div class="grid-item1">
        <div class="heading"><h2>Ongoing Projects</h2></div>
        <div class="project1"><h3>Project 1 <i class="fas fa-pen"></i></h3></div>
        <div class="project2"><h3>Project 2 <i class="fas fa-pen"></i></h3></div>
        <div class="project3"><h3>Project 3 <i class="fas fa-pen"></i></h3></div>
        <div class="project4"><h3>Project 4 <i class="fas fa-pen"></i></h3></div>
      </div>
      <div class="grid-item2">Project Members</div>
    </div>
  </div>
</div>
<div class="footer">
  <p>All rights reserved © 2020  Construct360<sup>0</sup>.com<br>Design: Epic code</p>
</div>
</body>

</html>