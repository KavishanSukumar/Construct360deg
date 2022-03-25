<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.*" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<!DOCTYPE html>
<html lang="en">

<%
    Account account = (Account) request.getAttribute("accounts");
    Account account1 = (Account) request.getAttribute("changepic");
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile_Customer</title>
    <link rel="stylesheet" href="./html/customer/resources/css/viewprofile-customer.css">
    <link rel="stylesheet" href="./html/customer/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script>
        function deleteimage(id){
            var userid = id;
            console.log(userid);
            var out=confirm("Delete Image");
            if(out==true){
                location.href="<%=request.getContextPath()%>/viewprofile?userid="+userid;
            }
        }
        //profile pic
        function preview() {
            frame.src=URL.createObjectURL(event.target.files[0]);
        }
        //end profile pic
        function popuppic(){
            document.getElementById("pic").classList.toggle("active");
        }
        function gotochat(ele){
            chatid=ele.id;
            location.href="<%=request.getContextPath()%>/chat?chat="+userid;
        }
    </script>
</head>

<body>
<div class="container">
    <%@include file="sidebar-customer.jsp"%>

    <div class="content1">

    </div>
    <div class="content2">
        <div class="box1" id="pic">
            <%
                String base64Encoded2=null;
                if (account1.getImgBytes()==null){

                }else {
                    byte[] bytes = account1.getImgBytes();
                    byte[] encodeBase64 = Base64.encodeBase64(bytes);
                    base64Encoded2 = new String(encodeBase64, "UTF-8");
                }
            %>
            <img src="./html/customer/resources/images/viewprofile/cover.png">
            <img src="data:image/jpeg;base64,<%=base64Encoded2%>" class="user" onclick="popuppic()" style="cursor: pointer">
            <div class="background"></div>
            <div class="piccontent">
                <div class="close-btn" onclick="popuppic()">&times;</div>
                <form action="<%=request.getContextPath()%>/profilepic" method="post" enctype="multipart/form-data">
                    <h3>Profile Photo</h3>
                    <input type="file" name="image" onchange="preview()">
                    <img id="frame" src="data:image/jpeg;base64,<%=base64Encoded2%>" />
                    <input type="submit" value="Save">
                    <button onclick="deleteimage(<%=account1.getUserid()%>)" class="button">Delete</button>
                </form>
            </div>
            <a href="<%=request.getContextPath()%>/editprofile"><i class="fa fa-pencil-alt"></i></a>
            <h2><%=account.getFirstname()%> <%=account.getLastname()%></h2><br>
            <p>Customer</p>
            <p><%=account.getDistrict()%> District, <%=account.getProvince()%>, Sri Lanka.</p>

<%--            <a href="#" id="<%=account.getUserid()%>" class="button" onclick="gotochat(this)">Message</a>--%>
            <a href="#" id="" class="buttonaddverify" onclick="">Address proof</a>

        </div>
        <div class="box2">
            <h3>Contact</h3>
            <p>Email - <%=account.getEmail()%></p>
            <p>Tele - <%=account.getContactno()%></p>
        </div>
    </div>
</div><br><br>
<%@include file="../../footer.jsp"%>
</body>

</html>