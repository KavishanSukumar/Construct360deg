<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../resources/css/registration.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>Registration</title>
</head>
<body>
    <div class="container-1">
        <h1>Registration</h1>
        <div class="container-2">
            <form action="<%=request.getContextPath()%>/UserRegistration" method="post">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email address">
                <br>
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username">
                <br>
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="**********************">
                <br>
                <label for="confirm_password">Confirm Password</label>
                <input type="password" id="confirm_password" name="confirm_password" placeholder="**********************">
                <br>
                <label for="contactno">Contact No</label>
                <input type="text" id="contactno" name="contactno" placeholder="Enter Contact Number">
                <br>
                <label for="professional">Professional Role</label>
                <select name="professional" id="professional">
                    <option >Select</option>
                    <option value="cus_indiv">Customer Individual</option>
                    <option value="cus_com">Customer Company</option>
                    <option value="prof_indiv">Professional Individual</option>
                    <option value="prof_com">Professional Company</option>
                </select>
                <div class="terms">
                    <input type="checkbox" required>
                    <label id="terms2"><a href="www.google.com" target="_blank">Accept the terms & condition</a></label>
                </div>
                <br>
                <input type="submit" name="Submit" class="submit" required>
            </form>
        </div>

    </div>

</body>
</html>