<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notification</title>
    <link rel="stylesheet" href="./html/professionals/resources/css/nav-bar-updated.css">
    <link rel="stylesheet" href="./html/professionals/resources/css/notification.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="./resources/js/jquery-3.6.0.js"></script>
    <script>
        $(document).ready(function (){
            var myvar=setInterval(function (){
                var text=" ";
                $.ajax({
                    url:"<%=request.getContextPath()%>/notification",
                    type:"POST",
                    success:function (data){
                        for (let i in data){
                            text+='<div class="message" onclick="openmessage('+data[i].notificationid+')"><div class="messagehead"><h4 class="title">'+data[i].notificationtype+'</h4><h4 class="time">'+data[i].datetime+'</h4></div><p id="'+data[i].notificationid+'" class="displayhidden">'+data[i].notificationmessage+'</p></div>';
                        }
                        $("#notify").empty();
                        $("#notify").append(text);
                    }
                })
            },5000);
        });
        function openmessage(ele){
            var id=document.getElementById(ele);
            id.classList.remove("displayhidden");
        };
    </script>
</head>

<body>
<%@include file="sidebar-professional.jsp"%>
<div class="container">
    <div class="content">
        <div class="notifications">
            <div class="heading1">
                <h2>Notifications</h2>
                <hr>
            </div>
            <div class="notify" id="notify">
            </div>
        </div>
    </div>
</div>
<%@include file="../../footer.jsp"%>
</body>

</html>