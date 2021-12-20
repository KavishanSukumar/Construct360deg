<%@ page import="com.example.construct360deg.model.Viewprofile" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.PreviousProject" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="com.example.construct360deg.model.Experience" %>
<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<%
    ArrayList<Viewprofile> addsummary= (ArrayList<Viewprofile>) request.getAttribute("summary");
%>

<%
    ArrayList<PreviousProject> previousProjects= (ArrayList<PreviousProject>) request.getAttribute("previousProjects");
%>

<%
    ArrayList<Experience> experiences = (ArrayList<Experience>) request.getAttribute("experiences");
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Profile</title>
  <link rel="stylesheet" href="./html/professionals/resources/css/viewprofile.css">
  <link rel="stylesheet" href="./html/professionals/resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script>
    function popup(){
      document.getElementById("popup").classList.toggle("active");
    }

    function summaryData(){
      let summaryText= document.getElementById("text").value;
      console.log(summaryText);
      var out=confirm("You entered summary successfully");
      if(out==true) {
        console.log("test")
        var xHTTP = new XMLHttpRequest();
        xHTTP.open("POST", "<%=request.getContextPath()%>/viewprofile?task=summary&summaryText="+summaryText, true);
        xHTTP.send();
        location = "<%=request.getContextPath()%>/viewprofile";
        console.log("Hello1**********");
      }
    }

    function popupex(){
      document.getElementById("popupex").classList.toggle("active");
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
        <a href="#"><i class="fa fa-mail-bulk"></i></a>
      </div>
    </div>
    <div class="content2">
      <div class="box1">
        <img src="./html/professionals/resources/images/viewprofile/cover.png">

          <div class="profile-pic">
            <img src="./html/professionals/resources/images/viewprofile/user2.png" id="user">
              <input id="file" type="file">
            <label for="file" id="uploadbtn">Choose Photo</label>
          </div>

        <a href="<%=request.getContextPath()%>/editprofile"><i class="fa fa-pencil-alt"></i></a>
        <h2>Robert Johns</h2>
        <p>Expert Consultant:Upscale Commercial/Residential
        <br>Construction, Architectural Concreate, Masonry,Foundation
        Award Winner<br>Colombo District, Western, Sri Lanka.</p>
        <a href="#" class="button">Message</a>
      </div>
      <script>
        //declearing html elements
        const imgDiv = document.querySelector('.profile-pic');
        const img = document.querySelector('#user');
        const file = document.querySelector('#file');
        const uploadbtn = document.querySelector('#uploadbtn');

        //if user hover on img div
        imgDiv.addEventListener('mouseenter', function (){
          uploadbtn.style.display = "block";
        });

        //if we hover out from img div
        imgDiv.addEventListener('mouseleave', function (){
          uploadbtn.style.display = "none";
        });

        //lets work for image showing functionality when we choose an image to upload
        //when we choose a photo to upload
        file.addEventListener('change', function (){
          //this refers to file
          const choosedFile = this.files[0];

          if (choosedFile){
            const reader = new FileReader();//FileReader is a predefined function of JS
            reader.addEventListener('load', function (){
              img.setAttribute('src', reader.result);
            });
            reader.readAsDataURL(choosedFile);
          }
        });
      </script>

      <div class="box2">
        <a href="#"><i class="fa fa-camera"></i></a>
          <h3>About</h3>

          <%for (Viewprofile x:addsummary){%>
             <p>* <%=x.getSummaryText()%></p>
          <% }%>

        <div class="summary" id="popup">
            <div class="button" onclick="popup()">Add summary</div>
          <div class="background"></div>
          <div class="summarycontent">
              <div class="close-btn" onclick="popup()">&times;</div>
            <h3>Description</h3>
              <textarea class="description" id = "text" placeholder="You can write about your years of experience, industry or skills.
               Peoples also talk about their achievements or previous project experiences here....">

              </textarea>
            <div class="save-btn" onclick="summaryData()">Save</div>
          </div>
        </div>

          <h3>Previous Projects</h3>
          <p>Add external documents, photos or links.</p>

          <%for (PreviousProject x:previousProjects){%>
          <%
            String base64Encoded=null;
            if (x.getImgBytes()==null){

            }else {
              byte[] bytes = x.getImgBytes();
              byte[] encodeBase64 = Base64.encodeBase64(bytes);
              base64Encoded = new String(encodeBase64, "UTF-8");
            }
          %>

          <div class="gallery">
            <a target="_blank" href="user4.png">
              <img src="data:image/jpeg;base64,<%=base64Encoded%>" onerror="this.src='./html/professionals/resources/images/Avatar.png;'" >
            </a>
            <p><%=x.getBuiltYear()%>-<%=x.getCity()%><br><%=x.getProvince()%></p>
          </div>
          <%}%>
      </div>

      <div class="box3">
          <i class="fa fa-shopping-bag"></i>
          <h3>Experience</h3>
          <p>Add past positions to find new career opportunities or to reconnect with your past colleagues</p>

        <div class="experience" id="popupex">
          <div class="button" onclick="popupex()">Add experience</div><br>

          <%for (Experience x:experiences){%>
          <p>* I worked as a <%=x.getTitle()%> for <%=x.getYears()%> years in <%=x.getCompanyname()%> company in <%=x.getLocation()%>.</p>
          <%}%>

          <div class="background"></div>
          <div class="excontent">
            <div class="close-btn" onclick="popupex()">&times;</div>

            <form action="<%=request.getContextPath()%>/viewprofile" method="post">
              <h3>Add Experience</h3>
              <label for="title">Title:</label>
              <input type="text" id="title" name="title">

              <label for="comname">Company Name: </label>
              <input type="text" id="comname" name="comname">

              <label for="location">Location: </label>
              <input type="text" id="location" name="location">

              <label for="years">Number of years worked: </label>
              <input type="text" id="years" name="years">
              <input type="submit" value="Save">
            </form>

          </div>
        </div>

          <i class="fa fa-pencil-ruler"></i>
          <h3>Skills</h3>
          <p>Add skills to showcase your strengths, get your profile noticed by hiring customers</p>
          <a href="#" class="button">Add skills</a>
      </div>

      <div class="box4">
        <h3>Contact</h3>
        <p>Email - <a href="wpsJohns456@gmail.com">wpsJohns456@gmail.com</a></p>
        <p>LinkedIn - <a href="htttps://www.linkedin.com/in/robert-john-466278a1a5">htttps://www.linkedin.com/in/robert-john-466278a1a5</a></p>
      </div>
    </div>
  </div><br><br>
  <%@include file="../../footer.jsp"%>
</body>

</html>