<!doctype html>
<html lang="en">
  <head>
    <title>PaymentComplete</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS v5.2.0-beta1 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"  integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="./resources/css/paymen.css">
  </head>
  <body>
   
  <div class="bg">
  
    <div class="card">
    
      <span class="card__success"><i class="ion-checkmark"></i></span>
    
      <h1 class="card__msg">Payment Complete</h1>
      <h2 class="card__submsg">Thank you for your payment</h2>
    
      <div class="card__body">
      
        <div class="card__recipient-info">
          <p class="card__recipient"><%=(String) session.getAttribute("name")%></p>
          <img src="./resources/images/404-tick.png" alt="paymentConf" class="card__avatar">     
        </div>   
      
        <h1 class="card__price"><span>&#x20b9;</span><span id="payment"></span><span>.00</span></h1>
      </div>
    
    </div>
  
  </div>
  
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
    <script>
      window.onload=function(){
        let arr = document.cookie.split(';').map(cookie => cookie.split('=')).reduce((accumulator, [key, value]) => ({ ...accumulator, [key.trim()]: decodeURIComponent(value) }), {});
        let a = parseInt(arr["totalamount"]);
        if (isNaN(a))
            a = 0;
        document.getElementById('payment').innerText=a;
      }
      
    </script>
  </body>
</html>