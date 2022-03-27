<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java"%>
<%
    int profid = (int) request.getAttribute("profid");
    int slotid = (int) request.getAttribute("thetimeslot");
    String date = (String) request.getAttribute("choosedate");
    System.out.println(profid+" "+slotid+" "+date);

    String timeperoid = null;

    if(slotid==1){
    timeperoid = "8:00 am - 9.00 am";
    }else if(slotid==2){
    timeperoid = "9:00 am - 10.00 am";
    }else if(slotid==3){
    timeperoid = "10:00 am - 11.00 am";
    }else if(slotid==4){
    timeperoid = "11:00 am - 12.00 pm";
    }else if(slotid==5){
    timeperoid = "12:00 pm - 13.00 pm";
    }else if(slotid==6){
    timeperoid = "13:00 pm - 14.00 pm";
    }else if(slotid==7){
    timeperoid = "14:00 pm - 15.00 pm";
    }else if(slotid==8){
    timeperoid = "15:00 pm - 16.00 pm";
    }else if(slotid==9){
    timeperoid = "16:00 pm - 17.00 pm";
    }else if(slotid==10){
    timeperoid = "17:00 pm - 18.00 pm";
    }




%>
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
        <form class="appoinmentform" action="<%=request.getContextPath()%>/Makeappointment" method="POST" >
            <h2 class="heading of form"> APPOINMENT FORM</h2>
            <input type="text" name="profid" value="<%=profid%>" required hidden>

            <div class="NAME">
                <p>   Caption</p>
                <input type="text" placeholder="Topic" name="caption">
            </div>

            <div class="DATE">
                <p>   Date</p>
<%--                <input type="date" name="date" required >--%>
                <p id="date" ><%=date%></p>
                <input type="hidden" name="date" value="<%=date%>">
            </div>
            <div class="TIME">
                <p>   Time</p>
<%--                <input type="time" name="time" required>--%>
                <p id="time" name="time"><%=timeperoid%></p>
                <input type="hidden" name="time" value="<%=timeperoid%>">
            </div>

            <div class="TELE">
                <p>   Description</p>
            <textarea id="message" name="message" rows="8" cols="50" type="area">

            </textarea><br><br>
            </div>
            <input type="hidden" value="<%=slotid%>" name="slotid">
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



