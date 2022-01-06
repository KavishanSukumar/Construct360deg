<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload requirements</title>
    <link rel="stylesheet" href="../resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="../resources/css/myrequirements.css">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>

<%@include file="sidebar-customer.jsp"%>
<div class="container">


<div class="header">
    <h1>My Requirements </h1>
</div>
<div class="uploadbtn">
    <button>Upload New Requirement</button>
</div>

<div class="item-container">
    <div class="item">
           <div class="text">
               <div class="req-name">

               </div>
               <div class="">

               </div>
               <div>

               </div>
               <div>

               </div>
           </div>
           <div class="btns">
               <button>Choose professional</button>
               <button>Upload to public</button>
               <button>Available proposals</button>
               <button>Remove</button>
           </div>
    </div>
</div>



    <%@include file="../../footer.jsp"%>
</div>

</body>
</html>