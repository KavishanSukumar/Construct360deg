<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.Project" %>
<%@ page import="com.example.construct360deg.model.Chat" %>
<%@ page import="java.sql.Time" %>
<%@ page import="java.sql.Date" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="com.example.construct360deg.model.*" %>

<!DOCTYPE html>
<html lang="en">
<%
    int userid= (int) session.getAttribute("userid");
%>
<%
    Project project = (Project) request.getAttribute("closeprojects");
    ArrayList<Project> newprojects = (ArrayList<Project>) request.getAttribute("newprojects");
    ArrayList<Chat> chats= (ArrayList<Chat>) request.getAttribute("chats");
    ArrayList<Appointment> appointments = (ArrayList<Appointment>) request.getAttribute("appointment");
    ArrayList<AllUsers> allcustomers =(ArrayList<AllUsers>)request.getAttribute("allcustomers");
    ArrayList<Requirement> displayRequirement = (ArrayList<Requirement>)request.getAttribute("displayRequirement");
    ArrayList<Proposal> displayownproposals =(ArrayList<Proposal>)request.getAttribute("displayownproposals");
    ArrayList<Requirement> displayRequirementonprof = (ArrayList<Requirement>)request.getAttribute("displayRequirementonprof");
    Account account = (Account) request.getAttribute("accounts");
    Account account1 = (Account) request.getAttribute("changepic");
