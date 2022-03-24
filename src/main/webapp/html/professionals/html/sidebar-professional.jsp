<%--<% Account account = (Account) request.getAttribute("accounts");%>--%>
<script src="./resources/js/jquery-3.6.0.js"></script>
<script>
    $(document).ready(function (){
        // $("#profile_name").value=profilename;

        <%--var myvar=setInterval(function (){--%>
        <%--    $.ajax({--%>
        <%--        url:"<%=request.getContextPath()%>/instantnotification",--%>
        <%--        type:"POST",--%>
        <%--        success:function (data){--%>
        <%--            console.log(data[0]);--%>
        <%--            if (data[0]!='0'){--%>
        <%--                $("#notification").addClass("mycolor");--%>
        <%--                $("#notificationtext").addClass("mycolor");--%>
        <%--                $("#notificationtext").html("Notifications("+data[0]+")");--%>

        <%--            }else{--%>
        <%--                $("#notification").removeClass("mycolor");--%>
        <%--                $("#notificationtext").removeClass("mycolor");--%>
        <%--                $("#notificationtext").html("Notifications");--%>
        <%--            }--%>
        <%--        }--%>
        <%--    });--%>
        <%--},25000);--%>
    });
</script>
<header class="menu_bar" id="menu_bar">
    <%
        if(session.getAttribute("uname")==null){
            response.sendRedirect(request.getContextPath()+"/login");
        }
    %>
    <div class="left_area">
        <!--<h2 class="logoname">Construct360</h2>-->
        <img src="./html/professionals/resources/images/Logo.png" id="logopic" sizes="100px">
    </div>
    <div class="right_area">
        <!-- <a href="#" id="logout_btn">Logout</a> -->
        <ul>
            <li><a href="#">HOME</a></li>
            <li><a href="#">SERVICES</a></li>
            <li><a href="#">PROJECT</a></li>
            <li><a href="#">CONTACT US</a></li>
            <li> <i class="fas fa-bars" id="sidebar_btn" onclick="document.querySelector('#nav').classList.toggle('hidden')"></i></li>
        </ul>
    </div>
    <div class="nav-panel hidden" id="nav">
        <ul>

<%--                <a href="<%=request.getContextPath()%>/viewprofile"><img src="./html/professionals/resources/images/def.png" id="profile_image" alt="" ></a>--%>
<%--                <h4 id="profile_name" onload="addprofilename(this)" style="margin-top: -5px;"></h4>--%>


            <!-- <a href="#"><i class="fas fa-laptop-house" id="house"></i><h4>Available Projects</h4></a> -->
            <a href="<%=request.getContextPath()%>/viewprofile"><i class="fas fa-user"></i><h4 id="profile_name">My Profile</h4></a>
            <a href="<%=request.getContextPath()%>/viewproject"><i class="fas fa-hard-hat" id="hat"></i><h4>Projects</h4></a>
            <a href="<%=request.getContextPath()%>/manageadvertise(prof)"><i class="fas fa-ad" id="user"></i><h4>Advertise</h4></a>
            <a href="<%=request.getContextPath()%>/customer"><i class="fas fa-users" id="customers"></i><h4>Customers</h4></a>
            <a href="<%=request.getContextPath()%>/notification" ><i class="fas fa-bell" aria-hidden="true" id="notification"></i><h4 id="notificationtext">Notifications</h4></a>
            <a href="<%=request.getContextPath()%>/paysubscription"><i class="fas fa-dollar-sign" id="payment"></i><h4>Payments & Pricing</h4></a>
            <a href="<%=request.getContextPath()%>/complains"><i class="fas fa-flag-checkered" id="chek"></i><h4>Lodge Complains</h4></a>
            <a href="#"><i class="fas fa-hands-helping" id="head"></i><h4>Help and Support</h4></a>
            <a href="<%=request.getContextPath()%>/Logout"><i class="fas fa-sign-out-alt" id="logout"></i><h4>Logout</h4></a>
        </ul>
    </div>
</header>