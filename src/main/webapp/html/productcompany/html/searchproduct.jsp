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
    <link rel="stylesheet" href="./html/productcompany/resources/css/Searchproductcompany.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
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

    <!-- <input type="checkbox" id="check"> -->
    <!-- header area start -->
    <div class="container">+
        <%@include file="sidebar-productcompany.jsp"%>
    <!-- header area end -->
    <!-- sidebar start-->

    <div class="content">

        <div class="searchbar">
            <!-- <i class="fas fa-search"></i>
                <input type="text" id="myInput" placeholder="Search here..."> -->
                <form class="example" method="get" action="<%=request.getContextPath()%>/searchproduct">
                    <button type="submit"><i class="fa fa-search"></i></button>
                    <input type="text" placeholder="Search.." name="search" id="search">
                </form>
        </div>
        <div class="filter">
            <a href="<%=request.getContextPath()%>/addproduct"><button class="buttonCart">Add Product</button></a>

            <ul>
                <li><h2>Filter By</h2></li>
<%--                <li class="fas fa-angle-down" id="angle-down" onclick="document.querySelector('#ft').classList.toggle('hidden')"></li>--%>

            </ul>

            <div class="filter-table" id="ft">
<%--                <h4>Type :</h4>--%>
<%--                <label class="filterby">Landscape--%>
<%--                    <input type="checkbox" checked="checked">--%>
<%--                    <span class="checkmark"></span>--%>
<%--                  </label>--%>
<%--                <label class="filterby">Ordinary--%>
<%--                    <input type="checkbox">--%>
<%--                    <span class="checkmark"></span>--%>
<%--                </label>--%>
<%--                <h4>Customer Ranking :</h4>--%>
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
                            <a target="_blank" href="user4.jpg">
                                <img src="data:image/jpeg;base64,<%=base64Encoded%>" onerror="this.src='./html/productcompany/resources/images/Avatar.png;'">
                            </a>
                            <div class="desc"> <%=x.getProductName()%></div>
                            <div class="quantitypro">Unit <%=x.getQuantity()%></div>
                            <div class="pricepro"> LKR <%=x.getPrice()%></div>
                        </div>
                        <div class="addtocart">
<%--                            <a href="<%=request.getContextPath()%>/editproducts"><button   class="order-btn">Edit</button></a>--%>
                            <button onclick="editproduct(<%=x.getProductid()%>)" class="order-btn">Edit</button>
                            <button onclick="deleteproduct(<%=x.getProductid()%>)" class="addtocart-btn" >Delete</button>
                        </div>

                    </div>
                <%}%>
            </div>
   </div>
</div>

<script>
    function deleteproduct(id){
        var productid = id;
        console.log(productid);
        var out=confirm("Delete product");
        if(out==true){
          location.href="<%=request.getContextPath()%>/deleteproduct?productid="+productid;
        }
    }
    function editproduct(id){
        var productid = id;
        console.log(productid);
        var out=confirm("Edit product");
        if(out==true){
            location.href="<%=request.getContextPath()%>/editproducts?productid="+productid;
        }else{
            console.log("we in flase box5");
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
<%--<%@include file="../../footer.jsp"%>--%>
</html>