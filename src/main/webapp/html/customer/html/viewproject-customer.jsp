<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Project-Customer</title>
  <link rel="stylesheet" href="../resources/css/viewproject-customer.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="../resources/js/jquery-3.6.0.js"></script>
  <script>
    $(document).ready(function (){
          $("#task-btn").click(function (){
            $(this).addClass("active");
            $("#chatbox-btn").removeClass("active");
            $("#home-btn").removeClass("active");
            $("#viewproject").css("display","none");
            $("#task").css("display","block");
            $("#chatbox").css("display","none");
          });
          $("#chatbox-btn").click(function (){
            $(this).addClass("active");
            $("#task-btn").removeClass("active");
            $("#home-btn").removeClass("active");
            $("#viewproject").css("display","none");
            $("#task").css("display","none");
            $("#chatbox").css("display","block");
          });
          $("#home-btn").click(function (){
            $(this).addClass("active");
            $("#task-btn").removeClass("active");
            $("#chatbox-btn").removeClass("active");
            $("#viewproject").css("display","grid");
            $("#task").css("display","none");
            $("#chatbox").css("display","none");
          });
    });
  </script>
</head>

<body>
    <%@include file="sidebar-customer.jsp"%>
    <div class="container">

        <div class="content1">
        <div class="name">
            <h3>Hi, Kalum</h3>
            <p>Keep up the good work!</p>
        </div>
        
        <form class="example" action="/action_page.java">
            <button type="submit"><i class="fa fa-search"></i></button>
            <input type="text" placeholder="Search your project..." name="search">
        </form>
        <div class="img">
            <img src="../resources/images/viewprofile/user2.png" class="user">
            <h3>Kalum Perera</h3>
            <p>Customer</p>
        </div>
        </div>
        <div class="content2">
            <div class="home">
                <a href="#" class="active" id="home-btn"><i class="fas fa-home"></i> Home</a>
                <a href="#" id="task-btn"><i class="fas fa-tasks"></i> My tasks</a>
                <a href="#" id="chatbox-btn"><i class="fas fa-inbox"></i> Chatbox</a>
            </div>
            <div class="project" id="viewproject">
                <div class="grid-item1">
                    <div class="heading"><h2>Ongoing Projects</h2></div>
                    <div class="project1"><h3>Project 1 </h3></div>
                    <div class="project2"><h3>Project 2 </h3></div>
                    <div class="project3"><h3>Project 3 </h3></div>
                    <div class="project4"><h3>Project 4 </h3></div>
                </div>
                <div class="grid-item2">
                    <div class="box1">
                        <h2>Upcoming Events</h2>
                    </div>
                    <div class="box2">
                        <h2>Project Members</h2>
                        <p>* You<br> * Johns Robert ( Contractor )<br> * Predeep Bandara ( Landscape Designer )</p>
                    </div>
                </div>
            </div>

            <div class="project" id="task">
                <a href="#" class="btn">Upload Requirements</a>
                <a href="#" class="btn">Update Payment Details</a>
                <a href="closeproject-professional.jsp" class="btn">Close Project</a>
                <a href="#" class="btn">Delete Project</a>
            </div>

            <div class="project" id="chatbox">
                <h2> Chatbox </h2>
            </div>




        </div>



    </div>
    <div class="footer">
      <p>All rights reserved © 2020  Construct360<sup>0</sup>.com<br>Design: Epic code</p>
    </div>
</body>

</html>