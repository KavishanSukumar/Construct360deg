<%@ page import="java.util.ArrayList" %>
<%--<%@ page import="com.example.construct360deg.model.Newproject" %>--%>
<%@ page import="com.example.construct360deg.model.Project" %>
<%@ page import="com.example.construct360deg.model.Chat" %>
<!DOCTYPE html>
<html lang="en">
<%
    int userid= (int) session.getAttribute("userid");
%>
<%
    Project project = (Project) request.getAttribute("closeprojects");
    ArrayList<Project> newprojects = (ArrayList<Project>) request.getAttribute("newprojects");
    ArrayList<Chat> chats= (ArrayList<Chat>) request.getAttribute("chats");
%>

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
            $("#chatbox-btn").removeClass("active");
            $("#viewproject").css("display","block");
            $("#chatbox").css("display","none");
          });
          $("#chatbox-btn").click(function (){
            $(this).addClass("active");
            $("#home-btn").removeClass("active");
            $("#viewproject").css("display","none");
            $("#chatbox").css("display","block");
          });

            var receiver=null;
            var name=null;

            $(".chatuser").click(function (){
                receiver=this.id;
                chatid="name"+receiver;
                name=document.getElementById(chatid).innerText;
                $("#chatname").empty();
                $("#chatname").append(name);
            });

            $("#send-btn").click(function (){
                var message= $("#message").val();
                $("#message").val('');
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
                                text+=data[i].datetime+" (Me):"+data[i].message+"&#13;&#10; &#13;&#10;";
                            }else{
                                text+=data[i].datetime+"     :"+data[i].message+"&#13;&#10; &#13;&#10;";
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
    function openproject(ele){
        var projectid=ele.id;
        location.href="<%=request.getContextPath()%>/myproject?projectid="+projectid;
    }
    function popupadd(){
        document.getElementById("viewproject").classList.toggle("active");
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
                <a href="#" id="chatbox-btn"><i class="fas fa-inbox"></i> Chatbox</a>
            </div>
            <div class="project" id="viewproject">
<%--                <div class="grid-item1">--%>
                    <div class="heading"><h2>Ongoing Projects</h2></div>
                    <%for (Project y:newprojects){%>
                    <div class="project1" style="cursor: pointer" onclick="openproject(this)" id=1>
                        <h3><%=y.getProjectname()%></h3>
                        <p style="color: red"><%=project.getDisplay()%></p>
                    </div>
                    <%}%>
<%--                </div>--%>
                <button onclick="popupadd()">Add Project</button>
                <div class="background"></div>
                <div class="new-content">
                    <div class="close-btn" onclick="popupadd()">&times;</div>
                    <form action="<%=request.getContextPath()%>/newproject" method="post">
                        <label for="new"> Add New Project :</label>
                        <input type="text" id="new" name="projectname">
                        <input type="submit" value="submit">
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
                            <%for (Chat x:chats){%>
                                <%if(x.getReceiver()==userid){
                                    continue;
                                }%>
                                <div class="chatuser" id="<%=x.getReceiver()%>">
                                    <%
                                        String name=null;
                                        if(x.getCustomerindividualName()!=null){
                                            name= x.getCustomerindividualName();
                                        }else if(x.getCustomercomname()!=null){
                                            name=x.getCustomercomname();
                                        }else if(x.getIndividualprof()!=null){
                                            name=x.getIndividualprof();
                                        }else {
                                            name=x.getProfessionalname();
                                        }
                                    %>
                                    <h4 id="name<%=x.getReceiver()%>"><%=name%></h4>
                                </div>
                            <%}%>
                        </div>
                    </div>
                    <div class="chat">
                        <div class="currentchatuser">
                            <h4 id="chatname"></h4>
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