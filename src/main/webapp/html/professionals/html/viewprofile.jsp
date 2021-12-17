<%@ page import="com.example.construct360deg.model.Viewprofile" %>
<%@ page import="java.util.ArrayList" %>
<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<%
    ArrayList<Viewprofile> addsummary= (ArrayList<Viewprofile>) request.getAttribute("summary");
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
        <img src="./html/professionals/resources/images/viewprofile/user2.png" class="user">
        <a href="<%=request.getContextPath()%>/editprofile"><i class="fa fa-pencil-alt"></i></a>
        <h2>Robert Johns</h2>
        <p>Expert Consultant:Upscale Commercial/Residential
        <br>Construction, Architectural Concreate, Masonry,Foundation
        Award Winner<br>Colombo District, Western, Sri Lanka.</p>
        <a href="#" class="button">Message</a>
      </div>

      <div class="box2">
        <a href="#"><i class="fa fa-camera"></i></a>
          <h3>About</h3>

          <%for (Viewprofile x:addsummary){%>
             <p><%=x.getSummaryText()%></p>
          <% }%>

        <div class="summary" id="popup">
            <div class="button" onclick="popup()">Add summary</div>
          <div class="content">
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



      </div>

      <div class="box3">
          <i class="fa fa-shopping-bag"></i>
          <h3>Experience</h3>
          <p>Add past positions to find new career opportunities or to reconnect with your past colleagues</p>
          <a href="#" class="button">Add experience</a>

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