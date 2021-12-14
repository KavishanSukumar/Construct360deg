<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>advertise</title>

    <link rel="stylesheet" href="../resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="../resources/css/advertise.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<!-- <input type="checkbox" id="check"> -->
<!-- header area start -->
<%@include file="sidebar-professional.jsp"%>
<div class="container">
  <div class="content">
    <div class="add-area">
      
        <div class="filling">
          <h2>Setup your advertisement here</h2>
            <form id="fill" class="details" action="<%=request.getContextPath()%>/advertise" method="post" enctype="multipart/form-data">
                
                <label for="url">Your web page's url (Optional) :</label>
                    <input type="text" id="url" name="weburl" maxlength="60"><br>
                    <p id="weburl_wordcount"></p>
                
                <label for="headline">Headline:</label>
                    <input type="text" id="headline" name="headline"  maxlength="60" required><br>
                    <p id="headline_wordcount"></p>
                <label for="descrip">Description :</label><br>
                    <textarea id="descrip" name="description" required></textarea><br><br>
                <p> Mesurements of the Advertisement :
                    <br>should be like this
                    <br>(Please upload an image file)
                </p><br>
                   <div class="imagetemp">
                       <img src="./html/professionals/resources/images/Advertise/addtemp.jpg" alt="">
                   </div> <br>
                <div class="img-file">  
                    <input type="file" id="imgfile" name="imgfile" onchange="return fileValidation()"/><br>
                    <label id="filetype">(Choose png / jpeg / jpg file)</label>
                </div>
<%--                <input type="submit" value="Uplaod" form="fill">--%>
                </form>
            </div>

      </div>
        
    
    <div class="preview-area">
      <div class="preview"> 
        <p>Preview </p> 
        <div class="preview-img">
          <img src="./html/professionals/resources/images/Advertise/preview.jpg" alt="">
        </div> <br>
        <input type="submit" value="Uplaod" form="fill">
      </div>
     
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
                return false;}
        }
    </script>
    <script>
         var text_weburl = document.getElementById("url");
         var result1  = document.getElementById("weburl_wordcount");
         var limit1 = 60;
         result1.textContent = 0 + "/" + limit1;

         text_weburl.addEventListener("input",function (){
             var textlen = text_weburl.value.length;
             result1.textContent = textlen + "/" + limit1;


         })
    </script>
    <script>
        var text_headline = document.getElementById("headline");
        var result2  = document.getElementById("headline_wordcount");
        var limit2 = 60;
        result2.textContent = 0 + "/" + limit2;

        text_headline.addEventListener("input",function (){
            var textlen = text_headline.value.length;
            result2.textContent = textlen + "/" + limit2;


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
