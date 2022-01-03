<%@ page import="com.example.construct360deg.model.Advertise" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%ArrayList<Advertise> displayadds = (ArrayList<Advertise>) request.getAttribute("displayadds");%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing page</title>
    <link rel="stylesheet" href="./html/customer/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="./html/customer/resources/css/landingpage.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>



<div class="container">
<<<<<<< HEAD
    <%@include file="sidebar-customer.jsp"%>
=======
>>>>>>> 59fb4cba82a76c43a129aa604bdcdfc5f36117c2


    <%@include file="sidebar-customer.jsp"%>


    <div class="content">

      <div class="displyitems">
          <%for(Advertise x:displayadds){%>
          <%
              String base64Encoded1=null;
              if(x.getProfimg()==null){

              }else{
                  byte[] profimg = x.getProfimg();
                  byte[] realprofimg = Base64.encodeBase64(profimg);
                  base64Encoded1 = new String(realprofimg, "UTF-8");
              }
          %>
          <%
              String base64Encoded2=null;
              if(x.getAddimg()==null){

              }else{
                  byte[] addimg = x.getAddimg();
                  byte[] realaddimg = Base64.encodeBase64(addimg);
                  base64Encoded2 = new String(realaddimg, "UTF-8");
              }
          %>

          <div class="item">

<%--              <img src="./html/customer/resources/images/landingpage/home.jpg" style="width: 900px">--%>
              <div class="ad-header">
                  <img src="data:image/jpeg;base64,<%=base64Encoded1%>" onerror="this.src='./resources/images/Avatar.png;'"  class="profimg">
                  <h2 class="topic"><%=x.getHeadline()%></h2>
                  <h3 class="username"><%=x.getUsername()%></h3>


              </div>
              <div class="advertisement">
                  <img src="data:image/jpeg/png;base64,<%=base64Encoded2%>" onerror="this.src='./resources/images/ad_Error.jpg;'" class="ad-img">
                  <%

                      if(!x.getWeburl().equals("")){%>
                          <h3 class="web-url" >For more information :- <a href="url" ><%=x.getWeburl()%></a></h3>
                  <% }

                  %>

              </div>

           </div>
           <%}%>
      </div>
        <%@include file="../../footer.jsp"%>
    </div>

    </div>


</body>

</html>