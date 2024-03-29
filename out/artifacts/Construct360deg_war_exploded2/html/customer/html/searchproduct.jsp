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
    <title>Products</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./html/customer/resources/css/searchProduct.css">
    <script src="./resources/js/jquery-3.6.0.js"></script>
    <script>
        $(document).ready(function (){
            $(".order-btn").click(function (){
                console.log($(this).val());
            })

        })
    </script>
</head>

<body>
<%--<%--%>
<%--    if(session.getAttribute("uname")==null){--%>
<%--        response.sendRedirect(request.getContextPath()+"/login");--%>
<%--    }--%>
<%--%>--%>
<%@include file="sidebar-customer.jsp"%>
    <!-- <input type="checkbox" id="check"> -->
    <!-- header area start -->
    <div class="container">

    <!-- header area end -->
    <!-- sidebar start-->

    <div class="content">
        
        <div class="searchbar">
            <!-- <i class="fas fa-search"></i>
                <input type="text" id="myInput" placeholder="Search here..."> -->
                <form class="example" method="get" action="<%=request.getContextPath()%>/searchproduct">
                    <button type="submit"><i class="fa fa-search"></i></button>
                    <input type="text" placeholder="Search.." name="search">
                </form> 
        </div>
        <div class="filter">
            <a href="<%=request.getContextPath()%>/addtocart"><button class="buttonCart">My Cart</button></a>
            <a href="<%=request.getContextPath()%>/vieworders"><button class="buttonOrders">My Orders</button></a>
            <ul>
                <li><h2>Filter By</h2></li>
<%--                <li class="fas fa-angle-down" id="angle-down" onclick="document.querySelector('#ft').classList.toggle('hidden')"></li>--%>
            </ul>

            <div class="filter-table " id="ft">
<%--                <h4>Type :</h4>--%>
<%--                <label class="filterby">Branded--%>
<%--                    <input type="checkbox" checked="checked">--%>
<%--                    <span class="checkmark"></span>--%>
<%--                  </label>--%>
<%--                <label class="filterby">Unbranded--%>
<%--                    <input type="checkbox">--%>
<%--                    <span class="checkmark"></span>--%>
<%--                </label>--%>
<%--                <h4>Seller Ranking :</h4>--%>
<%--                <label class="filterby"><i class="fas fa-star"></i>--%>
<%--                    <input type="checkbox" checked="checked">--%>
<%--                    <span class="checkmark"></span>--%>
<%--                  </label>--%>
<%--                <label class="filterby"><i class="fas fa-star"></i><i class="fas fa-star"></i>--%>
<%--                    <input type="checkbox">--%>
<%--                    <span class="checkmark"></span>--%>
<%--                </label>--%>
<%--                <label class="filterby"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>--%>
<%--                    <input type="checkbox" checked="checked">--%>
<%--                    <span class="checkmark"></span>--%>
<%--                  </label>--%>
<%--                <label class="filterby"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>--%>
<%--                    <input type="checkbox">--%>
<%--                    <span class="checkmark"></span>--%>
<%--                </label>--%>
<%--                <label class="filterby"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>--%>
<%--                    <input type="checkbox">--%>
<%--                    <span class="checkmark"></span>--%>
<%--                </label>--%>
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
                            <a target="_blank" onclick="viewdetails(<%=x.getProductid()%>)">
                                <img src="data:image/jpeg;base64,<%=base64Encoded%>" onerror="this.src='./html/customer/resources/images/Avatar.png;'">
                            </a>
                            <a target="_blank" onclick="viewdetails(<%=x.getProductid()%>)">
                            <div class="desc" > <%=x.getProductName()%></div>
                            <div class="priceunit">LKR </div>
                            <div class="price"><%=x.getPrice()%></div>
<%--                                <div class="quantitypr">Quntity<%=x.getQuantity()%></div>--%>
                            </a>
                        </div>
                        <div class="addtocart">
<%--                          <button onclick="orderproduct(this);" value="<%=x.getProductid()%>" id="<%=x.getProductid()%>" class="order-btn">Order Now</button>--%>
<%--                            <form action="<%=request.getContextPath()%>/orderproduct" method="get">--%>
<%--                                <input type="text" hidden value="<%=x.getProductid()%>" name="productid">--%>
<%--                                <input type="text" hidden value="<%=x.getPrice()%>" name="productprice">--%>
<%--                                <input type="text" hidden value="<%=x.getProductName()%>" name="productname">--%>
<%--                                <input type="text" hidden value="<%=x.getQuantity()%>" name="productquantity">--%>
<%--                                <input type="submit" value="Order Product" class="order-btn">--%>
<%--                            </form>--%>
<%--                            <button onclick="addtocart(this);" class="addtocart-btn" id="<%=x.getProductid()%>">Add to cart</button>--%>
                        </div>

                    </div>
                <%}%>
            </div>
   </div>
</div>
<%--<%@include file="../../footer.jsp"%>--%>
<script>
    function addtocart(ele){
        var out=confirm("Do you want to add the product to the cart");
        if(out==true){
          var productid=ele.id;
          var xhttp=new XMLHttpRequest();
          xhttp.open("POST","<%=request.getContextPath()%>/addtocart?productid="+productid,true);
          xhttp.send();
        }
    }
    function viewdetails(id){
        var productid = id;
        console.log(productid);
        var out=confirm("viewproduct");
        if(out==true){
            location.href="<%=request.getContextPath()%>/viewproductdetails?productid="+productid;
        }else {
            console.log("false box");
        }
    }
</script>

<script>
    const searchbar = document.getElementById('search');

    searchbar.addEventListener('keyup',(e)=>{
        const input = e.target.value;
        if(input==""){
            console.log("null value");
        }else{
            console.log("not null value");
        }

    })
</script>
</body>
</html>