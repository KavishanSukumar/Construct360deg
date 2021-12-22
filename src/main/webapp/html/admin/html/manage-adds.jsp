<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.Advertise" %>

<% ArrayList<Advertise> advertises = (ArrayList<Advertise>) request.getAttribute("advertise");%>
<% ArrayList<Advertise> acceptadds = (ArrayList<Advertise>) request.getAttribute("acceptadds");%>
<% ArrayList<Advertise> rejectadds = (ArrayList<Advertise>) request.getAttribute("rejectadds");%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>manage advertisement</title>
  <link rel="stylesheet" href="./html/admin/resources/css/nav-bar-updated.css">
  <link rel="stylesheet" href="./html/admin/resources/css/manage-adds.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<%@include file="sidebar-admin.jsp"%>
<div class="container">

  <div class="content">

    <div class="first">
      <div class="common">
        <button type="button" id="available_adds" onclick="document.getElementById('ava_adds').style.display='block',
                                                           document.getElementById('acc_adds').style.display='none',
                                                           document.getElementById('rej_adds').style.display='none',
                                                           document.getElementById('available_adds').style.backgroundColor='#ff7200',
                                                           document.getElementById('accept_adds').style.backgroundColor='rgb(239, 239, 239)',
                                                           document.getElementById('rejected_adds').style.backgroundColor='rgb(239, 239, 239)'">Available advertisements</button>
      </div>
      <div class="common">
        <button type="button" id="accept_adds" onclick="document.getElementById('ava_adds').style.display='none',
                                                        document.getElementById('acc_adds').style.display='block',
                                                        document.getElementById('rej_adds').style.display='none',
                                                        document.getElementById('available_adds').style.backgroundColor='rgb(239, 239, 239)',
                                                        document.getElementById('accept_adds').style.backgroundColor='#ff7200',
                                                        document.getElementById('rejected_adds').style.backgroundColor='rgb(239, 239, 239)'">Accepted advertisements</button>
      </div>
      <div class="common">
        <button type="button" id="rejected_adds" onclick=" document.getElementById('ava_adds').style.display='none',
                                                           document.getElementById('acc_adds').style.display='none',
                                                           document.getElementById('rej_adds').style.display='block',
                                                           document.getElementById('accept_adds').style.backgroundColor='rgb(239, 239, 239)',
                                                           document.getElementById('available_adds').style.backgroundColor='rgb(239, 239, 239)',
                                                           document.getElementById('rejected_adds').style.backgroundColor='#ff7200'">Rejected advertisements</button>
      </div>
    </div>
    <div class="second">
      <form action="" >
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
      <table class="manageadds" id="ava_adds" style="display: block">
        <thead>
        <tr class="headrow">
          <th class="submitDate" style="width: 150px"><span>Submit Date</span></th>
          <th class="submitTime" style="width: 150px"><span>Submit Time</span></th>
          <th class="user" style="width: 150px"><span>User</span></th>
          <th class="role" style="width: 150px"><span>Role</span></th>
          <th class="addid" style="width: 150px"><span>Advertisement ID</span></th>
          <th class="file" style="width: 150px"><span>File</span></th>
          <th class="action" style="width: 200px"><span>Action</span></th>
        </tr>
        </thead>
        <tbody>

        <%for (Advertise x:advertises){%>
        <tr class="1stline" onclick="openinqury(this)" id="<%=x.getAddid()%>">
          <td><%=x.getTodaydate()%> </td>
          <td> <%=x.getNowtime()%></td>
          <td> <%=x.getUsername()%></td>
          <td> <%=x.getRole()%> </td>
          <td> <%=x.getAddid()%></td>
          <td> <%=x.getImgblob()%></td>
          <td> <form  style="display: inline" method="post" action="<%=request.getContextPath()%>/advertiseaccept"><input type="hidden" value="<%=x.getAddid()%>" name="acceptadd">
                     <button class="btn" id="confirm" onclick="" >Confirm</button></form>
               <form style="display: inline"  action="<%=request.getContextPath()%>/advertisereject" method="post"><input type="hidden" value="<%=x.getAddid()%>" name="rejectadd">
                     <button style="padding:8px 18px" class="btn" id="reject" onclick="" >Reject</button></form>
        </tr>
        <%}%>

        </tbody>
      </table>

      <table class="manageadds" id="acc_adds" style="display: none">
        <thead>
        <tr class="headrow">
          <th class="acceptedDate" style="width: 150px"><span>Evaluated Date</span></th>
          <th class="submitDate" style="width: 150px"><span>Submit Date</span></th>
          <th class="submitTime" style="width: 150px"><span>Submit Time</span></th>
          <th class="user" style="width: 150px"><span>User</span></th>
          <th class="role" style="width: 150px"><span>Role</span></th>
          <th class="addid" style="width: 150px"><span>Advertisement ID</span></th>
          <th class="file" style="width: 150px"><span>File</span></th>
        </tr>
        </thead>
        <tbody>

        <%for (Advertise y:acceptadds){%>
           <tr class="1stline" onclick="openinqury(this)" id="<%=y.getAddid()%>">
                  <td><%=y.getEvodate()%></td>
                  <td><%=y.getTodaydate()%></td>
                  <td><%=y.getNowtime()%></td>
                  <td><%=y.getUsername()%></td>
                  <td><%=y.getRole()%> </td>
                  <td><%=y.getAddid()%></td>
                  <td><%=y.getImgblob()%></td>
           </tr>

          <%}%>

        </tbody>
        </table>


      <table class="manageadds" id="rej_adds" style="display: none">
        <thead>
        <tr class="headrow">
          <th class="rejectedDate" style="width: 150px"><span>Evaluated Date</span></th>
          <th class="submitDate" style="width: 150px"><span>Submit Date</span></th>
          <th class="submitTime" style="width: 150px"><span>Submit Time</span></th>
          <th class="user" style="width: 150px"><span>User</span></th>
          <th class="role" style="width: 150px"><span>Role</span></th>
          <th class="addid" style="width: 150px"><span>Advertisement ID</span></th>
          <th class="file" style="width: 150px"><span>File</span></th>
        </tr>
        </thead>
        <tbody>
           <%for(Advertise z:rejectadds){%>
               <tr class="1stline" onclick="openinqury(this)" id="<%=z.getAddid()%>">
                 <td><%=z.getEvodate()%></td>
                 <td><%=z.getTodaydate()%></td>
                 <td><%=z.getNowtime()%></td>
                 <td><%=z.getUsername()%></td>
                 <td><%=z.getRole()%> </td>
                 <td><%=z.getAddid()%></td>
                 <td><%=z.getImgblob()%></td>
               </tr>
           <%}%>

        </tbody>
      </table>

    </div>
  </div>
  <%@include file="../../footer.jsp"%>
</div>



</body>

</html>