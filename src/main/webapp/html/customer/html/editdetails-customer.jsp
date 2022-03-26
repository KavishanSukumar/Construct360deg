<%@page import="java.util.ArrayList" %>
<%@page import="com.example.construct360deg.model.PreviousProject" %>
<%@page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="com.example.construct360deg.model.Account" %>
<%@ page import="com.example.construct360deg.model.Project" %>
<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%
  Account account = (Account) request.getAttribute("accounts");
  Account account1 = (Account) request.getAttribute("changepic");
  ArrayList<Project> newprojects = (ArrayList<Project>) request.getAttribute("newprojects");
  int count = 0;


  for (Project x:newprojects){
    if(x.getIsclosed()==0){
      count++;
    }

  }
  System.out.println("count ="+count);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Details Customer</title>
  <link rel="stylesheet" href="./html/customer/resources/css/editdetails.css">
  <link rel="stylesheet" href="./html/customer/resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="./resources/js/jquery-3.6.0.js"></script>
  <script>
    $(document).ready(function (){
          $("#email-btn").click(function (){
            $(this).addClass("active");
            $("#preference-btn").removeClass("active");
            $("#account-btn").removeClass("active");
            $("#addproofbtn").removeClass("active");
            $("#account").css("display","none");
            $("#addprof").css("display","none");
            $("#emails").css("display","block");
            $("#preference").css("display","none");
          });
          $("#preference-btn").click(function (){
            $(this).addClass("active");
            $("#email-btn").removeClass("active");
            $("#account-btn").removeClass("active");
            $("#addproofbtn").removeClass("active");
            $("#account").css("display","none");
            $("#addprof").css("display","none");
            $("#emails").css("display","none");
            $("#preference").css("display","block");
          });
          $("#account-btn").click(function (){
            $(this).addClass("active");
            $("#email-btn").removeClass("active");
            $("#preference-btn").removeClass("active");
            $("#addproofbtn").removeClass("active");
            $("#account").css("display","block");
            $("#addprof").css("display","none");
            $("#emails").css("display","none");
            $("#preference").css("display","none");

          });
          $("#addproofbtn").click(function (){
           $(this).addClass("active");
           $("#email-btn").removeClass("active");
           $("#preference-btn").removeClass("active");
            $("#account-btn").removeClass("active");
            $("#addprof").css("display","block");
           $("#account").css("display","none");
           $("#emails").css("display","none");
           $("#preference").css("display","none");
      });
    });

    function deleteaccount(){
      var out=confirm("Delete Account");
      if(out==true){
        <%--location.href="<%=request.getContextPath()%>/registration?userid="+userid;--%>
        location.href="<%=request.getContextPath()%>/deleteaccount";
      }
    }
  </script>

</head>
<body>
  <div class="container">
    <%@include file="sidebar-customer.jsp"%>
    <div class="content1">
      <div class="main">
          <a href="<%=request.getContextPath()%>/viewprofile"><i class="fa fa-home"></i></a>
          <a href="#"><i class="fa fa-mail-bulk"></i></a>
      </div>
    </div>
    <div class="content2">
      <div class="setting">
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
        <p>Your personal account</p>
        <div class="menu">
          <h4>Account Settings</h4>
          <a id="account-btn" class="active" href="#">Account</a>
          <a id="preference-btn" href="#">Account preferences</a>
          <a id="addproofbtn" href="#">Address Proof</a>
        </div>

      </div>
      <div class="middle-content" id="account">
        <form action="<%=request.getContextPath()%>/account" method="post">
          <div class="col-1">
            <label for="fname">First Name</label>
            <label for="lname">Last Name</label>
            <label for="nic">Nic Number</label>
            <label for="pHomeno">Home Number</label>
            <label for="pstreet">Street</label>
            <label for="pcity">City</label>
            <label for="pdistrict">District</label>
            <label for="pprovince">Province</label>
            <label for="email">Email</label>
            <label for="contactnum">Contact Number</label>
          </div>
          <div class="col-2">
            <input type="text" id="fname" name="firstname" value="<%=account.getFirstname()%>">
            <input type="text" id="lname" name="lastname" value="<%=account.getLastname()%>">
            <input type="text" id="nic" name="nic" value="<%=account.getNic()%>">
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
          <%if(count==0){%>
          <div class="btn">
            <button onclick="deleteaccount()">Delete Account</button>
          </div>
          <%}%>
        </div>
      </div>

      <div id="addprof">
        <div class="middle-content">
          <h1>Address verification</h1>
          <img src="./html/customer/resources/images/edit profile/R.gif" class="addresgif"  style="cursor: pointer;width: 200px;height: 181px;margin-top: 30px;margin-left: 53px;">
          <form class="details" action="<%=request.getContextPath()%>/AllUserdocsServlet" method="post" enctype="multipart/form-data">
            <label for="reqfile">Requirement</label>
            <input type="file" id="reqfile" name="reqfile" multiple onchange="processSelectedFiles(this)" required accept="application/pdf"><br>
            <input  type="hidden" id="filename" name="filename" value="">
            <label id="filetype">(Choose pdf )</label>
            <input type="submit" value="Upload">
          </form>

        </div>





    </div>

  </div>
  <%@include file="../../footer.jsp"%>
</body>
<script>
  function processSelectedFiles(fileInput) {
    let files = fileInput.files;
    let val = document.querySelector("#filename");
    let val2 = document.getElementById('reqfile');
    console.log(val2.value);
    for (let i = 0; i < files.length; i++) {
      val.value += files[i].name;
      console.log("blajjncuans");
      console.log(val.value);
    }
  }
</script>

</html>