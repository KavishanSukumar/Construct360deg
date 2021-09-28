

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="../resources/css/registrationform.css">

    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>rofessional Registration Form - individual</title>
</head>
<body>
    <div class="wrapper">
        <div class="title">
            Professional Registration Form
        </div>
        <div class="form">
            <div class="inputfield">
               <label color>Company Name</label>
               <input type="text" class="input">
            </div>  
            
            <div class="inputfield">
             <label color>User Name</label>
             <input type="text" class="input">
            </div> 
            
            <div class="inputfield">
             <label>Company Email Address</label>
             <input type="email" pattern=".+@globex\.com" size="300" required class="input">
            </div> 
              
            <div class="inputfield">
               <label>Password</label>
               <input type="password" class="input">
            </div>  
            <div class="inputfield">
             <label>Confirm Password</label>
             <input type="password" class="input">
             
          </div>
            <div class="inputfield">
                <label>Province</label>
                <input type="text" class="input">
            </div>
            <div class="inputfield">
                <label>District</label>
                <input type="text" class="input">
            </div>
            <div class="inputfield">
                <label>City</label>
                <input type="text" class="input">
            </div>
            <div class="inputfield">
                <label>Street</label>
                <input type="text" class="input">
            </div>
            <div class="inputfield">
                <label>Houseno</label>
                <input type="text" class="input">
            </div>
          <div class="inputfield">
             <label>Address proof</label>
             <div class = "filearea">
               <input type="file" id="actual-btn1" hidden/>
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
          <div class="inputfield">
            <label>Career</label>
              <br>
            <div class="custom_select">
              <select>
                <option value="">Select</option>
                <option value="cont">Contractor </option>
                <option value="land">Landscape designer</option>
                <option value="cont_land">Contractor and Landscape designer</option>
                <option value="Product">Product company</option>
              </select>
            </div>
         </div> 
          <div class="inputfield">
             <label>Registration Number</label>
             <input type="text" class="input">
          </div>
          <div class="inputfield">
             <label>Registration Softcopy</label>
              <div class = "filearea">
                <input type="file" id="actual-btn" hidden/>
                <label for="actual-btn">Choose File</label>
                <span id="file-chosen" style="color:white">No file chosen</span>
                
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
        </div>
    </div>
    <script src="../resources/js/registrationform-professionals-company.js"></script>

</body>
</html>