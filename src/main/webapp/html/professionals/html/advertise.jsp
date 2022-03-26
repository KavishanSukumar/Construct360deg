<%@ page import="com.example.construct360deg.model.Account" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<%
    Account profimd = (Account) request.getAttribute("img");
    Account profname = (Account) request.getAttribute("name");
    String userrole = (String) request.getAttribute("userrole");
    System.out.println("userrole------"+userrole);
%>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>advertise</title>

    <link rel="stylesheet" href="./html/professionals/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="./html/professionals/resources/css/advertise.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<!-- <input type="checkbox" id="check"> -->
<!-- header area start -->
<%@include file="sidebar-professional.jsp"%>
<div class="container">
  <div class="content">
      <%
          String base64Encoded2=null;
          if (profimd.getImgBytes()==null){

          }else {
              byte[] bytes = profimd.getImgBytes();
              byte[] encodeBase64 = Base64.encodeBase64(bytes);
              base64Encoded2 = new String(encodeBase64, "UTF-8");
          }
      %>
    <div class="add-area">
      
        <div class="filling">
          <h2>Setup your advertisement here</h2>
            <form id="fill" class="details" action="<%=request.getContextPath()%>/advertise" method="post" enctype="multipart/form-data">
                
                <label for="url">Your web page's url (Optional) :</label>
                    <input type="text" id="url" name="weburl" maxlength="50"><br>
                    <p id="weburl_wordcount"></p>
                
                <label for="headline">Headline:</label>
                    <input type="text" id="headline" name="headline"  maxlength="50" required><br>
                    <p id="headline_wordcount"></p>
                <label for="descrip">Description :</label><br>
                    <textarea id="descrip" name="description" required maxlength="150"></textarea><br><br>
                    <p id="descrip_wordcount"></p>
                <p> Mesurements of the Advertisement :
                    <br>should be like this
                    <br>(Please upload an image file)
                </p><br>
                   <div class="imagetemp">
                       <img src="./html/professionals/resources/images/Advertise/addtemp.jpg" alt="">
                   </div> <br>
                <div class="img-file" style="display: flex; flex-direction: row">
                    <p style="margin-left: -215px;">Advertisement source file :</p>
                    <div>
                    <input type="file" id="imgfile" style="margin: 15px;" name="imgfile" onchange="fileValidation()"/><br>
                    <label id="filetype">(Choose png / jpeg / jpg file)</label>
                    </div>
                </div>
                <input type="submit" id="upload" value="Uplaod" form="fill">
                </form>
            </div>

      </div>
        
    
    <div class="preview-area">
      <div class="preview">

          <p id="preview">Preview </p>

           <div class="preview-img">
<%--             <img src="./html/professionals/resources/images/Advertise/preview.jpg" alt="">--%>
               <div class="addpreview">
                     <div class="padding">
                      <div class="profinfo">
                          <img src="data:image/jpeg;base64,<%=base64Encoded2%>" alt="" id="prof-img"  onerror="this.src='./html/professionals/resources/images/Avatar.png'">
                          <div class="minifacts">
                              <p id="title"></p>
                              <%if(userrole.equals("prof_indiv")){%>
                              <p  id="name"><b><%=profname.getFirstname()%>  <%=profname.getLastname()%> </b> </p>
                              <%}else{%>
                              <p id="name"><b><%=profname.getCompanyname()%> </b> </p>
                              <%}%>
                              <p id="date-time"></p>
                          </div>
                      </div>

                       <p id="add-descript"></p>
                       <div class="add">
                           <img  src=""  id="add-img"  alt="" onerror="this.src='./html/professionals/resources/images/Advertise/preview.jpg'">
<%--                           alt="./html/professionals/resources/images/Advertise/preview.jpg"--%>
                           <script>

                           </script>

                       </div>
                         <div id="add-url-area">
                             <a id="add-url"  href=""></a>
                         </div>

                       </div>
               </div>
           </div> <br>


      </div>

        <script>

            document.getElementById('date-time').innerHTML ='on '+(new Date()).toLocaleDateString()+' at ' +(new Date()).toLocaleTimeString()

            function setText(sourceId,destId){
                let s =document.getElementById(sourceId);
                s.addEventListener('keyup',()=>{
                    document.getElementById(destId).innerHTML = s.value;
                })
            }
            let h= document.getElementById('add-url');


            setText('url','add-url');
            // h.href = setText('url','add-url');
            setText('descrip','add-descript');
            setText('headline','title');

        </script>


    </div>

  </div>
    <script>
        function fileValidation(){
            var fileInput = document.getElementById('imgfile');
            var filePath = fileInput.value;
            var allowedExtensions = /(\.png|\.jpeg|\.jpg)$/i;
            if(!allowedExtensions.exec(filePath)){
                alert('Please upload an image file');
                fileInput.value = '';
                }
            let imgfile = document.getElementById("add-img");
            imgfile.src=URL.createObjectURL(event.target.files[0]);
        }
    </script>
    <script>
         var text_weburl = document.getElementById("url");
         var result1  = document.getElementById("weburl_wordcount");
         var limit1 = 50;
         result1.textContent = 0 + "/" + limit1;

         text_weburl.addEventListener("input",function (){
             var textlen = text_weburl.value.length;
             result1.textContent = textlen + "/" + limit1;


         })
    </script>
    <script>
        var text_headline = document.getElementById("headline");
        var result2  = document.getElementById("headline_wordcount");
        var limit2 = 50;
        result2.textContent = 0 + "/" + limit2;

        text_headline.addEventListener("input",function (){
            var textlen = text_headline.value.length;
            result2.textContent = textlen + "/" + limit2;


        })
    </script>
    <script>
        var text_description = document.getElementById("descrip");
        var result3  = document.getElementById("descrip_wordcount");
        var limit3 = 150;
        result3.textContent = 0 + "/" + limit3;

        text_description.addEventListener("input",function (){
            var textlen = text_description.value.length;
            result3.textContent = textlen + "/" + limit3;


        })
    </script>


    <%@include file="../../footer.jsp"%>
</div>

</body>

</html>
 <!-- <p>Date/Time: <span id="datetime"></span></p>

      <script>
      var dt = new Date();
      document.getElementById("datetime").innerHTML = dt.toLocaleString();
      </script> -->


<!-- 

      <!DOCTYPE html>
<html>

<body style="text-align: center;">

	<h1 style="color: green">
		GeeksforGeeks
	</h1>

	
<p>
		Type in the textbox and click on
		the button to count the words
	</p>



	<textarea id="inputField" rows=10 cols="60">
	</textarea>
	<br><br>

	<button onclick="countWords()">
		Count Words
	</button>
	<br><br>

	
<p> Word Count:
		<span id="show">0</span>
	</p>



	<script>
		function countWords() {

			// Get the input text value
			var text = document
				.getElementById("inputField").value;

			// Initialize the word counter
			var numWords = 0;

			// Loop through the text
			// and count spaces in it
			for (var i = 0; i < text.length; i++) {
				var currentCharacter = text[i];

				// Check if the character is a space
				if (currentCharacter == " ") {
					numWords += 1;
				}
			}

			// Add 1 to make the count equal to
			// the number of words
			// (count of words = count of spaces + 1)
			numWords += 1;

			// Display it as output
			document.getElementById("show")
				.innerHTML = numWords;
		}
	</script>
</body>

</html> -->
<%--this is comment--%>
<%--this is comment--%>
