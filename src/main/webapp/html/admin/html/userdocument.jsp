<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User document</title>
  <link rel="stylesheet" href="./html/admin/resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="./html/admin/resources/css/loginfile.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<%@include file="sidebar-admin.jsp"%>
<div class="container">

  
<div class="content">
    
    <div class="first"> 
        <div class="User Documents">
            <button type="button" class="btnManagelog">Manage Documents</button>
        </div>
    </div>
    <div class="second">
        <form action="">
            <div class="from">
                <label name="activityfrom">Show activities from</label> &ensp;
                <input id="activityfrom" name="activityfrom" type="date" size = "59"class="form-control validate" />
            </div>
            <div class="to">
                <label name="activityTo">to</label> &ensp;
                <input id="activityTo" name="activityTo" type="date" size = "59"class="form-control validate" />
            </div>
            <div class="By_option">
                <label name="By">by</label> &ensp;
                <input id="By" name="By" type="text" size = "59"class="form-control validate" />
            </div>
            <div class="OK">
                <button type="button" class="okbtn">GO</button>
              </div>
        </form>
    </div>
    <div class="third">
        
        <!-- ///////////////////////////////////////////// -->
        <table class="logTable">
            <thead>
                <tr class="headrow">
                    <th class="Date"><span>Date</span></th>
                    <th class="Time"><span>Time</span></th>
                    <th class="User"><span>User</span></th>
                    <th class="Activity"><span>User Files</span></th>
                </tr>
            </thead>
            <tbody>
                <tr class="1stline">
                    <td class="1stDate">01-08-2022</td>
                    <td class="1sttime">16:00:09</td>
                    <td class="1stUser">@Nimal</td>
                    <td class="1stActivity">Registration.pdf</td>
                </tr>
                <tr class="2ndline">
                    <td class="2ndDate">01-08-2022</td>
                    <td class="2ndtime">16:00:09</td>
                    <td class="2ndUser">@Nimal</td>
                    <td class="2ndActivity">Registration.pdf</td>
                </tr>
                <tr class="3rdline">
                    <td class="3rdDate">01-08-2022</td>
                    <td class="3rdtime">16:00:09</td>
                    <td class="3rdUser">@Nimal</td>
                    <td class="3rdActivity">Registration.pdf</td>
                </tr>
                <tr class="4thline">
                    <td class="4thDate">01-08-2022</td>
                    <td class="4thtime">16:00:09</td>
                    <td class="4thUser">@Nimal</td>
                    <td class="4thActivity">Registration.pdf</td>
                </tr>
                <tr class="5thline">
                    <td class="5thDate">01-08-2022</td>
                    <td class="5thtime">16:00:09</td>
                    <td class="5thUser">@Nimal</td>
                    <td class="5thActivity">Registration.pdf</td>
                </tr>
                <tr class="6thline">
                    <td class="6thDate">01-08-2022</td>
                    <td class="6thtime">16:00:09</td>
                    <td class="6thUser">@Nimal</td>
                    <td class="6thActivity">Registration.pdf</td>
                </tr>
                <tr class="7thline">
                    <td class="7thDate">01-08-2022</td>
                    <td class="7thtime">16:00:09</td>
                    <td class="7thUser">@Nimal</td>
                    <td class="7thActivity">Registration.pdf</td>
                </tr>
                <tr class="8thline">
                    <td class="8thDate">01-08-2022</td>
                    <td class="8thtime">16:00:09</td>
                    <td class="8thUser">@Nimal</td>
                    <td class="8thActivity">Registration.pdf</td>
                </tr>
                <tr class="9thline">
                    <td class="9thDate">01-08-2022</td>
                    <td class="9thtime">16:00:09</td>
                    <td class="9thUser">@Nimal</td>
                    <td class="9thActivity">Registration.pdf</td>
                </tr>
                <tr class="10thline">
                    <td class="10thDate">01-08-2022</td>
                    <td class="10thtime">16:00:09</td>
                    <td class="10thUser">@Nimal</td>
                    <td class="10thActivity">Registration.pdf</td>
                </tr>

                <tr class="1stline">
                    <td class="1stDate">01-08-2022</td>
                    <td class="1sttime">16:00:09</td>
                    <td class="1stUser">@Nimal</td>
                    <td class="1stActivity">Registration.pdf</td>
                </tr>
                <tr class="2ndline">
                    <td class="2ndDate">01-08-2022</td>
                    <td class="2ndtime">16:00:09</td>
                    <td class="2ndUser">@Nimal</td>
                    <td class="2ndActivity">Registration.pdf</td>
                </tr>
                <tr class="3rdline">
                    <td class="3rdDate">01-08-2022</td>
                    <td class="3rdtime">16:00:09</td>
                    <td class="3rdUser">@Nimal</td>
                    <td class="3rdActivity">Registration.pdf</td>
                </tr>
                <tr class="4thline">
                    <td class="4thDate">01-08-2022</td>
                    <td class="4thtime">16:00:09</td>
                    <td class="4thUser">@Nimal</td>
                    <td class="4thActivity">Registration.pdf</td>
                </tr>
                
            </tbody>

        </table>
        <!-- ///////////////////////////////////////////// -->
    </div>
</div>
  
</div>
</div>
<%@include file="../../footer.jsp"%>
</body>


</html>