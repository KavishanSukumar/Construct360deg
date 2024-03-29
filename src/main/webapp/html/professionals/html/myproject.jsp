<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.Project" %>
<%@ page import="com.example.construct360deg.model.Graph" %>
<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java"%>
<!DOCTYPE html>
<html lang="en">
<%
    int userid= (int) session.getAttribute("userid");
%>
<%
    Project project = (Project) request.getAttribute("projects");
    int projectid = (int) request.getAttribute("projectid");
    ArrayList<Project> newprojects = (ArrayList<Project>) request.getAttribute("newprojects");
    ArrayList<Graph> proposedGraph= (ArrayList<Graph>) request.getAttribute("proposedGraph");
    ArrayList<Graph> ongoingGraph=(ArrayList<Graph>) request.getAttribute("ongoingGraph");
    if(Integer.parseInt(request.getParameter("projectid"))!=projectid){
        response.sendRedirect(request.getContextPath()+"/login");
    }
%>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Project</title>
<%--  <link rel="stylesheet" href="./html/professionals/resources/css/viewproject.css">--%>
  <link rel="stylesheet" href="./html/professionals/resources/css/myproject.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="./html/professionals/resources/js/jquery-3.6.0.js"></script>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
  <script>
    $(document).ready(function (){
            $("#displayproject-btn").click(function (){
                $(this).addClass("active");
                $("#chatbox-btn").removeClass("active");
                $("#updateproject-btn").removeClass("active");
                $("#updatepayment-btn").removeClass("active");
                $("#closeproject-btn").removeClass("active");
                $("#deleteproject-btn").removeClass("active");
                $("#displayproject").css("display","block");
                $("#updateproject").css("display","none");
                $("#updatepayments").css("display","none");
                $("#closeproject").css("display","none");
                $("#viewproject").css("display","none");
                $("#chatbox").css("display","none");
                $("#update_payment").css("display","none");
            });
            $("#updateproject-btn").click(function (){
                $(this).addClass("active");
                $("#displayproject-btn").removeClass("active");
                $("#chatbox-btn").removeClass("active");
                $("#updatepayment-btn").removeClass("active");
                $("#closeproject-btn").removeClass("active");
                $("#deleteproject-btn").removeClass("active");
                $("#updateproject").css("display","grid");
                $("#displayproject").css("display","none");
                $("#updatepayments").css("display","none");
                $("#closeproject").css("display","none");
                $("#viewproject").css("display","none");
                $("#chatbox").css("display","none");
                $("#update_payment").css("display","none");
            });
            $("#updatepayment-btn").click(function (){
                $(this).addClass("active");
                $("#chatbox-btn").removeClass("active");
                $("#displayproject-btn").removeClass("active");
                $("#closeproject-btn").removeClass("active");
                $("#updateproject-btn").removeClass("active");
                $("#deleteproject-btn").removeClass("active");
                $("#displayproject").css("display","none");
                $("#updateproject").css("display","none");
                $("#update_payment").css("display","block");
                $("#closeproject").css("display","none");
                $("#viewproject").css("display","none");
                $("#chatbox").css("display","none");
            });
            $("#closeproject-btn").click(function (){
                $(this).addClass("active");
                $("#chatbox-btn").removeClass("active");
                $("#displayproject-btn").removeClass("active");
                $("#updatepayment-btn").removeClass("active");
                $("#updateproject-btn").removeClass("active");
                $("#deleteproject-btn").removeClass("active");
                $("#displayproject").css("display","none");
                $("#updateproject").css("display","none");
                $("#updatepayments").css("display","none");
                $("#closeproject").css("display","block");
                $("#viewproject").css("display","none");
                $("#chatbox").css("display","none");
                $("#update_payment").css("display","none");
            });
            $("#deleteproject-btn").click(function (){
                $(this).addClass("active");
                $("#chatbox-btn").removeClass("active");
                $("#displayproject-btn").removeClass("active");
                $("#updatepayment-btn").removeClass("active");
                $("#updateproject-btn").removeClass("active");
                $("#closeproject-btn").removeClass("active");
                $("#displayproject").css("display","none");
                $("#updateproject").css("display","none");
                $("#updatepayments").css("display","none");
                $("#closeproject").css("display","none");
                $("#viewproject").css("display","block");
                $("#chatbox").css("display","none");
                $("#update_payment").css("display","none");
            });
            $("#chatbox-btn").click(function (){
                $(this).addClass("active");
                $("#displayproject-btn").removeClass("active");
                $("#deleteproject-btn").removeClass("active");
                $("#updatepayment-btn").removeClass("active");
                $("#updateproject-btn").removeClass("active");
                $("#closeproject-btn").removeClass("active");
                $("#displayproject").css("display","none");
                $("#updateproject").css("display","none");
                $("#updatepayments").css("display","none");
                $("#closeproject").css("display","none");
                $("#viewproject").css("display","none");
                $("#chatbox").css("display","block");
                $("#update_payment").css("display","none");
            });

            var receiver=<%=projectid%>;

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
                                text+=data[i].datetime+" "+"(Client)"+":"+data[i].message+"&#13;&#10;";
                            }
                        }
                        if(text!=''){
                            $("#messagearea").empty();
                            $("#messagearea").append(text);
                        }
                    }
                });
            },2000)

            $('#addpaymentbtn').click(function(){
                var string="<form action='<%=request.getContextPath()%>/uploadpayment' method='post' enctype='multipart/form-data'><input type='text' name='paymentname' placeholder='Enter the payment name'><input type='text' name='paymentamount' placeholder='Enter the payment amount'> <input type='file' name='paymentfile'><input type='hidden' name='payee' value=67 ><input type='hidden' name='payer' value=66><input type='hidden' name='projectid' value=1 ><button type='submit'>Submit</button></form>";
                $('#newpayment').append(string);
            });

    });
    function popup(){
        document.getElementById("popup").classList.toggle("active");
    }
    function popupdetails(){
        document.getElementById("displayproject").classList.toggle("active");
    }
    function UpdateGraph(){
        document.getElementById("updategraph").classList.toggle("activeupdate");
    }

  </script>
