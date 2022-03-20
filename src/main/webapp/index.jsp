<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%
    session.removeAttribute("uname");
    session.removeAttribute("userid");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/homepage.css">
</head>
<body>
<div id ="HOME" class="main">
    <div class="navbar">
        <div class="logo">
            <!--<h2 class="logoname">Construct360</h2>-->
            <img src="./resources/images/homepage/LoginLogo.png" class="logopic">
        </div>
        <div class="menu">
            <ul>
                <li><a href="#HOME">HOME</a></li>
                <li><a href="#SERVICE">SERVICES</a></li>
                <li><a href="#PROJECTS">PROJECT</a></li>
                <li><a href="#ABOUT_US">ABOUT_US</a></li>
                <li><a href="#CONTACT_US">CONTACT_US</a></li>
            </ul>
        </div>

    </div>
    <div class="image-container">
        <figure class="homepagepic-1"></figure>
        <figure class="homepagepic-2"></figure>
        <figure class="homepagepic-3"></figure>
        <figure class="homepagepic-4"></figure>
    </div>
    <div  class="content">
        <h1>DESIGN YOU HOUSE</h1>
        <P>Our construction of the constitution is very different from that you quote.<br> It is that each department is truly independent of the others, and has an equal right to decide for itself what is the meaning of the constitution in the cases submitted to its action; <br>and especially, where it is to act ultimately and without appeal.</P>
        <div>
            <a href="<%=request.getContextPath()%>/login"><button><span></span>SIGN IN</button></a>
            <a href="<%=request.getContextPath()%>/registration"><button><span></span>JOIN WITH US</button></a>
        </div>

    </div>


</div>
<!-- //////////////////////////////////////////Services/////////////////////////////////////////////////////////////// -->
<div id = "SERVICE" class="Services">
    <!-- <div id="Servicestopic"></div> -->
    <div class="Servicecontent">
        <div id="Emptybox1"></div>
        <div id="Planing">
            <img src="./resources/images/homepage/plans.jpg" id="first">
            <div class="contentdetailsSer">
                <h2>Preconstruction Planning</h2>
                <p>Effective pre-construction services and planning is the cornerstone of a successful construction project.
                    The Pioneer approach to pre-construction is to serve both the owner and architect as a reliable source of current, complete, and accurate information.
                </p>
            </div>

        </div>
        <div id="Modelling">
            <div>
                <h1>SERVICES</h1>
            </div>
            <div>
                <img src="./resources/images/homepage/modeling.jpeg" id="middle">
                <div class="contentdetailsSer">
                    <h2>Architectural Modelling</h2>
                    <p>The architectural model is a tool often used to express a building design or masterplan.
                        The model represents architectural ideas, and can be used at all stages of design.
                        An architectural model shows the scale and physical presence of a proposed design.</p>
                </div>
            </div>
        </div>
        <div id="Management">
            <img src="./resources/images/homepage/managemant.png" id="third">
            <div class="contentdetailsSer">
                <h2>Construction Management</h2>
                <p>Whether you are just starting out in the industry or you are an open-minded expert who wants to know how the role has changed and will continue to do so in this new decade, this definitive guide provides an overview of everything you need to grow as a construction manager.</p>
            </div>
        </div>
        <div id="Emptybox2">

        </div>
    </div>

