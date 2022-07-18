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
import com.wipro.bean.StoreBean;
@WebServlet("/SaveStore")
public class AddPizzaServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
   
		String storeName=req.getParameter("storename"); 
		String phoneNumber=req.getParameter("phnumber"); 
		String address=req.getParameter("address"); 
		String state=req.getParameter("state"); 
		// int foodId=Integer.parseInt(req.getParameter("foodid"));
		StoreBean sb = new StoreBean();
        
		sb.setStoreName(storeName);
		sb.setPhoneNumber(phoneNumber);
		sb.setState(state);
		sb.setAddress(address);
		// sb.setFoodId(foodId);
        
        try{
            PizzaDao dao=new PizzaDao();
            if (dao.addPizzaStore(sb)) {
            	req.setAttribute("message","Store Added Successfully");
             
                resp.sendRedirect("AllStore.jsp");
            } else {

                req.setAttribute("message", "something went wronging");
                req.getRequestDispatcher("adminhome.jsp").forward(req, resp);
            }
           }
        catch(Exception e){
                 e.printStackTrace();
        }
        
    }
}
