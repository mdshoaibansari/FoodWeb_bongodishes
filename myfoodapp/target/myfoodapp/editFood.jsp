value page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wipro.bean.PizzaBean,com.wipro.Dao.PizzaDao,com.wipro.util.DButil,java.util.*,javax.servlet.http.Cookie" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/AddPizzaDetails.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Food Details</title>
</head>
<div class="contact" id="contact">
	<%
	
    Cookie[] c= request.getCookies();
    int v=0;
    boolean flag=true;
    if(c!=null){

        for(int i=0 ; i<c.length;i++){
            if(c[i].getName().equals("editFood")){
                v=Integer.parseInt(c[i].getValue());
               
                flag=false;
            } 
        }
    }

    if(flag){
    	out.println("Something Went Wrong");
    	
    }
   
       PizzaBean pb=new PizzaDao().getPizza(v);

   
	  
  
	
	%>
	 
    <div class="form-box"> 
            <div class="contact-inner-col">
                <h1>Food Details&nbsp;<i class="fas fa-pizza-slice"></i></h1>
                <form action="UpdateFood" id="" method="get">
                    <!-- <input type="text" name="name" id=" " placeholder="FoodID" required> -->
                    <select name="type" id="state" class="form-control">
                    <option value="<%= pb.getType()%>" selected><%= pb.getType()%></option>
                    <option value="nv">Non-veg</option>
                    <option value="v">Veg</option>
                    </select>
                    <input type="text" name="name"  value=" <%= pb.getFoodName()%> " required>
                    <input type="text" name="price"  value="<%= pb.getPrice() %>" required>
                    <div class="contact-inner-file">
                    <h2><input type="file" name="name" id=" " placeholder="Select the image" ></h2>         
                    </div>
                 
                    
                   <br>
                    <button class="btn" type="submit">Update Food Details</button>
                </form>
            </div>
        </div>
    </div>

</html>