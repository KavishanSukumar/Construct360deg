<%@ page import="com.example.construct360deg.model.Requirement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="com.example.construct360deg.model.Proposal" %>
<%@ page import="com.example.construct360deg.model.Account" %>
<!DOCTYPE html>

<html lang="en">
<%
    ArrayList<Proposal> proposals = (ArrayList<Proposal>) request.getAttribute("proposals");
    ArrayList<Requirement> requirements = (ArrayList<Requirement>) request.getAttribute("requirements");
    byte[] cusprofimg = (byte[]) request.getAttribute("cusprofimg");
    String cusname = (String) request.getAttribute("cusname");
    int cusid = (int) request.getAttribute("cusid");
    int profid = (int) request.getAttribute("profid");
    Account account = (Account) request.getAttribute("account");
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>available customer requirements</title>
    <link rel="stylesheet" href="./html/professionals/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="./html/professionals/resources/css/availableCusReq.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">

</head>
<body>
<%
    String base64Encoded2=null;
    if(account.getImgBytes()==null){

    }else{

        byte[] realcusimg = Base64.encodeBase64(account.getImgBytes());
        base64Encoded2 = new String(realcusimg, "UTF-8");
    }
%>

<div class="filling" id="uploadproposal">
    <button id="close" onclick="mypopupclose()">X</button>
    <div class="img-area">
        <p id="title" style="align-content: center">Upload your proposal to </p>
        <p class="info" id="customername"><%=cusname%></p>
        <img id="profimg" src="data:image/jpeg;base64,<%=base64Encoded2%>" onerror="this.src='./resources/images/Avatar.png;'" style="border-radius: 10px">
        <p class="info" id="cusid">Customer ID :- <%=cusid%></p>
    </div>

    <div class="up-area">
        <form class="proposal" method="post" action="<%=request.getContextPath()%>/DisplayCusReqOnProf" enctype="multipart/form-data">
            <label class="a" id="desrip">Description :-</label><br>
            <textarea id="text" style="" name="description" required></textarea>
            <label class="a" for="uploadfile" id="up-proposal">Proposal :-</label>
            <input type="file" id="uploadfile" name="uploadfile"  multiple onchange="processSelectedFiles(this)"  required accept="application/pdf,application/zip"/><br>
            <label id="filetype">(Choose pdf or zip file)</label>
            <input type="hidden" value="<%=profid%>" name="profid">
            <input type="hidden" value="<%=cusid%>" name="cusid">
            <input type="hidden" value="" name="filename" id="filename">
            <input type="hidden"  value="" name="reqid2" id="reqid2">
            <div class="upload">
                <input id="submit" type="submit" value="Upload">
            </div>
           <%System.out.println("i am in the upload form end");%>
        </form>
    </div>

</div>

