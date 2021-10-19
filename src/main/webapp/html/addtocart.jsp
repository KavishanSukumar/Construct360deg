<%@ page import="com.example.construct360deg.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.Cart" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page language="java" contentType="text/html;  ISO-8859-1"
         pageEncoding="iso-8859-1" %>

<%
    ArrayList<Cart> products= (ArrayList<Cart>) request.getAttribute("cartproducts");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add to cart</title>
    <link rel="stylesheet" href="./resources/css/addtocart.css">
    <link rel="stylesheet" href="./resources/css/nav-bar-updated.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="../resources/js/jquery-3.6.0.js"></script>
</head>
<body>
    <%@include file="sidebar.jsp"%>
    <div class="container-1">
            <div class="container-3">
                <div class="selectall">
                    <input type="checkbox" id="selectall" name="selectall">
                    <label for="selectall">Select all</label>
                </div>
                <div class="itemcolumn">
                        <ul class="itemlist">
                            <%for(Cart x: products){%>
                                <%
                                    String base64Encoded=null;
                                    if(x.getImgBytes()==null){

                                    }else{
                                        byte[] bytes = x.getImgBytes();
                                        byte[] encodeBase64 = Base64.encodeBase64(bytes);
                                        base64Encoded = new String(encodeBase64, "UTF-8");
                                    }

                                %>

                                <li class="item">
                                    <div class="itemimg">
                                        <input type="checkbox" id="<%=x.getProductid()%>" name="<%=x.getProductName()%>">
                                        <label for="<%=x.getProductid()%>"><strong><%=x.getProductName()%></strong></label>
                                        <br>
                                        <img src="data:image/jpeg;base64,<%=base64Encoded%>" alt="item image not available">
                                    </div>
                                    <div class="itemdes">
                                        <p><%=x.getProductdes()%></p>
                                    </div>
                                </li>
                            <%}%>
                        </ul>
                </div>
            </div>
            <div class="subtotalcolumn">
                <div class="subtotalsection">
                    <h3>Order Summary</h3>
                    <div class="prices">
                        <table class="pricetable">
                            <br>
                            <tr>
                                <td>Total price</td>
                                <td>Rs.<span id="priceval">0.00</span></td>
                            </tr>
                            <tr>
                                <td>Discount</td>
                                <td>Rs.<span id="discountval">0.00</span></td>
                            </tr>
                            <tr>
                                <td>Subtotal</td>
                                <td>Rs.<span id="subtotalval">0.00</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>