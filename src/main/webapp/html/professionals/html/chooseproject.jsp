<!DOCTYPE html>
<html lang="en">
<%
    int userid= (int) session.getAttribute("userid");
%>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Choose Project</title>
<%--  <link rel="stylesheet" href="./html/professionals/resources/css/chooseproject.css">--%>
    <link rel="stylesheet" href="../resources/css/chooseproject.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="../resources/js/jquery-3.6.0.js"></script>
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

            var receiver=null;

            $(".chatuser").click(function (){
                receiver=this.id;
            });

            $("#send-btn").click(function (){
                var message= $("#message").val();
                $("#message").val('');
                console.log(message);
                console.log(receiver);
                $.ajax({
                    url:"<%=request.getContextPath()%>/chat",
                    type:"POST",
                    data:{"receiver":receiver,"message":message,"task":1},
                });
            });

            var myVar=setInterval(function (){
                var text='';
                $.ajax({
                    url:"<%=request.getContextPath()%>/chat",
                    type: "POST",
                    data:{"receiver":receiver,"task":0},
                    success:function (data){
                        for (let i in data){
                            if(data[i].sender==<%=userid%>){
                                text+=data[i].datetime+" (Me):"+data[i].message+"&#13;&#10;";
                            }else{
                                text+=data[i].datetime+" "+data[i].receiver+":"+data[i].message+"&#13;&#10;";
                            }
                        }
                        if(text!=''){
                            $("#messagearea").empty();
                            $("#messagearea").append(text);
                        }
                    }

                });
            },2000)
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

        <div class="img">
<%--            <img src="./html/professionals/resources/images/viewprofile/user2.png" class="user">--%>
                <img src="../resources/images/viewprofile/user2.png" class="user">
            <h3>Johns Robert</h3>
            <p>Contractor</p>
        </div>
        </div>
        <div class="content2">
            <div class="home">
                <a href="#" class="active" id="home-btn"><i class="fas fa-home"></i> My Projects</a>
                <a href="#" id="chatbox-btn"><i class="fas fa-inbox"></i> Chatbox</a>
            </div>
            <div class="project" id="viewproject">

            </div>

            <div class="project" id="chatbox">
                <div class="chat-box-container" id="chat-box-container">
                    <div class="users">
                        <div class="searcharea">
                            <input type="text" class="searchbar"><i class="fa fa-search" aria-hidden="true" id="search"></i>
                        </div>
                        <div class="chatarea">
                            <div class="chatuser" id="64">
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
                            <textarea id="messagearea" style="width: 744px; height: 378px;" disabled></textarea>
                        </div>
                        <div class="currentchattextbox">
                            <input type="text" class="chatbar" id="message"><button class="fa fa-paper-plane" aria-hidden="true" id="send-btn"></button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

  <%@include file="../../footer.jsp"%>
</body>

</html>