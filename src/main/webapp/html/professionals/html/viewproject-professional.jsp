<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Project</title>
  <link rel="stylesheet" href="./html/professionals/resources/css/viewproject.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="./resources/js/jquery-3.6.0.js"></script>
  <script>
    $(document).ready(function (){
          $("#home-btn").click(function (){
            $(this).addClass("active");
            $("#task-btn").removeClass("active");
            $("#chatbox-btn").removeClass("active");
            $("#viewproject").css("display","grid");
            $("#task").css("display","none");
            $("#chatbox").css("display","none");
            $("#updateproject").css("display","none");
            $("#closeproject").css("display","none");
          });
          $("#task-btn").click(function (){
            $(this).addClass("active");
            $("#chatbox-btn").removeClass("active");
            $("#home-btn").removeClass("active");
            $("#viewproject").css("display","none");
            $("#task").css("display","block");
            $("#chatbox").css("display","none");
            $("#updateproject").css("display","none");
            $("#closeproject").css("display","none");
          });
          $("#updateproject-btn").click(function (){
            $(this).addClass("active");
            $("#chatbox-btn").removeClass("active");
            $("#home-btn").removeClass("active");
            $("#task-btn").addClass("active");
            $("#viewproject").css("display","none");
            $("#updateproject").css("display","grid");
            $("#chatbox").css("display","none");
            $("#task").css("display","none");
            $("#closeproject").css("display","none");
          });
          $("#closeproject-btn").click(function (){
            $(this).addClass("active");
            $("#chatbox-btn").removeClass("active");
            $("#home-btn").removeClass("active");
            $("#task-btn").addClass("active");
            $("#viewproject").css("display","none");
            $("#updateproject").css("display","none");
            $("#chatbox").css("display","none");
            $("#task").css("display","none");
            $("#closeproject").css("display","block");
          });
          $("#chatbox-btn").click(function (){
            $(this).addClass("active");
            $("#task-btn").removeClass("active");
            $("#home-btn").removeClass("active");
            $("#viewproject").css("display","none");
            $("#task").css("display","none");
            $("#chatbox").css("display","block");
            $("#updateproject").css("display","none");
            $("#closeproject").css("display","none");
          });
    });
    function popup(){
        document.getElementById("popup").classList.toggle("active");
    }
  </script>
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
            <img src="./html/professionals/resources/images/viewprofile/user2.png" class="user">
            <h3>Johns Robert</h3>
            <p>Contractor</p>
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
                    <div class="project1"><h3>Maharagama project two floors </h3></div>
                </div>
                <div class="grid-item2">
                    <div class="box1">
                        <h2>Upcoming Events</h2>
                        <h3>Building</h3>
                        <p>Building Walls<br>Drainage System<br></p>
                        <h3>Landscaping</h3>
                        <p>Garden desingning<br>Sculpture implement<br></p>
                    </div>
                    <div class="box2">
                        <h2>Project Members</h2>
                        <p>* You<br> * Kalum Perera ( Customer )<br> * Predeep Bandara ( Landscape Designer )</p>
                    </div>
                </div>
            </div>

            <div class="project" id="task">
                    <button id="updateproject-btn" onclick="myfunction1()">Update Ongoing Projects</button>
                    <button id="updatepayment-btn" onclick="myfunction2()">Update Payment details</button>
                    <button id="closeproject-btn"  onclick="myfunction3()">Close Project</button>

                <div class="deleteproject" id="popup">
                    <button onclick="popup()">Delete Project</button>
                    <div class="content">
                        <h1>WARNING..!</h1>
                        <h3>You can't delete this project.
                            <br>You are currently working on this project.you have to complete project then you can remove the project.
                            <br>If you want to remove the project, you must first close the project.</h3>
                        <div class="ok-btn" onclick="popup()">OK</div>
                    </div>
                </div>
            </div>

            <div class="project" id="updateproject">
                        <div class="item1">
                            <img id="upload" alt="your image" width="200" height="200" />
                            <input type="file" onchange="document.getElementById('upload').src = window.URL.createObjectURL(this.files[0])">
                            <input type="submit" value="submit">
                            <form action="/action_page.java">
                                <input type="checkbox" id="box" name="box">
                                <label for="box">View All Bills,Images and Documents names have uploaded</label>
                            </form>
                        </div>
                        <div class="item2">
                            <div class="chart1">
                                <h3>Ongoing Projects Gannt Chart</h3>
                            </div>
                            <div class="chart2">
                                <h3>Propossed Gannt Chart</h3>
                            </div>
                        </div>
            </div>



            <div class="project" id="closeproject">
                <h2>  Close Project </h2>
                <div class="form">
                    <form action="/action_page.java">
                        <label for="pname">Project Name</label>
                        <input type="text" id="pname" name="pname" placeholder="project name..">
                        <label for="area">Reason for close the project</label>
                        <textarea id="area" name="area" rows="8" cols="69">  Type your reason...</textarea>
                        <input type="submit" value="Submit">
                    </form>
                </div>
            </div>


            <div class="project" id="chatbox">
                <div class="chat-box-container" id="chat-box-container">
                    <div class="users">
                        <div class="searcharea">
                            <input type="text" class="searchbar"><i class="fa fa-search" aria-hidden="true" id="search"></i>
                        </div>
                        <div class="chatarea">
                            <div class="chatuser">
                                <h4>Sukumar Kavishan</h4>
                                <p>Date:2021-06-10</p>
                            </div>
                            <div class="chatuser">
                                <h4>Senal Punsara</h4>
                                <p>Date:2021-05-19</p>
                            </div>
                            <div class="chatuser">
                                <h4>Imesh Udara</h4>
                                <p>Date:2021-04-20</p>
                            </div>
                            <div class="chatuser">
                                <h4>Chathuri Priyangika</h4>
                                <p>Date:2021-03-01</p>
                            </div>
                        </div>
                    </div>
                    <div class="chat">
                        <div class="currentchatuser">
                            <h4>Kavishan Sukumar</h4>
                        </div>
                        <div class="currentchat">

                        </div>
                        <div class="currentchattextbox">
                            <input type="text" class="chatbar"><i class="fa fa-paper-plane" aria-hidden="true" id="send-btn"></i>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

  <%@include file="../../footer.jsp"%>
</body>

</html>