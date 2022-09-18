<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>upload-proposal</title>
    <link rel="stylesheet" href="../resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="../resources/css/uploadproposal.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

</head>
<body>
    <div class="container">
        <%@include file="sidebar-professional.jsp"%>
        <div class="content">
            <div class="filling">

                <div class="img-area">
                <p id="title" style="align-content: center">Upload your proposal to </p>
                <img id="profimg" src="../resources/images/Avatar.png" alt="" >
                    <div class="details">
                    <p class="info" id="profimgname">Pathum nissanka</p>
                    <p class="info" id="cusid">Customer ID :- 0009</p>
                    </div>
                </div>

                <div class="up-area">
                    <form class="proposal">

                        <label for="uploadfile" id="up-proposal">Proposal :-</label>
                        <input type="file" id="uploadfile" name="uploadfile" onchange="return fileValidation()"><br>
                        <label id="filetype">(Choose pdf or zip file)</label>
                        <div class="upload">
                            <input type="submit" value="Upload">
                        </div>

                    </form>
                </div>

            </div>


        </div>
        <script>
            function fileValidation(){

                var fileInput = document.getElementById('uploadfile');
                var filePath = fileInput.value;
                var allowedExtensions = /(\.pdf|\.zip)$/i;
                if(!allowedExtensions.exec(filePath)){
                    alert('Please upload pdf or zip file');
                    fileInput.value = '';
                    return false;}
            }
        </script>



    <%@include file="../../footer.jsp"%>
    </div>

</body>

</html>