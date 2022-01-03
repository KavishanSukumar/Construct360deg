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
    <script src="./resources/js/jquery-3.6.0.js"></script>
  <script type="text/javascript">
    $(document).ready(function (){
        $("#neworder").click(function (){
            $("#neworder").addClass("active");
            $("#confirmorder").removeClass("active");
            $("#rejectedorder").removeClass("active");
            $("#neworders").css("display","block");
            $("#confirmorders").css("display","none");
            $("#rejectedorders").css("display","none");
        });
        $("#confirmorder").click(function (){
            $("#neworder").removeClass("active");
            $("#confirmorder").addClass("active");
            $("#rejectedorder").removeClass("active");
            $("#neworders").css("display","none");
            $("#confirmorders").css("display","block");
            $("#rejectedorders").css("display","none");
        });
        $("#rejectedorder").click(function (){
            $("#neworder").removeClass("active");
            $("#confirmorder").removeClass("active");
            $("#rejectedorder").addClass("active");
            $("#neworders").css("display","none");
            $("#confirmorders").css("display","none");
            $("#rejectedorders").css("display","block");
        });

    });

  </script>
</head>

<body>

    <div class="vieworder">
        <h1 id="ordernumber" style="text-align: center"></h1>
        <h2 id="customername" style="text-align: left"></h2>
        <h3 id="address" style="text-align: left"></h3>
        <h3 id="itemid" style="text-align: left"></h3>
        <h3 id="itemname" style="text-align: left"></h3>
        <h3 id="quantity" style="text-align: left"></h3>
        <h3 id="price" style="text-align: left"></h3>
        <h3 id="contactno" style="text-align: left"></h3>
        <span><button class="btn" onclick="closeorder(this)" style="text-align: right">Close</button>       <button class="btn" style="text-align: right">Print</button></span>
    </div>
    <div class="container">
        <%@include file="sidebar-productcompany.jsp"%>
        <div class="content">
            <div class="second">
                <form action="<%=request.getContextPath()%>/searchorders" method="post">
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
                        <input id="search" name="search" type="text" size = "59"class="form-control validate" />
                    </div>
                    <div class="OK">
                        <button type="submit" class="okbtn" id="searchbtn">GO</button>
                    </div>
                </form>
            </div>
            <div class="third">
                <div class="ordertypes">
                    <button class="active" id="neworder">New Orders</button>
                    <button id="confirmorder">Confirmed Orders</button>
                    <button id="rejectedorder">Rejected Orders</button>
                </div>

                <!-- ///////////////////////////////////////////// -->
                <div class="ordertable" id="neworders" >
                    <table class="logTable">
                        <thead>
                        <tr class="headrow">
                            <th class="Date"><span>Order ID</span></th>
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
                            <%if(a.getOrderstatus().equals("Pending")){%>
                                    <tr id="<%=a.getOrderid()%>" onclick="openorder(this)" class="1stline">
                                        <td ><%=a.getOrderid()%></td>
                                        <td ><%=a.getOrderdate()%></td>
                                        <td ><%=a.getCustomername()%></td>
                                        <td ><%=a.getProductname()%></td>
                                        <td ><%=a.getQuantity()%></td>
                                        <td >Rs.<%=a.getQuantity()*a.getProductprice()%></td>
                                        <td ><%=a.getDeliverytype()%></td>
                                        <td><button class="btn" onclick=orderconfirm(this) id="<%=a.getOrderid()%>">Confirm Order</button> <button class="btn" onclick="orderreject(this)" id="<%=a.getOrderid()%>">Reject</button></td>
                                    </tr>
                            <%}%>
                        <%}%>
                        </tbody>
                    </table>
                </div>


                <div class="ordertable" id="confirmorders">
                    <table class="logTable">
                        <thead>
                        <tr class="headrow">
                            <th class="Date"><span>Order ID</span></th>
                            <th class="Date"><span>Order Date</span></th>
                            <th class="User"><span>Customer</span></th>
                            <th class="User"><span>Product Name</span></th>
                            <th class="User"><span>Product Quantity</span></th>
                            <th class="EventSource"><span>Order Total</span></th>
                            <th class="Activity"><span>Delivery Type</span></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for(Order a:orders){%>
                            <%if(a.getOrderstatus().equals("Confirmed")){%>
                                <tr id="<%=a.getOrderid()%>" onclick="openorder(this)" class="1stline">
                                    <td ><%=a.getOrderid()%></td>
                                    <td ><%=a.getOrderdate()%></td>
                                    <td ><%=a.getCustomername()%></td>
                                    <td ><%=a.getProductname()%></td>
                                    <td ><%=a.getQuantity()%></td>
                                    <td >Rs.<%=a.getQuantity()*a.getProductprice()%></td>
                                    <td ><%=a.getDeliverytype()%></td>
                                </tr>
                            <%}%>
                        <%}%>
                        </tbody>
                    </table>
                </div>


                <div class="ordertable" id="rejectedorders">
                    <table class="logTable">
                        <thead>
                        <tr class="headrow">
                            <th class="Date"><span>Order ID</span></th>
                            <th class="Date"><span>Order Date</span></th>
                            <th class="User"><span>Customer</span></th>
                            <th class="User"><span>Product Name</span></th>
                            <th class="User"><span>Product Quantity</span></th>
                            <th class="EventSource"><span>Order Total</span></th>
                            <th class="Activity"><span>Delivery Type</span></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for(Order a:orders){%>
                            <%if(a.getOrderstatus().equals("Rejected")){%>
                                <tr id="<%=a.getOrderid()%>" onclick="openorder(this)" class="1stline">
                                    <td ><%=a.getOrderid()%></td>
                                    <td ><%=a.getOrderdate()%></td>
                                    <td ><%=a.getCustomername()%></td>
                                    <td ><%=a.getProductname()%></td>
                                    <td ><%=a.getQuantity()%></td>
                                    <td >Rs.<%=a.getQuantity()*a.getProductprice()%></td>
                                    <td ><%=a.getDeliverytype()%></td>
                                </tr>
                            <%}%>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<%@include file="../../footer.jsp"%>
</body>
<script>
    function orderconfirm(ele){
        var orderid=ele.id;
        var out=confirm("Do you want to confirm the order!");
        if(out==true){
            console.log("test")
            var xHTTP=new XMLHttpRequest();
            xHTTP.open("POST","<%=request.getContextPath()%>/ViewAllOrders?task=1&orderid="+orderid,true);
            xHTTP.send();
            location="<%=request.getContextPath()%>/ViewAllOrders";
            console.log("Hello1");
        }
    }

    function orderreject(ele){
        var orderid=ele.id;
        var out=confirm("Do you want to reject the order!");
        if (out==true){
            console.log("test2")
            var xHTTP=new XMLHttpRequest();
            xHTTP.open("POST","<%=request.getContextPath()%>/ViewAllOrders?task=0&orderid="+orderid,true);
            xHTTP.send();
            location="<%=request.getContextPath()%>/ViewAllOrders";
            console.log("Hello2");
        }
    }

    function openorder(ele){
        var orderid=ele.id;
        var customername=null;
        var address=null;
        var itemid=null;
        var itemname=null;
        var quantity=null;
        var price=null;
        var contactno=null;
        <%for(Order a:orders){%>
        if(orderid==<%=a.getOrderid()%>){
            customername="<%=a.getCustomername()%>";
            address="<%=a.getHouseno()%>,<%=a.getStreet()%>,<%=a.getCity()%>,<%=a.getDistrict()%>";
            itemid=<%=a.getProductid()%>;
            itemname="<%=a.getProductname()%>";
            quantity=<%=a.getQuantity()%>;
            price=<%=a.getProductprice()%>;
            contactno="<%=a.getPhone()%>";
        }
        <%}%>
        document.getElementById("ordernumber").innerHTML=orderid;
        document.getElementById("customername").innerHTML="Customer Name:"+customername;
        document.getElementById("address").innerHTML="Address:"+address;
        document.getElementById("itemid").innerHTML="Item Id:"+itemid;
        document.getElementById("itemname").innerHTML="Item Name:"+itemname;
        document.getElementById("quantity").innerHTML="Quantity:"+quantity;
        document.getElementById("price").innerHTML="Price:"+price;
        document.getElementById("contactno").innerHTML="Contact Number:"+contactno;

        var element1=document.getElementsByClassName("vieworder");
        var element2=document.getElementsByClassName("container");

        for (var i=0;i<element1.length;i+=1){
            element1[i].style.display = 'block';
        }
        for (var i=0;i<element2.length;i+=1){
            element2[i].classList.add("blurer");
        }
    }

    function closeorder(ele){
        var element3=document.getElementsByClassName("vieworder");
        var element4=document.getElementsByClassName("container");

        for (var i=0;i<element3.length;i+=1){
            element3[i].style.display = 'none';
        }

        for (var i=0;i<element4.length;i+=1){
            element4[i].classList.remove("blurer");
        }
    }
</script>

</html>