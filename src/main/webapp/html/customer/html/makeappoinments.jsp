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
<!-- <input type="checkbox" id="check"> -->
<!-- header area start -->
<%@include file="sidebar-customer.jsp"%>
<div class="container">

<%--    ///////////////////////////////////////////////////////////////////////--%>
  <div class="content">
<!--    <img src="../resources/images/navbar/sidebarpro.jpg"-->
<!--         alt="" >-->
    
<div class="container1">
    <div class="container-details">
        <!-- <h2>This time for you </h2>
        <p>shffhdfj sjjsjsjk sldsjjh nfddmfndj ajsjajhs eiituen dgfhfhh</p> -->
        <img src="../resources/images/makeappoinment/appoinmentpicture.jpeg" id="appoinmentpic" sizes="100px">
    </div>
    <div class="container-form">
        <form class="appoinmentform" action="<%=request.getContextPath()%>/Makeappointment" method="post" >
            <h2 class="heading of form"> APPOINMENT FORM</h2>

            <label for="custid">Customerid</label>
            <input type="text" id="custid" name="custid" value="66" hidden>

            <label for="profid">Profid</label>
            <input type="text" id="profid" name="profid" value="67" hidden>

            <div class="NAME">
                <p>   Caption</p>
                <input type="text" placeholder="Topic" name="caption">
            </div>
<%--            <div class="EMAIL">--%>
<%--                <p>   Your email</p>--%>
<%--                <input type="email" placeholder="Your email" name="email">--%>
<%--            </div>--%>
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



