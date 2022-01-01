<%@ page import="com.example.construct360deg.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%--<%@ page import="java.util.Base64" %>--%>
<%--<%@ page import="static java.util.Base64.*" %>--%>
<%@page language="java" pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" %>
<%-- <%--%>
<%--   ArrayList<Product> products= (ArrayList<Product>) request.getAttribute("product");--%>
<%-- %>--%>
<%
  Product x = (Product) request.getAttribute("product");
%>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit product</title>
  <link rel="stylesheet" href="./html/productcompany/resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="./html/productcompany/resources/css/editproducts.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script>
    const upload = document.querySelector("input");
    const uploadbtn = document.querySelector(".upload");
    const image = document.querySelector(".productimg img");
    const close = document.querySelector(".row11 .close");

    var loadFile = function(event){
      var image = document.querySelector(".productimg img");
      image.classList.add("active");
      close.classList.add("exit");
      image.src = URL.createObjectURL(event.target.files[0]);


      close.onclick = (e) => {
        image.classList.remove("active");
        close.classList.remove("exit");
      }
    }


  </script>
</head>

<body>

<%@include file="sidebar-productcompany.jsp"%>
<div class="Maxcontainer">
  <!-- <div class="firstpart"> -->


  <div class="content">
    <div class="leftSide">
      <img src="./html/productcompany/resources/images/Addproduct/addproductpagedec.png" id="leftsideimage" alt="" >
    </div>

    <%{%>
    <div class="rightSide">
      <!-- /////////////////This is the leftside of rightside//////////////////// -->
      <form action="<%=request.getContextPath()%>/updateproduct" method="post" enctype="multipart/form-data" class="col4">
        <input type="hidden" value="<%=x.getProductid()%>" name="productid">
      <div class="leftrightSide">
        <div class="col-12">
          <h2 class="row3">Edit Product</h2>
        </div>
        <!-- ////////////////////////////// -->
        <div class="row4">

          <!-- //////////////////////////////form starting////////////////////////////////// -->                   
            <div class="row5">
              <label for="name">Product Name</label>
              <input id="name" name="name" type="text" size = "59"class="form-control validate" value="<%=x.getProductName()%>"required/>
            </div>
            <div class="col6">
              <label for="description">Description</label>
              <textarea class="row6" rows="19" cols="56" id="description" name="desc" required><%=x.getProductdes()%></textarea>
            </div>
            <div class="col7">
              <label for="category">Category</label>
              <select class="custom-select" id="category" >
                <option selected>Select category</option>
                <option value="1">Branded</option>
                <option value="2">Non branded</option>
              </select>
            </div>
            <div class="row7">
              <div class="col9">
                <label for="Price">Price</label>
                <input id="Price"  name="price" type="number" size = "24" min="0" max="1000" class="form-control validate" value=<%=x.getPrice()%> required/>
              </div>
              <div class="row10">
                <label for="stock">Units In Stock
                </label>
                <input id="stock" name="stock" type="number" min="1" max="200" class="form-control validate" value=<%=x.getQuantity()%> required />
              </div>
            </div>
          <div class="DeleteandCloseButton">
            <button type="button" class="btndel">Delete</button>
            <a href="<%=request.getContextPath()%>/searchproduct"><button type="button" class="btnclo">Close</button></a>
          </div>
        </div>

      </div>

            <!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
            <div class="rightrightside">
                  <div class="brower_content" >
                  <div class="row11">
                    <i class="fas fa-cloud-upload-alt tm-upload-icon" ></i>
                    <i class="close fas fa-times"></i>
                    <div id="notfile">No file</div>
                  </div>


                  <div class="productimg">
                    <%
                      String base64Encoded=null;
                      if(x.getImgBytes()==null){

                      }else{
                        byte[] bytes=x.getImgBytes();
                        byte[] realimg = Base64.encodeBase64(bytes);
                        base64Encoded=new String(realimg,"UTF-8");
                      }
                    %>
                    <img src="data:image/jpeg;base64,<%=base64Encoded%>" onerror="this.src='./resources/images/Avatar.png;'" alt=""  >


                  </div>
                </div>
                  <div class="custom-fileUpload">
                    <!-- <input id="fileInput" type="file" style="display:none;" /> -->


                    <input type="file" accept="image/*" class="btnfile" name="image" id="imgfile"   onchange="loadFile(event)"/>
                    <label for="imgfile" class="upload">Browse</label>
                  </div>
                
                
                <div class="col-12">
                  <button type="submit" class="btnsub">OK</button>
                </div>
              
              
            </div>
            
          </form>
          <!-- //////////////////////////////////////////form ending//////////////////////////////////////////// -->
        </div>
    <%}%>
        <!-- rightside end -->
      </div>
      <!-- content end -->

    </div>

<div class="footer">
  <p>All rights reserved &copy; 2020  Construct360deg.com<br>Design: Epic code</p>
</div>
<%--  <script src="../resources/js/addproduct.js" ></script>--%>
</body>


</html>