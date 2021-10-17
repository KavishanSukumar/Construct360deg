<%@ page import="com.example.construct360deg.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<!DOCTYPE html>
<html lang="en">
<%
    ArrayList<Product> products= (ArrayList<Product>) request.getAttribute("products");

%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SerachProfile</title>
    <link rel="stylesheet" href="./resources/css/serachProduct.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<%
    if(session.getAttribute("uname")==null){
        response.sendRedirect(request.getContextPath()+"/login");
    }

%>

    <!-- <input type="checkbox" id="check"> -->
    <!-- header area start -->
    <div class="container">+
    <header class="menu_bar">

        <div class="left_area">
            <!--<h2 class="logoname">Construct360</h2>-->
            <img src="./resources/images/searchProducts/LoginLogo.png" id="logopic" sizes="100px">
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
            <img src="./resources/images/searchProducts/sidebarpro.jpg" id="profile_image" alt="" onclick="click">
            <h4 id="profile_name" style="margin-top: -5px;">Reena</h4>
            </div>
            <!-- <a href="#"><i class="fas fa-laptop-house" id="house"></i><h4>Available Projects</h4></a> -->
            <a href="#"><i class="fas fa-hard-hat" id="hat"></i><h4>Projects</h4></a>
            <a href="#"><i class="fab fa-product-hunt" id="hunt"></i><h4>Products</h4></a>
            <a href="#"><i class="fas fa-user" id="user"></i><h4>Professionals</h4></a>
            <a href="#"><i class="fas fa-flag-checkered" id="chek"></i><h4>Report</h4></a>
            <a href="#"><i class="fas fa-headset" id="head"></i><h4>Help and Support</h4></a>
            <a href="#"><i class="fas fa-sign-out-alt" id="logout"></i><h4>Logout</h4></a>
            </ul>
        </div>
    </header>
    <!-- header area end -->
    <!-- sidebar start-->

    <div class="content">
        
        <div class="searchbar">
            <!-- <i class="fas fa-search"></i>
                <input type="text" id="myInput" placeholder="Search here..."> -->
                <form class="example" action=" ">
                    <button type="submit"><i class="fa fa-search"></i></button>
                    <input type="text" placeholder="Search.." name="search">
                </form> 
        </div>
        <div class="filter"> 
            <ul>
                <li><h2>Filter By</h2></li>
                <li class="fas fa-angle-down" id="angle-down" onclick="document.querySelector('#ft').classList.toggle('hidden')"></li>
                 
            </ul>
           
            <div class="filter-table hidden" id="ft">
                <h4>Type :</h4>
                <label class="filterby">Branded
                    <input type="checkbox" checked="checked">
                    <span class="checkmark"></span>
                  </label>
                <label class="filterby">Unbranded
                    <input type="checkbox">
                    <span class="checkmark"></span>
                </label>
                <h4>Seller Ranking :</h4>
                <label class="filterby"><i class="fas fa-star"></i>
                    <input type="checkbox" checked="checked">
                    <span class="checkmark"></span>
                  </label>
                <label class="filterby"><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    <input type="checkbox">
                    <span class="checkmark"></span>
                </label>
                <label class="filterby"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    <input type="checkbox" checked="checked">
                    <span class="checkmark"></span>
                  </label>
                <label class="filterby"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    <input type="checkbox">
                    <span class="checkmark"></span>
                </label>
                <label class="filterby"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    <input type="checkbox">
                    <span class="checkmark"></span>
                </label>
                <h4>Price :</h4>
                <label class="filterby">Under Rs.1000.00
                    <input type="checkbox" checked="checked">
                    <span class="checkmark"></span>
                  </label>
                <label class="filterby">Rs1000.00-5000.00
                    <input type="checkbox" checked="checked">
                    <span class="checkmark"></span>
                </label> 
                <label class="filterby">Rs5000.00-10000.00
                    <input type="checkbox" checked="checked">
                    <span class="checkmark"></span>
                </label> 
                <label class="filterby">Over Rs10000.00
                    <input type="checkbox" checked="checked">
                    <span class="checkmark"></span>
                </label>  
            </div>    
        </div>

            <div class="profiles">
                <%for (Product x: products){%>
                    <%
                        String base64Encoded=null;
                        if(x.getImgBytes()==null){

                        }else{
                            byte[] bytes=x.getImgBytes();
                            byte[] encodeBase64= Base64.encodeBase64(bytes);
                            base64Encoded=new String(encodeBase64,"UTF-8");
                        }
                    %>
                    <div class="profile">
                        <div class="gallery">
                            <a target="_blank" href="user4.jpg">
                                <img src="data:image/jpeg;base64,<%=base64Encoded%>" onerror="this.src='./resources/images/Avatar.png;'">
                            </a>
                            <div class="desc"> <%=x.getProductName()%></div>
                        </div>
                        <div class="addtocart">
                            <a href="#">Order Now</a>
                            <a href="#">Add to cart</a>
                        </div>
                    </div>
                <%}%>
            </div>
   </div>
</div>

</body>

</html>