%>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Project</title>
    <link rel="stylesheet" href="./html/professionals/resources/css/viewappoinment.css">
  <link rel="stylesheet" href="./html/professionals/resources/css/viewproject.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
  <script src="./resources/js/jquery-3.6.0.js"></script>

  <script src="./resources/js/calander.js"></script>

    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>

  <script>
    $(document).ready(function (){
          $("#home-btn").click(function (){
            $(this).addClass("active");
            $("#chatbox-btn").removeClass("active");
            $("#myproposals").removeClass("active");
            $("#proposals").css("display","none");
            $("#appointment-btn").removeClass("active");
            $("#cusreq").removeClass("active");
            $("#timeslot-btn").removeClass("active");
            $("#viewproject").css("display","block");
            $("#chatbox").css("display","none");
            $("#appointment").css("display","none");
            $("#arrived_cusreq").css("display","none");
            $("#timeslots").css("display","none");

          });
          $("#chatbox-btn").click(function (){
            $(this).addClass("active");
            $("#home-btn").removeClass("active");
            $("#myproposals").removeClass("active");
            $("#proposals").css("display","none");
            $("#appointment-btn").removeClass("active");
            $("#cusreq").removeClass("active");
            $("#timeslot-btn").removeClass("active");
            $("#viewproject").css("display","none");
            $("#chatbox").css("display","block");
            $("#appointment").css("display","none");
            $("#arrived_cusreq").css("display","none");
            $("#timeslots").css("display","none");

          });
          $("#appointment-btn").click(function (){
            $(this).addClass("active");
            $("#home-btn").removeClass("active");
            $("#chatbox-btn").removeClass("active");
              $("#timeslot-btn").removeClass("active");
            $("#myproposals").removeClass("active");
            $("#cusreq").removeClass("active");
            $("#viewproject").css("display","none");
            $("#chatbox").css("display","none");
            $("#appointment").css("display","block");
            $("#proposals").css("display","none");
            $("#arrived_cusreq").css("display","none");
            $("#timeslots").css("display","none");

          });
        $("#myproposals").click(function (){
            $(this).addClass("active");
            $("#chatbox-btn").removeClass("active");
            $("#timeslot-btn").removeClass("active");
            $("#home-btn").removeClass("active");
            $("#appointment-btn").removeClass("active");
            $("#cusreq").removeClass("active");
            $("#viewproject").css("display","none");
            $("#chatbox").css("display","none");
            $("#proposals").css("display","grid");
            $("#appointment").css("display","none");
            $("#arrived_cusreq").css("display","none");
            $("#timeslots").css("display","none");
        });
        $("#cusreq").click(function (){
            $(this).addClass("active");
            $("#chatbox-btn").removeClass("active");
            $("#home-btn").removeClass("active");
            $("#appointment-btn").removeClass("active");
            $("#myproposals").removeClass("active");
            $("#timeslot-btn").removeClass("active");
            $("#viewproject").css("display","none");
            $("#chatbox").css("display","none");
            $("#proposals").css("display","none");
            $("#appointment").css("display","none");
            $("#arrived_cusreq").css("display","grid");
            $("#timeslots").css("display","none");
        });
        $("#timeslot-btn").click(function (){
            $(this).addClass("active");
            $("#chatbox-btn").removeClass("active");
            $("#home-btn").removeClass("active");
            $("#appointment-btn").removeClass("active");
            $("#myproposals").removeClass("active");
            $("#cusreq").removeClass("active");
            $("#viewproject").css("display","none");
            $("#chatbox").css("display","none");
            $("#proposals").css("display","none");
            $("#appointment").css("display","none");
            $("#arrived_cusreq").css("display","none");
            $("#timeslots").css("display","grid");
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

            $("#addfield").click(function (){
                var proposalid=$("#proposalid").val();
                var fieldname=$("#fieldname").val();
                var fieldval=$("#fieldval").val();

               $.ajax({
                   url:"<%=request.getContextPath()%>/updateproposedgraph",
                   type:"POST",
                   data:{"proposalid":proposalid,"fieldname":fieldname,"fieldval":fieldval},
                   success:function (data){

                   }
               })
            })
    });
    function popup(){
        document.getElementById("popup").classList.toggle("active");
    }
    function openproject(project_id,cus_accept){
        var projectid=project_id;
        var cusaccept = cus_accept;
        if(cusaccept==1) {
            location.href = "<%=request.getContextPath()%>/myproject?projectid=" + projectid;
        }else{
            alert("Customer still not agreed to terms and conditions. Please wait...");
        }
    }
    function popupadd(){
        document.getElementById("viewproject").classList.toggle("active");
    }



  </script>
    <script type="text/javascript">
        $(document).ready(function (){
            $("#newappointment").click(function (){
                $("#newappointment").addClass("active");
                $("#confirmappointment").removeClass("active");
                $("#rejectedappointment").removeClass("active");
                $("#newappointments").css("display","block");
                $("#confirmappointments").css("display","none");
                $("#rejectedappointments").css("display","none");
            });
            $("#confirmappointment").click(function (){
                $("#newappointment").removeClass("active");
                $("#confirmappointment").addClass("active");
                $("#rejectedappointment").removeClass("active");
                $("#newappointments").css("display","none");
                $("#confirmappointments").css("display","block");
                $("#rejectedappointments").css("display","none");
            });
            $("#rejectedappointment").click(function (){
                $("#newappointment").removeClass("active");
                $("#confirmappointment").removeClass("active");
                $("#rejectedappointment").addClass("active");
                $("#newappointments").css("display","none");
                $("#confirmappointments").css("display","none");
                $("#rejectedappointments").css("display","block");
            });

        });
        function showhide() {
            const Div3 = document.getElementById("third");
            const Div2 = document.getElementById("second");
            const Div = document.getElementById("first");
            if (Div.style.display !== "none") {
                Div.style.display = "none";
                Div2.style.display = "block";
                Div3.style.display = "none";
            }else if (Div2.style.display !== "none") {
                    Div.style.display = "none";
                    Div2.style.display = "none";
                    Div3.style.display = "block";
            } else {
                Div3.style.display = "block";
            }
        }

    </script>
</head>

<div class="new-content" style="display: none" id="newcontent">
    <button class="close-btn" onclick="popupformclose()">X</button>
    <form action="<%=request.getContextPath()%>/newproject" method="post">
        <div id="first">
        <label for="new"><b>Project Name :</b></label>
        <input type="text" id="new" name="projectname" required>

        <label for="new"><b>Project Members</b></label><br><br>
        <label for="contractor">Contractor :</label>
        <input type="text" id="contractor" name="contractor">
        <label for="designer">Landscape Designer :</label>
        <input type="text" id="designer" name="landscape">
        <label for="customer">Customer :</label>
        <input type="text" id="customer" name="customer">

        <label for="address"><b>Project Address :</b></label>
        <input type="text" id="address" name="address" required>

        <label for="start"><b>Expected Starting Date :</b></label>
        <input type="date" id="start" name="starttime" required><br><br>

        <label for="end"><b>Expected Finishing Date :</b></label>
        <input type="date" id="end" name="finishtime" required><br><br>
            <button id="btn1" onclick="showhide()">Next</button>
        </div>
<%----------------------------------My proposal graph-------------------------------%>

        <div id="second" style="display: none">
            <h3>Proposed Graph</h3>
            <div id="proposed" style="width: 600px;height: 300px">

            </div>

            <label for="fieldname"><b>Field Name :</b></label>
            <input type="text" id="fieldname" name="fieldname">
            <br>
            <label for="fieldval"><b>Field Value :</b></label>
            <input type="number" id="fieldval" name="fieldval">
            <button type="button" name="addfield" id="addfield" onclick="addField()">Add Field</button>
            <button id="btn2" onclick="showhide()">Next</button>
        </div>
        <script>
            var xArray = [];
            var yArray = [];

            var data = [{
                x:xArray,
                y:yArray,
                type:"bar",
                orientation:"h",
                marker: {color:"rgba(255,0,0,0.6)"}
            }];

            var layout = {title:"Proposed Graph"};
            Plotly.newPlot("proposed", data, layout);

            function addField(){
                var proposalid=document.getElementById("proposalid").value;
                var fieldname=document.getElementById("fieldname");
                var fieldval=document.getElementById("fieldval");
                xArray.push(fieldval.value);
                yArray.push(fieldname.value);


                var data = [{
                    x:xArray,
                    y:yArray,
                    type:"bar",
                    orientation:"h",
                    marker: {color:"rgba(255,0,0,0.6)"}
                }];

                var layout = {title:"Proposed Graph"};
                Plotly.newPlot("proposed", data, layout);
            }
        </script>
<%----------------------------------------------------------------------------------%>
        <div id="third" style="display: none">
        <h3>Rules &  Regulations</h3>
        <div class="terms">
            <input type="checkbox" required="">
            <label id="terms2"><a href="www.google.com" target="www.google.com">Accept the rules &amp; regulations</a></label>
        </div>
        <input id="proposalid" type="hidden" value="" name="proposalid">
        <input id="reqid"       type="hidden" value="" name="reqid">

        <input id="cus_id" type="hidden" value="" name="cus_id">

        <input type="submit" value="submit">

        </div>

    </form>
</div>
<input type="hidden"  value="" name="reqid2" id="reqid2">
<%

%>


<%-- -------------------- upload proposal popup -----------------------------%>
<div class="filling" id="uploadproposal" style="display: none">
    <button id="close" onclick="mypopupclose()">X</button>
    <div class="img-area">
        <p id="title" style="align-content: center">Upload your proposal to </p>
        <p class="info" id="customername"></p>
        <img id="profimg" src="" onerror="this.src='./resources/images/Avatar.png;'" style="border-radius: 10px">
        <h2 class="info" id="custid1"> </h2>
    </div>

    <div class="up-area">
        <form class="proposal" method="post" action="<%=request.getContextPath()%>/sendproposal" enctype="multipart/form-data">
            <label class="a" id="desrip">Description :-</label><br>
            <textarea id="text" style="" name="description" required></textarea>
            <label class="a" for="uploadfile" id="up-proposal">Proposal :-</label>
            <input type="file" id="uploadfile" name="uploadfile"  multiple onchange="processSelectedFiles(this)"  required accept="application/pdf,application/zip"/><br>
            <label id="filetype">(Choose pdf or zip file)</label>
            <input type="hidden" value="" id="profid" name="profid">
            <input type="hidden" value="" id="cusid" name="cusid">
            <input type="hidden" value="" name="filename" id="filename">
            <input type="hidden"  value="" name="reqid3" id="reqid3">
            <div class="upload">
                <input id="submit" type="submit" value="Upload">
            </div>
            <%System.out.println("i am in the upload form end");%>
        </form>
    </div>

</div>
<%-- -------------------- end of  upload proposal popup -----------------------------%>



<%--<div class="new-content" style="display: none" id="graph" >--%>
<%--    <button class="close-btn" onclick="popupformclose()">X</button>--%>
<%--    <form action="<%=request.getContextPath()%>/newproject" method="post">--%>
<%--        <h3>Proposed Graph</h3>--%>
<%--        <input type="submit" id="next2-btn" value="Next" onclick="myfunction2()">--%>
<%--    </form>--%>
<%--</div>--%>
<%--<div class="new-content" style="display: none" id="rules" >--%>
<%--    <button class="close-btn" onclick="popupformclose()">X</button>--%>
<%--    <form action="<%=request.getContextPath()%>/newproject" method="post">--%>
<%--        <h3>Rules &  Regulations</h3>--%>
<%--                <div class="terms">--%>
<%--                    <input type="checkbox" required="">--%>
<%--                    <label id="terms2"><a href="www.google.com" target="www.google.com">Accept the rules &amp; regulations</a></label>--%>
<%--                </div>--%>
<%--                <input id="proposalid" type="hidden" value="" name="proposalid">--%>
<%--                <input id="reqid"       type="hidden" value="" name="reqid">--%>
<%--                <input id="cusid" type="hidden" value="" name="cusid">--%>
<%--        <input type="submit" value="Submit">--%>
<%--    </form>--%>
<%--</div>--%>





<body>
<%--<div class="viewappointment">--%>
<%--    <h1 id="appointmentid" style="text-align: center"></h1>--%>
<%--    <h2 id="customerid" style="text-align: left"></h2>--%>
<%--    <h3 id="timee" style="text-align: left"></h3>--%>
<%--    <h3 id="date" style="text-align: left"></h3>--%>
<%--    <h3 id="caption" style="text-align: left"></h3>--%>
<%--    <h3 id="messagee" style="text-align: left"></h3>--%>

<%--    <span><button class="btn" onclick="closeappointment(this)" style="text-align: right">Close</button>       <button class="btn" style="text-align: right">Print</button></span>--%>
<%--</div>--%>


    <div class="container" id="blur">
        <%@include file="sidebar-professional.jsp"%>
        <div class="content1">
        <div class="name">
            <h3>Hi, <%=account.getFirstname()%></h3>
            <p>Keep up the good work!</p>
        </div>
        <div class="img">
            <%
                String base64Encoded2=null;
                if (account1.getImgBytes()==null){

                }else {
                    byte[] bytes = account1.getImgBytes();
                    byte[] encodeBase64 = Base64.encodeBase64(bytes);
                    base64Encoded2 = new String(encodeBase64, "UTF-8");
                }
            %>
            <img src="data:image/jpeg;base64,<%=base64Encoded2%>" class="user">
            <h3><%=account.getFirstname()%> <%=account.getLastname()%></h3>
            <p>Contractor</p>
        </div>
        </div>
        <div class="content2">
            <div class="home">
                <a href="#" class="active" id="home-btn"><i class="fas fa-home"></i> Home</a>
                <a href="#" id="chatbox-btn"><i class="fas fa-inbox"></i> Chatbox</a>

                <a href="#" id="myproposals"><i class="fas fa-file"></i> My proposals</a>

                <a href="#" id="cusreq"><i class="fas fa-layer-group"></i> Received Requirements</a>


                <a href="#" id="appointment-btn"><i class="fas fa-calendar-check"></i> Appointments</a>
                <a href="#" id="timeslot-btn"><i class="fas fa-clock"></i> Make Time Slots</a>

            </div>
            <div class="project" id="viewproject">
<%--                <div class="grid-item1">--%>
                    <div class="heading"><h2>Ongoing Projects</h2></div>
                    <%for (Project y:newprojects){%>

                    <div class="project1" style="cursor: pointer" onclick="openproject(<%=y.getProjectid()%>,<%=y.getCusaccept()%>)" id=<%=y.getProjectid()%>>
                        <h3><%=y.getProjectname()%></h3>
                        <p style="color: red"><%=project.getDisplay()%></p>
                    </div>
                    <%}%>
<%--                </div>--%>
<%--                <button onclick="popupadd()">Add Project</button>--%>
                <div class="background"></div>
<%--                <div class="new-content">--%>
<%--                    <div class="close-btn" onclick="popupadd()">&times;</div>--%>
<%--                    <form action="<%=request.getContextPath()%>/newproject" method="post">--%>
<%--                        <label for="new"> Add New Project :</label>--%>
<%--                        <input type="text" id="new" name="projectname">--%>
<%--                        <input type="submit" value="submit">--%>
<%--                    </form>--%>
<%--                </div>--%>
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
            <div class="project" id="proposals" style="display: none">

                   <%for(Proposal x:displayownproposals){%>
                        <%
                            int cusid = x.getCusid();
                            System.out.println("============+++++++++++++++===============");
                            System.out.println(cusid);
                            Time time = null;
                            Date date = null;
                            byte[] reqfile = null;
                            String reqfilename = null;
                            byte[] cusprofimg = null;
                            String cususername = null;
                            String type = null;
                            String reqname = null;
                            int reqid = 0;

                        %>
                        <%for(AllUsers y:allcustomers){%>
                             <%if(y.getUserid()==cusid){%>
                               <%

                                   cusprofimg = y.getImgbytes();
                                   cususername = y.getCususername();
                                   System.out.println("********************************");
                                   System.out.println(cususername);
                                   System.out.println("********************************");

                               %>
                             <%}%>

                        <%}%>
                         <%for(Requirement z:displayRequirement){%>

                              <%if(x.getRequirementid()==z.getRequirementid()){%>
                                 <%
                                     reqid = z.getRequirementid();
                                     type = z.getType();
                                     reqfile = z.getRequirementfile();
                                     reqfilename = z.getFilename();
                                     reqname = z.getReqname();
                                     date = z.getReq_upload_date();
                                     time = z.getReq_upload_time();
                                 %>
                                <%


                                %>
                             <%}%>

                         <%}%>
                            <%
                                String cusimg=null;
                                if(cusprofimg==null){

                                }else{
                                    byte[] img = cusprofimg;
                                    byte[] realimg = Base64.encodeBase64(img);
                                    cusimg = new String(realimg, "UTF-8");
                                }
                            %>
                            <%
                                String thereqfile=null;
                                if(reqfile==null){

                                }else{
                                    byte[] req = reqfile;
                                    byte[] realreq = Base64.encodeBase64(req);
                                    thereqfile = new String(realreq, "UTF-8");
                                }
                            %>
                            <%
                                String proposal=null;
                                if(x.getProposal()==null){

                                }else{
                                    byte[] theproposal = x.getProposal();
                                    byte[] realtheproposal = Base64.encodeBase64(theproposal);
                                    thereqfile = new String(realtheproposal, "UTF-8");
                                }
                            %>



                    <div class="items-proposals">
                        <div class="items">
                            <div class="prof-details">
                                <h3 id="heading"><%=reqname%></h3>
                                <div class="test">
                                <div class="prof-img-area">
                                    <img  src="data:image/jpeg;base64,<%=cusimg%>" onerror="this.src='./resources/images/Avatar.png;'" style="; border-radius: 10px; width: 100px; height: 100px; margin-top: -3px;">

                                         <div class="info">
                                             <p class="mini-info"  id="name" style="font-size: 25px; margin-top: -7px; font-weight: bold"><%=cususername%></p>
                                             <p class="mini-info" id="time" style="margin-top: -22px;">on <%=date%> at <%=time%> </p>
                                             <p class="mini-info" id="tye" style="margin-top: -10px;">Type :- <%=type%> </p>
                                             <div class="reqfile" style="margin-top: -11px;">
                                                 <%
                                                     String extention1 = reqfilename.substring(reqfilename.lastIndexOf("."));
                                                     System.out.println(extention1);
                                                 %>
                                                 <%if(extention1.equals(".pdf")){%>
                                                 <a href="data:application/pdf;base64,<%=thereqfile%>" download="<%=reqfilename%>" style="font-size: 15px; margin-top: 0px"><i class="fas fa-file-pdf"></i> <%=reqfilename%></a>
                                                 <%}else {%>
                                                 <a href="data:application/zip;base64,<%=thereqfile%>" download="<%=reqfilename%>" style="font-size: 15px; margin-top: 0px"><i class="fas fa-file-archive"></i> <%=reqfilename%></a>

                                                 <%}%>
                                             </div>
                                         </div>
                                </div>


                            <div class="others">
                                <%
                                    String extention2 = x.getFilename().substring(x.getFilename().lastIndexOf("."));
                                    System.out.println(extention1);
                                %>
                                <%if(extention2.equals(".pdf")){%>
                               <p style="margin-top: 10px;font-size: 20px;">My proposal <a href="data:application/pdf;base64,<%=proposal%>" download="<%=x.getFilename()%>"><i class="fas fa-file-pdf"></i> <%=x.getFilename()%></a> </p>
                                <%}else {%>
                                <p style="margin-top: 10px;font-size: 20px;">My proposal <a href="data:application/pdf;base64,<%=proposal%>" download="<%=x.getFilename()%>"><i class="fas fa-file-archive"></i> <%=x.getFilename()%></a> </p>
                                <%}%>

                                <p style="font-size: 18px; margin-top: -10px;">You proposed on <%=x.getProposal_upload_date()%> at <%=x.getProposal_upload_time()%></p>
                            </div>
                            </div>
                            </div>
                            <div>
                                <div class="mini-btns">
                                <%if(x.getCustomeraccept()==0 && x.getCustomerreject()==0){%>
                                <button id="pending" class="minibtn">Pending...</button>
                                <%} else if(x.getCustomeraccept()==1 && x.getCustomerreject()==0){%>
                                <button id="accept" class="minibtn" >Accepted</button>
                                   <%if(x.getIsprojectcreated()==0) {%>
                                      <button id="makeproject" class="minibtn" onclick="popupform(<%=x.getProposalid()%>,<%=reqid%>,<%=cusid%>)">Create project</button>
                                    <%} else{%>
                                    <button id="makeproject2" class="minibtn" id="createdproject">Project is created</button>
                                    <%}%>
                                <%} else if(x.getCustomeraccept()==0 && x.getCustomerreject()==1){%>
                                <button id="reject" class="minibtn">Rejected</button>
                                <button id="remove" class="minibtn">Remove</button>
                                <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                <%}%>



        </div>

        <div class="project" id="arrived_cusreq" style="display: none">

            <%for(Requirement x:displayRequirementonprof){%>
            <%
                int profid = x.getProfid();
                int reqid = x.getRequirementid();
                byte[] reqfile = x.getRequirementfile();
                String reqfilename = x.getFilename();
                byte[] cusprofimg = null;
                String cususername = null;
                System.out.println("----- this is prof id ----"+x.getProfid());

            %>


            <%for(AllUsers y:allcustomers){%>
             <%if(y.getUserid()==x.getUseridcus()){%>

            <%

                cusprofimg = y.getImgbytes();
                cususername = y.getCususername();
                System.out.println("*************  new *******************");
                System.out.println(cususername);
                System.out.println("*************** new *****************");

            %>
            <%}%>

            <%}%>
            <%
                String cusimg=null;
                if(cusprofimg==null){

                }else{
                    byte[] img = cusprofimg;
                    byte[] realimg = Base64.encodeBase64(img);
                    cusimg = new String(realimg, "UTF-8");
                }
            %>
            <%
                String thereqfile=null;
                if(reqfile==null){

                }else{
                    byte[] req = reqfile;
                    byte[] realreq = Base64.encodeBase64(req);
                    thereqfile = new String(realreq, "UTF-8");
                }
            %>



            <div class="items-proposals">
                <div class="items">
                    <div class="prof-details">
                        <h3 id="heading1"><%=x.getReqname()%></h3>
                        <div class="test">
                            <div class="prof-img-area">
                                <img  src="data:image/jpeg;base64,<%=cusimg%>" onerror="this.src='./resources/images/Avatar.png;'" style="; border-radius: 10px; width: 118px; height: 122px; margin-top: -3px;">

                                <div class="info">
                                    <p class="mini-info"  id="name1" style="font-size: 25px; margin-top: -7px; font-weight: bold"><%=cususername%></p>
                                    <p class="mini-info" id="time1" style="margin-top: -22px;"><b>Requested on </b><%=x.getReq_upload_date()%> <b>at</b> <%=x.getReq_upload_time()%> </p>
                                    <p class="mini-info" id="type" style="margin-top: -10px;"><b>Type :-</b> <%=x.getType()%> </p>
                                    <p class="mini-info" id="location" style="margin-top: -10px;"><b>Location :- </b><%=x.getStreet()%>, <%=x.getCity()%></p>
                                    <div class="reqfile" style="margin-top: -11px;">
                                        <%
                                            String extention1 = reqfilename.substring(reqfilename.lastIndexOf("."));
                                            System.out.println(extention1);
                                        %>
                                        <%if(extention1.equals(".pdf")){%>
                                        <a href="data:application/pdf;base64,<%=thereqfile%>" download="<%=reqfilename%>" style="font-size: 15px; margin-top: 0px"><i class="fas fa-file-pdf"></i> <%=reqfilename%></a>
                                        <%}else {%>
                                        <a href="data:application/zip;base64,<%=thereqfile%>" download="<%=reqfilename%>" style="font-size: 15px; margin-top: 0px"><i class="fas fa-file-archive"></i> <%=reqfilename%></a>

                                        <%}%>
                                    </div>
                                </div>
                            </div>
                            <div class="others">
                                <p style="margin-top: 10px;font-size: 17px;"><b>Description : - </b><%=x.getDescription()%></p>
                            </div>
                        </div>
                    </div>
                    <div>


                        <%
                            int count = 0;
                            int profid1 = 0;
                            int reqid1 = 0;
                            for(Proposal y:displayownproposals) {
                                 profid1 = y.getProfid();
                                if (profid == y.getProfid()){
                                    reqid1 = y.getRequirementid();
                                    if (reqid == y.getRequirementid()) {
                                        count++;
                                    }
                                }

                          }
                            System.out.println("profid = " + profid +" "+profid1 +"reqid = " + reqid+" "+ reqid1);

                        %>
                        <div class="mini-btns">
                            <%if(count>0){%>
                            <button id="pending" class="minibtn" style="cursor: none; background-color: #1fa11f">Proposal sent</button>
                           <%}else{%>

                          <%if(x.getAccept()==0&&x.getReject()==0) {%>
                            <form style="display: inline"  action="<%=request.getContextPath()%>/rejectreq" method="post"><input type="hidden" >
<%--                                <button class="reject1" class="minibtn" onclick="rejectreq(<%=x.getRequirementid()%>,<%=x.getProfid()%>)">Reject</button>--%>
                                <button class="reject1" class="minibtn" onclick="">Reject</button>

                                <input type="hidden" value="<%=x.getRequirementid()%>" name="reqid">
                                <input type="hidden" value="<%=x.getProfid()%>" name="profid">
                                <input type="hidden" value="1" name="reject">

                            </form>

                            <button id="remove1" class="minibtn" onclick="senddata(<%=x.getRequirementid()%>,'<%=cusimg%>','<%=cususername%>')">Send a Proposal</button>



                          <%}else if(x.getAccept()==1){%>
                            <button id="pending" class="minibtn" style="cursor: none; background-color: #1fa11f">Proposal sent</button>
                          <%}else if(x.getReject()==1){%>
                            <button class="reject1" class="minibtn" style="cursor: none">You Rejected this Requirement</button>
                          <%}%>
                        <%}%>
                        </div>
                    </div>
                </div>
            </div>

            <%}%>

        </div>

        <div class="project" id="timeslots" style="display: none">


            <div id="container123">
                <div id="topic">
                    <h1 id="topic_name">Manage your time slots</h1>
                </div>
                <div id="cal">
                <div id="header">


                        <button id="backButton">Back</button>
                        <div id="monthDisplay"></div>
                        <button id="nextButton">Next</button>

                </div>

                <div id="weekdays">
                    <div>Sunday</div>
                    <div>Monday</div>
                    <div>Tuesday</div>
                    <div>Wednesday</div>
                    <div>Thursday</div>
                    <div>Friday</div>
                    <div>Saturday</div>
                </div>

                <div id="calendar"></div>
            </div>

            <div id="newEventModal">
                <h2>New Event</h2>

                <input id="eventTitleInput" placeholder="Event Title" />

                <button id="saveButton">Save</button>
                <button id="cancelButton">Cancel</button>
            </div>

            <div id="deleteEventModal">
                <h2>Event</h2>

                <p id="eventText"></p>

                <button id="deleteButton">Delete</button>
                <button id="closeButton">Close</button>
            </div>

            <div id="modalBackDrop"></div>

            </div>



        </div>


<%--            //////////////////////////////Appointment part//////////////////////////////////////////////--%>
            <div class="project" id="appointment">
                <div class="ordertypes">
                    <button class="active" id="newappointment">New Appointment</button>
                    <button id="confirmappointment">Confirmed Appointment</button>
                    <button id="rejectedappointment">Rejected Appointment</button>
                </div>

                <div class="ordertable" id="newappointments" >
                    <table class="logTable">
                        <thead>
                        <tr class="headrow">
                            <th class="appointmentid"><span>Appointment ID</span></th>
                            <th class="customerid"><span>Customerid</span></th>
                            <th class="time"><span>Time</span></th>
                            <th class="date"><span>Date</span></th>
                            <th class="caption"><span>Caption</span></th>
                            <th class="message"><span>Message</span></th>
                            <th class="appointmentstatus">Appointment status</th>
                        </tr>
                        </thead>
                        <tbody>
                                            <%for(Appointment a:appointments){%>
                                            <%if(a.getAppointmentstatus().equals("pending")){%>
                                            <tr id="<%=a.getAppoinmentid()%>" onclick="openappointment(this)" class="1stline">
                                                <td><%=a.getAppoinmentid()%></td>
                                                <td ><%=a.getCustomerid()%></td>
                                                <td ><%=a.getTime()%></td>
                                                <td ><%=a.getDate()%></td>
                                                <td ><%=a.getCaption()%></td>
                                                <td ><%=a.getMessage()%></td>
<%--                                                <td><%=a.getAppointmentstatus()%></td>--%>

                                                <td><button class="btn" onclick="acceptappointment(this)" id="<%=a.getAppoinmentid()%>">Accept</button> <button class="btn" onclick="appointmentreject(this)" id="<%=a.getAppoinmentid()%>">Reject</button></td>
                                            </tr>
                                            <%}%>
                                            <%}%>
                        </tbody>
                    </table>
                </div>

                <div class="ordertable" id="confirmappointments">
                    <table class="logTable">
                        <thead>
                        <tr class="headrow">
                            <th class="appointmentid"><span>Appointment ID</span></th>
                            <th class="customerid"><span>Customerid</span></th>
                            <th class="time"><span>Time</span></th>
                            <th class="date"><span>Date</span></th>
                            <th class="caption"><span>Caption</span></th>
                            <th class="message"><span>Message</span></th>
                        </tr>
                        </thead>
                        <tbody>
                                            <%for(Appointment a:appointments){%>
                                            <%if(a.getAppointmentstatus().equals("Confirmed")){%>
                                            <tr id="<%=a.getAppoinmentid()%>" onclick="openappointment(this)" class="1stline">
                                                <td><%=a.getAppoinmentid()%></td>
                                                <td ><%=a.getCustomerid()%></td>
                                                <td ><%=a.getTime()%></td>
                                                <td ><%=a.getDate()%></td>
                                                <td ><%=a.getCaption()%></td>
                                                <td ><%=a.getMessage()%></td>
                                            </tr>
                                            <%}%>
                                            <%}%>
                        </tbody>
                    </table>
                </div>

                <div class="ordertable" id="rejectedappointments">
                    <table class="logTable">
                        <thead>
                        <tr class="headrow">
                            <th class="appointmentid"><span>Appointment ID</span></th>
                            <th class="customerid"><span>Customerid</span></th>
                            <th class="time"><span>Time</span></th>
                            <th class="date"><span>Date</span></th>
                            <th class="caption"><span>Caption</span></th>
                            <th class="message"><span>Message</span></th>
                        </tr>
                        </thead>
                        <tbody>
                                            <%for(Appointment a:appointments){%>
                                            <%if(a.getAppointmentstatus().equals("Rejected")){%>
                                            <tr id="<%=a.getAppoinmentid()%>" onclick="openappointment(this)" class="1stline">
                                                <td><%=a.getAppoinmentid()%></td>
                                                <td ><%=a.getCustomerid()%></td>
                                                <td ><%=a.getTime()%></td>
                                                <td ><%=a.getDate()%></td>
                                                <td ><%=a.getCaption()%></td>
                                                <td ><%=a.getMessage()%></td>
                                            </tr>
                                            <%}%>
                                            <%}%>
                        </tbody>
                    </table>
                </div>

            </div>

    </div>

    </div>
    <%@include file="../../footer.jsp"%>
</body>
<script>
    function popupform(porpid,reqid,cusid){
        var blur = document.getElementById("blur");
        blur.style.filter="blur(8px)";
        var con = document.getElementById("newcontent");
        con.style.display="block";
        var val1= document.getElementById("proposalid").value=porpid;
        var val2= document.getElementById("reqid").value=reqid;
        var val3 = document.getElementById("cus_id").value=cusid;
    }
    function popupformclose(){
        var blur = document.getElementById("blur");
        blur.style.filter="none";
        var con = document.getElementById("newcontent");
        con.style.display="none";
    }
</script>
<script>

    console.log("------------------ new content ----------------------------")
    console.log(document.getElementById("proposalid").value);
    console.log(document.getElementById("reqid").value);
    console.log("----------------------------------------------")
</script>

<script>
    function acceptappointment(ele){
        var appointmentid = ele.id;
        var out=confirm("Do you want to accept the appointment!");
        if(out==true){
            var xHTTP = new XMLHttpRequest();
            xHTTP.open("POST","<%=request.getContextPath()%>/viewproject?task=1&appointmentid="+appointmentid,true);
            xHTTP.send();
            location="<%=request.getContextPath()%>/viewproject";
        }
    }

    function appointmentreject(ele){
        var appointmentid = ele.id;
        var out=confirm("Do you want to reject the appointment!");
        if (out==true){
            console.log("test2");
            var xHTTP=new XMLHttpRequest();
            xHTTP.open("POST","<%=request.getContextPath()%>/viewproject?task=0&appointmentid="+appointmentid,true);
            console.log("texxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
            xHTTP.send();
            location="<%=request.getContextPath()%>/viewproject";
            console.log("Hello2");
        }
    }
    function rejectreq(reqid,profid){
        var reqid1 = reqid;
        var profid1 = profid;
        var out=confirm("Do you want to reject the Requirement!");
        if (out==true){
            console.log("test2");
            var xHTTP=new XMLHttpRequest();
            xHTTP.open("POST","<%=request.getContextPath()%>/rejectreq?reject=1&reqid="+reqid1+"&profid="+profid1,true);
            console.log("rejectreq function 1 ");
            xHTTP.send();
            console.log("rejectreq function 2");
            location="<%=request.getContextPath()%>/viewproject";

        }
    }
    function mypopupclose(){
        var filling =document.getElementById("uploadproposal");
        filling.style.display="none";
        var blur = document.getElementById("blur");
        blur.style.filter="none";
        var menubar = document.getElementById("menu_bar");
        menubar.style.filter="none";
    }
    function processSelectedFiles(fileInput) {
        let files = fileInput.files;
        let val = document.querySelector("#filename");

        for (let i = 0; i < files.length; i++) {
            val.value += files[i].name;
            console.log("============");
            console.log(val.value);
        }
    }
    function senddata(reqid,cusimg,cusname){
        var reqid1 = reqid;
        var cusname1 = cusname;

        console.log("========== reqid =================="+reqid1)
        var filling =document.getElementById("uploadproposal");
        filling.style.display="block";
        var blur = document.getElementById("blur");
        blur.style.filter="blur(8px)";

        var menubar = document.getElementById("menu_bar");
        menubar.style.filter="blur(8px)";

        // var cusimage = null;
        var cusid = 0;
        var profid = 0;
        var realcusimg = null;
        // var img = null;
        // var realimg = null;
        var filename = null;
        <%for(Requirement x:displayRequirementonprof){%>
        if(reqid1==<%=x.getRequirementid()%>){
            cusname="<%=x.getCusname()%>";
            <%--cusimage = "<%=x.getCusprofimg()%>";--%>
            cusid = "<%=x.getUseridcus()%>";
            profid = "<%=x.getProfid()%>";
            filename = "<%=x.getFilename()%>"

        }else{
            console.log("------------ error error error---------------");
        }
        // if(cusimage==null){
        //
        // }else{
        //     img = cusimage;
        //     realimg = Base64.encodeBase64(img);
        //     realcusimg = new String(realimg, "UTF-8");
        // }
        <%}%>
       console.log(cusname1+cusid+realcusimg+profid+filename+reqid1);
        document.getElementById("customername").innerHTML=cusname1;
        document.getElementById("custid1").innerHTML="Customer ID :- "+cusid;
        document.getElementById("profimg").source="data:image/jpeg;base64,cusimg"+cusimg;
        document.getElementById("cusid").value=cusid;
        document.getElementById("profid").value=profid;
        document.getElementById("filename").value=filename;
        document.getElementById("reqid3").value=reqid1;

       console.log(document.getElementById("cusid").value+" "+document.getElementById("profid").value+" "+document.getElementById("filename").value+" "+ document.getElementById("reqid2").value);


    }
    <%--function openappointment(ele){--%>
    <%--    var appointmentid=ele.id;--%>
    <%--    var customerid=null;--%>
    <%--    var time=null;--%>
    <%--    var date=null;--%>
    <%--    var caption=null;--%>
    <%--    var message=null;--%>

    <%--    <%for(Appointment a:appointments){%>--%>
    <%--    if(appointmentid==<%=a.getAppoinmentid()%>){--%>
    <%--        customerid=<%=a.getCustomerid()%>;--%>
    <%--        time="<%=a.getTime()%>";--%>
    <%--        date="<%=a.getDate()%>";--%>
    <%--        caption="<%=a.getCaption()%>";--%>
    <%--        message="<%=a.getMessage()%>";--%>
    <%--    }--%>
    <%--    <%}%>--%>
    <%--    document.getElementById("appointmentid").innerHTML=appointmentid;--%>
    <%--    document.getElementById("customerid").innerHTML="Customer Id:"+customerid;--%>
    <%--    document.getElementById("timee").innerHTML="Time:"+time;--%>
    <%--    document.getElementById("date").innerHTML="Date:"+date;--%>
    <%--    document.getElementById("caption").innerHTML="Caption:"+caption;--%>
    <%--    document.getElementById("messagee").innerHTML="Message:"+message;--%>

    <%--    var element1=document.getElementsByClassName("viewappointment");--%>
    <%--    var element2=document.getElementsByClassName("container");--%>

    <%--    for (var i=0;i<element1.length;i+=1){--%>
    <%--        element1[i].style.display = 'block';--%>
    <%--    }--%>
    <%--    for (var i=0;i<element2.length;i+=1){--%>
    <%--        element2[i].classList.add("blurer");--%>
    <%--    }--%>
    <%--}--%>

    <%--function closeappointment(ele){--%>
    <%--    var element3=document.getElementsByClassName("viewappointment");--%>
    <%--    var element4=document.getElementsByClassName("container");--%>

    <%--    for (var i=0;i<element3.length;i+=1){--%>
    <%--        element3[i].style.display = 'none';--%>
    <%--    }--%>

    <%--    for (var i=0;i<element4.length;i+=1){--%>
    <%--        element4[i].classList.remove("blurer");--%>
    <%--    }--%>
    <%--}--%>
</script>
<script>
    let nav = 0; //if we in a current month nav = 0  eg:- we in march so nav = 0, if we go previous month which is feb nav become -1,
                 // janauary nav = -2, april nav = 1, may nav= 2;
    let clicked = null;
    let events = localStorage.getItem('events') ? JSON.parse(localStorage.getItem('events')) : [];

    const calendar = document.getElementById('calendar');
    const newEventModal = document.getElementById('newEventModal');
    const deleteEventModal = document.getElementById('deleteEventModal');
    const backDrop = document.getElementById('modalBackDrop');
    const eventTitleInput = document.getElementById('eventTitleInput');
    const weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

    function openModal(date) {
        clicked = date;

        const eventForDay = events.find(e => e.date === clicked);

        if (eventForDay) {
            document.getElementById('eventText').innerText = eventForDay.title;
            deleteEventModal.style.display = 'block';
        } else {
            newEventModal.style.display = 'block';
        }

        backDrop.style.display = 'block';
    }

    function load() {
        const dt = new Date();

        if (nav !== 0) {
            dt.setMonth(new Date().getMonth() + nav);
        }

        const day = dt.getDate();
        const month = dt.getMonth();   // jan = 0 , feb = 1, ..... dec = 12
        const year = dt.getFullYear();

        const firstDayOfMonth = new Date(year, month, 1);
        const daysInMonth = new Date(year, month + 1, 0).getDate();

        const dateString = firstDayOfMonth.toLocaleDateString('en-us', {
            weekday: 'long',
            year: 'numeric',
            month: 'numeric',
            day: 'numeric',
        });
        const paddingDays = weekdays.indexOf(dateString.split(', ')[0]);

        document.getElementById('monthDisplay').innerText =
            `\${dt.toLocaleDateString('en-us', { month: 'long' })} \${year}`;

        calendar.innerHTML = '';

        for(let i = 1; i <= paddingDays + daysInMonth; i++) {
            const daySquare = document.createElement('div');
            daySquare.classList.add('day');

            const dayString = `\${month + 1}/\${i - paddingDays}/\${year}`;

            if (i > paddingDays) {

                daySquare.innerText = i - paddingDays;
                const eventForDay = events.find(e => e.date === dayString);
                if(i - paddingDays < day && nav === 0){
                    daySquare.style.opacity="0.5";
                    daySquare.style.backgroundColor="black";
                    daySquare.style.cursor="none";
                    daySquare.onclick="";
                    daySquare.style.color="white";
                }
                if (i - paddingDays === day && nav === 0) {
                    daySquare.id = 'currentDay';
                }

                if (eventForDay) {
                    const eventDiv = document.createElement('div');
                    eventDiv.classList.add('event');
                    eventDiv.innerText = eventForDay.title;
                    daySquare.appendChild(eventDiv);
                }

                daySquare.addEventListener('click', () => openModal(dayString));
            } else {
                daySquare.classList.add('padding');
            }

            calendar.appendChild(daySquare);
        }
    }

    function closeModal() {
        eventTitleInput.classList.remove('error');
        newEventModal.style.display = 'none';
        deleteEventModal.style.display = 'none';
        backDrop.style.display = 'none';
        eventTitleInput.value = '';
        clicked = null;
        load();
    }

    function saveEvent() {
        if (eventTitleInput.value) {
            eventTitleInput.classList.remove('error');

            events.push({
                date: clicked,
                title: eventTitleInput.value,
            });

            localStorage.setItem('events', JSON.stringify(events));
            closeModal();
        } else {
            eventTitleInput.classList.add('error');
        }
    }

    function deleteEvent() {
        events = events.filter(e => e.date !== clicked);
        localStorage.setItem('events', JSON.stringify(events));
        closeModal();
    }

    function initButtons() {
        document.getElementById('nextButton').addEventListener('click', () => {
            nav++;
            load();
        });

        document.getElementById('backButton').addEventListener('click', () => {
            nav--;
            if(nav<0){
                nav=0;
                load()
            }else{
                load();
            }


        });

        document.getElementById('saveButton').addEventListener('click', saveEvent);
        document.getElementById('cancelButton').addEventListener('click', closeModal);
        document.getElementById('deleteButton').addEventListener('click', deleteEvent);
        document.getElementById('closeButton').addEventListener('click', closeModal);
    }

    initButtons();
    load();
</script>
</html>