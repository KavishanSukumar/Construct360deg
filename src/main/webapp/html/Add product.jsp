<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add product</title>
  <link rel="stylesheet" href="../resources/css/AddproductNavbar.css">
  <link rel="stylesheet" href="../resources/css/AddProduct.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<!-- <input type="checkbox" id="check"> -->
<!-- header area start -->
  <div class="Maxcontainer">
    <div class="firstpart">
  <header class="menu_bar">

    <div class="left_area">
      <!--<h2 class="logoname">Construct360</h2>-->
      <img src="../resources/images/Addproduct/LoginLogo.png" id="logopic" sizes="100px">
    </div>
    <div class="right_area">
      <!-- <a href="#" id="logout_btn">Logout</a> -->
      <ul>
        <li><a href="#">HOME</a></li>
        <li><a href="#">SERVICES</a></li>
        <li><a href="#">PROJECT</a></li>
        <li><a href="#">CONTACT US</a></li>
        <li> <i class="fas fa-bars" id="sidebar_btn" onclick="document.querySelector('#nav').classList.toggle('hidden')"></i></li>
      </ul>
    </div>
    <%@include file="sidebar.jsp"%>
  </header>
  </div>
  <div class="content">
    <div class="leftSide">
      <img src="../resources/images/Addproduct/addproductpagedec.png" id="leftsideimage" alt="" >
    </div>
    <div class="rightSide">
      <div class="leftrightSide">
        <div class="col-12">
          <h2 class="row3">Add Product</h2>
        </div>
        <div class="row4">
        <form action="" class="col4">
        <div class="row5">
          <label for="name">Product Name</label>
          <input id="name" name="name" type="text" size = "59"class="form-control validate" required/>
        </div>
        <div class="col6">
          <label for="description">Description</label>
          <textarea class="row6" rows="10" cols="56"  required></textarea>
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
                <input id="Price"  name="Price" type="text" size = "24" min="0" max="1000" class="form-control validate" required/>
              </div>
              <div class="row10">
                <label for="stock">Units In Stock
                </label>
                <input id="stock" name="stock" type="number" min="0" max="1000" class="form-control validate" required />
              </div>
        </div>
        </form>
      </div>
    </div>
      <div class="rightrightside">
        <div class="rightcol">
        <form action="" class="col15">
          <div class="col10">
            <div class="row11">
              <i class="fas fa-cloud-upload-alt tm-upload-icon" onclick="document.getElementById('fileInput').click();"></i>
            </div>
            <div class="custom-fileUpload">
              <input id="fileInput" type="file" style="display:none;" />
              <input type="button" class="btnfile" value="UPLOAD PRODUCT IMAGE" onclick="document.getElementById('fileInput').click();" />
            </div>
          </div>
          <div class="col-12">
            <button type="submit" class="btnsub">Add Product Now</button>
          </div>
        </form>
      </div>
      </div>
    </div>
  </div>
    <div class="footer">
      <p>All rights reserved © 2020  Construct360<sup>0</sup>.com<br>Design: Epic code</p>
    </div>
  </div>
</body>


</html>