<%@ page import="com.example.construct360deg.model.AllUserdocs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<!DOCTYPE html>
<html lang="en">
<%
    ArrayList<AllUserdocs> allUserdocs= (ArrayList<AllUserdocs>) request.getAttribute("alldocuments");

%>
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
        function verifydoc(data){
            var docid=data.id;
            var out=confirm("Do you want to make the document verified");
            if (out==true){
                var xHTTP=new XMLHttpRequest();
                xHTTP.open("POST","<%=request.getContextPath()%>/userdocument?task=1&docid="+docid,true);
                xHTTP.send();
                location="<%=request.getContextPath()%>/userdocument";
            }
        }


        function rejectdoc(data){
            var docid=data.id;
            var out=confirm("Do you want to reject the document");
            if (out==true){
                var xHTTP=new XMLHttpRequest();
                xHTTP.open("POST","<%=request.getContextPath()%>/userdocument?task=0&docid="+docid,true);
                xHTTP.send();
                location="<%=request.getContextPath()%>/userdocument";
            }
        }
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
                    <th class="userid"><span>Date</span></th>
                    <th class="User"><span>User</span></th>
                    <th class="Userrole"><span>User role</span></th>
                    <th class="filetype"><span>File name</span></th>
                    <th class="Activity"><span>File</span></th>
                    <th class="status"><span>Document Status</span></th>
                </tr>
            </thead>
            <tbody>
            <%for (AllUserdocs x:allUserdocs){%>
                <tr class="1stline">
                    <td class="1stDate"><%=x.getUploaded_date()%></td>
                    <td class="1stUser"><%=x.getUserid()%></td>
                    <td class="1stUserrole"><%=x.getUser_role()%></td>
                    <td class="1stfiletype"><%=x.getDoc_name()%></td>
                    <%if(x.getDocument()!=null){%>
                    <%
                        byte[] theproposal = x.getDocument();
                        byte[] realtheproposal = Base64.encodeBase64(theproposal);
                        String thereqfile = new String(realtheproposal, "UTF-8");
                    %>
                    <%
                        String reqfilename=x.getDoc_name();
                        String extention1 = reqfilename.substring(reqfilename.lastIndexOf("."));
                        System.out.println(extention1);
                    %>
                    <%if(extention1.equals(".pdf")){%>
                    <td><a href="data:application/pdf;base64,<%=thereqfile%>" download="<%=reqfilename%>" style="font-size: 15px; margin-top: 0px"><i class="fas fa-file-pdf"></i> <%=reqfilename%></a></td>
                    <%}else {%>
                    <td><a href="data:application/zip;base64,<%=thereqfile%>" download="<%=reqfilename%>" style="font-size: 15px; margin-top: 0px"><i class="fas fa-file-archive"></i> <%=reqfilename%></a></td>
                    <%}%>
                    <%}%>
                    <%if (x.getTag()==0){%>
                        <td><button id="<%=x.getDoc_id()%>" onclick="verifydoc(this)">Verify Doc</button>  <button id="<%=x.getDoc_id()%>" onclick="rejectdoc(this)">Reject Doc</button></td>
                    <%}else{%>
                        <%if (x.getVerified()==0){%>
                        <td>Rejected</td>
                        <%}else{%>
                        <td>Verified</td>
                        <%}%>
                    <%}%>
                </tr>
            <%}%>
            </tbody>

        </table>
    </div>
</div>
  
</div>
</div>
<%@include file="../../footer.jsp"%>
</body>


</html>