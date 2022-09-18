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
    <script src="./resources/js/jquery-3.6.0.js"></script>
    <script>
        $(document).ready(function (){
          $("#lostpaswd").click(function (){
             $(".navbar").css("display","none");
              $(".content").css("display","none");
              $(".forgotpassword").css("display","");
          });
          // $("#next").click(function (){
          //     $("#resettype").css("display","none");
          //     $("#inputdata").css("display","");
          //     $("#otpcode").css("display","none");
          // })
          // $("#prev").click(function (){
          //     $("#resettype").css("display","");
          //     $("#inputdata").css("display","none");
          //     $("#otpcode").css("display","none");
          // })
          $("#send").click(function (){
                var emailusername=$("#usenameemail").val();
                var typeofdata=$("#usenameemail").val();
                var datatest;
                if(emailusername!=""){
                    $.ajax({
                        url:"<%=request.getContextPath()%>/forgotpassword",
                        type:"POST",
                        data:{"emailusername":emailusername},
                        success:function (data){
                            if(data==false){
                                $("#error").css("display","none");
                                $("#error1").css("display","");
                                console.log("datablacok");
                            }else{
                                $("#resettype").css("display","none");
                                $("#inputdata").css("display","none");
                                $("#otpcode").css("display","");
                            }
                        }
                    });

                }else{
                    $("#error").css("display","");
                    $("#error1").css("display","none");
                }
          })

          <%--$("#reset").click(function (){--%>
          <%--    var otpcode=$("#otp").val();--%>
          <%--    $.ajax({--%>
          <%--        url:"<%=request.getContextPath()%>/forgotpassword",--%>
          <%--        type:"POST",--%>
          <%--        data:{"otp":otpcode,"task":"verifyotp"},--%>
          <%--        success:function (data){--%>
          <%--              if (data==true){--%>

          <%--              }else {--%>

          <%--              }--%>
          <%--        }--%>
          <%--    });--%>
          <%--});--%>

          $("#cancel").click(function (){
                location.href="<%=request.getContextPath()%>/login";
          });
        })
    </script>
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
                <li><a href="<%=request.getContextPath()%>/#HOME">HOME</a></li>
                <li><a href="<%=request.getContextPath()%>/#SERVICE">SERVICES</a></li>
                <li><a href="<%=request.getContextPath()%>/#PROJECTS">PROJECT</a></li>
                <li><a href="<%=request.getContextPath()%>/#ABOUT_US">ABOUT_US</a></li>
                <li><a href="<%=request.getContextPath()%>/#CONTACT_US">CONTACT_US</a></li>
            </ul>
        </div>
    </div>

    <div class="forgotpassword" style="display: none" >
        <div class="form" id="forgotpassword" action="">
            <div style="margin-left: 140px">
                <img src="./resources/images/login/LoginLogo.png" class="logopic" >
            </div>
            <h2 style="color: white;text-align: center;padding-left: 0px;">Forgot Password</h2>
            <div id="inputdata">
                <p style="color: white;text-align: left;padding-left: 0px; margin-top: 10px; margin-bottom: 10px" >Enter your email address below and we?ll send you a OTP to reset your password.</p>
                <input type="text" id="usenameemail" style="width: 310px"  name="usenameemail" placeholder="Enter Username/Email">
                <br>
                <p id="error" style="color: red;display: none" >The Username/Email text box is empty</p>
                <p id="error1" style="color: red;display: none" >The Username/Email doesn't exist</p>
                <br>
<%--                <button class="btn" id="prev" style="width: 150px">Previous</button>--%>
                <button class="btn" id="send" style="width: 310px">Send</button>
            </div>
            <div id="otpcode" style="display: none">
                <p style="color: white;text-align: left;padding-left: 0px; margin-top: 10px; margin-bottom: 10px" >Enter your OTP code below that has been send to you email.</p>
                <form action="<%=request.getContextPath()%>/changepassword" method="POST" >
                    <input type="text" style="width: 310px" name="otp" id="otp" placeholder="Enter the code send to you email">
                    <br>
                    <button type="submit" class="btn" style="width: 150px" id="reset">Reset</button>
                    <button type="reset" class="btn" style="width: 150px" id="cancel">Cancel</button>
                </form>

            </div>
        </div>
    </div>

    <div class="content">
        <h1>BUILD<br><span>YOUR DREAM</span><br>WITH PASSION</h1>
        <p class="par">It is not the beauty of a building you should look at; <br>its the construction of the foundation that will stand the test of time. ...</p>
        <button class="cn"><a href="<%=request.getContextPath()%>/registration">Join with us</a></button>
        <form class="form" action="<%=request.getContextPath()%>/login" method="post">
            <h2>Login here</h2>
            <br>
            <input type="text"  name="username" placeholder="Enter Username" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit"  value="Submit"><br>
            <a href="#" id="lostpaswd">Lost your password?</a><br>
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