<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.Order" %>
<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<%
    ArrayList<Order> orders= (ArrayList<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Orders</title>
  <link rel="stylesheet" href="./html/productcompany/resources/css/vieworders.css">
  <link rel="stylesheet" href="./html/productcompany/resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>

<%@include file="sidebar-productcompany.jsp"%>
<div class="container">

<div class="content">

    <div class="second">
        <form action="">
            <div class="from">
                <label name="activityfrom">Show Orders From</label> &ensp;
                <input id="activityfrom" name="activityfrom" type="date" size = "59"class="form-control validate" />
            </div>
            <div class="to">
                <label name="activityTo">To</label> &ensp;
                <input id="activityTo" name="activityTo" type="date" size = "59"class="form-control validate" />
            </div>
            <div class="By_option">
                <label name="By">Search</label> &ensp;
                <input id="By" name="By" type="text" size = "59"class="form-control validate" />
            </div>
            <div class="OK">
                <button type="button" class="okbtn">GO</button>
              </div>
        </form>
    </div>
    <div class="third">
        <div class="ordertypes">
            <button>New Orders</button>
            <button>Confirmed Orders</button>
            <button>Rejected Orders</button>
        </div>

        <!-- ///////////////////////////////////////////// -->
        <div class="ordertable">
            <table class="logTable">
                <thead>
                <tr class="headrow">
                    <th class="Date"><span>Order Date</span></th>
                    <th class="User"><span>Customer</span></th>
                    <th class="User"><span>Product Name</span></th>
                    <th class="User"><span>Product Quantity</span></th>
                    <th class="EventSource"><span>Order Total</span></th>
                    <th class="Activity"><span>Delivery Type</span></th>
                    <th class="Activity"><span>Confirmation Rejection</span></th>
                </tr>
                </thead>
                <tbody>
                <%for(Order a:orders){%>
                    <a>
                        <tr class="1stline">
                            <td ><%=a.getOrderdate()%></td>
                            <td ><%=a.getCustomername()%></td>
                            <td ><%=a.getProductname()%></td>
                            <td ><%=a.getQuantity()%></td>
                            <td >Rs.<%=a.getQuantity()*a.getProductprice()%></td>
                            <td ><%=a.getDeliverytype()%></td>
                            <td><button class="btn">Confirm Order</button> <button class="btn">Reject</button></td>
                        </tr>
                    </a>
                <%}%>
                </tbody>
            </table>
        </div>
        <!-- ///////////////////////////////////////////// -->
    </div>
</div>

</div>
</div>
<%@include file="../../footer.jsp"%>
</body>


</html>