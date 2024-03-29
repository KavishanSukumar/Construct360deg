<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
  int productid= (int) request.getAttribute("productid");
  float productprice=(float) request.getAttribute("productprice");
  String productname= (String) request.getAttribute("productname");
  float productquantity= (float) request.getAttribute("productquantity");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>order product</title>
  <link rel="stylesheet" href="./html/customer/resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="./html/customer/resources/css/orderproduct.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
</head>

<body>
<%@include file="sidebar-customer.jsp"%>
<div class="Maxcontainer">
  <div class="content">
    <div class="container">
      <div class="title">
          <h2>Product Order Form</h2>
      </div>
    <div class="d-flex">
      <form action="<%=request.getContextPath()%>/orderproduct" method="POST" id="my-form" >
        <div class="left-side">
          <label>
            <span>District <span class="required">*</span></span>
            <select name="district">
              <option value="select" disabled>Select a District...</option>
              <option value="Colombo">Colombo</option>
              <option value="Gampaha">Gampaha</option>
              <option value="Kalutara">Kaluthara</option>
              <option value="Kandy">Kandy</option>
              <option value="Matale">Matale</option>
              <option value="NuweraEliya">Nuwera Eliya</option>
              <option value="Galle">Galle</option>
              <option value="Matara">Matara</option>
              <option value="Hambanthota">Hambanthota</option>
              <option value="Rathnapura">Rathnapura </option>
              <option value="Polonnaruwa">Polonnaruwa</option>
              <option value="Anuradhapura">Anuradhapura</option>
              <option value="Kegalle">Kegalle </option>

            </select>
          </label>

          <label>
            <span>Street Address <span class="required">*</span></span>
            <input type="text" name="street" placeholder="House number and street name" required>
          </label>
          <label>
            <span>&nbsp;</span>
            <input type="text" name="houseno" placeholder="Apartment, suite, unit etc. (optional)">
          </label>
          <label>
            <span>Town / City <span class="required">*</span></span>
            <input type="text" name="city" placeholder="Your city">
          </label>
          <label>
            <span>Phone <span class="required">*</span></span>
            <!-- <input type="tel" name="city">  -->
            <input type="tel" id="phone" name="phone" placeholder="xxx-xxxxxxx" pattern="[0-9]{3}[0-9]{7}" required>
          </label>
          <label>
            <span>Email Address <span class="required">*</span></span>
            <input type="email" name="email" placeholder="Your Email" required>
          </label>
          <label>
            <span>Quantity <span class="required">*</span></span>
            <input type="number" name="quantity" onchange="calculateAmount(this.value)" placeholder="" required min="1" max="<%=productquantity%>">
          </label>
        </div>

        <div class="rightside">
            <table>
              <tr>
                <th colspan="2">Your order</th>
              </tr>
              <tr>
                <td><%=productname%></td>
                <input type="text" name="productid" value="<%=productid%>" required hidden>
                <td>Rs.<%=productprice%></td>
              </tr>
              <tr>
                <td>Subtotal</td>
                <td><input class="subtotalprice" name="tot_amount" id="tot_amount" type="text" readonly></td>
                <td></td>
<%--                <td><%=productprice*productquantity%></td>--%>
              </tr><br><br>

            </table><br>
            <div>
              <input type="radio" name="dbt" value="dbt" checked> Pick Up
            </div>
            <p>
                Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order will not be shipped until the funds have cleared in our account.
            </p>
            <div>
              <input type="radio" name="dbt" value="cd"> Home Delivery
            </div>
            <button type="submit">Place Order</button>
        </div><!-- rightside -->

      </form>
     </div>
    </div>
  </div>
</div>
<%@include file="../../footer.jsp"%>
<script>
  function calculateAmount(val){
    var tot_price = val * <%=productprice%>
    var divobj = document.getElementById('tot_amount');
    divobj.value = tot_price;
  }
</script>
</body>


</html>