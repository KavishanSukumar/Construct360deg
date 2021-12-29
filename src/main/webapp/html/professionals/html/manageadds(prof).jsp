<%@ page import="com.example.construct360deg.model.Advertise" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/25/2021
  Time: 5:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Advertise> advertises = (ArrayList<Advertise>) request.getAttribute("displayadds");%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage adds by profs</title>
    <link rel="stylesheet" href="./html/professionals/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="./html/professionals/resources/css/manageadds(prof).css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="./resources/js/jquery-3.6.0.js"></script>
    <script>
        function mypopup(id) {
            var popup = document.getElementById(id);
            popup.style.visibility="visible"
        }
        function mypopupclose(id) {
            var popup = document.getElementById(id);
            popup.style.visibility="hidden"
        }
        function deleteadd(id){
            var addid = id;
            console.log(addid);
            var out = confirm("Do you want to delete the advertisement?");
            if(out==true){
                console.log("true");
                var xHTTP = new XMLHttpRequest();
                console.log("delete add 1");
                xHTTP.open("post","<%=request.getContextPath()%>/deleteadds?addid="+addid,true);
                xHTTP.send();
                location="<%=request.getContextPath()%>/manageadvertise(prof)";

            }else{
                console.log("false");
                console.log(addid);
            }
        }
    </script>

</head>
<body>
<%@include file="sidebar-professional.jsp"%>
<div class="container">

    <div class="content">
        <div class="headline">
            <h1 id="title">Your Avertisements</h1>
        </div>
        <div class="first">

            <div class="common">
                <a href="<%=request.getContextPath()%>/advertise"><button type="button" id="make_adds" onclick="" ><b>Make Your Own Advertisements</b></button></a>
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
                    <th class="addid" style="width: 150px"><span>Advertisement ID</span></th>
                    <th class="submitDate" style="width: 150px"><span>Submit Date</span></th>
                    <th class="submitTime" style="width: 150px"><span>Submit Time</span></th>
                    <th class="evodate" style="width: 150px"><span>Evoluated Date</span></th>
                    <th class="addstatus" style="width: 150px">Ad Status</th>
                    <th class="discription" style="width: 300px; height: auto; float: left; ">Discription</th>
                    <th class="action" style="width: 200px"><span>Action</span></th>
                </tr>
                </thead>
                <tbody>

               <%for(Advertise x:advertises){%>
               <%
                   String base64Encoded1=null;
                   if(x.getAddimg()==null){

                   }else{
                       byte[] addimg = x.getAddimg();
                       byte[] realadd = Base64.encodeBase64(addimg);
                       base64Encoded1 = new String(realadd, "UTF-8");


                   }
               %>

                      <tr class="1stline" onclick = "openinqury(this)" id = "" >
                          <td><%=x.getAddid()%></td >
                          <td><%=x.getTodaydate()%></td >
                          <td><%=x.getNowtime()%></td >
                          <% if(x.getEvodate()==null){%>
                              <td> Still not evoluated</td>
                          <%}else {%>
                          <td><%=x.getEvodate()%></td>
                          <%}%>
                          <td><%=x.getAddstatus()%></td>
                          <td><%=x.getDescription()%></td>
                          <td><button  class="managebtn" id="view" style="cursor: pointer" onclick="mypopup('popupid<%=x.getAddid()%>')">View AD</button >
                              <button  class="managebtn" onclick="deleteadd(<%=x.getAddid()%>)" id="delete" style="cursor: pointer">Delete AD</button >
                          </td >
                      </tr >

                      <div class="popup" id="popupid<%=x.getAddid()%>">
                          <div class="popup-content">
                              <button id="close" onclick="mypopupclose('popupid<%=x.getAddid()%>')">X</button>
                              <img src="data:image/jpeg;base64,<%=base64Encoded1%>" onerror="this.src='./resources/images/Avatar.png;'" id="addimg" style="width: 600px; height: 500px; padding: 8px">
                          </div>
                      </div>
                <%}%>



                </tbody>
            </table>







        </div>

    </div>
    <%@include file="../../footer.jsp"%>
</div>

</body>
</html>
