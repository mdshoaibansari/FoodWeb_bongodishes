<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.wipro.bean.PizzaBean,com.wipro.Dao.PizzaDao,com.wipro.util.DButil,java.util.*,javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <!-- Bootstrap CSS v5.0.2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
      body{
            height  : 100vh;
            background-image: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.2)), url("./resources/images/pexels-pixabay-235985.jpg");
             background-repeat: no-repeat;
            background-size:cover; 
            background-position:  ;
        }
        .table{
        	font-size: 22px;
        	color: white;
        }
          h1{
        color: white;
         
        }
    </style>
</head>
<body>

 <div class="container ">
      <h1 class="text-center  my-5">Cart</h1>
    <table class="table  table-hover mt-5">

        <thead>
          <tr>
            <th scope="col">Food Name</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Amount</th>
          </tr>
        </thead>
        <%  int total=0;
            Cookie[] c= request.getCookies();
            if(c!=null){
   
            for(int ij=0 ; ij<c.length;ij++){
                try{
                	
                	
                	
                int temp= Integer.parseInt( c[ij].getName());
                String val=c[ij].getValue();
                PizzaDao pd=new PizzaDao();
                
                  if(temp>=1000){
                	 
                    PizzaBean pb=pd.getPizza(temp);
               
       %>
                   
   
        <tbody>
          <tr>
                 
            <th scope="row"><%= pb.getFoodName()%></th>
            <td id="price<%= temp %>"><%= pb.getPrice()%></td>
             <!--  <td></td> -->
            <td><button class="btn" onclick="removecart(<%= temp %>)"> <i class="fas fa-minus-circle"></i></button>
              <button class="btn" id="btn<%= temp %>" ><%= val %></button>
              <button class="btn"  onclick="addcart(<%= temp %>)">  <i class="fas fa-plus-circle"></i></button></td>
             <% total+= ( Integer.parseInt(val)*  Integer.parseInt(pb.getPrice()));%> 
              <td id="amount<%= temp %>"><%= ( Integer.parseInt(val)*  Integer.parseInt(pb.getPrice())) %></td>
          </tr>
		 <%

					 }
                }catch(NumberFormatException e){
                
                }
                finally{
                }
                
            }
          }
		
		
		
       %>
         
          
        </tbody>
         
      </table>
          <div class="container">
         <h4 class="text-center mt-5 my-4">Total Cost = <span id="totalamount"> <%= total %></span></h4>
          <div class="container text-center mt-3">
            <a  id="" class="btn btn-primary" href="MakePayment.jsp" role="button">Make Payment</a>
        </div>
      </div>
      </div>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="./resources/script/newjs2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 
</body>
</html>