<header class="menu_bar">
    <%
        if(session.getAttribute("uname")==null){
            response.sendRedirect(request.getContextPath()+"/login");
        }
    %>
    <div class="left_area">
        <!--<h2 class="logoname">Construct360</h2>-->
        <img src="./html/admin/resources/images/Logo.png" id="logopic" sizes="100px">
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
            <div>
                <a href="<%=request.getContextPath()%>/viewprofile"><img src="./html/admin/resources/images/adminpic.jpg" id="profile_image" alt="" ></a>
                <h4 id="profile_name" style="margin-top: -5px;">Pathum</h4>
            </div>
            <!-- <a href="#"><i class="fas fa-laptop-house" id="house"></i><h4>Available Projects</h4></a> -->
            <a href="<%=request.getContextPath()%>/searchprofile"><i class="fas fa-users" id="folder1"></i><h4>All Users</h4></a>
            <a href="<%=request.getContextPath()%>/userdocument"><i class="fas fa-folder-minus" id="folder"></i><h4>User Document</h4></a>
            <a href="<%=request.getContextPath()%>/inquires"><i class="fas fa-flag-checkered" id="flag"></i><h4>Inquires</h4></a>
            <a href="<%=request.getContextPath()%>/allpayments"><i class="fas fa-file-invoice-dollar" id="payment"></i><h4>Payment Details</h4></a>
            <a href="<%=request.getContextPath()%>/managelog"><i class="fas fa-address-book" id="book"></i><h4>Manage Log </h4></a>
            <a href="<%=request.getContextPath()%>/manageadds"><i class="fas fa-ad" id="ads"></i><h4>Manage Ads </h4></a>
            <a href="#"><i class="fas fa-hands-helping" id="help"></i><h4>Help and Support</h4></a>
            <a href="<%=request.getContextPath()%>/Logout"><i class="fas fa-sign-out-alt" id="logout"></i><h4>Logout</h4></a>
        </ul>
    </div>
</header>