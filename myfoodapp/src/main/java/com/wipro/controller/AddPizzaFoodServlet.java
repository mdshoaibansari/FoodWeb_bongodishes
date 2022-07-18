package com.wipro.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipro.Dao.AdminDao;
import com.wipro.Dao.UserDao;
import com.wipro.Dao.PizzaDao;
import com.wipro.bean.PizzaBean;
@WebServlet("/SaveFood")
public class AddPizzaFoodServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
    	
		String Type=req.getParameter("type"); 
		String FoodName=req.getParameter("name"); 
		String Price=req.getParameter("price"); 
		//File to be chosen
		
		PizzaBean pb = new PizzaBean();
        pb.setType(Type);
        pb.setFoodName(FoodName);
        pb.setPrice(Price);
        
        
        try{
            PizzaDao dao=new PizzaDao();
            if (dao.addPizzaFood(pb)) {
            	resp.sendRedirect("AllFood.jsp");
            } else {

                req.setAttribute("error", "something went wronging");
                req.getRequestDispatcher("adminhome.jsp").forward(req, resp);
            }
           }
        catch(Exception e){
                 e.printStackTrace();
             }
        
    	// String StoreId=req.getParameter("StoreId");
        // // ......Your..Code...
        // PizzaSotre ps=new PizzaStore();
        // ps.setStoreId(StoreId);
        // // ....Your..code
        // try{
        //     AdminDao dao=new AdminDao();
        //     String message=dao.AddPizzaStore();
        //     if(message.equals("Success")){
        //     //  ..Your code
        //     }
        //     else if(message.equals("InvStrId")){
        //         // ..
        //     }
        //     else{
        //         // failed
        //     }
        // }
        // catch(Exception e){
        //     e.printStackTrace();
        // }

    }
}
