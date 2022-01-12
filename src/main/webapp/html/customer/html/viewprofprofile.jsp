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
    Account account = (Account) request.getAttribute("accounts");
    Account account1 = (Account) request.getAttribute("changepic");
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


<body>
<div class="container">
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
            <a href="#" class="button">Appointments</a>
            <a href="#" class="button">Upload requirements</a>
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
</body>

</html>
