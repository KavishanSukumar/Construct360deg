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
    <link rel="stylesheet" href="./html/productcompany/resources/css/advertiseproduct.css">
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

<div class="container">+
    <%@include file="sidebar-productcompany.jsp"%>
    <!-- header area end -->
    <!-- sidebar start-->

    <div class="content">

        <div class="searchbar">

            <form class="example" method="get" action="<%=request.getContextPath()%>/promoteproduct">
                <button type="submit"><i class="fa fa-search"></i></button>
                <input type="text" placeholder="Search.." name="search" id>
            </form>
        </div>
        <div class="filter">


            <ul>
                <li><h2>Filter By</h2></li>
                <li class="fas fa-angle-down" id="angle-down" onclick="document.querySelector('#ft').classList.toggle('hidden')"></li>

            </ul>

            <div class="filter-table hidden" id="ft">


                <h4>Customer Ranking :</h4>
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

        <div class="profiles" id="pict">
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

                    <a target="_blank" onclick="openForm()">
                        <img src="data:image/jpeg;base64,<%=base64Encoded%>" onerror="this.src='./html/productcompany/resources/images/Avatar.png;'">
                    </a>
                    <div class="desc"> <%=x.getProductName()%></div>
                </div>
                <div class="addtocart">


                        <button onclick="openForm()" class="order-btn">Advertise product</button>
                </div>
<%--                /////////////////////////////////////////////////////new popup window--%>
                <div class="loginPopup">
                    <div class="formPopup" id="popupForm">
                        <form  method="post" action="https://sandbox.payhere.lk/pay/checkout" class="formContainer">

                            <input type="hidden" name="merchant_id" value="1219380">
                            <input type="hidden" name="return_url" value="http://localhost:8080/Construct360deg_war_exploded/promoteproduct">
                            <input type="hidden" name="cancel_url" value="http://localhost:8080/Construct360deg_war_exploded/promoteproduct">
                            <input type="hidden" name="notify_url" value="">
                            <%--            <br><br>Item Details<br>--%>
                            <input type="hidden" name="order_id" value="">
                            <input type="hidden" name="items" value="Monthly Subscription">
                            <input type="hidden" name="currency" value="LKR">
<%--                            <input type="hidden" name="amount" value="40">--%>
                            <input type="hidden" name="first_name" value=<%=x.getProductName()%>>
                            <input type="hidden" name="last_name" value=" ">
                            <input type="hidden" name="email" value="construct360deg@gmail.com">
                            <input type="hidden" name="phone" value="+94775844312">
                            <input type="hidden" name="address" value=" ">
                            <input type="hidden" name="city" value=" ">
                            <input type="hidden" name="country" value="Sri Lanka">



                            <h2>Promote Your Product</h2>
                            <p>Your product will be appear in the customer landing page</p>
<%--////////////////////////////////////////////////////////////////////////////////////////////////////--%>

                            <input type="hidden" name="mode" value="pinRequest"/>
                            <label class="label-PIN"><b><br>Number of days</b></label>
                            <select name="tot_pin_requested" onchange="calculateAmount(this.value)" required>
                                <option value=" " disabled selected>Choose your option</option>
                                <option value="1">7 days</option>
                                <option value="2">8 days</option>
                                <option value="3">9 days</option>
                                <option value="4">10 days</option>
                            </select>
                            <label><b><br>Price(Rs.)</b></label>
                            <input class="amountot" name="tot_amount" id="tot_amount" type="text" readonly>
                            <input type="hidden" name="amount" value="" id="payval"/>
                            <button type="submit" class="btn">Promote Now</button>
                            <button type="button" class="btn cancel" onclick="closeForm()">Cancel</button>
                            <script>
                                function calculateAmount(val){
                                    var tot_price = val * 1000;
                                    var divbob = document.getElementById('tot_amount');
                                    var payval=document.getElementById('payval');
                                    divbob.value = tot_price;
                                    payval.value=tot_price;
                                }
                            </script>
                        </form>
                    </div>
                </div>
<%--                /////////////////////////////////////////////////////////--%>


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
<script>


</script>
<script>
    function openForm() {
        document.getElementById("popupForm").style.display = "block";
    }
    function closeForm() {
        document.getElementById("popupForm").style.display = "none";
    }
</script>
</body>

</html>