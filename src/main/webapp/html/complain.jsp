<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java"%>
<%
    int userid= (int) session.getAttribute("userid");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report</title>
    <link rel="stylesheet" href="./resources/css/complain.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


</head>

<body>
<!-- <input type="checkbox" id="check"> -->
<!-- header area start -->
<div class="container">
    <form class="myform" action="<%=request.getContextPath()%>/complains" method="post">
        <label for="userid">Userid</label>
        <input type="text" id="userid" name="userid" placeholder="Your Userid.." value="<%=userid%>" disabled>

        <label for="fname">Full Name</label>
        <input type="text" id="fname" name="fname" placeholder="Your full name.." required>

        <label for="email">Email</label>
        <input type="email" placeholder="Enter Email" name="email" id="email" required>

        <label for="category">Complain Category</label>
        <select id="category" name="category" required>
            <option disabled selected>Select</option>
            <option value="user">User</option>
            <option value="website">Website</option>
        </select>

        <label for="complaineeuserid">Last Name</label>
        <input type="number" id="complaineeuserid" name="complaineeuserid" placeholder="Enter Complainee userid" required>

        <label for="message" >Message</label>
        <textarea id="message" name="message"  style="height:200px" required></textarea>
        <div id="buttons">
            <button type="submit" value="submit" class="btn">Submit</button>
            <button value="cancel" class="btn">Cancel</button>
        </div>
    </form>
</div>
<%@include file="footer.jsp"%>
</body>

</html>