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


    <%@include file="sidebar-customer.jsp"%>


    <div class="content">
        <div class="column1">

        </div>
        <div class="column2">

        </div>

      <div class="displyitems">
          <%for(Advertise x:displayadds){%>

          <%if(x.getIsproduct()==0){%>
          <div class="item">
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
                  System.out.println("this is is product "+x.getIsproduct());
              %>

<%--              <img src="./html/customer/resources/images/landingpage/home.jpg" style="width: 900px">--%>
              <div class="ad-header">
                  <img src="data:image/jpeg;base64,<%=base64Encoded1%>" onerror="this.src='./resources/images/Avatar.png;'"  class="profimg">
                  <h2 class="topic" style="margin-left: 10px"><%=x.getHeadline()%></h2>
                  <h3 class="username" style="margin-left: 10px"><%=x.getUsername()%></h3>
                  <p class="datetime" style="grid-area: b2;margin-left: 10px;margin-top: 49px;">on <%=x.getTodaydate()%> at <%=x.getNowtime()%></p>
                    <br>

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

          <%}else{%>
          <div class="item">
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
                  System.out.println("this is is proguct "+x.getIsproduct());
              %>

              <%--              <img src="./html/customer/resources/images/landingpage/home.jpg" style="width: 900px">--%>
              <div class="ad-header">
                  <img src="data:image/jpeg;base64,<%=base64Encoded1%>" onerror="this.src='./resources/images/Avatar.png;'"  class="profimg">
                  <h2 class="topic" style="margin-left: 10px"><%=x.getHeadline()%></h2>
                  <h3 class="username" style="margin-left: 10px"><%=x.getUsername()%></h3>
                  <p class="datetime" style="grid-area: b2;margin-left: 10px;margin-top: 49px;">on <%=x.getTodaydate()%> at <%=x.getNowtime()%></p>
                  <br>

              </div>
              <div class="advertisement">
                  <img src="data:image/jpeg/png;base64,<%=base64Encoded2%>" onerror="this.src='./resources/images/ad_Error.jpg;'" class="ad-img">



              </div>

          </div>
          <% }%>


           <%}%>
      </div>
        <%@include file="../../footer.jsp"%>
    </div>

    </div>


</body>

</html>