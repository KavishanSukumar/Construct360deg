<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.*" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<!DOCTYPE html>
<html lang="en">

<%
    ArrayList<Viewprofile> addsummary = (ArrayList<Viewprofile>) request.getAttribute("summary");
    ArrayList<PreviousProject> previousProjects= (ArrayList<PreviousProject>) request.getAttribute("previousProjects");
    ArrayList<Experience> experiences = (ArrayList<Experience>) request.getAttribute("experiences");
    ArrayList<Skills> skills = (ArrayList<Skills>) request.getAttribute("skills");
    ArrayList<AllUsers> allprofs= (ArrayList<AllUsers>) request.getAttribute("allprofs");
    int profid = (int) request.getAttribute("profid");
    int userid = (int) session.getAttribute("userid");

    Account account = (Account) request.getAttribute("accounts");
    Account account1 = (Account) request.getAttribute("changepic");
    int tag = 0;
    int count = 0;
    try{

        tag = (int) request.getAttribute("tag");
    }catch (Exception e){
        count++;
    }
    System.out.println("this is viewprofile count "+count+"if count==0 no exception");
    int  reqid = -1;
    if(count==0){
        reqid = (int) request.getAttribute("reqid");

    }
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Professional's profile</title>
    <link rel="stylesheet" href="./html/customer/resources/css/viewprofprofile.css">
    <link rel="stylesheet" href="./html/customer/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<%---------------------- appointment - select date ----------------------------------%>
<div class="appointment" id="appointment-timeslots" style="display: none">
    <div class="part1">
        <div class="part1_1">
            <h1 id="ap-tittle">Select a Date</h1>
            <button class="closebtnclass" id="closebtn" onclick="mypopupclose()">X</button>
        </div>
        <div class="part1_2">
            <input type="date" id="choosedate" name="choosedate">
            <input type="submit">
        </div>

    </div>
    <div class="part2">
        <h1 id="ap-tittle2">Available Time Slots</h1>
        <div class="avai-timeslots">
            <div class="notavai">
                <h3 id="notavailable">Sorry Time slots are not Avilable</h3>
<%--                <i class="fa fa-frown-o" aria-hidden="true"></i>--%>
            </div>
            <button class="timeslot" id="s1" val="1">8:00 am  - 9.00 am</button>
            <button class="timeslot" id="s2" val="2">9:00 am  - 10.00 am</button>
            <button class="timeslot" id="s3" val="3">10:00 am  - 11.00 am</button>
            <button class="timeslot" id="s4" val="4">11:00 am  - 12.00 pm</button>
            <button class="timeslot" id="s5" val="5">12:00 pm  - 13.00 pm</button>
            <button class="timeslot" id="s6" val="6">13:00 pm  - 14.00 pm</button>
            <button class="timeslot" id="s7" val="7">14:00 pm  - 15.00 pm</button>
            <button class="timeslot" id="s8" val="8">15:00 pm  - 16.00 pm</button>
            <button class="timeslot" id="s9" val="9">16:00 pm  - 17.00 pm</button>
            <button class="timeslot" id="s10" val="10">17:00 pm  - 18.00 pm</button>


        </div>

    </div>


</div>
<body>
<div class="container" id="blur">
    <%@include file="sidebar-customer.jsp"%>
    <div class="content1">
    </div>
    <div class="content2">
        <div class="box1" id="pic">
            <%
                String base64Encoded2=null;
                if (account1.getImgBytes()==null){

                }else {
                    byte[] bytes = account1.getImgBytes();
                    byte[] encodeBase64 = Base64.encodeBase64(bytes);
                    base64Encoded2 = new String(encodeBase64, "UTF-8");
                }
            %>
            <img src="./html/customer/resources/images/viewprofile/cover.png">
            <img src="data:image/jpeg;base64,<%=base64Encoded2%>" class="user" onclick="popuppic()">
            <h2><%=account.getFirstname()%> <%=account.getLastname()%></h2>
            <%for (Viewprofile x:addsummary){%>
            <p><%=x.getSummaryText()%></p>
            <%}%><br>
            <a href="#" class="button">Message</a>

<%--            <a  onclick="makeappointment(<%=profid%>)" class="button">Appointments</a>--%>
            <a  onclick="gettimeslots()" class="button">Appointments</a>
            <%if(count==0){%>
            <a onclick="uploadreq(<%=profid%>,<%=reqid%>,<%=userid%>)" class="button">Upload requirements</a>
            <%}%>
        </div>

        <div class="box2">
            <h3>About</h3>
            <h3>Previous Projects</h3>
        <%for (PreviousProject x:previousProjects){%>
        <%
            String base64Encoded=null;
            if (x.getImgBytes()==null){

            }else {
                byte[] bytes = x.getImgBytes();
                byte[] encodeBase64 = Base64.encodeBase64(bytes);
                base64Encoded = new String(encodeBase64, "UTF-8");
            }
        %>

        <div class="gallery">
            <a target="_blank" href="user4.png">
                <img src="data:image/jpeg;base64,<%=base64Encoded%>" onerror="this.src='./html/professionals/resources/images/Avatar.png;'" >
            </a>
            <p><%=x.getBuiltYear()%>-<%=x.getCity()%><br><%=x.getProvince()%></p>
        </div>
        <%}%>
        </div>

        <div class="box3">
            <i class="fa fa-shopping-bag"></i>
            <h3>Experience</h3>
            <%for (Experience x:experiences){%>
            <p>* I worked as a <%=x.getTitle()%> for <%=x.getYears()%> years in <%=x.getCompanyname()%> company in <%=x.getLocation()%>.</p>
            <%}%>
            <i class="fa fa-pencil-ruler"></i>
            <h3>Skills</h3>
            <%for (Skills x:skills){%>
            <div class="gallery">
                <p>* <%=x.getSkill1()%></p>
                <p>* <%=x.getSkill2()%></p>
                <p>* <%=x.getSkill3()%></p>
                <p>* <%=x.getSkill4()%></p>
                <p>* <%=x.getSkill5()%></p>
                <p> <%=x.getOther()%></p>
            </div>
            <%}%>
        </div>

        <div class="box4">
            <h3>Contact</h3>
            <p>Email - <%=account.getEmail()%></p>
            <p>Tele - <%=account.getContactno()%></p>
        </div>
    </div>
</div><br><br>
<%@include file="../../footer.jsp"%>
<script>
    function makeappointment(id){
        var profid = id
        var out = confirm("makeappointment")
        if (out==true){
            location.href="<%=request.getContextPath()%>/Makeappointment?profid="+profid;
        }else {
            console.log("something wrong")
        }
    }

    function  uploadreq(profid,reqid,userid) {
        var profid1 = profid;
        var reqid1 = reqid;
        var userid = userid;
        var out = confirm("you sure")
        if (out==true){
            location.href="<%=request.getContextPath()%>/sendreqtochooseprof?profid="+profid1+"&reqid="+reqid1+"&userid="+userid;
        }else {
            console.log("canceled the sending request")
        }
    }
    function gettimeslots(){
        var slots =document.getElementById("appointment-timeslots");
        slots.style.display="block";
        var blur = document.getElementById("blur");
        blur.style.filter="blur(8px)";

        // var menubar = document.getElementById("menu_bar");
        // menubar.style.filter="blur(8px)";

    }
    function mypopupclose(){
        var slots =document.getElementById("appointment-timeslots");
        slots.style.display="none";
        var blur = document.getElementById("blur");
        blur.style.filter="none";
        // var menubar = document.getElementById("menu_bar");
        // menubar.style.filter="none";
    }
</script>
</body>

</html>
