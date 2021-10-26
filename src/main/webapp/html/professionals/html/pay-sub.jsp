<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Paying subscription</title>
  <link rel="stylesheet" href="./html/professionals/resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="./html/professionals/resources/css/pay-sub.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<%@include file="sidebar-professional.jsp"%>
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
            <div class="ammount">
              <h1>900/<span style="font-size: 30px">Mo</span></h1>
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
              <button value="monthlysubscription" class="sub-btn">Choose Plan</button>
            </div>
        </div>
        <div id="annual" class="annual">
          <div class="ammount">
            <h1>10000/<span style="font-size: 30px">Yr</span></h1>
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
            <button value="monthlysubscription" class="sub-btn">Choose Plan</button>
          </div>
        </div>
      </div>
    </div>
<%@include file="../../footer.jsp"%>
</body>

</html>