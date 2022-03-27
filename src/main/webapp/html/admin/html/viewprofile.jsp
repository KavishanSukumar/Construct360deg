<%@ page import="com.example.construct360deg.model.Account" %>
<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<!DOCTYPE html>
<html lang="en">

<%
    Account account = (Account) request.getAttribute("accounts");
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile_Admin</title>
    <link rel="stylesheet" href="./html/admin/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="./html/admin/resources/css/viewprofile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
</head>

<body>
<%@include file="sidebar-admin.jsp"%>
<div class="container">
    <div class="content1">
<%--        <form class="example" action="/action_page.java">--%>
<%--            <button type="submit"><i class="fa fa-search"></i></button>--%>
<%--            <input type="text" placeholder="Search.." name="search">--%>
<%--        </form>--%>
<%--        <div class="main">--%>
<%--            <a href="#"><i class="fa fa-home"></i></a>--%>
<%--            <a href="#"><i class="fa fa-mail-bulk"></i></a>--%>
<%--        </div>--%>
    </div>
    <div class="content2">
        <div class="box1">
            <img src="./html/admin/resources/images/viewprofile/cover.png">
            <img src="./html/admin/resources/images/adminpic.jpg" class="user">
            <a href="<%=request.getContextPath()%>/editprofile"><i class="fa fa-pencil-alt"></i></a>
            <h2>Admin</h2>
            <p><%=account.getDistrict()%> District, <%=account.getProvince()%>, Sri Lanka.</p>
<%--            <a href="#" class="button">Message</a>--%>
        </div>
        <div class="box2">
            <a href="#"><i class="fa fa-camera"></i></a>
            <h3>Contact</h3>
            <p>Email - <%=account.getEmail()%></p>
            <p>Tele - <%=account.getContactno()%></p>
        </div>
    </div>
</div>
</body>
<%@include file="../../footer.jsp"%>
</html>