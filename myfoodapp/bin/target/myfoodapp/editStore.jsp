<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wipro.bean.StoreBean,com.wipro.Dao.PizzaDao,com.wipro.util.DButil,java.util.*,javax.servlet.http.Cookie" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/AddPizzaDetails.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Store Details</title>
</head>
<body>

	<%
	
    Cookie[] c= request.getCookies();
    int v=0;
    boolean flag=true;
    if(c!=null){

        for(int i=0 ; i<c.length;i++){
            if(c[i].getName().equals("editStore")){
                v=Integer.parseInt(c[i].getValue());
               
                flag=false;
            } 
        }
    }

    if(flag){
    	out.println("Something Went Wrong");
    	
    }
   
       StoreBean sb=new PizzaDao().getStore(v);

   
	  
  
	
	%>
	 
   <div class="contact" id="contact">
    <div class="form-box"> 
            <div class="contact-inner-col">
                <h1>Store Details<i class="fas fa-store"></i></h1>
                <form action="SaveStore" id="" method="get">
                    <!-- <input type="text" name="nam" id=" " placeholder="StoreID" required> -->
                    <input type="text" name="storename" id=" " value="<%= sb.getStoreName() %>" required>
                    <input type="text" name="phnumber" id=" " pattern="[0-9]{10}" value="<%= sb.getPhoneNumber() %>" required>
                   <textarea  name="address" id="" value="<%= sb.getAddress() %>" cols="10" rows="6" required></textarea>
                    <select name="state" id="state" class="form-control" ><option value="<%= sb.getState()%>" selected><%= sb.getState()%></option>
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
                   </select>
                    
                       
                     </select>   
                   <br>
                     
                    <button class="btn" type="submit">Update Store Details</button>
                </form>
            </div>
        </div>
    </div>
 </body>   
</html>