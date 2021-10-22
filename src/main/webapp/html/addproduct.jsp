<!-- <%@page language="java" pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" %>-->
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add product</title>
  <link rel="stylesheet" href="./resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="./resources/css/AddProduct.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<%-- <%--%>
<%--   if(session.getAttribute("uname")==null){--%>
<%--     response.sendRedirect(request.getContextPath()+"/login");--%>
<%--   }--%>
<%--%>--%>
<div class="Maxcontainer">
  <!-- <div class="firstpart"> -->
  <%@include file="sidebar.jsp"%>
  <!-- </div> -->

  <div class="content">
    <div class="leftSide">
      <img src="./resources/images/Addproduct/addproductpagedec.png" id="leftsideimage" alt="" >
    </div>


    <div class="rightSide">
      <!-- /////////////////This is the leftside of rightside//////////////////// -->
      <form action="<%=request.getContextPath()%>/AddaProduct" method="post" enctype="multipart/form-data" class="col4">
      <div class="leftrightSide">
        <div class="col-12">
          <h2 class="row3">Add Product</h2>
        </div>
        <!-- ////////////////////////////// -->
        <div class="row4">

          <!-- //////////////////////////////form starting////////////////////////////////// -->                   
            <div class="row5">
              <label for="name">Product Name</label>
              <input id="name" name="name" type="text" size = "59"class="form-control validate" required/>
            </div>
            <div class="col6">
              <label for="description">Description</label>
              <textarea class="row6" rows="10" cols="56" id="description" name="desc" required style="resize:none"></textarea>
            </div>
            <div class="col7">
              <label for="category">Category</label>
              <select class="custom-select" id="category">
                <option selected>Select category</option>
                <option value="1">Branded</option>
                <option value="2">Non branded</option>
              </select>
            </div>
            <div class="row7">
              <div class="col9">
                <label for="Price">Price</label>
                <input id="Price"  name="price" type="text" size = "24" min="0" max="1000" class="form-control validate" required/>
              </div>
              <div class="row10">
                <label for="stock">Units In Stock
                </label>
                <input id="stock" name="stock" type="number" min="1" max="200" class="form-control validate" required />
              </div>
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
                    <img src="" alt="">
                  </div>
                </div>
                  <div class="custom-fileUpload">
                    <!-- <input id="fileInput" type="file" style="display:none;" /> -->
                    <input type="file" accept="image/*" class="btnfile" name="image" id="imgfile" onchange="loadFile(event)"/>
                    <label for="imgfile" class="upload">Browse</label>
                  </div>
                
                
                <div class="col-12">
                  <button type="submit" class="btnsub">Add Product Now</button>
                </div>
              
              
            </div>
            
          </form>
          <!-- //////////////////////////////////////////form ending//////////////////////////////////////////// -->
        </div>
        <!-- rightside end -->
      </div>
      <!-- content end -->
      <!-- //////////////////////////////////// -->
    </div>
  
  <div class="footer">
    <p>All rights reserved 	&copy; 2020  Construct360<sup>0</sup>.com<br>Design: Epic code</p>
  </div>
  <script src="./resources/js/addproduct.js" ></script>
</body>


</html>