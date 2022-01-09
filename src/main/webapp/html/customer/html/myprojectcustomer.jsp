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
    ArrayList<Graph> proposedGraph= (ArrayList<Graph>) request.getAttribute("proposedGraph");
    ArrayList<Graph> ongoingGraph=(ArrayList<Graph>) request.getAttribute("ongoingGraph");
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Project Customer</title>
    <link rel="stylesheet" href="./html/customer/resources/css/myproject-customer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="./html/customer/resources/js/jquery-3.6.0.js"></script>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <script>
        $(document).ready(function (){
            $("#displayproject-btn").click(function (){
                $(this).addClass("active");
                $("#chatbox-btn").removeClass("active");
                $("#uploadreq-btn").removeClass("active");
                $("#updatepayment-btn").removeClass("active");
                $("#closeproject-btn").removeClass("active");
                $("#deleteproject-btn").removeClass("active");
                $("#displayproject").css("display","flex");
                $("#uploadreq").css("display","none");
                $("#updatepayments").css("display","none");
                $("#closeproject").css("display","none");
                $("#viewproject").css("display","none");
                $("#chatbox").css("display","none");
                $("#update_payment").css("display","none");
            });
            $("#uploadreq-btn").click(function (){
                $(this).addClass("active");
                $("#displayproject-btn").removeClass("active");
                $("#chatbox-btn").removeClass("active");
                $("#updatepayment-btn").removeClass("active");
                $("#closeproject-btn").removeClass("active");
                $("#deleteproject-btn").removeClass("active");
                $("#uploadreq").css("display","block");
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
                $("#uploadreq-btn").removeClass("active");
                $("#deleteproject-btn").removeClass("active");
                $("#displayproject").css("display","none");
                $("#uploadreq").css("display","none");
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
                $("#uploadreq-btn").removeClass("active");
                $("#deleteproject-btn").removeClass("active");
                $("#displayproject").css("display","none");
                $("#uploadreq").css("display","none");
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
                $("#uploadreq-btn").removeClass("active");
                $("#closeproject-btn").removeClass("active");
                $("#displayproject").css("display","none");
                $("#uploadreq").css("display","none");
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
                $("#uploadreq-btn").removeClass("active");
                $("#closeproject-btn").removeClass("active");
                $("#displayproject").css("display","none");
                $("#uploadreq").css("display","none");
                $("#updatepayments").css("display","none");
                $("#closeproject").css("display","none");
                $("#viewproject").css("display","none");
                $("#chatbox").css("display","block");
                $("#update_payment").css("display","none");
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

            $('#addpaymentbtn').click(function(){
                var string="<hr><form action='<%=request.getContextPath()%>/uploadpayment' method='post' enctype='multipart/form-data'><input type='text' name='paymentname' placeholder='Enter the payment name'><input type='text' name='paymentamount' placeholder='Enter the payment amount'> <input type='file' name='paymentfile'><input type='hidden' name='payee' value=67 ><input type='hidden' name='payer' value=66><input type='hidden' name='projectid' value=1 ><button type='submit'>Submit</button></form><hr>";
                $('#newpayment').append(string);
            });

        });
        function popup(){
            document.getElementById("popup").classList.toggle("active");
        }
        // function popupdetails(){
        //     document.getElementById("displayproject").classList.toggle("active");
        // }

    </script>

</head>

<body>
<%@include file="sidebar-customer.jsp"%>
<div class="container">
    <div class="content1">
        <div class="name">
            <h2>Maharagama project two floors</h2>
        </div>
    </div>
    <div class="content2">
        <div class="home">
            <a href="#" class="active" id="displayproject-btn"><i class="fas fa-home"></i> Project Overview</a>
            <a href="#" id="uploadreq-btn"><i class="fas fa-home"></i> Upload requirements</a>
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
                        <br>If you want to remove the project, you must first close the project.</h3>
                    <div class="ok-btn" onclick="popup()">OK</div>
                </div>
            </div>
        </div>

        <div class="project" id="displayproject">
            <div class="grid-item1">
                <div class="box3" id="ongoing">
                </div>

                <div class="box4" id="proposed">
                </div>
            </div>
            <div class="grid-item2">
                <div class="box1">
                    <h2>Upcoming Events</h2>
                    <h3>Building</h3>
                    <p><%=project.getEvent1()%><br><%=project.getEvent2()%><br></p>
                    <h3>Landscaping</h3>
                    <p><%=project.getEvent3()%><br><%=project.getEvent4()%><br></p>
                    <h3>Another events</h3>
                    <p><%=project.getOther()%></p>
                </div>
                <div class="box2">
                    <h2>Project Members</h2>
                    <p> * Contractor : <%=project.getContractor()%><br> * Customer :<%=project.getCustomer()%><br> * Landscape Designer :<%=project.getLand()%></p>
                </div>
            </div>

        </div>

        <div class="project" id="uploadreq">

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
                        <div class="chatuser" id="67">
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
