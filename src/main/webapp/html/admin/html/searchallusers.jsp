<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.construct360deg.model.AllUsers" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@page pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" language="java" %>
<%
    ArrayList<AllUsers> allprofs= (ArrayList<AllUsers>) request.getAttribute("allviews");

%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Search for contractors</title>
  <link rel="stylesheet" href="./html/admin/resources/css/searchallusers.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<%@include file="sidebar-admin.jsp"%>
<div class="container">
      <div class="content">
        <div class="content1">
        <form class="example" action="/action_page.java">
          <button type="submit"><i class="fa fa-search"></i></button>
          <input type="text" placeholder="Search.." name="search">
        </form>
        </div>
        <div class="container-3">
            <h3>Filter By</h3>
            <h4>Users :</h4>
            <label class="box">Contractor
                <input type="checkbox">
                <span class="checkmark"></span>
              </label>
            <label class="box">Landscape Designer
                <input type="checkbox">
                <span class="checkmark"></span>
            </label>
            <label class="box">Customers
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
                    <a target="_blank" href="user4.png">
                      <img src="data:image/jpeg;base64,<%=base64Encoded%>" onerror="this.src='./resources/images/Avatar.png;'" >
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
</body>

</html>
