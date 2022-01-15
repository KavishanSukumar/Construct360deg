<%@ page import="java.util.ArrayList" %>
<%--<%@ page import="com.example.construct360deg.model.Newproject" %>--%>
<%@ page import="com.example.construct360deg.model.Project" %>
<%@ page import="com.example.construct360deg.model.AllUsers" %>
<%@ page import="com.example.construct360deg.model.Requirement" %>
<%@ page import="com.example.construct360deg.model.Proposal" %>
<%@ page import="java.sql.Time" %>
<%@ page import="java.sql.Date" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<!DOCTYPE html>
<html lang="en">
<%
    int userid= (int) session.getAttribute("userid");
%>
<%
    Project project = (Project) request.getAttribute("closeprojects");
    ArrayList<Project> newprojects = (ArrayList<Project>) request.getAttribute("newprojects");

    ArrayList<AllUsers> allcustomers =(ArrayList<AllUsers>)request.getAttribute("allcustomers");
    ArrayList<Requirement> displayRequirement = (ArrayList<Requirement>)request.getAttribute("displayRequirement");
    ArrayList<Proposal> displayownproposals =(ArrayList<Proposal>)request.getAttribute("displayownproposals");



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
            $("#myproposals").removeClass("active");
            $("#proposals").css("display","none");
            $("#appointment-btn").removeClass("active");
            $("#viewproject").css("display","block");
            $("#chatbox").css("display","none");
            $("#appointment").css("display","none");
          });
          $("#chatbox-btn").click(function (){
            $(this).addClass("active");
            $("#home-btn").removeClass("active");
            $("#myproposals").removeClass("active");
            $("#proposals").css("display","none");
            $("#appointment-btn").removeClass("active");
            $("#viewproject").css("display","none");
            $("#chatbox").css("display","block");
            $("#appointment").css("display","none");
          });
          $("#appointment-btn").click(function (){
            $(this).addClass("active");
            $("#home-btn").removeClass("active");
            $("#chatbox-btn").removeClass("active");
            $("#myproposals").removeClass("active");
            $("#viewproject").css("display","none");
            $("#chatbox").css("display","none");
            $("#appointment").css("display","block");
            $("#proposals").css("display","none");
          });
        $("#myproposals").click(function (){
            $(this).addClass("active");
            $("#chatbox-btn").removeClass("active");
            $("#home-btn").removeClass("active");
            $("#appointment-btn").removeClass("active");
            $("#viewproject").css("display","none");
            $("#chatbox").css("display","none");
            $("#proposals").css("display","grid");
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
</head>

<div class="new-content" style="display: none" id="newcontent">
<%--    <button class="close-btn" onclick="popupformclose()">&times;</button>--%>
    <button class="close-btn" onclick="popupformclose()">X</button>
    <form action="<%=request.getContextPath()%>/newproject" method="post">
        <label for="new"> Add New Project :</label>
        <input type="text" id="new" name="projectname" required>
        <div class="terms">
            <input type="checkbox" required="">
            <label id="terms2"><a href="www.google.com" target="www.google.com">Accept the rules &amp; regulations</a></label>
        </div>
        <input id="proposalid" type="hidden" value="" name="proposalid">
        <input id="reqid"       type="hidden" value="" name="reqid">

        <input type="submit" value="submit">
    </form>
</div>



<body >

    <div class="container" id="blur">
        <%@include file="sidebar-professional.jsp"%>
        <div class="content1">
        <div class="name">
            <h3>Hi, Johns</h3>
            <p>Keep up the good work!</p>
        </div>
<%--        <form class="example" action="/action_page.java">--%>
<%--            <button type="submit"><i class="fa fa-search"></i></button>--%>
<%--            <input type="text" placeholder="Search your project..." name="search">--%>
<%--        </form>--%>
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

                <a href="#" id="myproposals"><i class="fas fa-file"></i></i> My proposals</a>

                <a href="#" id="appointment-btn"><i class="fas fa-inbox"></i> Appointments</a>

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
                            <div class="chatuser" id="66">
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
                                                 <a href="data:application/pdf;base64,<%=thereqfile%>" download="<%=reqfilename%>" style="font-size: 15px; margin-top: 0px"><i class="fas fa-file-archive"></i> <%=reqfilename%></a>

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
                                      <button id="makeproject" class="minibtn" onclick="popupform(<%=x.getProposalid()%>,<%=reqid%>)">Creat project</button>
                                    <%} else{%>
                                    <button id="makeproject" class="minibtn" id="createdproject">Project is created</button>
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

            <div class="project" id="appointment">

            </div>

        </div>

    </div>

    </div>
    <%@include file="../../footer.jsp"%>
</body>
<script>
    function popupform(porpid,reqid){
        var blur = document.getElementById("blur");
        blur.style.filter="blur(8px)";
        var con = document.getElementById("newcontent");
        con.style.display="block";
        var val1= document.getElementById("proposalid").value=porpid;
        var val2= document.getElementById("reqid").value=reqid;
        console.log("----------------------------------------------")
        console.log(porpid);
        console.log(val1);
        console.log(reqid);
        console.log(val2);
        console.log("----------------------------------------------")

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
</html>