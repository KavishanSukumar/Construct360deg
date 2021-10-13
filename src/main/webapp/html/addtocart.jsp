<%@ page language="java" contentType="text/html;  ISO-8859-1"
         pageEncoding="iso-8859-1" %>
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
                            <li class="item">
                                <div class="itemimg">
                                    <input type="checkbox" id="item1" name="item1">
                                    <label for="item1"><strong>General purpose cement</strong></label>
                                    <br>
                                    <img src="./resources/images/addtocart/image1.jpg" alt="item1">
                                </div>
                                <div class="itemdes">
                                    <p>Lorem ipsum dolor, sit amet consectetur
                                        adipisicing elit. Totam odit quia suscipit consequuntur
                                        esse earum quidem, deleniti culpa minima? Consectetur?
                                    </p>
                                </div>
                            </li>

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
                                <td>Rs.<span id="priceval">500.00</span></td>
                            </tr>
                            <tr>
                                <td>Discount</td>
                                <td>Rs.<span id="discountval">500.00</span></td>
                            </tr>
                            <tr>
                                <td>Subtotal</td>
                                <td>Rs.<span id="subtotalval">500.00</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>