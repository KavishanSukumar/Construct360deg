<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SerachProfile</title>
    <link rel="stylesheet" href="../resources/css/search-Profile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="../resources/js/jquery-3.6.0.js"></script>
</head>

<body>
<div class="container">+
    <header class="menu_bar">

        <div class="left_area">
            <img src="../resources/images/navbar/LoginLogo.png" id="logopic" sizes="100px">
        </div>
        <div class="right_area">
            <ul>
                <li><a href="#">HOME</a></li>
                <li><a href="#">SERVICES</a></li>
                <li><a href="#">PROJECT</a></li>
                <li><a href="#">CONTACT US</a></li>
                <li> <i class="fas fa-bars" id="sidebar_btn" onclick="document.querySelector('#nav').classList.toggle('hidden')"></i></li>
            </ul>
        </div>
        <div class="nav-panel hidden" id="nav">
            <ul>
                <div>
                    <img src="../resources/images/navbar/sidebarpro.jpg" id="profile_image" alt="" onclick="click">
                    <h4 id="profile_name" style="margin-top: -5px;">Reena</h4>
                </div>
                <a href="#"><i class="fas fa-hard-hat" id="hat"></i><h4>Projects</h4></a>
                <a href="#"><i class="fab fa-product-hunt" id="hunt"></i><h4>Products</h4></a>
                <a href="#"><i class="fas fa-user" id="user"></i><h4>Professionals</h4></a>
                <a href="#"><i class="fas fa-flag-checkered" id="chek"></i><h4>Report</h4></a>
                <a href="#"><i class="fas fa-headset" id="head"></i><h4>Help and Support</h4></a>
                <a href="#"><i class="fas fa-sign-out-alt" id="logout"></i><h4>Logout</h4></a>
            </ul>
        </div>
    </header>

    <div class="content">

        <div class="searchbar">
            <!-- <i class="fas fa-search"></i>
                <input type="text" id="myInput" placeholder="Search here..."> -->
            <form class="example" action=" ">
                <button type="submit"><i class="fa fa-search"></i></button>
                <input type="text" placeholder="Search.." name="search">
            </form>
        </div>
        <div class="filter">
            <ul>
                <li><h2>Filter By</h2></li>
                <li class="fas fa-angle-down" id="angle-down" onclick="document.querySelector('#ft').classList.toggle('hidden')"></li>

            </ul>

            <div class="filter-table hidden" id="ft">
                <h4>Professional :</h4>
                <label class="filterby">Contractor
                    <input type="checkbox" checked="checked">
                    <span class="checkmark"></span>
                </label>
                <label class="filterby">Landscape Designers
                    <input type="checkbox">
                    <span class="checkmark"></span>
                </label>
                <h4>Ranking :</h4>
                <label class="filterby"><i class="fas fa-star"></i>
                    <input type="checkbox" checked="checked">
                    <span class="checkmark"></span>
                </label>
                <label class="filterby"><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    <input type="checkbox">
                    <span class="checkmark"></span>
                </label>
                <label class="filterby"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    <input type="checkbox" checked="checked">
                    <span class="checkmark"></span>
                </label>
                <label class="filterby"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    <input type="checkbox">
                    <span class="checkmark"></span>
                </label>
                <label class="filterby"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    <input type="checkbox">
                    <span class="checkmark"></span>
                </label>
                <h4>Others :</h4>
                <label class="filterby">Customer
                    <input type="checkbox" checked="checked">
                    <span class="checkmark"></span>
                </label>
                <label class="filterby">Product company
                    <input type="checkbox" checked="checked">
                    <span class="checkmark"></span>
                </label>
            </div>
        </div>
        <div class="profile">
            <div class="contractor">
                <div class="gallery">
                    <a target="_blank" href="user4.png">
                        <img src="../resources/images/SearchProfile/user4.png" >
                    </a>
                    <div class="desc">
                        <p>Mr. Tharindu Dissanayaka</p>
                        <p>Landscape Designer</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

</body>

</html>