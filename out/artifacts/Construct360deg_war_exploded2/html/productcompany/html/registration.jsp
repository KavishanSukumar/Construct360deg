<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="./html/productcompany/resources/css/registration.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>Registration</title>
    <script src="./resources/js/jquery-3.6.0.js"></script>
    <script>
        $(document).ready(function (){
            console.log("hello");
            $("#email").keyup(function (){
               var email=$("#email").val()
               $.ajax({
                   url:"<%=request.getContextPath()%>/GetEmailUsername",
                   type:'POST',
                   data:{"field":"email","data":email},
                   success:function (data){
                           if(data==true){
                               $("#emailcheck").css("display","block");
                               $(".submit").prop('disabled', true);
                           }else{
                               $("#emailcheck").css("display","none");
                               $(".submit").prop('disabled', false);
                           }
                   }
               })
            })

            $("#username").keyup(function (){
                var username=$("#username").val();
                $.ajax({
                    url:"<%=request.getContextPath()%>/GetEmailUsername",
                    type:'POST',
                    data:{"field":"username","data":username},
                    success:function (data){
                        if(data==true){
                            console.log(typeof(data));
                            $("#usernamecheck").css("display","block");
                            $(".submit").prop('disabled', true);
                        }else{
                            $("#usernamecheck").css("display","none");
                            $(".submit").prop('disabled', false);
                        }
                    }
                })
            })
            $("#confirm_password").keyup(function (){
                var password1=$("#password").val();
                var password2=$(this).val();
                if(password1!=password2){
                    $("#passwordcheck").css("display","block");
                    $(".submit").prop("disabled",true);
                }else{
                    $("#passwordcheck").css("display","none");
                    $(".submit").prop("disabled",false);
                }
            })
        })
    </script>
</head>
<body>
    <div class="container-1">
        <div class="container-2">
            <img src="./html/productcompany/resources/images/registrationform/Registration.jpg" class="sidepic">
            <p class="par"><strong>"You can dream, create, design, and build the most wonderful place in the world. But it requires people to make the dream a reality."<br>Walt Disney</strong></p>
        </div>
        <div class="container-3">
            <h1>Registration</h1>
            <div class="container-4">
                <form action="<%=request.getContextPath()%>/registration" method="post">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email address" required>
                    <p class="checkparagph" id="emailcheck">Email exist</p>
                    <br>
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                    <p class="checkparagph" id="usernamecheck">Username exist</p>
                    <br>
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="**********************" required>
                    <br>
                    <label for="confirm_password">Confirm Password</label>
                    <input type="password" id="confirm_password" name="confirm_password" placeholder="**********************" required>
                    <p class="checkparagph" id="passwordcheck">Password doesn't match</p>
                    <br>
                    <label for="contactno" >Contact No</label>
                    <input type="text" id="contactno" name="contactno" placeholder="Enter Contact Number" required>
                    <br>
                    <label for="professional">Professional Role</label>
                    <select name="professional" id="professional" required>
                        <option >Select</option>
                        <option value="cus_indiv">Customer Individual</option>
                        <option value="cus_com">Customer Company</option>
                        <option value="prof_indiv">Professional Individual</option>
                        <option value="prof_com">Professional Company</option>
                    </select>
                    <div class="terms">
                        <input type="checkbox" required >
                        <label id="terms2"><a href="www.google.com" target="_blank">Accept the terms & condition</a></label>
                    </div>
                    <br>
                    <div class="sbt-btn">
                        <input type="submit" name="Submit" class="submit" required>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>