<div class="container" >
    <%@include file="sidebar-professional.jsp"%>
    <div class="content" id="blur">
        <div class="cus-details">
             <div class="area-b1">

                 <img src="data:image/jpeg;base64,<%=base64Encoded2%>" onerror="this.src='./resources/images/Avatar.png;'" style="width: 150px; height: 150px; margin: auto; border-radius: 10px">
                 <p id="cusname" style="margin: auto;"><%=cusname%></p>
             </div>

        </div>

        <div class="cus-requirements ">
            <div class="item-container">
                <%for(Requirement x:requirements){%>
                <%if(x.getDisplay_on_prof()==1){%>
                <div class="item">
                    <div class="text">

                        <table id="myreqtable">

                            <tr>
                                <td class=field-name" style="width: 30vh"><h3  class="h3header">Requirement name</h3></td>
                                <td><%=x.getReqname()%></td>
                            </tr>
                            <tr>
                                <td class=field-name"><h3 class="h3header">Type</h3></td>
                                <td><%=x.getType()%></td>
                            </tr>

                            <%
                                //  String extention = x.getFilename().split(("[.]"))[1];
                                String extention = x.getFilename().substring(x.getFilename().lastIndexOf("."));
                                System.out.println(extention);
                            %>
                            <%
                                String base64Encoded1=null;
                                if(x.getRequirementfile()==null){

                                }else{
                                    byte[] reqfile = x.getRequirementfile();
                                    byte[] realreqfile = Base64.encodeBase64(reqfile);
                                    base64Encoded1 = new String(realreqfile, "UTF-8");
                                }
                            %>
                            <% if(extention.equals(".pdf")){%>
                            <tr>
                                <td class=field-name"><h3 class="h3header">File</h3></td>
                                <td><a href="data:application/pdf;base64,<%=base64Encoded1%>" download="<%=x.getFilename()%>"><i class="fas fa-file-pdf"></i> <%=x.getFilename()%></a></td>

                            </tr>

                            <% }else{%>
                            <tr>
                                <td class=field-name"><h3 class="h3header">File</h3></td>
                                <td><a href="data:application/zip;base64,<%=base64Encoded1%>" download="<%=x.getFilename()%>"><i class="fas fa-file-archive"></i> <%=x.getFilename()%></a></td>

                            </tr>

                            <%}%>

                            <tr>
                                <td class=field-name"><h3 class="h3header">Description</h3></td>
                                <td><%=x.getDescription()%></td>
                            </tr>
                            <tr>
                                <td class=field-name"><h3 class="h3header">Uploaded date and time</h3></td>
                                <td>The requirement was Uploaded on <%=x.getReq_upload_date()%> at <%=x.getReq_upload_time()%></td>

                            </tr>
                            <tr>
                                <td class=field-name"><h3 class="h3header">Location</h3></td>
                                <td><%=x.getStreet()%>,<%=x.getCity()%></td>

                            </tr>

                            </tr>

                        </table>
                    </div>
                    <input type="hidden" id="reqid1" value="<%=x.getRequirementid()%>">
                    <%
                       int count = 0;

                    for(Proposal y:proposals){
                        if(y.getRequirementid()==x.getRequirementid()&& y.getProfid()==profid){
                            count++;
                        }

                    }
                    %>
                    <%if(count==0){%>
                    <div class="btns">
                        <button class="minibtns" onclick="displayuploadform(<%=x.getRequirementid()%>)">Send Proposal</button>
                    </div>
                    <%}else{%>
                    <div class="btns">
                        <button class="minibtns" >You already sent a Proposal</button>
                    </div>
                    <%}%>

                </div>
                   <%}%>
                <%}%>

            </div>

        </div>






    </div>

    <%@include file="../../footer.jsp"%>


</div>
<script>
    // type in <input> tag to use this file validation function:- onchange(return fileValidation())
    function fileValidation(){
        var fileInput = document.getElementById('uploadfile');
        var filePath = fileInput.value;
        var allowedExtensions = /(\.pdf|\.zip)$/i;
        if(!allowedExtensions.exec(filePath)){
            alert('Please upload pdf or zip file');
            fileInput.value = '';
            return false;}
    }


    function displayuploadform(id){
        document.getElementById('reqid2').value = id;
        console.log(id);
        console.log("========== reqid ==================")
        var filling =document.getElementById("uploadproposal");
        filling.style.display="block";
        var blur = document.getElementById("blur");
        blur.style.filter="blur(8px)";

        var menubar = document.getElementById("menu_bar");
        menubar.style.filter="blur(8px)";

    }
    function mypopupclose(){
        var filling =document.getElementById("uploadproposal");
        filling.style.display="none";
        var blur = document.getElementById("blur");
        blur.style.filter="none";
        var menubar = document.getElementById("menu_bar");
        menubar.style.filter="none";
    }
    function processSelectedFiles(fileInput) {
        let files = fileInput.files;
        let val = document.querySelector("#filename");

        for (let i = 0; i < files.length; i++) {
            val.value += files[i].name;
            console.log("blajjncuans");
            console.log(val.value);
        }
    }
</script>
</body>

</html>