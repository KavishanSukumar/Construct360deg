<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="com.example.construct360deg.model.*" %>
<!DOCTYPE html>
<html lang="en">
<%
    int userid= (int) session.getAttribute("userid");
%>
<%
    Project project = (Project) request.getAttribute("closeprojects");
    ArrayList<Requirement> requirements = (ArrayList<Requirement>) request.getAttribute("requirements");
    ArrayList<Chat> chats= (ArrayList<Chat>) request.getAttribute("chats");
    ArrayList<Project> newprojects = (ArrayList<Project>) request.getAttribute("newprojectscus");
    ArrayList<Proposal> proposals = (ArrayList<Proposal>) request.getAttribute("proposals");
    Account account = (Account) request.getAttribute("accounts");
    Account account1 = (Account) request.getAttribute("changepic");
%>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Project-Customer</title>
  <link rel="stylesheet" href="./html/customer/resources/css/viewproject-customer.css">
    <link rel="stylesheet" href="./html/customer/resources/css/chatbox.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="./resources/js/jquery-3.6.0.js"></script>
  <script>
      $(document).ready(function (){
          $("#home-btn").click(function (){
              $(this).addClass("active");
              $("#chatbox-btn").removeClass("active");
              $("#my-req-btn").removeClass("active");
              $("#viewproject").css("display","block");
              $("#chatbox").css("display","none");
              $("#my_reqs").css("display","none");
          });
          $("#chatbox-btn").click(function (){
              $(this).addClass("active");
              $("#home-btn").removeClass("active");
              $("#my-req-btn").removeClass("active");
              $("#viewproject").css("display","none");
              $("#my_reqs").css("display","none");
              $("#chatbox").css("display","block");
          });
          $("#my-req-btn").click(function (){
              $(this).addClass("active");
              $("#chatbox-btn").removeClass("active");
              $("#home-btn").removeClass("active");
              $("#viewproject").css("display","none");
              $("#chatbox").css("display","none");
              $("#my_reqs").css("display","block");
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
                              text+=data[i].datetime+" (Me):"+data[i].message+"&#13;&#10; &#13;&#10;";
                          }else{
                              text+=data[i].datetime+" "+data[i].receiver+":"+data[i].message+"&#13;&#10; &#13;&#10;";
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
      function openproject(cusaccept,theprojectid){
          var projectid=theprojectid;
          console.log(projectid);
          if(cusaccept==0){
               document.getElementById("newcontent").style.display="block";
               document.getElementById("blur").style.filter="blur(8px)";
               document.getElementById("projectid").value=theprojectid;
          }else {
              location.href = "<%=request.getContextPath()%>/myproject?projectid=" + projectid;
          }
      }

      function closepopup(){
          console.log("i am in");
          var blur = document.getElementById("blur");
          blur.style.filter="none"
          var content = document.getElementById("newcontent");
          content.style.display="none";
      }
  </script>
</head>



<body>
<%--+++++++++++++++++++++++++++++++++++ senal's req form +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>
<div class="filling" id="filling-form">
    <button id="close" onclick="mypopupclose()">X</button>
    <form class="details" action="<%=request.getContextPath()%>/uploadrequirement" method="post" enctype="multipart/form-data">
        <label for="reqname">Requirement<br>Name</label>
        <input type="text" id="reqname" name="reqname" style=" margin: auto; margin-left: 75px;" required><br><br>
        <label for="description">Description</label><br>
        <textarea id="description" name="description" rows="5" cols="10" required></textarea><br><br>
        <label for="type">Type</label>
        <select name="type" id="type">
            <option value="none" disabled >Select</option>
            <option value="building">Building</option>
            <option value="landscapeDesigning">Landscape design</option>
            <option value="Both">Both Building and Landscape design</option>
        </select><br><br>
        <label for="con-num">Contact Number</label>
        <input type="tel" id="con-num" name="contactnum" pattern="[0-9]{10}" required><br><br><br>
        <label for="reqfile">Requirement</label>
        <input type="file" id="reqfile" name="reqfile" multiple onchange="processSelectedFiles(this)" required accept="application/pdf,application/zip"><br>
        <input  type="hidden" id="filename" name="filename" value="">
        <label id="filetype">(Choose pdf or zip file)</label>
        <h4>Construction area</h4>
        <label for="street">Street</label>
        <input type="text" id="street" name="street" required><br><br>
        <label for="city">City</label>
        <input type="text" id="city" name="city" required><br><br>
        <label for="dis">District</label>
        <input type="text" id="dis" name="district" required><br><br>
        <label for="provin">Province</label>
        <input type="text" id="provin" name="province" required><br><br>
        <div class="uploadFile">
            <input type="submit" id="create" value="Create">
            <!-- <input type="submit" value="Uplaod" style="float: right;"> -->
        </div>
    </form>
</div>
<%--+++++++++++++++++++++++++++++++++++ senal's req form  end++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>
<%--+++++++++++++++++++++++++++++++++++ senal's available proposals ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>

<%--<div class="proposals" id="proposals" style="display: none">--%>
<%--    <div class="closebtninproposal"><button id="close2" onclick="mypopupclose2()">X</button></div>--%>
<%--    <div class="items-proposals">--%>
<%--        <div class="prof-details">--%>
<%--            <div class="prof-img">--%>
<%--                <img src="" style="width: 100px; height: 100px">--%>
<%--            </div>--%>
<%--             <div class="info">--%>
<%--                 <p class="mini-info"  id="name">name</p>--%>
<%--                 <p class="mini-info" id="time">time</p>--%>
<%--             </div>--%>
<%--        </div>--%>
<%--        <div class="descrip">--%>
<%--            <label for="poposal-descrip">Description</label><br>--%>
<%--            <input type="text" id="poposal-descrip" name="poposal-descrip" value="djnjdmkmdocskdcmoidm">--%>
<%--        </div>--%>
<%--        <div class="others">--%>
<%--           <div class="file">--%>
<%--               <a>file</a>--%>
<%--           </div>--%>
<%--           <div class="mini-btns">--%>
<%--               <button id="accept">Accept</button>--%>
<%--               <button id="reject">Reject</button>--%>
<%--           </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%--+++++++++++++++++++++++++++++++++++ senal's available proposals ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>

<%--+++++++++++++++++++++++++++++++++++ senal's customer sign  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>

<div class="new-content" style="display: none" id="newcontent">
    <%--    <button class="close-btn" onclick="popupformclose()">&times;</button>--%>
    <button class="close-btn" onclick="closepopup()">X</button>
    <form action="<%=request.getContextPath()%>/customeracceptproject" method="post">

        <div class="terms">
            <input type="checkbox" required="" id="checkbox">
            <label id="terms2"><a href="www.google.com" target="www.google.com" id="sentence"> I Accept with the rules &amp; regulations</a></label>
        </div>
        <input id="projectid" type="hidden" value="" name="projectid">

        <input type="submit" value="Submit">
    </form>
</div>

<%--+++++++++++++++++++++++++++++++++++ senal's customer sign end ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>







    <div class="container" id="blur">
        <%@include file="sidebar-customer.jsp"%>

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
            <p>Customer</p>
        </div>
        </div>
        <div class="content2">
            <div class="home">
                <a href="#" class="active" id="home-btn"><i class="fas fa-home"></i> Home</a>
<%--                <a href="#" id="chatbox-btn"><i class="fas fa-inbox"></i> Chatbox</a>--%>
                <a href="#" id="my-req-btn"><i class="fas fa-file-alt"></i> My requirements</a>
            </div>
            <div class="project" id="viewproject">
                <div class="heading"><h2>Ongoing Projects</h2></div>
                <div class="projects">
                    <%for(Project x:newprojects){%>
                    <%
                        System.out.println("888888888888888888888888888888888888888888888888888888888888888");
                        System.out.println(x.getProjectid());
                    %>

                    <div class="project1" style="cursor: pointer" onclick="openproject(<%=x.getCusaccept()%>,<%=x.getProjectid()%>)" >
                        <h3><%=x.getProjectname()%></h3>
<%--                        <p style="color: red"><%=project.getDisplay()%></p>--%>
                    </div>

                    <%}%>
                </div>
            </div>

<%--            <div class="project" id="chatbox">--%>
<%--                <div class="chat-box-container" id="chat-box-container">--%>
<%--                    <div class="chat">--%>
<%--                        <div class="currentchatuser">--%>
<%--                            <h4>Kavishan Sukumar</h4>--%>
<%--                        </div>--%>
<%--                        <div class="currentchat">--%>
<%--                            <textarea id="messagearea" style="width: 744px; height: 378px;" disabled></textarea>--%>
<%--                        </div>--%>
<%--                        <div class="currentchattextbox">--%>
<%--                            <input type="text" class="chatbar" id="message"><button class="fa fa-paper-plane" aria-hidden="true" id="send-btn"></button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--  ##############################################   senal's part   ###############################################################          --%>
<%--            senal's part--%>
            <div class="project" id="my_reqs">
               <div class="my_requirements" id="my_requirements">

                   <div class="header">
                       <a href="#" id="creat-req-button" onclick="myfun()"><i class="far fa-plus-square"></i> Create New Requirement</a>
                   </div>

                   <div class="item-container">
                       <%for(Requirement x:requirements){%>
                       <div class="item">
                           <div class="text">

                                    <table  class="styled-table">

                                        <tr>
                                            <td class=field-name" style="width: 30vh"><h3  class="h3header">Requirement name</h3></td>
                                            <td><%=x.getReqname()%></td>

                                        </tr>
                                        <tr class="active-row">
                                            <td class=field-name"><h3 class="h3header">Type</h3></td>
                                            <td><%=x.getType()%></td>

                                        </tr>

                                        <%
//                                            String extention = x.getFilename().split(("[.]"))[1];
                                           String extention = x.getFilename().substring(x.getFilename().lastIndexOf("."));
                                            System.out.println(extention);
                                        %>
                                        <%
                                            String base64Encoded1=null;
                                            if(x.getRequirementfile()==null){

                                            }else{
                                                byte[] reqfile = x.getRequirementfile();
                                                byte[] realreqfile = Base64.encodeBase64(reqfile);
                                                base64Encoded1 = new String(realreqfile, "UTF-8");
                                            }
                                        %>
                                        <% if(extention.equals(".pdf")){%>
                                                <tr>
                                                     <td class=field-name"><h3 class="h3header">File</h3></td>
                                                     <td><a href="data:application/pdf;base64,<%=base64Encoded1%>" download="<%=x.getFilename()%>"><i class="fas fa-file-pdf"></i> <%=x.getFilename()%></a></td>

                                                </tr>

                                        <% }else{%>
                                            <tr>
                                                     <td class=field-name"><h3 class="h3header">File</h3></td>
                                                     <td><a href="data:application/zip;base64,<%=base64Encoded1%>" download="<%=x.getFilename()%>"><i class="fas fa-file-archive"></i> <%=x.getFilename()%></a></td>

                                        </tr>

                                        <%}%>


                                        <tr>
                                            <td class=field-name"><h3 class="h3header">Location</h3></td>
                                            <td><%=x.getStreet()%>,<%=x.getCity()%></td>

                                        </tr>

                                    </table >
                           </div>
                           <div class="bigclass">
                               <%
                                   int option = 0;
                                   option = x.getRequirementid()+1;

                               %>

                           <i class="fa fa-angle-double-right" aria-hidden="true" title="Options" id="fa-bars1" onclick="document.getElementById('<%=x.getRequirementid()%>').classList.toggle('hidden')"></i>
<%--                           <h3 class="options active" id="option" style="cursor: pointer" onclick="document.getElementById('<%=x.getRequirementid()%>').classList.toggle('hidden')">Options</h3>--%>

                           <div class="btns hidden" id="<%=x.getRequirementid()%>">

                               <% if(x.getDisplay_on_prof()==0){%>
                               <form action="<%=request.getContextPath()%>/sendrequirement-public" method="post"><button class="minibtns" id="uploadtopublic">Upload to public</button>
                               <input type="hidden" value="<%=x.getRequirementid()%>" name="reqid">
                               <input type="hidden" value="<%=x.getDisplay_on_prof()%>" name="dis_on_prof">
                               <input type="hidden" value="<%=x.getReqname()%>" name="reqname">

                               </form>
                               <% }else{%>
                               <button class="minibtns" id="uploadtopublic2" style="cursor: none">Requirement is Uploaded  to public</button>
                               <%}%>
                               <form action="<%=request.getContextPath()%>/searchprofessionals" method="post">
                                   <button class="minibtns" id="chooseprof">Choose professional</button>
                                   <input type="hidden" value="<%=x.getRequirementid()%>" name="reqid">
                                   <input type="hidden" value="100" name="tag">
                               </form>
<%--                               <button class="minibtns" onclick="processAvailableProposals(<%=x.getRequirementid()%>)">Available proposals</button>--%>
                               <form action="<%=request.getContextPath()%>/availableproposals" method="get"><button class="minibtns" id="availableprop">Available proposals</button>
                                   <input type="hidden" value="<%=x.getRequirementid()%>" name="reqid">
                                   <input type="hidden" value="<%=x.getReqname()%>" name="reqname1">
                                   <%   System.out.println("-------------------------------------");
                                       System.out.println(x.getReqname());
                                       System.out.println("-------------------------------------");
                                   %>
                               </form>
                               <%
                                   int tag1 = 0; //to check empty arraylist
                                   for(Proposal a:proposals){
                                       if(x.getRequirementid()==a.getRequirementid()) {
                                           tag1++;
                                           System.out.println("==+++++++++++ array is empty +++++++++++++");
                                       }else{
                                           System.out.println("==+++++++++++ array is not empty +++++++++++++");
                                       }
                                   }

                                   int tag2 = 0;
                                   int tag3 = 0;
                                   for(Proposal a:proposals){
                                       if(a.getRequirementid()==x.getRequirementid()&&a.getCustomeraccept()==1){
                                         tag2++;
                                       }else{
                                           tag3++;
                                       }
                                   }
                               %>
                                  <%if(tag2>0){%>

                                  <%}else{%>
                                   <button class="minibtns" id="remove123" onclick="removereq(<%=tag1%>,<%=tag3%>,<%=x.getRequirementid()%>)">Delete</button>
                                  <%}%>

<%--                               <%if(tag2>0){%>--%>

<%--                               <%}else if(tag1==0){%>--%>
<%--                               <form action="<%=request.getContextPath()%>/deleteownreq" method="post">--%>
<%--                                   <button class="minibtns" id="remove123" onclick="removereq1()">Delete</button>--%>
<%--                                   <input type="hidden" value="<%=x.getRequirementid()%>" name="reqid">--%>
<%--                               </form>--%>
<%--                               <%}else if(tag3>0){%>--%>
<%--                               <form action="<%=request.getContextPath()%>/deleteownreq" method="post">--%>
<%--                                   <button class="minibtns" id="remove1234" onclick="removereq2()">Delete</button>--%>
<%--                                   <input type="hidden" value="<%=x.getRequirementid()%>" name="reqid">--%>
<%--                               </form>--%>
<%--                               <%}%>--%>
                           </div>
                           </div>
                       </div>
                       <%}%>
               </div>
            </div>
                <div id="output"></div>
            </div>
            <%@include file="../../footer.jsp"%>
<%--################################################################# end of senal's part########################################################--%>
    </div>

</body>
<script>
    function myfun(){
        var filling =document.getElementById("filling-form");
        filling.style.display="block";
        var blur = document.getElementById("blur");
        blur.style.filter="blur(8px)";
        var menubar = document.getElementById("menu_bar");
        menu_bar.style.filter="blur(8px)";

    }
    function mypopupclose(){
        var filling =document.getElementById("filling-form");
        filling.style.display="none";
        var blur = document.getElementById("blur");
        blur.style.filter="none";
        var menubar = document.getElementById("menu_bar");
        menu_bar.style.filter="none";
    }
    function processSelectedFiles(fileInput) {
        let files = fileInput.files;
        let val = document.querySelector("#filename");

        for (let i = 0; i < files.length; i++) {
            val.value += files[i].name;
            console.log("blajjncuans");
            console.log(val.value);
        }
        var uploadField = document.getElementById("reqfile");


            if(uploadField.files[0].size > 5242880){
                alert("File is too big!");
                uploadField.value = "";
            };

    }
    function processAvailableProposals(reqid){
       var displayprposals = document.getElementById("proposals");
        displayprposals.style.display="block";
        var blur = document.getElementById("blur");
        blur.style.filter="blur(8px)";
        blur.style.zIndex="0";
        var menu_bar = document.getElementById("menu_bar");
        menu_bar.style.filter="blur(8px)";
        var overflow = document.getElementById("my_reqs");
        overflow.style.overflowY="hidden";
    }
    function mypopupclose2(){
        var displayprposals = document.getElementById("proposals");
        displayprposals.style.display="none";
        var blur = document.getElementById("blur");
        blur.style.filter="none";
        var menubar = document.getElementById("menu_bar");
        menu_bar.style.filter="none";
    }
    function  removereq(tag1,tag3,reqid){

        console.log(tag1+" "+tag3+" "+reqid);
        if(tag1==0){
           var out = confirm("Do you want to delete this requirements");
           if (out==true){
               var xHTTP=new XMLHttpRequest();
               xHTTP.open("POST","<%=request.getContextPath()%>/deleteownreq?reqid="+reqid,true);
               console.log("deletereq function 1 ");
               xHTTP.send();
               console.log("deletereq function 2");
               location="<%=request.getContextPath()%>/viewproject";
               console.log("deletereq function 3");
               <%--location.href="<%=request.getContextPath()%>/deleteownreq?reqid="+reqid;--%>
           }
        } else if(tag3>0) {
            var out = confirm("Do you want to delete this requirements? \n Warrning! You have arrived proposals. Please check those before delete the requirement");
            if (out==true){
                var xHTTP=new XMLHttpRequest();
                xHTTP.open("POST","<%=request.getContextPath()%>/deleteownreq?reqid="+reqid,true);
                console.log("deletereq function 3 ");
                xHTTP.send();
                console.log("deletereq function 4");
                location="<%=request.getContextPath()%>/viewproject";
                <%--location.href="<%=request.getContextPath()%>/deleteownreq?reqid="+reqid;--%>
            }
        }
        var uploadField = document.getElementById("reqfile");

        uploadField.onchange = function() {
            if(this.files[0].size > 2097152){
                alert("File is too big!");
                this.value = "";
            };
        };




    }
    // function removereq1(){
    //     var out = confirm("Do you want to delete this requirements");
    // }
    // function removereq2(){
    //     var out = confirm("Do you want to delete this requirements? \n Warrning! You have arrived proposals. Please check those before delete the requirement");
    //
    // }
</script>
</html>