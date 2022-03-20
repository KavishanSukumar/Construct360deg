<%@ page import="java.util.ArrayList" %>
<%--<%@ page import="com.example.construct360deg.model.Complain" %>--%>
<%@ page import="com.example.construct360deg.model.HomeForm" %>
<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<%
    ArrayList<HomeForm> homeForm= (ArrayList<HomeForm>) request.getAttribute("homeForm");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inquires</title>
    <link rel="stylesheet" href="./html/admin/resources/css/viewinquiresfromHome.css">
    <link rel="stylesheet" href="./html/admin/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="./resources/js/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="http://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready( function () {
            $('#mytable').DataTable();
        });
    </script>
</head>

<body>
<div class="viewinquires">
    <h1 id="contactid" style="text-align: center">Contact id:</h1>
    <h3 id="fname" style="text-align: left">First Name:</h3>
    <h3 id="lname" style="text-align: left">Last Name:</h3>
    <h3 id="email" style="text-align: left"> Email:</h3>
    <h3 id="message" style="text-align: left">Message:</h3>
    <span><button class="btn" onclick="closeinqury(this)" style="text-align: right">Close</button>       <button class="btn" style="text-align: right">Print</button></span>
</div>
<div class="container">
    <%@include file="sidebar-admin.jsp"%>
    <div class="content">
<%--        <div class="second">--%>
<%--            <form action="">--%>
<%--                <div class="from">--%>
<%--                    <label name="activityfrom">Show activities from</label> &ensp;--%>
<%--                    <input id="activityfrom" name="activityfrom" type="date" size = "59"class="form-control validate" />--%>
<%--                </div>--%>
<%--                <div class="to">--%>
<%--                    <label name="activityTo">to</label> &ensp;--%>
<%--                    <input id="activityTo" name="activityTo" type="date" size = "59"class="form-control validate" />--%>
<%--                </div>--%>
<%--                <div class="By_option">--%>
<%--                    <label name="By">by</label> &ensp;--%>
<%--                    <input id="By" name="By" type="text" size = "59"class="form-control validate" />--%>
<%--                </div>--%>
<%--                <div class="OK">--%>
<%--                    <button type="button" class="okbtn">GO</button>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
        <div class="third">

            <!-- ///////////////////////////////////////////// -->
            <table class="logTable" id="mytable">
                <thead>
                <tr class="headrow">
                    <th class="contactid"><span>Contact Id</span></th>
                    <th class="fname"><span>First Name</span></th>
                    <th class="lname"><span>Last Name</span></th>
                    <th class="email"><span>Email</span></th>
                    <th class="message"><span>Message</span></th>
                </tr>
                </thead>
                <tbody>
                <%for (HomeForm x:homeForm){%>
                <tr class="1stline" onclick="openinqury(this)" id="<%=x.getContactid()%>">
                    <td><%=x.getContactid()%></td>
                    <td><%=x.getFname()%></td>
                    <td><%=x.getLname()%></td>
                    <td><%=x.getEmail()%></td>
                    <td><%=x.getMessage()%></td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file="../../footer.jsp"%>
</body>

<%--//////////////////////////////////////////////////////--%>
<script>
    function openinqury(ele){
        var contactid=ele.id;
        var fname=null;
        var lname=null;
        var email=null;
        var message=null;

        <%for(HomeForm a:homeForm){%>
        if(contactid==<%=a.getContactid()%>){
            fname="<%=a.getFname()%>";
            lname="<%=a.getLname()%>";
            email="<%=a.getEmail()%>";
            message="<%=a.getMessage()%>";
        }
        <%}%>
        document.getElementById("contactid").innerHTML=contactid;
        document.getElementById("fname").innerHTML="First Name: "+fname;
        document.getElementById("lname").innerHTML="Last Name: "+lname;
        document.getElementById("email").innerHTML="Email: "+email;
        document.getElementById("message").innerHTML="Message: "+message;

        var element1=document.getElementsByClassName("viewinquires");
        var element2=document.getElementsByClassName("container");

        for (var i=0;i<element1.length;i+=1){
            element1[i].style.display = 'block';
        }
        for (var i=0;i<element2.length;i+=1){
            element2[i].classList.add("blurer");
        }
    }

    function closeinqury(ele){
        var element3=document.getElementsByClassName("viewinquires");
        var element4=document.getElementsByClassName("container");

        for (var i=0;i<element3.length;i+=1){
            element3[i].style.display = 'none';
        }

        for (var i=0;i<element4.length;i+=1){
            element4[i].classList.remove("blurer");
        }
    }
</script>
<%--/////////////////////////////////////////////////////--%>

</html>