<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>product advertise</title>
    <link rel="stylesheet" href="../resources/css/Productadvertise.css">
    <link rel="stylesheet" href="../resources/css/nav-bar-updated.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="../resources/js/jquery-3.6.0.js"></script>
</head>

<body>
    <div class="container-1">
        <div class="x">
            <%@include file="sidebar-productcompany.jsp"%>

        </div>
        <div class="container-2">

            <div class="container-3">
                <div class="heading">
                    <h2 id="advertise_product">Advertising products</h2>
                </div>
                <div class="advertisingcomponent">
                    <img src="../resources/images/Advertise/advertiseproduct.png">
                    <p>“Building a profitable personal brand online is not a sprint, and something that happens over
                        night. Don’t aim for perfection early on.
                        Instead allow your brand to evolve naturally over time and focus on providing massive value and
                        over deliver to your target audience.
                        Then you will get more clear over your message and brand as well. Always remember that!”</p>
                </div>
            </div>

            <div class="datacomponent">
                <form class="dataform">
                    <label for="advertisername" id="adv">Advertiser Name</label>
                    <input type="text" id="advertisername" name="advertisername" placeholder="Enter the name">
                    <br>
                    <label for="companyname" id="com">Company Name</label>
                    <input type="text" id="companyname" name="companyname" placeholder="Enter the company name"
                        required>
                    <br>
                    <label for="banchname" id="ban">Branch Name</label>
                    <input type="text" id="banchname" name="banchname" placeholder="Enter the branch Name">
                    <br>
                    <label for="areadistrict" id="are">Area/District</label>
                    <input type="text" id="areadistrict" name="areadistrict" placeholder="Enter the Area/District">
                    <br>
                    <label for="companywebsite" id="compa">Company Website</label>
                    <input type="text" id="companywebsite" name="companywebsite"
                        placeholder="Enter the company website">
                    <br>
                    <br>
                    <label for="adimage" id="adim">Advertising image</label>
                    <input type="file" id="adimage" placeholder="png/jpg/jepg">
                    <br>
                    <br>
                    <label for="desc" id="descri">Description</label>
                    <br>
                    <textarea cols="57" rows="6" id="desc" name="desc"></textarea>
                    <br>
                    <input type="checkbox" id="policy" required>
                    <label for="policy" id="Iagree">I agree to the Terms of use and the Privacy Policy</label>
                    <br>
                    <button type="submit" name="Submit" id="advertisementsubmit" class="btn">Submit</button>
                </form>
            </div>
        </div>
        <div class="footer">
            <p>All rights reserved 	&copy; 2020  Construct360<sup>0</sup>.com<br>Design: Epic code</p>
        </div>
    </div>
</body>

</html>