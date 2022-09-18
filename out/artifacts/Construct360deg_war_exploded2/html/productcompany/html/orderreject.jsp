<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contactnum= (String) request.getAttribute("contactnum");
    System.out.println(contactnum+"reject");

%>
<html>
<head>
    <title>Title</title>
    <script src="./resources/js/jquery-3.6.0.js"></script>
    <script>
        $(document).ready(function (){
            $.ajax({ url: "https://meghaduta.dhahas.com/sms/sendSMS",
                type: "POST",
                data: JSON.stringify({"senders": ["+94<%=contactnum%>"], "message": "Hello, Your order has been rejected by the product company sorry for the inconvenience.", "apiKey": "623d4f613638d4002e306e74"}),
                dataType:'json',
                contentType: 'application/json', success: function (response) { location.href="<%=request.getContextPath()%>/ViewAllOrders"; console.log(response); }, error: function(error){ location.href="<%=request.getContextPath()%>/ViewAllOrders";console.log("Something went wrong", error); } });
            <%----%>
        });
    </script>
</head>
<body>
</body>
</html>
