<%@ page import="com.example.construct360deg.model.ProductOrder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Integer> productOrders= (ArrayList<Integer>) request.getAttribute("orderids");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ViewOrders</title>
    <link rel="stylesheet" href="./resources/css/vieworder.css">
    <link rel="stylesheet" href="./resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="./resources/js/jquery-3.6.0.js"></script>
    <script>
        function getOrderDetails(ele){
            var orderid=ele.id;
            var text=" ";
            var obj;
            $("#orderdetailsrows").empty();
            $.ajax({
                url:"<%=request.getContextPath()%>/orderdetails",
                type: 'POST',
                data:{"orderid":orderid},
                success: function (data){
                    obj=data;
                    for (let i in obj){
                        text+="<tr><td>"+obj[i].productName+"</td><td>"+obj[i].quantity+"</td><td>"+ obj[i].quantity*obj[i].price +"</td></tr>";
                        $("#orderdetailsrows").append(text);
                        console.log(data);
                    }
                }
            });
            text=" ";
        }
    </script>
</head>

<body>
<div class="container">
    <header class="menu_bar">

        <div class="left_area">
            <!--<h2 class="logoname">Construct360</h2>-->
            <img src="./resources/images/navbar/LoginLogo.png" id="logopic" sizes="100px">
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
                    <img src="./resources/images/navbar/sidebarpro.jpg" id="profile_image" alt="" onclick="click">
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



    <div class="content">
        <div class="container-2">
            <div class="container-3">
                <div class="heading">
                    <h4>Orders</h4>
                </div>

                <div class="ordercolm">
                    <ul>
                        <%for (int i=0;i<productOrders.size();i++){%>
                            <li class="order" onclick="getOrderDetails(this)" id="<%=productOrders.get(i)%>"><%=productOrders.get(i)%></li>
                        <%}%>
                    </ul>
                </div>
            </div>
            <div class="container-4">
                <div class="heading">
                    <h4>Order Number</h4>
                </div>
                <div class="orderdetailscolm">
                    <table>
                        <thead>
                        <tr>
                            <th>Item name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                        </thead>

                        <tbody id="orderdetailsrows">

                        </tbody>
                        <tr>
                            <th>Total</th>
                            <td></td>
                            <td>17000.00</td>
                        </tr>
                    </table>
                    <div class="">
                        <button type="button" class="dwn-btn"><i class="fa fa-download" aria-hidden="true"></i>Download</button>
                    </div>

                </div>
            </div>

        </div>

        <!-- </div> -->


    </div>
    <div class="footer">
        <p>All rights reserved © 2020  Construct360<sup>0</sup>.com<br>Design: Epic code</p>
    </div>

</div>



</body>

</html>