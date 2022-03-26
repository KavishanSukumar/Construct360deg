<%@ page import="com.example.construct360deg.model.AllUsers" %>
<%
    AllUsers user= (AllUsers) request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Paying subscription</title>
  <link rel="stylesheet" href="./html/customer/resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="./html/customer/resources/css/pay-sub.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<video autoplay muted loop id="myVideo">
    <source src="./html/customer/resources/images/paysub/rain.mp4" type="video/mp4">
    Your browser does not support HTML5 video.
</video>
<%@include file="sidebar-customer.jsp"%>
    <div class="container" id="container">

      <div class="content" id="content">
        <div id="free" class="free">
          <div class="ammount">
            <h1>0/<span style="font-size: 30px">Mo</span></h1>
          </div>
          <div class="facilities">
            <ul class="facilities-list" style="list-style-type: circle">
              <li>Finding professionals</li>
              <li>Finding previous projects</li>
              <li>A lifetime continues subscription</li>
              <li> </li>
            </ul>
          </div>
          <div class="sub">
            <button value="freesubscription" class="sub-btn" disabled>Your Plan</button>
          </div>
        </div>

          <div id="monthly" class="monthly">
            <form method="post" action="https://sandbox.payhere.lk/pay/checkout">
                <%--        monthly--%>
                <input type="hidden" name="merchant_id" value="1219380">
                <input type="hidden" name="return_url" value="http://localhost:8080/Construct360deg_war_exploded/paysubscription">
                <input type="hidden" name="cancel_url" value="http://localhost:8080/Construct360deg_war_exploded/paysubscription">
                <input type="hidden" name="notify_url" value="">
                <%--            <br><br>Item Details<br>--%>
                <input type="hidden" name="order_id" value="<%=user.getUserid()%>mon">
                <input type="hidden" name="items" value="Monthly Subscription">
                <input type="hidden" name="currency" value="LKR">
                <input type="hidden" name="amount" value="500">
                <%--            <br><br>Customer Details<br>--%>
                    <%
                        String name=null;
                        if(user.getProffullname()!=null)
                            name=user.getProffullname();
                        else if(user.getProfcompanyname()!=null)
                            name=user.getProfcompanyname();
                        else if(user.getCusindfullname()!=null)
                            name=user.getCusindfullname();
                        else if(user.getCuscompanyname()!=null)
                            name=user.getCuscompanyname();
                        else if(user.getProductcomname()!=null)
                            name=user.getProductcomname();
                        else
                            name="Not Mentioned";
                    %>
                <input type="hidden" name="first_name" value="<%=name%>">
                <input type="hidden" name="last_name" value="">
                <input type="hidden" name="email" value="<%=user.getEmail()%>">
                <input type="hidden" name="phone" value="<%=user.getContactnum()%>">
                <input type="hidden" name="address" value="<%=user.getHouseno()+" "+user.getStreet()%>">
                <input type="hidden" name="city" value="<%=user.getCity()%>">
                <input type="hidden" name="country" value="Sri Lanka">
              <div class="ammount" id="secon">
                <h1>500/<span style="font-size: 30px">Mo</span></h1>
              </div>
              <div class="facilities">
                <ul class="facilities-list">
                  <li>Contacting professionals through the website</li>
                  <li>Managing projects through the website</li>
                  <li>Lodge appointment</li>
                  <li>A month long continues subscription</li>
                </ul>
              </div>
              <div class="sub">
                <button type="submit" target="_blank" value="monthlysubscription" class="sub-btn" >Choose Plan</button>
              </div>
            </form>
          </div>
          <%--        monthly--%>
          <div id="annual" class="annual">
            <form method="post" action="https://sandbox.payhere.lk/pay/checkout">
              <%--        annual--%>
                  <input type="hidden" name="merchant_id" value="1219380">
                  <input type="hidden" name="return_url" value="http://localhost:8080/Construct360deg_war_exploded/paysubscription">
                  <input type="hidden" name="cancel_url" value="http://localhost:8080/Construct360deg_war_exploded/paysubscription">
                  <input type="hidden" name="notify_url" value="">
                  <%--            <br><br>Item Details<br>--%>
                  <input type="hidden" name="order_id" value="<%=user.getUserid()%>mon">
                  <input type="hidden" name="items" value="Monthly Subscription">
                  <input type="hidden" name="currency" value="LKR">
                  <input type="hidden" name="amount" value="5000">
                  <%--            <br><br>Customer Details<br>--%>
                  <%
                      name=null;
                      if(user.getProffullname()!=null)
                          name=user.getProffullname();
                      else if(user.getProfcompanyname()!=null)
                          name=user.getProfcompanyname();
                      else if(user.getCusindfullname()!=null)
                          name=user.getCusindfullname();
                      else if(user.getCuscompanyname()!=null)
                          name=user.getCuscompanyname();
                      else if(user.getProductcomname()!=null)
                          name=user.getProductcomname();
                      else
                          name="Not Mentioned";
                  %>
                  <input type="hidden" name="first_name" value="<%=name%>">
                  <input type="hidden" name="last_name" value="">
                  <input type="hidden" name="email" value="<%=user.getEmail()%>">
                  <input type="hidden" name="phone" value="<%=user.getContactnum()%>">
                  <input type="hidden" name="address" value="<%=user.getHouseno()+" "+user.getStreet()%>">
                  <input type="hidden" name="city" value="<%=user.getCity()%>">
                  <input type="hidden" name="country" value="Sri Lanka">
                <div class="ammount">
                  <h1>5000/<span style="font-size: 30px">Yr</span></h1>
                </div>
                <div class="facilities">
                  <ul class="facilities-list">
                    <li>Contacting professionals through the website</li>
                    <li>Managing projects through the website</li>
                    <li>Lodge appointment</li>
                    <li>A year long continues subscription</li>
                  </ul>
                </div>
                <div class="sub">
                  <button type="submit" target="_blank" value="monthlysubscription" class="sub-btn">Choose Plan</button>
                </div>
              <%--        annual--%>
            </form>
          </div>
      </div>
    </div>
<%@include file="../../footer.jsp"%>
</body>

</html>