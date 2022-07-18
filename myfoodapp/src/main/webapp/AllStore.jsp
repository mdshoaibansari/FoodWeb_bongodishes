<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.wipro.bean.StoreBean,com.wipro.Dao.PizzaDao,com.wipro.util.DButil,java.util.*,javax.servlet.http.Cookie" %>

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
            background-position: 10% ;
        }
        .table{
        	font-size: 22px;
        	color: white;
        }
        h1{
        color: white;
        underline:
        }
     
     </style>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	 <%@ include file="headerstore.jsp"%>
</head>
<body>

 <div class="container">
      
     <form  id="StrForm" method="get">
      <span id="buttonSet">
      <button class="btn btn-danger" type="button" onclick="deleteStore()"> Delete </button>
 	  <button class="btn btn-warning" type="button" id="ManageButton" onclick="manage()"> Manage Store </button>
      <button class="btn btn-info" type="button" id="EditButton" onclick="edit()"> Edit </button>
       </span>
    <table class="table  table-hover  mt-3">

        <thead>
          <tr>
           <!--  <th scope="col">Store Id</th> -->
            <th scope="col">Select</th>
            <th scope="col">Store Name</th>
            <th scope="col">Phone Number</th>
            <th scope="col">Address</th>
            <th scope="col">State</th>
           
          </tr>
        </thead>
       
                   
   
        <tbody>
         <%  
           PizzaDao pd=new PizzaDao();
           ArrayList<StoreBean> list=pd.getAllStore();
           StoreBean sb;
           for(int i=0;i<list.size();i++)
           {
        	   sb=list.get(i);
       %>
          <tr id="rowid<%= sb.getStoreId()%>">
                 
           <%--  <th scope="row"><%= sb.getStoreId()%></th> --%>
            <td scope="row"><input type="checkbox" name="userName" id="" value="<%= sb.getStoreId()%>"></td>
            <td ><%= sb.getStoreName()%></td>
            
            <td><%= sb.getPhoneNumber()%></td>
            <td><%= sb.getAddress()%></td>
            <td><%= sb.getState()%></td>
            
          </tr>

		 <%   
            }	
           
		
       %>
        </form>
         <tr id="rowidNew">
          <form action="SaveStore" id="" method="get">
          <td>#</td>
          <td> <input type="text" class="form-control" name="storename" id="" aria-describedby="helpId" placeholder="Enter Store Name "></td>
          <td> <input type="text" class="form-control" name="phnumber" id="" aria-describedby="helpId" placeholder="Enter Phone Number"></td>
          <td> <input type="text" class="form-control" name="address" id="" aria-describedby="helpId" placeholder="Enter Address"></td>
          <td> <select name="state" id="state" class="form-control" ><option value="select" selected>Select State</option>
            <option value="Andhra Pradesh">Andhra Pradesh</option>
            <option value="Delhi">Delhi</option>
            <option value="Lakshadweep">Lakshadweep</option>
            <option value="Puducherry">Puducherry</option>
            <option value="Goa">Goa</option>
            <option value="Gujarat">Gujarat</option>
            <option value="Haryana">Haryana</option>
            <option value="Karnataka">Karnataka</option>
            <option value="Kerala">Kerala</option>
            <option value="Maharashtra">Maharashtra</option>
            <option value="Manipur">Manipur</option>
            <option value="Meghalaya">Meghalaya</option>
            <option value="Odisha">Odisha</option>
            <option value="Punjab">Punjab</option>
            <option value="Rajasthan">Rajasthan</option>
            <option value="Sikkim">Sikkim</option>
            <option value="Tamil Nadu">Tamil Nadu</option>
            <option value="Telangana">Telangana</option>
            <option value="Tripura">Tripura</option>
            <option value="Uttar Pradesh">Uttar Pradesh</option>
            <option value="West Bengal">West Bengal</option>
       </select></td>
   
              
                   <button class="btn btn-md btn-secondary" type="submit">Add Store</button>
                 
              
        </form>
          </tr>
        
        </tbody>
         
      </table>
      <!--  <!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal"  data-bs-target="#exampleModal"> -->
  <!--   Launch demo modal -->
 <!--  </button> --> -->
  </div>
  <!-- Modal -->
  <div class="modal-dialog modal-dialog-centered">

  <div class="modal fade"  id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Are You Sure to delete store?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-danger" id='deleteStr'>Delete</button>
        </div>
      </div>
    </div>
  </div>
  </div>
         
      
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="./resources/script/allstoresrc.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 
</body>
</html>