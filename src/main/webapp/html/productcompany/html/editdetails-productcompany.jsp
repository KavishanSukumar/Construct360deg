<%@ page import="com.example.construct360deg.model.Account" %>
<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%
  Account account = (Account) request.getAttribute("accounts");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Details ProductCompany</title>
  <link rel="stylesheet" href="./html/productcompany/resources/css/editdetails-productcompany.css">
  <link rel="stylesheet" href="./html/productcompany/resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="./resources/js/jquery-3.6.0.js"></script>
  <script>
    $(document).ready(function (){
          $("#email-btn").click(function (){
            $(this).addClass("active");
            $("#preference-btn").removeClass("active");
            $("#account-btn").removeClass("active");
            $("#account").css("display","none");
            $("#emails").css("display","block");
            $("#preference").css("display","none");
          });
          $("#preference-btn").click(function (){
            $(this).addClass("active");
            $("#email-btn").removeClass("active");
            $("#account-btn").removeClass("active");
            $("#account").css("display","none");
            $("#emails").css("display","none");
            $("#preference").css("display","block");
          });
          $("#account-btn").click(function (){
            $(this).addClass("active");
            $("#email-btn").removeClass("active");
            $("#preference-btn").removeClass("active");
            $("#account").css("display","block");
            $("#emails").css("display","none");
            $("#preference").css("display","none");
          });
    });
  </script>
</head>
<body>
  <div class="container">
     <%@include file="sidebar-productcompany.jsp"%>

    <div class="content1">
      <form class="example" action="/action_page.java">
        <button type="submit"><i class="fa fa-search"></i></button>
        <input type="text" placeholder="Search.." name="search">
      </form>
      <div class="main">
        <a href="<%=request.getContextPath()%>/viewprofile"><i class="fa fa-home"></i></a>
        <a href="#"><i class="fa fa-mail-bulk"></i></a>
      </div>
    </div>
    <div class="content2">
      <div class="setting">
        <img src="./html/productcompany/resources/images/Addproduct/companyLogo.jpg">
        <a href="#"><i class="fa fa-camera"></i></a>
        <h3><%=account.getCompanyname()%></h3>
        <p>Your account</p>
        <div class="menu">
          <h4>Account Settings</h4>
          <a id="account-btn" class="active" href="#">Account</a>
          <a id="preference-btn" href="#">Account preferences</a>
        </div>

      </div>
      <div class="middle-content" id="account">
        <form action="<%=request.getContextPath()%>/account" method="post">
          <div class="col-1">
            <label for="cname">Company Name</label>
            <label for="pHomeno">Home Number</label>
            <label for="pstreet">Street</label>
            <label for="pcity">City</label>
            <label for="pdistrict">District</label>
            <label for="pprovince">Province</label>
            <label for="email">Email</label>
            <label for="contactnum">Contact Number</label>
          </div>
          <div class="col-2">
            <input type="text" id="cname" name="companyname" value="<%=account.getCompanyname()%>">
            <input type="text" id="pHomeno" name="houseno" value="<%=account.getHouseno()%>">
            <input type="text" id="pstreet" name="street" value="<%=account.getStreet()%>">
            <input type="text" id="pcity" name="city" value="<%=account.getCity()%>">
            <input type="text" id="pdistrict" name="district" value="<%=account.getDistrict()%>">
            <input type="text" id="pprovince" name="province" value="<%=account.getProvince()%>">
            <input type="text" id="email" name="email" value="<%=account.getEmail()%>">
            <input type="text" id="contactnum" name="contactno" value="<%=account.getContactno()%>">
          </div>
          <input type="submit" id="submit" value="Save changes">
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
            <a class="right-btn" href="#">
              <span>Delete my account</span>
            </a>
          </div>

        </div>
      </div>
    </div>

  </div>
  <div class="footer">
    <p>All rights reserved &copy; 2020  Construct360deg.com<br>Design: Epic code</p>
  </div>
</body>

</html>