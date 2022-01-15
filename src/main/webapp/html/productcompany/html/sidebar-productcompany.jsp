<header class="menu_bar">
    <%
        if(session.getAttribute("uname")==null){
            response.sendRedirect(request.getContextPath()+"/login");
        }
    %>
    <div class="left_area">
        <!--<h2 class="logoname">Construct360</h2>-->
        <img src="./html/productcompany/resources/images/Logo.png" id="logopic" sizes="100px">
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
                <a href="<%=request.getContextPath()%>/viewprofile"><img src="./html/productcompany/resources/images/Addproduct/companyLogo.jpg" id="profile_image" alt="" ></a>
                <h4 id="profile_name" style="margin-top: -5px;">Square angle</h4>
            </div>
            <!-- <a href="#"><i class="fas fa-laptop-house" id="house"></i><h4>Available Projects</h4></a> -->
            <a href="<%=request.getContextPath()%>/searchproduct"><i class="fab fa-product-hunt" id="hat"></i><h4>Products</h4></a>
            <a href="<%=request.getContextPath()%>/ViewAllOrders"><i class="fas fa-cart-arrow-down" id="hunt"></i><h4>Orders</h4></a>
            <a href="<%=request.getContextPath()%>/manageadvertise(prof)"><i class="fas fa-ad" id="user"></i><h4>Advertise</h4></a>
            <a href="<%=request.getContextPath()%>/paysubscription"><i class="fas fa-dollar-sign" id="payment"></i><h4>Payment & Pricing</h4></a>
            <a href="<%=request.getContextPath()%>/complains"><i class="fas fa-flag-checkered" id="chek"></i><h4>Lodge Complains</h4></a>
            <a href="#"><i class="fas fa-hands-helping" id="head"></i><h4>Help and Support</h4></a>
            <a href="<%=request.getContextPath()%>/Logout"><i class="fas fa-sign-out-alt" id="logout"></i><h4>Logout</h4></a>
        </ul>
    </div>
</header>