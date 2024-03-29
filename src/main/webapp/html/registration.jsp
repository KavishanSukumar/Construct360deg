<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="./resources/css/registration.css">
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

            $("#contactno").keyup(function (){
                var contactnumber=$("#contactno").val();
                console.log(contactnumber.length);
                if(contactnumber.length==10){
                    $("#contactnocheck").css("display","none");
                }else{
                    $("#contactnocheck").css("display","block");
                }
            })



            $("#professional").change(function (){
                var value=$("#professional option:selected").text();
                if(value=="Customer"){
                    $(".customerblock").css("display","");
                    $(".professionalblock").css("display","none");
                }else if (value=="Professional"){
                    $(".professionalblock").css("display","");
                    $(".customerblock").css("display","none");
                }else{
                    $(".professionalblock").css("display","none");
                    $(".customerblock").css("display","none");
                }
            });

            $("#cancelbtn").click(function (){
                var status=confirm("Do you want to cancel ?");
                if(status){
                    location.href="<%=request.getContextPath()%>/login";
                }
            });
        })
    </script>
</head>
<body>
    <div class="container-1">
        <div class="container-2">
            <img src="./resources/images/registrationform/Registration.jpg" class="sidepic">
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
                        <label for="address">Address</label>
                        <input type="text" id="address" name="address">
                    <br>
                    <label for="contactno" >Contact No</label>
                    <input type="text" id="contactno" name="contactno" placeholder="Enter Contact Number" required>
                    <p  id="contactnocheck" style="color: red;display: none">Number size is not 10</p >
                    <br>
                    <label for="professional">Professional Role</label>
                    <select id="professional" required>
                        <option disabled selected>Select</option>
                            <option >Customer</option>
                            <option >Professional</option>
                            <option value="prod">Product Company</option>
                    </select>
                    <label for="professional" class="customerblock" style="display:none " >Role Type</label>
                    <select name="professional" id="customerblock" class="customerblock" style="display:none " required>
                        <option disabled selected>Select</option>
                        <option value="cus_indiv">Customer Individual</option>
                        <option value="cus_com">Customer Company</option>
                    </select>
                    <label for="professional" class="professionalblock" style="display:none ">Role Type</label>
                    <select name="professional" id="professionalblock" class="professionalblock" style="display:none" required>
                        <option disabled selected>Select</option>
                        <option value="prof_indiv">Professional Individual</option>
                        <option value="prof_com">Professional Company</option>
                    </select>

                    <select name="professional" id="productblock"  style="display:none" required>
                        <option value="prod_com" selected>Product Company</option>
                    </select>
                    <div class="terms">
                        <input type="checkbox" required >
                        <label id="terms2"><a href="www.google.com" target="_blank">Accept the terms & condition</a></label>
                    </div>
                    <br>
                    <div class="sbt-btn">
                        <input type="button" id="cancelbtn" name="cancel" class="cancel" value="Cancel">
                        <input type="submit" name="Submit" class="submit" >
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>