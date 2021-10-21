<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10/21/2021
  Time: 1:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body{
            text-align: center;
            margin-top: 10%;
        }
    </style>
</head>
<body>
<h1>Something Went Wrong! Sorry For the Inconvenience</h1>
<h2>Please Contact the administrator</h2>
<h3>Back To Homepage <a href="<%=request.getContextPath()%>/">back</a></h3>
</body>
</html>
