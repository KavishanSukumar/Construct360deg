<%@ page import="java.util.ArrayList" %>
<<<<<<< HEAD
<%@ page import="com.example.construct360deg.model.Project" %>
=======
<%@ page import="com.example.construct360deg.model.Closeproject" %>
<%@ page import="com.example.construct360deg.model.Requirement" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
>>>>>>> 6c432d84ce14665466493bedb9cb1824f247c420
<!DOCTYPE html>
<html lang="en">
<%
    int userid= (int) session.getAttribute("userid");
%>
<%
<<<<<<< HEAD
    Project project = (Project) request.getAttribute("closeprojects");
=======
    ArrayList<Closeproject> closeprojects = (ArrayList<Closeproject>) request.getAttribute("closeprojects");
    ArrayList<Requirement> requirements = (ArrayList<Requirement>) request.getAttribute("requirements");
>>>>>>> 6c432d84ce14665466493bedb9cb1824f247c420
%>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Project-Customer</title>
  <link rel="stylesheet" href="./html/customer/resources/css/viewproject-customer.css">
    <link rel="stylesheet" href="./html/customer/resources/css/chatbox.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="./resources/js/jquery-3.6.0.js"></script>
  <script>
      $(document).ready(function (){
          $("#home-btn").click(function (){
              $(this).addClass("active");
              $("#chatbox-btn").removeClass("active");
              $("#my-req-btn").removeClass("active");
              $("#viewproject").css("display","grid");
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
      function openproject(){
          location.href="<%=request.getContextPath()%>/myproject";
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
            <input type="submit" value="Upload">
            <!-- <input type="submit" value="Uplaod" style="float: right;"> -->
        </div>
    </form>
</div>
</div>

<%--+++++++++++++++++++++++++++++++++++ senal's req form end+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>


    <%@include file="sidebar-customer.jsp"%>
    <div class="container" id="blur">
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
            <img src="./html/customer/resources/images/viewprofile/user2.png" class="user">
            <h3>Kalum Perera</h3>
            <p>Customer</p>
        </div>
        </div>
        <div class="content2">
            <div class="home">
                <a href="#" class="active" id="home-btn"><i class="fas fa-home"></i> Home</a>
                <a href="#" id="chatbox-btn"><i class="fas fa-inbox"></i> Chatbox</a>
                <a href="#" id="my-req-btn"><i class="fas fa-file-alt"></i> My requirements</a>
            </div>
            <div class="project" id="viewproject">
                <div class="grid-item1">
                    <div class="heading"><h2>Ongoing Projects</h2></div>
                    <div class="project1" style="cursor: pointer" onclick="openproject()">
                        <h3>Maharagama project two floors </h3>
                        <p style="color: red"><%=project.getDisplay()%></p>
                    </div>
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
<%--  ########################################################################################################################          --%>
<%--            senal's part--%>
            <div class="project" id="my_reqs">
               <div class="my_requirements" id="my_requirements">

                   <div class="header">
                       <a href="#" id="creat-req-button" onclick="myfun()"><i class="far fa-plus-square"></i> Creat New Requirement</a>
                   </div>

                   <div class="item-container">
                       <%for(Requirement x:requirements){%>
                       <div class="item">
                           <div class="text">

                                    <table id="myreqtable">

                                        <tr>
                                            <td class=field-name" style="width: 30vh"><h3  class="h3header">Requirement name</h3></td>
                                            <td><%=x.getReqname()%></td>

                                        </tr>
                                        <tr>
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

                                    </table>
                           </div>
                           <div class="btns">
                               <button class="minibtns">Choose professional</button>
                               <button class="minibtns">Upload to public</button>
                               <button class="minibtns">Available proposals</button>
                               <button class="minibtns">Remove</button>
                           </div>
                       </div>
                       <%}%>
               </div>
            </div>
                <div id="output"></div>
            </div>

    </div>
        <%@include file="../../footer.jsp"%>
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
    }
</script>
</html>