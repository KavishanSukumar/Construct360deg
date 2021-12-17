
<!DOCTYPE html>
<html >

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>make appointment</title>
  <link rel="stylesheet" href="../resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="../resources/css/makeappoinment.css">
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

  <!-- <header class="menu_bar">

    <div class="left_area">
        
        <img src="../resources/images/Logo.png" id="logopic" sizes="100px">
    </div>
    <div class="right_area">
        
        <ul>
            <li><a href="#">HOME</a></li>
            <li><a href="#">SERVICES</a></li>
            <li><a href="#">PROJECT</a></li>
            <li><a href="#">CONTACT US</a></li>
            <li> <i class="fas fa-bars" id="sidebar_btn" onclick="document.querySelector('#nav').classList.toggle('hidden')"></i></li>
        </ul>
    </div>
    <div class="nav-panel hidden" id="nav">
        <ul>
            <div>
                <img src="../resources/images/Addproduct/sidebarpro.jpg" id="profile_image" alt="" >
                <h4 id="profile_name" style="margin-top: -5px;">Reena</h4>
            </div>
            
            <a href="#"><i class="fas fa-hard-hat" id="hat"></i><h4>Projects</h4></a>
<%--            <a href="<%=request.getContextPath()%>/searchproduct"><i class="fab fa-product-hunt" id="hunt"></i><h4>Products</h4></a>--%>
<%--            <a href="<%=request.getContextPath()%>/searchprofessionals"><i class="fas fa-user" id="user"></i><h4>Professionals</h4></a>--%>
            <a href="#"><i class="fas fa-flag-checkered" id="chek"></i><h4>Report</h4></a>
            <a href="#"><i class="fas fa-headset" id="head"></i><h4>Help and Support</h4></a>
<%--            <a href="<%=request.getContextPath()%>/Logout"><i class="fas fa-sign-out-alt" id="logout"></i><h4>Logout</h4></a>--%>
        </ul>
    </div>
</header> -->



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
        <form class="appoinmentform" action="makeappointment">
            <h2 class="heading of form"> APPOINMENT FORM</h2>

            <div class="NAME">
                <p>   Your name</p>
                <input type="text" placeholder="Your name">
            </div>
            <div class="EMAIL">
                <p>   Your email</p>
                <input type="email" placeholder="Your email">
            </div>
            <div class="DATE">
                <p>   Date</p>
                <input type="date" required >
            </div>
            <div class="TIME">
                <p>   Time</p>
                <input type="time" required><br><br>
            </div>
            <div class="TELE">
                <label for="phone">Enter a phone number</label><br><br>
                <input type="tel" id="phone" name="phone" placeholder="07x-xxxxxxx" pattern="[0-9]{3}-[0-9]{7}" required><br><br>
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



