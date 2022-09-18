<%@ page import="com.example.construct360deg.model.Product" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product x = (Product) request.getAttribute("product");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>product details</title>
    <link rel="stylesheet" href="./html/customer/resources/css/productdetails.css">
</head>
<body>
<main>
    <div class="container">
        <div class="cover">
            <%
                String base64Encoded=null;
                if(x.getImgBytes()==null){

                }else{
                    byte[] bytes=x.getImgBytes();
                    byte[] realimg = Base64.encodeBase64(bytes);
                    base64Encoded=new String(realimg,"UTF-8");
                }
            %>
            <img src="data:image/jpeg;base64,<%=base64Encoded%>" alt="">
        </div>
        <div class="content">
            <div class="nav">
                <span class="logo">Brand New*</span>
                <span><i class='fab fa-sistrix' style='font-size: 24px'></i> </span>
            </div>
            <div class="content-body">

                <div class="black-lable">
                    <span class="title"><b><%=x.getProductName()%></b></span>
                    <p><%=x.getProductdes()%></p>
                    <div class="prix">
                        <span><b>Rs.<%=x.getPrice()%> </b></span>
                        <span><b>Units In Stock : <%=x.getQuantity()%></b></span>
                        <%--                        <span class="crt">Add to cart</span>--%>
                        <a><button class="crt" onclick="addtocart(this);" class="addtocart-btn" id="<%=x.getProductid()%>">Add to cart</button></a>
                        <%--                        <span class="orderNow">Order Now</span>--%>
                        <form action="<%=request.getContextPath()%>/orderproduct" method="get">
                            <input type="text" hidden value="<%=x.getProductid()%>" name="productid">
                            <input type="text" hidden value="<%=x.getPrice()%>" name="productprice">
                            <input type="text" hidden value="<%=x.getProductName()%>" name="productname">
                            <input type="text" hidden value="<%=x.getQuantity()%>" name="productquantity">
                            <input type="submit" value="Order Product" class="orderNow">
                        </form>
<%--                        <a><button class="orderNow">Order Product</button></a>--%>
                    </div>
                </div>

            </div>
        </div>
    </div>
</main>
<script>
    function addtocart(ele){
        var out=confirm("Do you want to add the product to the cart");
        if(out==true){
            var productid=ele.id;
            var xhttp=new XMLHttpRequest();
            xhttp.open("POST","<%=request.getContextPath()%>/addtocart?productid="+productid,true);
            xhttp.send();
        }
    }
</script>

</body>
</html>
