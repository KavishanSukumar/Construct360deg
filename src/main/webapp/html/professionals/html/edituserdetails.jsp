<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.PreviousProject" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%

  ArrayList<PreviousProject> previousProjects= (ArrayList<PreviousProject>) request.getAttribute("previousProjects");

%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit User Details</title>
  <link rel="stylesheet" href="../resources/css/adddetails.css">
  <link rel="stylesheet" href="./resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="./resources/js/jquery-3.6.0.js"></script>
  <script>
    $(document).ready(function (){
          $("#email-btn").click(function (){
            $(this).addClass("active");
            $("#preproject-btn").removeClass("active");
            $("#preference-btn").removeClass("active");
            $("#account-btn").removeClass("active");
            $("#qualification-btn").removeClass("active");
            $("#account").css("display","none");
            $("#qualification").css("display","none");
            $("#emails").css("display","block");
            $("#preproject").css("display","none");
            $("#preference").css("display","none");
          });
          $("#preproject-btn").click(function (){
            $(this).addClass("active");
            $("#email-btn").removeClass("active");
            $("#preference-btn").removeClass("active");
            $("#account-btn").removeClass("active");
            $("#qualification-btn").removeClass("active");
            $("#account").css("display","none");
            $("#qualification").css("display","none");
            $("#emails").css("display","none");
            $("#preproject").css("display","block");
            $("#preference").css("display","none");
          });
          $("#preference-btn").click(function (){
            $(this).addClass("active");
            $("#email-btn").removeClass("active");
            $("#preproject-btn").removeClass("active");
            $("#account-btn").removeClass("active");
            $("#qualification-btn").removeClass("active");
            $("#account").css("display","none");
            $("#qualification").css("display","none");
            $("#emails").css("display","none");
            $("#preproject").css("display","none");
            $("#preference").css("display","block");
          });
          $("#account-btn").click(function (){
            $(this).addClass("active");
            $("#email-btn").removeClass("active");
            $("#qualification-btn").removeClass("active");
            $("#preproject-btn").removeClass("active");
            $("#preference-btn").removeClass("active");
            $("#account").css("display","block");
            $("#qualification").css("display","none");
            $("#emails").css("display","none");
            $("#preproject").css("display","none");
            $("#preference").css("display","none");
          });
          $("#qualification-btn").click(function (){
            $(this).addClass("active");
            $("#email-btn").removeClass("active");
            $("#account-btn").removeClass("active");
            $("#preproject-btn").removeClass("active");
            $("#preference-btn").removeClass("active");
            $("#qualification").css("display","block");
            $("#account").css("display","none");
            $("#emails").css("display","none");
            $("#preproject").css("display","none");
            $("#preference").css("display","none");
          });
          $("#addproject-btn").click(function (){
            $(this).addClass("active");
            $("#email-btn").removeClass("active");
            $("#account-btn").removeClass("active");
            $("#qualification-btn").removeClass("active");
            $("#preproject-btn").addClass("active");
            $("#preference-btn").removeClass("active");
            $("#account").css("display","none");
            $("#emails").css("display","none");
            $("#preproject").css("display","block");
            $("#preference").css("display","none");
          });
    });

    function myfunction(){
      var x = document.getElementById("uploadproject").innerHTML;
      document.getElementById("preproject").innerHTML = x;
    }
  </script>
