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

                $("#confrmpwd").keyup(function (){
                    var password1=$("#newpwd").val();
                    var password2=$(this).val();
                    if(password1!=password2){
                        $("#passwordcheck").css("display","block");
                        $("#resetfrm").prop("disabled",true);
                    }else{
                        $("#passwordcheck").css("display","none");
                        $("#resetfrm").prop("disabled",false);
                    }
                })

            $("#cancelfrm").click(function (){
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

    <div class="forgotpassword">
        <div class="form" id="forgotpassword" action="">
            <div style="margin-left: 140px">
                <img src="./resources/images/login/LoginLogo.png" class="logopic" >
            </div>
            <div id="pswdform">
                <form method="post" action="<%=request.getContextPath()%>/changethepassword">
                    <input type=password style="width: 310px" name="newpwd" id="newpwd" placeholder="Enter the new password">
                    <br>
                    <input type=password style="width: 310px" name="confrmpwd" id="confrmpwd" placeholder="Confirm password">
                    <p class="checkparagph" id="passwordcheck" style="font-family: Roboto, sans-serif; display: none;color: red">Password doesn't match</p>
                    <button class="btn" style="width: 150px" id="cancelfrm">Cancel</button>
                    <button class="btn" style="width: 150px" id="resetfrm">Reset</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
</body>

</html>