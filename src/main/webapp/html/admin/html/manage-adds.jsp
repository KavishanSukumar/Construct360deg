<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.Advertise" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>

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
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
</head>

<body>
<%@include file="sidebar-admin.jsp"%>
<%
String active_page = request.getParameter("active_page");
if(active_page==null){
  active_page = "avail";
}

%>
<div class="container blur">

  <div class="content" id="content">

    <div class="first">
      <div class="common">
        <a class="button"  href="?active_page=avail" type="button" id="available_adds" style="background-color: <%=active_page.equals("avail") ? "#ff7200":"#c4c4c4"%>"
                onclick="document.getElementById('ava_adds').style.display='block',document.querySelector('[name=active_page]').value = 'avail'">Available advertisements</a>
      </div>
      <div class="common">
        <a class="button" href="?active_page=accepted" type="button" id="accept_adds" style="background-color: <%=active_page.equals("accepted") ? "#ff7200":"#c4c4c4"%>"
                onclick="document.getElementById('ava_adds').style.display='none',document.querySelector('[name=active_page]').value = 'accepted'">Accepted advertisements</a>
      </div>
      <div class="common">
        <a class="button" href="?active_page=rejected" type="button" id="rejected_adds" style="background-color: <%=active_page.equals("rejected") ? "#ff7200":"#c4c4c4"%>"
                onclick=" document.getElementById('ava_adds').style.display='none',document.querySelector('[name=active_page]').value = 'rejected'">Rejected advertisements</a>
      </div>
    </div>
    <div class="second">
      <form action="<%=request.getContextPath()%>/manageadds" method="get" name="searchactivities">
        <input type="hidden" name="active_page" value="<%=active_page%>">
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
          <button type="submit" class="okbtn">GO</button>
        </div>
      </form>
    </div>
    <div class="third">

      <!-- ///////////////////////////////////////////// -->
      <table class="manageadds" id="ava_adds" style="display: <%=active_page.equals("avail") ? "block" : "none"%>">
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
        <%
          String base64Encoded1=null;
          if(x.getAddimg()==null){

          }else{
            byte[] addimg = x.getAddimg();
            byte[] realadd = Base64.encodeBase64(addimg);
            base64Encoded1 = new String(realadd, "UTF-8");


          }
        %>
        <tr class="1stline" onclick="openinqury(this)" id="<%=x.getAddid()%>">
          <td><%=x.getTodaydate()%> </td>
          <td> <%=x.getNowtime()%></td>
          <td> <%=x.getUsername()%></td>
          <td> <%=x.getRole()%> </td>
          <td> <%=x.getAddid()%></td>
          <td> <button  class="btn" id="view" style="cursor: pointer" onclick="mypopup('popupid<%=x.getAddid()%>')">View AD</button ></td>
          <td> <form  style="display: inline" method="post" action="<%=request.getContextPath()%>/advertiseaccept"><input type="hidden" value="<%=x.getAddid()%>" name="acceptadd">
                     <button class="btn" id="confirm" onclick="" >Confirm</button></form>
               <form style="display: inline"  action="<%=request.getContextPath()%>/advertisereject" method="post"><input type="hidden" value="<%=x.getAddid()%>" name="rejectadd">
                     <button style="padding:8px 18px" class="btn" id="reject" onclick="" >Reject</button></form>
        </tr>
        <div class="popup" id="popupid<%=x.getAddid()%>">
          <div class="popup-content">
            <button id="close" onclick="mypopupclose('popupid<%=x.getAddid()%>')">X</button>
            <img src="data:image/jpeg;base64,<%=base64Encoded1%>" onerror="this.src='./resources/images/Avatar.png;'" id="addimg" style="width: 600px; height: 500px; padding: 8px">
          </div>
        </div>
        <%}%>

        </tbody>
      </table>

      <table class="manageadds" id="acc_adds" style="display:  <%=active_page.equals("accepted") ? "block" : "none"%>">
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
        <%
          String base64Encoded1=null;
          if(y.getAddimg()==null){

          }else{
            byte[] addimg = y.getAddimg();
            byte[] realadd = Base64.encodeBase64(addimg);
            base64Encoded1 = new String(realadd, "UTF-8");


          }
        %>
           <tr class="1stline" onclick="openinqury(this)" id="<%=y.getAddid()%>">
                  <td><%=y.getEvodate()%></td>
                  <td><%=y.getTodaydate()%></td>
                  <td><%=y.getNowtime()%></td>
                  <td><%=y.getUsername()%></td>
                  <td><%=y.getRole()%> </td>
                  <td><%=y.getAddid()%></td>
                  <td><button  class="btn" id="view2" style="cursor: pointer" onclick="mypopup('popupid<%=y.getAddid()%>')">View AD</button ></td>
           </tr>
        <div class="popup" id="popupid<%=y.getAddid()%>">
          <div class="popup-content">
            <button id="close2" onclick="mypopupclose('popupid<%=y.getAddid()%>')">X</button>
            <img src="data:image/jpeg;base64,<%=base64Encoded1%>" onerror="this.src='./resources/images/Avatar.png;'" id="addimg2" style="width: 600px; height: 500px; padding: 8px">
          </div>
        </div>
          <%}%>

        </tbody>
        </table>


      <table class="manageadds" id="rej_adds" style="display:  <%=active_page.equals("rejected")?"block":"none"%>">
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
           <%
             String base64Encoded1=null;
             if(z.getAddimg()==null){

             }else{
               byte[] addimg = z.getAddimg();
               byte[] realadd = Base64.encodeBase64(addimg);
               base64Encoded1 = new String(realadd, "UTF-8");


             }
           %>
               <tr class="1stline" onclick="openinqury(this)" id="<%=z.getAddid()%>">
                 <td><%=z.getEvodate()%></td>
                 <td><%=z.getTodaydate()%></td>
                 <td><%=z.getNowtime()%></td>
                 <td><%=z.getUsername()%></td>
                 <td><%=z.getRole()%> </td>
                 <td><%=z.getAddid()%></td>
                 <td><button  class="btn" id="view3" style="cursor: pointer" onclick="mypopup('popupid<%=z.getAddid()%>')">View AD</button ></td>
               </tr>
           <div class="popup" id="popupid<%=z.getAddid()%>">
             <div class="popup-content">
               <p>Construct 360</p>
               <button id="close3"  type="button" onclick="mypopupclose('popupid<%=z.getAddid()%>')">X</button>
               <img src="data:image/jpeg;base64,<%=base64Encoded1%>" onerror="this.src='./resources/images/Avatar.png;'" id="addimg3" style="width: 600px; height: 500px; padding: 8px">
             </div>
           </div>
           <%}%>

        </tbody>
      </table>

    </div>

  </div>
  <%@include file="../../footer.jsp"%>
</div>
<script>
  function mypopup(id) {
    var popup = document.getElementById(id);
    var content = document.getElementById("content");

    popup.style.visibility="visible";

  }
  function mypopupclose(id) {
    var popup = document.getElementById(id);
    popup.style.visibility="hidden";

  }
</script>


</body>

</html>


