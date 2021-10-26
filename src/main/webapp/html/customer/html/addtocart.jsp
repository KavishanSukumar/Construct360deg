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
    <link rel="stylesheet" href="./html/customer/resources/css/addtocart.css">
    <link rel="stylesheet" href="./html/customer/resources/css/nav-bar-updated.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="./resources/js/jquery-3.6.0.js"></script>
    <script>
        $(document).ready(function (){
            var total=0;
            var discount=0;
            $(".select-all").click(function (){
                if($(".select-all").prop('checked')){
                    total=0;
                    $(".select-each").each(function (){
                        $(".select-each").prop("checked",true);
                        total=total+parseInt($(this).val());
                    });
                }else{
                    $(".select-each").each(function (){
                        $(".select-each").prop("checked",false);
                    });
                    total=0;
                }
                $("#priceval").text(total);
                $("#discountval").text(discount);
                $("#subtotalval").text(total-discount);
            });
            $('input[type="checkbox"]').click(function(){
                if($(this).prop("checked") == true){
                    total=total+parseInt($(this).val());
                    console.log(total);
                }
                else if($(this).prop("checked") == false){
                    $(".select-all").prop("checked",false);
                    total=total-parseInt($(this).val());
                    console.log(total);
                }
                $("#priceval").text(total);
                $("#discountval").text(discount);
                $("#subtotalval").text(total-discount);
            });
        });
    </script>
</head>
<body>
    <%@include file="sidebar-customer.jsp"%>
    <div class="container-1">
            <div class="container-3">
                <div class="selectall">
                    <input type="checkbox" id="selectall" name="selectall" class="select-all" value="0">
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
                                        <input type="checkbox" id="<%=x.getProductid()%>" name="<%=x.getProductName()%>" value="<%=x.getPrice()%>" class="select-each">
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
<%@include file="../../footer.jsp"%>
</body>
</html>