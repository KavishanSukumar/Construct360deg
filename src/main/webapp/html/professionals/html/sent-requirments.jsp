<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>upload-proposal</title>
    <link rel="stylesheet" href="../resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="../resources/css/sent-requirments.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

</head>
<body>
<div class="container">
    <%@include file="sidebar-professional.jsp"%>
    <div class="content">

      <div class="part1">

          <br>
          <p id="title"> <b>Available Customers Requests</b> </p>
      </div>
       <div class="part2">

           <table id="req-table">
               <tr>
                   <th>Customer Name</th>
                   <th>Requirement file</th>
                   <th>Respond or decline</th>
               </tr>

           </table>

       </div>
    </div>




    <%@include file="../../footer.jsp"%>
</div>

</body>

</html>