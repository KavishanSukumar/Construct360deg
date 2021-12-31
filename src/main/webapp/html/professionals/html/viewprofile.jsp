<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="com.example.construct360deg.model.*" %>
<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<%
    ArrayList<Viewprofile> addsummary= (ArrayList<Viewprofile>) request.getAttribute("summary");
    ArrayList<PreviousProject> previousProjects= (ArrayList<PreviousProject>) request.getAttribute("previousProjects");
    ArrayList<Experience> experiences = (ArrayList<Experience>) request.getAttribute("experiences");
    ArrayList<Skills> skills = (ArrayList<Skills>) request.getAttribute("skills");
    ArrayList<Account> accounts = (ArrayList<Account>) request.getAttribute("accounts");
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
    function popup(){
      document.getElementById("popup").classList.toggle("active");
    }
    function popupex(){
      document.getElementById("popupex").classList.toggle("active");
    }
    function popupskills(){
      document.getElementById("popupskills").classList.toggle("active");
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
        <%for (Account x:accounts){%>
        <h2><%=x.getFirstname()%> <%=x.getLastname()%></h2>
        <p><%=x.getBio()%></p>
        <%}%>
        <a href="#" class="button">Message</a>
      </div>

      <div class="box2">
        <a href="#"><i class="fa fa-camera"></i></a>
          <h3>About</h3>

        <div class="summary" id="popup">
            <div class="button" onclick="popup()">Add summary</div>
          <%for (Viewprofile x:addsummary){%>
              <p><%=x.getSummaryText()%></p>
          <%}%>

          <div class="background"></div>
          <div class="summarycontent">
              <div class="close-btn" onclick="popup()">&times;</div>
            <h3>Description</h3>
              <textarea class="description" id = "text">
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
          <div class="button" onclick="popupex()">Add Experience</div><br>

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
        <div class="skills" id="popupskills">
        <div class="button" onclick="popupskills()">Add Skills</div><br>

          <%for (Skills x:skills){%>
            <div class="gallery">
            <p>* <%=x.getSkill1()%></p>
              <p>* <%=x.getSkill2()%></p>
              <p>* <%=x.getSkill3()%></p>
              <p>* <%=x.getSkill4()%></p>
              <p>* <%=x.getSkill5()%></p>
              <p> <%=x.getOther()%></p>
            </div>
          <%}%>

          <div class="background"></div>
          <div class="skills-content">
            <div class="close-btn" onclick="popupskills()">&times;</div>
              <form action="<%=request.getContextPath()%>/skills" method="post">
                <h2>Add Your Skills :</h2>
                <label for="skill-1">Skill-1:</label>
                <input type="text" id="skill-1" name="skill1">

                <label for="skill-2">Skill-2: </label>
                <input type="text" id="skill-2" name="skill2">

                <label for="skill-3">Skill-3: </label>
                <input type="text" id="skill-3" name="skill3">

                <label for="skill-4">Skill-4: </label>
                <input type="text" id="skill-4" name="skill4">

                <label for="skill-5">Skill-5: </label>
                <input type="text" id="skill-5" name="skill5">

                <label for="other">Another skills: </label>
                <input type="text" id="other" name="other">
                <input type="submit" value="Save">
              </form>
          </div>
        </div>
      </div>

      <div class="box4">
        <h3>Contact</h3>
        <%for (Account x:accounts){%>
        <p>Email - <%=x.getEmail()%></p>
        <p>Tele - <%=x.getContactnum()%></p>
        <%}%>
      </div>
    </div>
  </div><br><br>
  <%@include file="../../footer.jsp"%>
</body>

</html>