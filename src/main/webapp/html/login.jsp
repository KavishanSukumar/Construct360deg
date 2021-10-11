<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/loginstyle.css">
</head>
<body >
    <div class="main">
        
        <video autoplay muted loop poster="polina.jpg" id="bgvid">
            <source src="./resources/images/login/Loginbackground.mp4" type="video/mp4">
        </video>
        
        <div class="navbar">
            <div class="logo">
                <!--<h2 class="logoname">Construct360</h2>-->
                <img src="./resources/images/login/LoginLogo.png" class="logopic">
            </div>
            <div class="menu">
                <ul>
                    <li><a href="<%=request.getContextPath()%>/#hoome">HOME</a></li>
                    <li><a href="<%=request.getContextPath()%>/#seervise">SERVICES</a></li>
                    <li><a href="<%=request.getContextPath()%>/#prooject">PROJECT</a></li>
                    <li><a href="<%=request.getContextPath()%>/#AbooutUs">ABOUT_US</a></li>
                    <li><a href="<%=request.getContextPath()%>/#coonatact">CONTACT_US</a></li>
                </ul>
            </div>
            
        </div>
        <div class="content">
            <h1>BUILD<br><span>YOUR DREAM</span><br>WITH PASSION</h1>
            <p class="par">It is not the beauty of a building you should look at; <br>its the construction of the foundation that will stand the test of time. ...</p>
            <button class="cn"><a href="<%=request.getContextPath()%>/Registration">Join with us</a></button>
            <form class="form" action="<%=request.getContextPath()%>/loginvalidate" method="post">
                    <h2>Login here</h2>
                    <br>
                    <input type="text"  name="username" placeholder="Enter Username" required>
                    <input type="password" name="password" placeholder="Enter Password" required>
                    <input type="submit"  value="Submit"><br>
                    <a href="#">Lost your password?</a><br>
                    <a href="#">Don't have an account?</a>
                    <p class="loginwith">Login with</p>
                    <div class="icon">
                        <a href="#"><ion-icon name="logo-linkedin"></ion-icon></a>
                        <a href="#"><ion-icon name="logo-twitter"></ion-icon></a>
                        <a href="#"><ion-icon name="logo-google"></ion-icon></a>
                        <a href="#"><ion-icon name="logo-skype"></ion-icon></a>
                    </div>
            </form>
        </div>
    </div>
    <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
</body>

</html>