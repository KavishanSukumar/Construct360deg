<%@ page import="com.example.construct360deg.model.PreviousProject" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="com.example.construct360deg.model.PreviousProject" %>

<!DOCTYPE html>
<html lang="en">
<%
    ArrayList<PreviousProject> projects= (ArrayList<PreviousProject>) request.getAttribute("projects");

%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Project Button</title>
    <link rel="stylesheet" href="./resources/css/addproject.css">
    <link rel="stylesheet" href="./resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
    <div class="container">
        <%@include file="sidebar.jsp"%>

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
                    <a href="#">Account</a>
                    <a href="#">Qualifications</a>
                    <a href="#">Emails</a>
                    <a href="#">Appointments</a>
                    <a href="#">Feedbacks</a>
                    <a href="#" class="active">Previous Projects</a>
                    <a href="#">Account preferences</a>
                </div>
            </div>
            <div class="form">
                <a href="<%=request.getContextPath()%>/uploadpreviousproject" class="button">Add Project</a>
                <%for (PreviousProject x: projects){%>
                        <%
                          String base64Encoded=null;
                          if(x.getImgBytes()==null){

                          }else{
                            byte[] bytes=x.getImgBytes();
                            byte[] encodeBase64= Base64.encodeBase64(bytes);
                            base64Encoded=new String(encodeBase64,"UTF-8");
                          }
                        %>
<%--                        <div class="profile">--%>

                          <div class="gallery">
<%--                          <a href="/uploadpreviousproject" class="button">Add Project</a>--%>
                              <a target="_blank" href="user4.jpg">
                              <img src="data:image/jpeg;base64,<%=base64Encoded%>" onerror="this.src='./resources/images/Avatar.png;'">
                            </a>
<%--                            <div class="desc"> <%=x.getProductName()%></div>--%>
                          </div>
<%--                          <div class="addtocart">--%>
<%--                            <button href="#">Order Now</button>--%>
<%--                            <button onclick="confirmation(this);" class="addtocart-btn" id="<%=x.getProductid()%>">Add to cart</button>--%>
<%--                          </div>--%>

            </div>
                        <%}%>

<%--                <a href="#" class="button">Add Project</a>--%>
<%--                <div class="gallery">--%>
<%--                    <a target="_blank" href="user4.png">--%>
<%--                        <img src='./resources/images/Avatar.png;' >--%>
<%--                    </a>--%>
<%--                </div>--%>

            </div>


        </div>
    </div><br>
    <div class="footer">
        <p>All rights reserved © 2020  Construct360<sup>0</sup>.com<br>Design: Epic code</p>
    </div>
</body>

</html>