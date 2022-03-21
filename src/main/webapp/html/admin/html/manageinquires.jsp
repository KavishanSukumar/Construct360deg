<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.Complain" %>
<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<%
    ArrayList<Complain> complains= (ArrayList<Complain>) request.getAttribute("complains");
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Inquires</title>

  <link rel="stylesheet" href="./html/admin/resources/css/manageinquires.css">
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
        <h1 id="complainid" style="text-align: center">Complain id:</h1>
        <h3 id="date" style="text-align: left">Date:</h3>
        <h3 id="time" style="text-align: left">Time:</h3>
        <h3 id="complainername" style="text-align: left">Complainer Name:</h3>
        <h3 id="complaineruserid" style="text-align: left">Complainer Userid:</h3>
        <h3 id="complaineremail" style="text-align: left">Complainer Email:</h3>
        <h3 id="complaineeuserid" style="text-align: left">Complainee Userid:</h3>
        <h3 id="categary" style="text-align: left">Categary:</h3>
        <h3 id="message" style="text-align: left">Message:</h3>
        <span><button class="btn" onclick="closeinqury(this)" style="text-align: right">Close</button>       <button class="btn" style="text-align: right">Print</button></span>
    </div>
    <div class="container">
        <%@include file="sidebar-admin.jsp"%>
        <div class="content">
            <div class="second" style="display: none">
                <form action="">
                    <div class="from">
                        <label name="activityfrom">Show activities from</label> &ensp;
                        <input id="activityfrom" name="activityfrom" type="date" size = "59"class="form-control validate" />
                    </div>
                    <div class="to">
                        <label name="activityTo">to</label> &ensp;
                        <input id="activityTo" name="activityTo" type="date" size = "59"class="form-control validate" />
                    </div>
                    <div class="By_option">
                        <label name="By">by</label> &ensp;
                        <input id="By" name="By" type="text" size = "59"class="form-control validate" />
                    </div>
                    <div class="OK">
                        <button type="button" class="okbtn">GO</button>
                      </div>
                </form>
            </div>
            <div class="third">

                <!-- ///////////////////////////////////////////// -->
                <table class="mytable" id="mytable">
                    <thead>
                        <tr class="headrow">
                            <th class="Time"><span>Complain id</span></th>
                            <th class="Date"><span>Date</span></th>
                            <th class="Time"><span>Time</span></th>
                            <th class="complainername"><span>Complainer Name</span></th>
                            <th class="complaintype"><span>Complain Type</span></th>
                            <th class="message"><span>Message</span></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Complain x:complains){%>
                            <tr class="1stline" onclick="openinqury(this)" id="<%=x.getComplainid()%>">
                                <td><%=x.getComplainid()%></td>
                                <td>05-09-2020</td>
                                <td>13:10:01</td>
                                <td><%=x.getFullname()%></td>
                                <td><%=x.getCategory()%></td>
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
<script>
    function openinqury(ele){
        var complainid=ele.id;
        var date=null;
        var time=null;
        var complainername=null;
        var complaineruserid=null;
        var complaineremail=null;
        var complaineeuserid=null;
        var categary=null;
        var message=null;

        <%for(Complain a:complains){%>
            if(complainid==<%=a.getComplainid()%>){
                date="05-09-2020";
                time="13:10:01";
                complainername="<%=a.getFullname()%>";
                complaineruserid="<%=a.getComplainer()%>";
                complaineremail="<%=a.getEmail()%>";
                complaineeuserid="<%=a.getComplainee()%>";
                categary="<%=a.getCategory()%>";
                message="<%=a.getMessage()%>";
            }
        <%}%>
        document.getElementById("complainid").innerHTML=complainid;
        document.getElementById("date").innerHTML="Date: "+date;
        document.getElementById("time").innerHTML="Time: "+time;
        document.getElementById("complainername").innerHTML="Complainer Name: "+complainername;
        document.getElementById("complaineruserid").innerHTML="Complainer Userid: "+complaineruserid;
        document.getElementById("complaineremail").innerHTML="Complainer Email: "+complaineremail;
        document.getElementById("complaineeuserid").innerHTML="Complainee Userid: "+complaineeuserid;
        document.getElementById("categary").innerHTML="Complaint Categary: "+categary;
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

</html>