</div>
<!-- /////////////////////////////////////////////////////// Projects//////////////////////////////////////////-->
<div id="PROJECTS" class="PProjects">
    <!-- <div id="Servicestopic"></div> -->
    <div class="Projectcontent">
        <div id="Emptybox3">
            <img src="./resources/images/homepage/p01.jpg" id="secondP">
            <div class="contentdetails">
                <h2>Railway Operation HQ & Train Control Centre at Maradana</h2>
                <p>Client:Ministry of Transport
                    <br><br>Completion Date:July 2023 (planned)
                    <br><br>Location:Colombo 10
                    <br><br>Contractor:Mr. Lochana Udawatta
                </p>
            </div>
        </div>
        <div id="Project01">
            <img src="./resources/images/homepage/p02%20(2).jpg" id="firstP">
            <div class="contentdetails">
                <h2>Fairway Urban Homes</h2>
                <p>
                    Client:Fairway Urban Homes (Pvt) Ltd
                    <br>Location:Koswatte, Colombo District
                    <br>Contractor:Mr. N R Jayathilake
                </p>
            </div>

        </div>
        <div id="Project02">
            <div>
                <h1>PROJECTS</h1>
            </div>
            <div>
                <img src="./resources/images/homepage/p03.jpg" id="thirdP">
                <div class="contentdetails">
                    <h2>Prime Grand, Colombo 07</h2>
                    <p>Client:Prime Group
                        <br><br>Completion Date:November 2021
                        <br><br>Location:Ward Place, Colombo 07
                        <br><br>Contractor:Mr. Saman Mahawatta

                    </p>
                </div>
            </div>
        </div>
        <div id="Project03">
            <img src="./resources/images/homepage/p04.png" id="forthP">
            <div class="contentdetails">
                <h2>Fairway Latitude</h2>
                <p>Client:Fairway Holdings (Pvt) Ltd
                    <br>Location:Colombo 05
                    <br>Contractor:Mr M A S Perera</p>
            </div>
        </div>
        <div id="Emptybox4">
            <img src="./resources/images/homepage/p05.jpg" id="fifthP">
            <div class="contentdetails">
                <h2>Galle Techno-Park</h2>
                <p>Client:Ministry of Information Technology
                    <br><br>Completion Date:July 2023
                    <br><br>Location:Galle District
                    <br><br>Contractor:Mr M S Amarasinghe

                </p>
            </div>
        </div>
    </div>

</div>
<!-- /////////////////////////////////////////// About Us//////////////////////////////////////////////-->
<div id="ABOUT_US" class="AboutUs">
    <!-- <div id="Servicestopic"></div> -->
    <div class="Aboutcontent">
        <div id="Aboutleft">
            <img src="./resources/images/homepage/AboutUspicture1.jpg" id="About01">

        </div>
        <div id="AboutRight">

            <div class="Aboutcontentdetails">
                <h1>ABOUT US</h1>
                <p>
                    In 2022, while working as architects, our founders realized that there was no place for their peers to experience the latest projects, products, and trends. So, we decided to build it.

                    We began as a platform to collect and spread the most important information for architects seeking to build a better world. Today, we are an ever-evolving tool for anybody who has a passion and determination to shape the world around them, including the 13.6 million readers that visit Construct360deg every month.

                    We are proudly driven to help our users design a better world.
                </p>
            </div>

        </div>

    </div>

</div>
<!-- /////////////////////////////////////// Contact Us////////////////////////////////////////////////-->
<div id="CONTACT_US" class="ContactUs">
    <div id="contopic">
        <h1>CONTACT US</h1>
    </div>
    <div id="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.902976854159!2d79.85896421474314!3d6.902205495012678!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae25963120b1509%3A0x2db2c18a68712863!2sUniversity%20of%20Colombo%20School%20of%20Computing!5e0!3m2!1sen!2slk!4v1647588492493!5m2!1sen!2slk" width="1200" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
<%--        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.902976854159!2d79.85896421474314!3d6.902205495012678!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae25963120b1509%3A0x2db2c18a68712863!2sUniversity%20of%20Colombo%20School%20of%20Computing!5e0!3m2!1sen!2slk!4v1647588492493!5m2!1sen!2slk" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>--%>
    </div>
    <div class="line03">
        <div class="inquiries">Inquiries</div>
        <div class="head_Office">Head Office</div>
    </div>
    <div id="line04">
        <div class="InqContent">
            For any inquiries, questions or commendations, <br>please call: 0112581245 or fill out the following form
        </div>
        <div class="Homeoffcontent">
            Construct365 Building Complex, 35 Reid Ave,  <br>Colombo 00700
        </div>
    </div>
    <div class="line05">
        <div class="contactTop">Contact us</div>
        <div class="contactmail">Tel: 0112581245 <br> Fax: 0112581245<br>construct365@mysite.com</div>
    </div>
    <div id="contactform">
        <div class="container">
            <form action="<%=request.getContextPath()%>/Homeform" method="post">

                <label for="fname">First Name</label>
                <input type="text" id="fname" name="firstname" placeholder="Your name..">

                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lastname" placeholder="Your last name..">

                <label for="email"><b>Email*</b></label>
                <input type="text" placeholder="Enter Email" name="email" id="email" required>

                <label for="subject">Message</label>
                <textarea id="subject" name="message"  style="height:200px"></textarea>

                <input type="submit" value="Submit">

            </form>
        </div>
    </div>
    <div class="footer">
        <p>All rights reserved 	&copy; 2020  Construct360deg.com<br>Design:Team Epic Code</p>
    </div>

</div>



</body>
</html>


