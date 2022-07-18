<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/StyleforMakePayment.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Make Online Payment</title>
     <style>
      input[name=amount] {
        pointer-events: none;
      }
    </style>
</head>
<body>
<div class="contact" id="contact">
    <div class="form-box"> 
            <div class="contact-inner-col">
                <h1>Payment&nbsp;<i class="fa fa-credit-card"></i></h1>
                <form action="Payment" id="" method="post" onsubmit="return afunction()">
                    <input id="totalamt"type="text" name="amount" value="Total Amount : ">
                    <input type="text" name="name" id=" " placeholder="Name on the Card" required>
                    <input type="text" name="number" id=" " placeholder="Credit Card Number" required>
                    <br>
                    <select name="month" id="state" class="form-control">
                    <option value="select" selected>Month</option>
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option></select>
                    <br>
                    <select name="year" id="state" class="form-control">
                    <option value="123" selected>Year</option>
                    <option value="21">2021</option>
                    <option value="22">2022</option>
                    <option value="23">2023</option>
                    <option value="24">2024</option>
                    <option value="25">2025</option>
                    <option value="26">2026</option>
                    <option value="27">2027</option>
                    <option value="28">2028</option>
                    <option value="29">2029</option>
                    <option value="30">2030</option>
                    <option value="31">2031</option>
                    <option value="32">2032</option></select>
                    <input type="password" name="cvv" id=" " placeholder="CVV" required>
                    <button class="btn" type="submit">Make Payment</button>
                    <br><br>
                    <a href="index.jsp">Go Back</a>
            
                </form>
            </div>
        </div>
    </div>
    <script>
    function afunction(){
    	
        alert("Payment Successful");
    }
    window.onload=function(){
    	let arr = document.cookie.split(';').map(cookie => cookie.split('=')).reduce((accumulator, [key, value]) => ({ ...accumulator, [key.trim()]: decodeURIComponent(value) }), {});
        let a = parseInt(arr["totalamount"]);
        if (isNaN(a))
            a = 0;
         
       document.getElementById('totalamt').value="Total Amount : "+a+".00 INR";
     
    }
    </script>
</body>
</html>