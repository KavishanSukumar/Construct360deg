<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.AllUsers" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<%
    ArrayList<AllUsers> allprofs= (ArrayList<AllUsers>) request.getAttribute("allprofs");
    int tag = 0;
    int count = 0;
    try{
        tag = (int) request.getAttribute("tag");
    }catch (Exception e){
        count++;
    }
    System.out.println("this is searchprofessional count "+count+"if count==0 no exception");
    int  reqid = -1;
    if(count==0){
        reqid = (int) request.getAttribute("reqid");
    }


%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Search for contractors</title>
  <link rel="stylesheet" href="./html/customer/resources/css/searchcontractor.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script>
        const searchbar = document.getElementById('search');

        searchbar.addEventListener('keyup',(e)=>{
            const input = e.target.value;
            if(input==""){
                console.log("null value");
            }else{
                console.log("not null value");
            }

        })
    </script>
</head>

<body>
<%@include file="sidebar-customer.jsp"%>
<div class="container">
      <div class="content">
        <div class="content1">
        <form class="example" action="<%=request.getContextPath()%>/searchprofessionals">
          <button type="submit"><i class="fa fa-search"></i></button>
          <input type="text" placeholder="Search.." name="search">
        </form>
        </div>
        <div class="container-3">
            <h3>Filter By</h3>
            <h4>Professional :</h4>
            <label class="box">Contractor
                <input type="checkbox">
                <span class="checkmark"></span>
              </label>
            <label class="box">Landscape Designer
                <input type="checkbox">
                <span class="checkmark"></span>
            </label>
            <h4>Ranking :</h4>
            <label class="box"><i class="fas fa-star"></i>
                <input type="checkbox">
                <span class="checkmark"></span>
              </label>
            <label class="box"><i class="fas fa-star"></i><i class="fas fa-star"></i>
                <input type="checkbox">
                <span class="checkmark"></span>
            </label>
            <label class="box"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                <input type="checkbox">
                <span class="checkmark"></span>
              </label>
            <label class="box"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                <input type="checkbox">
                <span class="checkmark"></span>
            </label>
            <label class="box"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                <input type="checkbox">
                <span class="checkmark"></span>
            </label>
        </div>

        <div class="container-4">
            <%for (AllUsers x:allprofs){%>
                <%
                    String base64Encoded=null;
                    if(x.getImgbytes()==null){

                    }else{
                        byte[] bytes = x.getImgbytes();
                        byte[] encodeBase64 = Base64.encodeBase64(bytes);
                        base64Encoded = new String(encodeBase64, "UTF-8");
                    }
                %>
                <div class="gallery">
                    <a target="" onclick="viewprofprofile(<%=x.getUserid()%>,<%=reqid%>,<%=tag%>)">
                      <img src="data:image/jpeg;base64,<%=base64Encoded%>" style="cursor: pointer" class="user" >

<%--                    <a target="" href="<%=request.getContextPath()%>/viewprofprofile">--%>
<%--&lt;%&ndash;                      <img src="data:image/jpeg;base64,<%=base64Encoded%>" onerror="this.src='./resources/images/user.png;'">&ndash;%&gt;--%>
<%--                        <img src="data:image/jpeg;base64,<%=base64Encoded%>" class="user">--%>


                    </a>
                    <%
                        String name=null;
                        if(x.getProffullname()!=null)
                            name=x.getProffullname();
                        else if(x.getProfcompanyname()!=null)
                            name=x.getProfcompanyname();
                        else
                            name="Not Mentioned";
                    %>
                    <%
                        String post=null;
                        if((x.isComlandflag()&&x.isComcontractflag())||(x.isIndivcontractflag()&&x.isIndivlandflag()))
                            post="Contracting & Landscape Designing";
                        else if(x.isComlandflag()||x.isIndivlandflag())
                            post="Landscape Designing";
                        else if(x.isComcontractflag()||x.isIndivcontractflag())
                            post="Contracting";
                        else
                            post="Not Mentioned";
                    %>
                    <div class="desc">
                        <p><%=name%></p>
                        <p><%=post%></p>
                    </div>
                </div>
            <%}%>
        </div>
      </div>
    </div>
    <%@include file="../../footer.jsp"%>
<script>
    function viewprofprofile(id,reqid,tag){
        var d = 100;
        var tag1 = tag;
        var profid = id
        var reqid1 = reqid;
        console.log(profid);
        console.log("this is tag and reqid"+tag1+reqid1)
        var out = confirm("viewproprofile");
       <%--if(out==true) {--%>
       <%--     location.href="<%=request.getContextPath()%>/viewprofprofile?profid="+profid;--%>
       <%-- }else{--%>
       <%--     console.log("false");--%>
       <%-- }--%>
       //////////////////  senal changed above part to below part  /////////////////////////
        if (out==true&&reqid1>0){
            console.log("this is   if condition");
            location.href="<%=request.getContextPath()%>/viewprofprofile?profid="+profid+"&reqid="+reqid1+"&tag="+tag1;

        }else if(out==true&&reqid1==-1) {
            location.href="<%=request.getContextPath()%>/viewprofprofile?profid="+profid;
            console.log("this is  else if condition");
        }else{
            console.log("false");
        }
    }
</script>
</body>

</html>
