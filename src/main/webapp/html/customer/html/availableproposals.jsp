<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.Proposal" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2022
  Time: 7:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    ArrayList<Proposal> proposals = (ArrayList<Proposal>) request.getAttribute("proposals");
    String reqname = (String) request.getAttribute("reqname");
%>
<head>
    <title>available proposals</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Project-Customer</title>
    <link rel="stylesheet" href="./html/customer/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="./html/customer/resources/css/availableproposals.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</head>
<body>
<div class="container">
    <%@include file="sidebar-customer.jsp"%>
    <div class="content">
        <div class="content1">

            <div class="details">
                <div class="name">
                    <p class="qwer">Requirement's Name :- <%=reqname%></p>
                </div>
                <div class="title">
                    <p id="title">Available Proposals</p>
                </div>
            </div>
        </div>
        <div class="content2">
            <div class="proposals" id="proposals">
                <%for(Proposal x:proposals){%>
                <div class="items-proposals">
                    <div class="prof-details">
                        <%
                            String base64Encoded1=null;
                            if(x.getProfprofimg()==null){

                            }else{
                                byte[] profproffile = x.getProfprofimg();
                                byte[] realprofproffile = Base64.encodeBase64(profproffile);
                                base64Encoded1 = new String(realprofproffile, "UTF-8");
                            }
                        %>
                        <div class="prof-img">
                            <img src="data:image/jpeg;base64,<%=base64Encoded1%>" onerror="this.src='./resources/images/Avatar.png;'" style="; border-radius: 10px; width: 100px; height: 100px">
                        </div>
                        <div class="info">
                            <p class="mini-info"  id="name"><%=x.getProfname()%></p>
                            <p class="mini-info" id="time">on <%=x.getProposal_upload_date()%> at <%=x.getProposal_upload_time()%></p>
                            <div class="mini-btns">
                                <button id="accept" class="minibtns">Accept Proposal</button>
                                <button id="reject" class="minibtns">Reject Proposal</button>
                            </div>
                        </div>
                    </div>
                    <div class="descrip">
                       <p id="proposal-descrip" style="font-size: 20px; font-weight: bold">Description</p>

                        <p style="width: 145vh; margin-left: 5px; margin-top: -15px"><%=x.getDescription()%></p>
                    </div>
                    <div class="others">
                        <%
                            //  String extention = x.getFilename().split(("[.]"))[1];
                            String extention = x.getFilename().substring(x.getFilename().lastIndexOf("."));
                            System.out.println(extention);
                        %>
                        <%
                            String base64Encoded2=null;
                            if(x.getProposal()==null){

                            }else{
                                byte[] Proposal = x.getProposal();
                                byte[] realProposal = Base64.encodeBase64(Proposal);
                                base64Encoded2 = new String(realProposal, "UTF-8");
                            }
                        %>
                        <div class="file">
                            <p style="margin-top: -1px; font-size: 20px;font-weight: bold">Proposal</p>

                            <% if(extention.equals(".pdf")){%>
                            <a href="data:application/pdf;base64,<%=base64Encoded2%>" download="<%=x.getFilename()%>"   id="file" style="margin-left: 10px; font-size: 20px"><i class="fas fa-file-pdf"></i> <%=x.getFilename()%></a>
                            <% }else{%>
                            <a href="data:application/pdf;base64,<%=base64Encoded2%>" download="<%=x.getFilename()%>"   id="file" style="margin-left: 10px; font-size: 20px"> <i class="fas fa-file-archive"></i> <%=x.getFilename()%></a>
                            <%}%>
                        </div>

                    </div>

                </div>
                <%}%>


            </div>
        </div>

    </div>
    <%@include file="../../footer.jsp"%>
</div>

</body>
</html>

<%--<div class="proposals" id="proposals">--%>

<%--    <div class="items-proposals">--%>
<%--        <div class="prof-details">--%>
<%--            <div class="prof-img">--%>
<%--                <img src="../resources/images/Avatar.png" style="; border-radius: 10px; width: 100px; height: 100px">--%>
<%--            </div>--%>
<%--            <div class="info">--%>
<%--                <p class="mini-info"  id="name">name</p>--%>
<%--                <p class="mini-info" id="time">time</p>--%>
<%--                <div class="mini-btns">--%>
<%--                    <button id="accept" class="minibtns">Accept Proposal</button>--%>
<%--                    <button id="reject" class="minibtns">Reject Proposal</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="descrip">--%>
<%--            &lt;%&ndash;                        <label for="poposal-descrip">Description</label><br>&ndash;%&gt;--%>
<%--            &lt;%&ndash;                        <input type="text" id="poposal-descrip" name="poposal-descrip" value="djnjdmkmdocskdcmoidm">&ndash;%&gt;--%>
<%--            <p id="proposal-descrip" style="font-size: 20px; font-weight: bold">Description</p>--%>
<%--            &lt;%&ndash;                        <table id="descrip-content">&ndash;%&gt;--%>
<%--            &lt;%&ndash;                            <tr>&ndash;%&gt;--%>
<%--            &lt;%&ndash;                                <td>description jinisswev aiubedciuandvc vaiidvnc a sciuasnicasc iaunsicuqjiwc qscjniuadnuad avjandviuansv vadjivans</td>&ndash;%&gt;--%>
<%--            &lt;%&ndash;                            </tr>&ndash;%&gt;--%>
<%--            &lt;%&ndash;                        </table><br>&ndash;%&gt;--%>
<%--            <p style="width: 100vh; margin-left: 5px; margin-top: -15px">description jinisswev</p>--%>
<%--        </div>--%>
<%--        <div class="others">--%>
<%--            <div class="file">--%>
<%--                <p style="margin-top: -1px; font-size: 20px;font-weight: bold">Proposal</p>--%>
<%--                <a id="file" style="margin-left: 10px; font-size: 20px">file.zip</a>--%>
<%--            </div>--%>
<%--            &lt;%&ndash;                        <div class="mini-btns">&ndash;%&gt;--%>
<%--            &lt;%&ndash;                            <button id="accept">Accept</button>&ndash;%&gt;--%>
<%--            &lt;%&ndash;                            <button id="reject">Reject</button>&ndash;%&gt;--%>
<%--            &lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--        </div>--%>
<%--        &lt;%&ndash;                    <table id="info">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                        <tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                            <td style="width: 105px"> <img src="" style="width: 100px; height: 100px; margin-left: 1px"></td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                            <td><div class="info">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                                <p class="mini-info"  id="name" style="font-size: 21px">name</p>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                                <p class="mini-info" id="time" style="font-size: 21px; margin-top: -10px">time</p>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                            </td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                        </tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                        <tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                            <td><p style="font-size: 21px">Description</p></td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                            <td style="height: auto">qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq</td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                        </tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                        <tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                            <td><p style="font-size: 21px">Proposal</p></td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                            <td><a></a></td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                        </tr>&ndash;%&gt;--%>

<%--        &lt;%&ndash;                    </table>&ndash;%&gt;--%>

<%--        &lt;%&ndash;                    <div class="mini-btns">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                            <button id="accept" class="minibtns">Accept</button>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                            <button id="reject" class="minibtns">Reject</button>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--    </div>--%>

<%--</div>--%>