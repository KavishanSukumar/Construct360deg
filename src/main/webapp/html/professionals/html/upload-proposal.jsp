<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>upload-proposal</title>
    <link rel="stylesheet" href="./html/professionals/resources/css/upload-proposal.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</head>
<body>
    <div class="container">
        <%@include file="sidebar-professional.jsp"%>
        <div class="content">
             <div class="uploadarea">
                <p>PDF only</p>
                <div class="drag-area">
                    <div class="icon"><i class="fas fa-cloud-upload-alt"></i></div>
                    <header>Drag & Drop to Upload File</header>
                    <span>OR</span>
                    <button>Browse File</button>
                    <input type="file" hidden>
                </div>

                <div class="uploadFile">
                    <input type="submit" value="Save changes">
                    <input type="submit" value="Uplaod" style="float: right;">
                </div>
             </div>
        </div>
    </div>
    <script src="./html/professionals/resources/js/upload-proposal.js"></script>


    <%@include file="../../footer.jsp"%>
</body>

</html>