</head>

<body>
    <%@include file="sidebar-professional.jsp"%>
    <div class="container">
        <div class="content1">
            <%for (Project x:newprojects){%>
          <div class="name">
            <h2><%=x.getProjectname()%></h2>
          </div>
            <%}%>
        </div>
        <div class="content2">
            <div class="home">
                <a href="#" class="active" id="displayproject-btn"><i class="fas fa-home"></i> Project Overview</a>
                <a href="#" id="updateproject-btn"><i class="fas fa-home"></i> Update Project</a>
                <a href="#" id="updatepayment-btn"><i class="fas fa-home"></i> Update Payments</a>
                <a href="#" id="closeproject-btn"><i class="fas fa-home"></i> Close Project</a>
                <a href="#" id="deleteproject-btn" onclick="popup()"><i class="fas fa-home"></i> Delete Project</a>
                <a href="#" id="chatbox-btn"><i class="fas fa-inbox"></i> Chat box</a>
            </div>
            <div class="project" id="viewproject">
                <div class="deleteproject" id="popup">
                    <div class="background"></div>
                    <div class="content">
                        <h1>WARNING..!</h1>
                        <h3>You can't delete this project.
                            <br>You are currently working on this project.you have to complete project then you can remove the project.
                            <br>If you want you can close the project.</h3>
                        <div class="ok-btn" onclick="popup()">OK</div>
                    </div>
                </div>
            </div>

            <div class="project" id="displayproject">
                <div class="grid-item1">
                    <div class="box3" id="ongoing">
                    </div>
                    <button onclick="UpdateGraph()" class="update">Update</button>
                    <div class="box4" id="proposed">
                    </div>
<%--                ----------------------------------------------------------------------%>
                    <div class="updategraph" id="updategraph" >
                        <div class="overlay2"></div>
                        <div class="updatecontent">
                            <div class="close-btn1" onclick="UpdateGraph()">&times;</div>
                            <h1>Update Ongoing Graph</h1>
                            <form action="<%=request.getContextPath()%>/updategraph" method="post" class="updategraphform">
                                <label for="graphattribute">Graph Attribute:</label>
                                <select name="graphattribute" id="graphattribute" required>
                                    <option selected disabled>Select</option>
                                    <%for (Graph x:proposedGraph){%>
                                         <option value="<%=x.getGraphattribute()%>"><%=x.getGraphattribute()%></option>
                                    <%}%>
                                </select>
                                <br>
                                <label for="workinghours">Value(Working hours):</label>
                                <input type="number" step="0.1" id="workinghours" name="graphpoint" required>
                                <input type="hidden" name="projectid" value=<%=projectid%>>
                                <br>
                                <input type="submit">
                            </form>
                        </div>
                    </div>
<%--               --------------------------------------------------------------------------%>
                </div>
                <div class="grid-item2">
                    <div class="box1">
                        <h2>Upcoming Events</h2>
                        <h3>Building</h3>

                        <p><%=project.getEvent1()%><br><%=project.getEvent2()%><br></p>

                        <h3>Landscaping</h3>
                        <p><%=project.getEvent3()%><br><%=project.getEvent4()%><br></p>
