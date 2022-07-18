<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.wipro.bean.PizzaBean,com.wipro.Dao.PizzaDao,com.wipro.util.DButil,java.util.*,javax.servlet.http.Cookie" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Items</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <!-- Bootstrap CSS v5.0.2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
     <style>
     header{
    		background-color: white;
    	}
         body{
            min-height  : 100vh;
            background-image: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.4)), url("./resources/images/pexels-lukas-616401.jpg");
             background-repeat: no-repeat;
            background-size:cover; 
            background-position: 50% ;
        }
        .table{
        	font-size: 22px;
        	color: white;
        }
        h1{
        color: white;
    
        }
     
     </style>
	<%@ include file="headerfood.jsp"%>
</head>
<body>


 <div class="container">

      <form  id="FoodForm" method="get">
      <span id="buttonSet">
      <button class="btn btn-danger" type="button" onclick="deleteFood()"> Delete </button>
      <button class="btn btn-info" type="button" id="EditButton" onclick="edit()"> Edit </button>
      <button class="btn btn-md btn-secondary" id="AddButton" type="button" onclick="add()">Add Food</button>
       </span>
      <table id="mytable"class="table  table-hover  mt-3">

        <thead>
          <tr>
          <th scope="col">Select</th>
            <th scope="col">Food Name</th>
            
            <th scope="col">Price</th>
            <th scope="col">Food Type</th>   
            
          </tr>
        </thead>
        <%  
           PizzaDao pd=new PizzaDao();
           ArrayList<PizzaBean> list=pd.getAllFood();
           PizzaBean pb;
           for(int i=0;i<list.size();i++)
           {
        	   pb=list.get(i);
       %>
                   
   
        <tbody>
          <tr id="rowid<%= pb.getFoodId()%>">
             <td scope="row"><input type="checkbox" name="userName" id="" value="<%= pb.getFoodId()%>"></td>     
            <td><%= pb.getFoodName()%></td>
             
            <td><%= pb.getPrice()%></td>
            <td><%= pb.getType()%></td>
            
          </tr>

		 <%   
            }	
		
       %>
          <tr id="newRow">
          </tr>
          
        </tbody>
         
      </table>
        </form>
        <div class="modal-dialog modal-dialog-centered">

  <div class="modal fade"  id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Are You Sure to delete food?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-danger" id='deleteFood'>Delete</button>
        </div>
      </div>
    </div>
  </div>
  </div>
        
      </div>
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="./resources/script/allfoodsrc.js" >
     

    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 
</body>
</html>