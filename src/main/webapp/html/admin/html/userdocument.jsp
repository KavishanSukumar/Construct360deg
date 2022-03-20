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
    <script src="./resources/js/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="http://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready( function () {
            $('#mytable').DataTable();
        });
    </script>
</head>

<body>
<%@include file="sidebar-admin.jsp"%>
<div class="container">


<div class="content">
    
<%--    <div class="first"> --%>
<%--        <div class="User Documents">--%>
<%--            <button type="button" class="btnManagelog">Manage Documents</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="second">--%>
<%--        <form action="">--%>
<%--            <div class="from">--%>
<%--                <label name="activityfrom">Show activities from</label> &ensp;--%>
<%--                <input id="activityfrom" name="activityfrom" type="date" size = "59"class="form-control validate" />--%>
<%--            </div>--%>
<%--            <div class="to">--%>
<%--                <label name="activityTo">to</label> &ensp;--%>
<%--                <input id="activityTo" name="activityTo" type="date" size = "59"class="form-control validate" />--%>
<%--            </div>--%>
<%--            <div class="By_option">--%>
<%--                <label name="By">by</label> &ensp;--%>
<%--                <input id="By" name="By" type="text" size = "59"class="form-control validate" />--%>
<%--            </div>--%>
<%--            <div class="OK">--%>
<%--                <button type="button" class="okbtn">GO</button>--%>
<%--              </div>--%>
<%--        </form>--%>
<%--    </div>--%>
    <div class="third">
        
        <!-- ///////////////////////////////////////////// -->
        <table class="logTable" id="mytable">
            <thead>
                <tr class="headrow">
                    <th class="Date"><span>Date</span></th>
                    <th class="Time"><span>Time</span></th>
                    <th class="User"><span>User</span></th>
                    <th class="Userrole"><span>User role</span></th>
                    <th class="filetype"><span>File type</span></th>
                    <th class="Activity"><span>File name</span></th>
                </tr>
            </thead>
            <tbody>
                <tr class="1stline">
                    <td class="1stDate">01-08-2020</td>
                    <td class="1sttime">16:00:09</td>
                    <td class="1stUser">Nimali</td>
                    <td class="1stUserrole">Customer-individual</td>
                    <td class="1stfiletype">Address proof</td>
                    <td class="1stActivity">Addressproof-2005.pdf</td>
                </tr>
                <tr class="2ndline">
                    <td class="2ndDate">01-07-2021</td>
                    <td class="2ndtime">13:10:09</td>
                    <td class="2ndUser">Abans</td>
                    <td class="2ndUserrole">Product company</td>
                    <td class="2ndtfiletype">Registrationfile</td>
                    <td class="2ndtActivity">Registrationfile-2000.pdf</td>
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