</head>
<body>
  <div class="container">
    <%@include file="sidebar-professional.jsp"%>

    <div class="content1">
      <form class="example" action="/action_page.java">
        <button type="submit"><i class="fa fa-search"></i></button>
        <input type="text" placeholder="Search.." name="search">
      </form>
      <div class="main">
        <a href="#"><i class="fa fa-home"></i></a>
        <a href="#"><i class="fa fa-bell"></i></a>
        <a href="#"><i class="fa fa-mail-bulk"></i></a>
      </div>
    </div>
    <div class="content2">
      <div class="setting">
        <img src="./resources/images/viewprofile/user2.png">
        <a href="#"><i class="fa fa-camera"></i></a>
        <h3>Robert Johns</h3>
        <p>Your personal account</p>
        <div class="menu">
          <h4>Account Settings</h4>
          <a id="account-btn" class="active" href="#">Account</a>
          <a id="qualification-btn" href="#">Qualifications</a>
          <a id="email-btn" href="#">Emails</a>
          <a id="preproject-btn" href="#">Previous Projects</a>
          <a id="preference-btn" href="#">Account preferences</a>
        </div>

      </div>
      <div class="middle-content" id="account">
        <form action="/action_page.java">
          <label for="fname">First Name: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="fname" name="firstname" value="Robert">

          <label for="lname">Last Name: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="lname" name="lastname" value="Johns">

          <label for="bio">Bio: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="bio" name="bio" value="Expert Consultant:Upscale Commercial/ResidentialConstruction, Architectural Concreate, Masonry,Foundation Award Winner Colombo District, Western, Sri Lanka">

          <label for="nic">Nic Number: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="nic" name="nic" value="708240370v">

          <label for="email">E-mail: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="email" name="email" value="wpsJohns456@gmail.com">

          <label for="address">Address: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="address" name="address" value="No.22 boralasgamuwa road, Kaluthara North, Colombo.">

          <label for="contactnum">Contact Number: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="contactnum" name="contactnum" value="0763452789">

          <input type="submit" id="submit" value="Save changes">
        </form>
      </div>
      <div class="middle-content" id="qualification">
        <h3>Qualifications</h3>
      </div>
      <div class="middle-content" id="emails">
        <h3>Emails</h3>
      </div>

      <div class="middle-content" id="preproject">
            <%for (PreviousProject x:previousProjects){%>
              <%
                String base64Encoded=null;
                if(x.getImgBytes()==null){

                }else{
                  byte[] bytes = x.getImgBytes();
                  byte[] encodeBase64 = Base64.encodeBase64(bytes);
                  base64Encoded = new String(encodeBase64, "UTF-8");
                }
              %>
              <div class="gallery">
                <a target="_blank" href="user4.png">
                  <img src="data:image/jpeg;base64,<%=base64Encoded%>" onerror="this.src='./resources/images/Avatar.png;'" >
                </a>
                <p><%=x.getBuiltYear()%>-<%=x.getCity()%><br><%=x.getProvince()%></p>
              </div>
            <%}%>
            <button id="addproject-btn" onclick="myfunction()">Add Project</button>
      </div>

      <div class="middle-content" id="uploadproject">
        <form action="<%=request.getContextPath()%>/uploadpreviousproject" method="post" enctype="multipart/form-data">
          <h3>Upload Previous Project</h3><br>
          <label for="Homeno">House Number: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="Homeno" name="HouseNumber">

          <label for="street">Street: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="street" name="street">

          <label for="city">City: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="city" name="city">

          <label for="district">District: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="district" name="district">

          <label for="province">Province: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="province" name="province">

          <label for="Rname">Reference Name: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="Rname" name="Rname">

          <label for="Rnum">Reference Contact Number: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="Rnum" name="Rnum">

          <label for="Remail">Reference Email: <i class="fa fa-pencil-alt"></i></label>
          <input type="text" id="Remail" name="Remail">

          <label for="builtyear">Built Year: <i class="fa fa-pencil-alt"></i></label>
          <input type="number" id="builtyear" name="builtyear">

          <label for="img">Upload images:</label>
          <input type="file" id="img" name="img">
          <input type="submit" value="Submit">
        </form>
        </div>

      <div id="preference">
        <div class="middle-content">
          <h2>Delete Your Account</h2>
          <h3>We are sorry to see you go.</h3>
          <br>
          <h4>Before you go...</h4>
          <p>* If you're sick of getting email notifications from us, you can disable them here.
            <br><br>* If you want to change your username, you can do that here.
            <br><br>* Account deletion is final. There will be no way to restore your account. </p>
          <div class="btn">
            <a class="left-btn" href="<%=request.getContextPath()%>/viewprofile">
              <span>Keep my account</span>
            </a>
            <a class="right-btn" href="#">
              <span>Delete my account</span>
            </a>
          </div>

        </div>
      </div>
<%--      ----------------------%>
    </div>

  </div>
  <div class="footer">
    <p>All rights reserved © 2020  Construct360<sup>0</sup>.com<br>Design: Epic code</p>
  </div>
</body>

</html>