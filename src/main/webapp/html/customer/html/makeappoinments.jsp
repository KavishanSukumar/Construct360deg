<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java"%>

<!DOCTYPE html>
<html >

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>make appointment</title>
  <link rel="stylesheet" href="./html/customer/resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="./html/customer/resources/css/makeappoinment.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
</head>

<body>

<!-- header area start -->
<%@include file="sidebar-customer.jsp"%>
<div class="container">

<%--    ///////////////////////////////////////////////////////////////////////--%>
  <div class="content">
<!--    <img src="../resources/images/navbar/sidebarpro.jpg"-->
<!--         alt="" >-->
    
<div class="container1">
    <div class="container-details">

        <img src="./html/customer/resources/images/makeappoinment/appoinmentpicture.jpeg" id="appoinmentpic" sizes="100px">
    </div>
    <div class="container-form">
        <form class="appoinmentform" action="<%=request.getContextPath()%>/Makeappointment" method="post" >
            <h2 class="heading of form"> APPOINMENT FORM</h2>


            <div class="NAME">
                <p>   Caption</p>
                <input type="text" placeholder="Topic" name="caption">
            </div>

            <div class="DATE">
                <p>   Date</p>
                <input type="date" name="date" required >
            </div>
            <div class="TIME">
                <p>   Time</p>
                <input type="time" name="time" required><br><br>
            </div>

            <div class="TELE">
            <textarea id="message" name="message" rows="8" cols="50" type="area">

            </textarea><br><br>
            </div>

            <button class="btn">Submit</button>
        </form>
    </div>
</div>



  </div>


</div>
<%@include file="../../footer.jsp"%>
</body>

</html>
<!-- //////////////////////////////////////////////////////////////////// -->



