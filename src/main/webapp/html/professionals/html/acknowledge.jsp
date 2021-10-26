<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>acknowledge</title>
    <link rel="stylesheet" href="./html/professionals/resources/css/acknowledge.css">
    <link rel="stylesheet" href="./html/professionals/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<%@include file="sidebar-professional.jsp"%>
<div class="container">
    <div class="content" id="content">
        <div class="users">
            <div class="searcharea">
                <input type="text" class="searchbar"><i class="fa fa-search" aria-hidden="true" id="search"></i>
            </div>
            <div class="chatarea">
                <div class="chatuser">
                    <h4>Sukumar Kavishan</h4>
                    <p>Date:2021-06-10</p>
                </div>
                <div class="chatuser">
                    <h4>Senal Punsara</h4>
                    <p>Date:2021-05-19</p>
                </div>
                <div class="chatuser">
                    <h4>Imesh Udara</h4>
                    <p>Date:2021-04-20</p>
                </div>
                <div class="chatuser">
                    <h4>Chathuri Priyangika</h4>
                    <p>Date:2021-03-01</p>
                </div>
            </div>
        </div>
        <div class="chat">
            <div class="currentchatuser">
                <h4>Kavishan Sukumar</h4>
            </div>
            <div class="currentchat">

            </div>
            <input type="submit" value="Acknowledge" style="float: right">
        </div>
    </div>
</div>
<%@include file="../../footer.jsp"%>
</body>
</html>