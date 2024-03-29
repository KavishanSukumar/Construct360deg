<%@ page import="com.example.construct360deg.model.Product" %>
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
    <link rel="stylesheet" href="./html/customer/resources/css/vieworder.css">
    <link rel="stylesheet" href="./html/customer/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="./resources/js/jquery-3.6.0.js"></script>
    <script>
        function getOrderDetails(ele){
            var orderid=ele.id;
            var text=" ";
            var total=0;
            $("#OrderNum").empty();
            $("#OrderNum").append(orderid);
            $("#orderdetailsrows").empty();
            $.ajax({
                url:"<%=request.getContextPath()%>/vieworders",
                type: 'POST',
                data:{"orderid":orderid},
                success: function (data){
                    for (let i in data){
                        text="<tr><td>"+data[i].productName+"</td><td>"+data[i].quantity+"</td><td>"+ data[i].quantity*data[i].price +"</td><td><button class='cancel-btn' onclick='cancelorder("+orderid+")' id='"+orderid+"'>Cancel</button></td></tr>";
                        $("#orderdetailsrows").append(text);
                        total+=data[i].quantity*data[i].price;
                    }
                    $("#totalvalue").empty();
                    $("#totalvalue").append(total);
                }
            });
        }

        function cancelorder(data){
            var confirmdeletion=confirm("Do you want to delete the order?");
            if (confirmdeletion){
                $.ajax({
                    url:"<%=request.getContextPath()%>/cancelorder",
                    type: 'POST',
                    data:{"orderid":data},
                    success: function (data){
                        location.href="<%=request.getContextPath()%>/vieworders";
                    }
                });
            }
        }
    </script>
</head>

<body>
<%
    if(session.getAttribute("uname")==null){
        response.sendRedirect(request.getContextPath()+"/login");
    }
%>
<%@include file="sidebar-customer.jsp"%>
<div class="container-1">
    <div class="content">
        <div class="container-2">
            <div class="container-3">
                <div class="heading">
                    <h2>Orders</h2>
                </div>
                <div class="ordercolm">
                    <ul>
                        <%for (int i=0;i<productOrders.size();i++){%>
                            <li class="order" onclick="getOrderDetails(this)" id="<%=productOrders.get(i)%>"><strong><%=productOrders.get(i)%></strong></li>
                        <%}%>
                    </ul>
                </div>
            </div>
            <div class="container-4">
                <div class="heading">
                    <h2 id="OrderNum">Order Number</h2>
                </div>
                <div class="orderdetailscolm">
                    <table>
                        <thead>
                        <tr>
                            <th>Item name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody id="orderdetailsrows">
                        </tbody>
                        <tr>
                            <th>Total</th>
                            <td></td>
                            <td id="totalvalue">0.00</td>
                        </tr>
                    </table>
                    <div class="" id="downloadbutton">
                        <button type="button" class="dwn-btn"><i class="fa fa-download" aria-hidden="true"></i>Download</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../../footer.jsp"%>
</body>

</html>