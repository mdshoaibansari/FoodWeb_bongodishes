<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Admin</title>
     <link rel="stylesheet" href="./resources/css/AdminPage.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
                integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
                crossorigin="anonymous">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!---we had linked our css file----->
    <style>
    	header{
    		background-color: white;
    	}
    	body{
            min-height  : 100vh;
            background-image: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.4)), url("./resources/images/pexels-lukas-616401.jpg");
             background-repeat: no-repeat;
            background-size:cover; 
            background-position: 10% ;
        }
        .container {
    display: flex;
    justify-content: center;
}
    </style>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>


        <div class="container">
                
      
                <b>Welcome Admin </b>
        </div>
            
       
    <script>
    window.onload = function () {
        console.log("document is loadded");
        i=10;
        $.ajax({
        	
            url : "someservlet",
            data : {cid : i},
            success: function(data,textstatus,jqXHR){
                console.log(data);
                
            }
        })
    }
       
    </script>        
    
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
                integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
                crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
                integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
                crossorigin="anonymous"></script>

</body>

</html>