<%
    System.out.println("this is project id="+projectid);
%>
                        <h3>Another events</h3>
                        <p><%=project.getOther()%></p>
                    </div>

                    <%for (Project z:newprojects){%>
                    <div class="box2">
                        <h2>Project Members</h2>
                        <p> * Contractor : <%=z.getContractor()%><br> * Customer :<%=z.getCustomer()%><br> * Landscape Designer :<%=z.getLandscape()%></p>
                        <h2>Another Members</h2>
                        <p>* <%=project.getMember1()%><br>* <%=project.getMember2()%><br>* <%=project.getMember3()%></p>
                    </div>
                    <%}%>
                </div>

                <button onclick="popupdetails()" class="addDetails">Add Details</button>
                <div class="background"></div>
                <div class="project-content">

                    <div class="close-btn" onclick="popupdetails()">&times;</div>
                    <form action="<%=request.getContextPath()%>/myproject" method="post">
                        <h2>Add your upcoming events :</h2>
                        <h3>Building</h3>
                        <label for="event1">Event-1:</label>
                        <input type="text" id="event1" name="event1" value="<%=project.getEvent1()%>">

                        <label for="event2">Event-2: </label>
                        <input type="text" id="event2" name="event2" value="<%=project.getEvent2()%>">

                        <h3>Landscaping</h3>
                        <label for="event3">Event-3: </label>
                        <input type="text" id="event3" name="event3" value="<%=project.getEvent3()%>">

                        <label for="event4">Event-4: </label>
                        <input type="text" id="event4" name="event4" value="<%=project.getEvent4()%>">

                        <label for="other">Another Events: </label>
                        <input type="text" id="other" name="other" value="<%=project.getOther()%>">

                        <h2>Add members :</h2>
                        <label for="member1"></label>
                        <input type="text" id="member1" name="member1" value="<%=project.getMember1()%>">
                        <label for="member2"></label>
                        <input type="text" id="member2" name="member2" value="<%=project.getMember2()%>">
                        <label for="member3"></label>
                        <input type="text" id="member3" name="member3" value="<%=project.getMember3()%>">
                        <input type="hidden" name="myprojectid" value="<%=projectid%>">
                        <input type="submit" value="Save">
                    </form>
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

            <div class="update_payment" id="update_payment">
                <div class="newpayment" id="newpayment">
                </div>
                <div>
                    <button class="ok-btn" id="addpaymentbtn" onclick="addpayment()">Add payment</button>
                </div>
            </div>

            <div class="project" id="closeproject">
                <h2>  Close Project </h2>
                <div class="form">
                    <form action="<%=request.getContextPath()%>/closeproject" method="post">
                        <label for="area">Reason for close the project</label>
                        <textarea id="area" name="reason" rows="8" cols="69" placeholder="Type your reason..." required></textarea><br><br>

                        <label for="pname">Type here "Project is Closed"</label>
                        <input type="text" id="pname" name="display" required>
                        <input type="hidden" id="projectid" value="<%=projectid%>" name="projectid">

                        <input type="submit" value="Submit">
                    </form>
                </div>
            </div>

            <div class="project" id="chatbox" style="padding: 0px 240px;">
                <div class="chat-box-container" id="chat-box-container">
                    <div class="chat">
                        <div class="currentchatuser">
                            <h4>My Chat</h4>
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
<script>
    var xArray =[];
    var yArray =[];
    <%for (Graph y:ongoingGraph){%>
    xArray.push(<%=y.getGraphpoint()%>)
    yArray.push("<%=y.getGraphattribute()%>")
    <%}%>
    var data = [{
        x:xArray,
        y:yArray,
        type:"bar",
        orientation:"h",
        marker: {color:"rgba(255,0,0,0.6)"}
    }];

    var layout = {title:"Ongoing Graph"};

    Plotly.newPlot("ongoing", data, layout);
</script>
<script>
    var xArray = [];
    var yArray = [];

    <%for (Graph y:proposedGraph){%>
    xArray.push(<%=y.getGraphpoint()%>)
    yArray.push("<%=y.getGraphattribute()%>")
    <%}%>

    var data = [{
        x:xArray,
        y:yArray,
        type:"bar",
        orientation:"h",
        marker: {color:"rgba(255,0,0,0.6)"}
    }];

    var layout = {title:"Proposed Graph"};

    Plotly.newPlot("proposed", data, layout);
</script>
</html>