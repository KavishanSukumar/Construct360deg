<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="../resources/css/registrationform.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration form - individual</title>
</head>
<body>
    <div class="wrapper">
        <div class="title">
            Customer Registration Form
        </div>
        <form class="form" action="<%=request.getContextPath()%>/registercustomerindividual" enctype='multipart/form-data' method="post">
           <div class="inputfield">
              <label color>First Name</label>
              <input type="text" class="input" name="firstname">
           </div>  
           
           <div class="inputfield">
              <label>Last Name</label>
              <input type="text" class="input" name="lastname">
           </div>
           <div class="inputfield">
            <label color>User Name</label>
            <input type="text" class="input" name="username">
           </div> 
           <div class="inputfield">
              <label color>Date of birth</label>
              <div class="dob">
              <input type="date" id="dob" name="dob">
            </div>
            
           </div> 
           <div class="inputfield">
            <label>Email Address</label>
            <input type="email"  size="300" required class="input" name="email">
           </div> 
             
           <div class="inputfield">
              <label>Password</label>
              <input type="password" class="input" name="password">
           </div>  
           <div class="inputfield">
            <label>Confirm Password</label>
            <input type="password" class="input">
         </div>
         <div class="inputfield">
            <label>NIC</label>
            <input type="text" class="input" name="nic">
         </div>
         <div class="inputfield">
            <label>NIC Softcopy</label>
             <div class = "filearea">
               <input type="file" id="actual-btn" hidden name="nicsoftcpy"/>
               <label for="actual-btn">Choose File</label>
               <span id="file-chosen" style="color:white">No file chosen</span>
                 <script>
                     const actualBtn = document.getElementById('actual-btn');

                     const fileChosen = document.getElementById('file-chosen');

                     actualBtn.addEventListener('change', function(){
                         fileChosen.textContent = this.files[0].name
                     })
                 </script>
            </div>
         </div> 
            <div class="inputfield">
              <label>Honorific</label>
              <div class="custom_select">
                <select name="honorfic">
                  <option value="">Select</option>
                  <option value="Mr.">Mr</option>
                  <option value="Mrs.">Mrs</option>
                    <option value="Ms.">Ms</option>
                </select>
              </div>
           </div> 
            
          <div class="inputfield">
              <label>Contact Number</label>
              <input type="text" class="input" name="contactnum">
           </div>
            <div class="inputfield">
                <label>Province</label>
                <input type="text" class="input" name="province">
            </div>
            <div class="inputfield">
                <label>District</label>
                <input type="text" class="input" name="district">
            </div>
            <div class="inputfield">
                <label>City</label>
                <input type="text" class="input" name="city">
            </div>
            <div class="inputfield">
                <label>Street</label>
                <input type="text" class="input" name="street">
            </div>
            <div class="inputfield">
                <label>Houseno</label>
                <input type="text" class="input" name="houseno">
            </div>
           <div class="inputfield">

            <label>Address proof</label>
             <div class = "filearea">
               <input type="file" id="actual-btn1" hidden name="addressproof"/>
               <label for="actual-btn1">Choose File</label>
               <span id="file-chosen1" style="color:white">No file chosen</span>
               <script>
                  const actualBtn1 = document.getElementById('actual-btn1');

                  const fileChosen1 = document.getElementById('file-chosen1');

                  actualBtn1.addEventListener('change', function(){
                 fileChosen1.textContent = this.files[0].name
                })
               </script>
            </div>
           </div>
           <div class="termsandconditions">
            <a href="https://www.google.com/" target="_blank" style="color:aqua; font-size: 70%;">terms and conditions</a> 
           </div>
            <br>
          <div class="inputfield terms">
              <label class="check">
                <input type="checkbox" required>
                <span class="checkmark"></span>
              </label>
              <p>Agreed to terms and conditions</p>
           </div> 
          <div class="inputfield">
            <input type="submit" value="Register" class="btn">
          </div>
        </form>
    </div>
    <script src="../resources/js/registrationform-customer-individula.js"></script>

</body>
</html>