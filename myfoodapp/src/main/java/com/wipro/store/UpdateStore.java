package com.wipro.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wipro.Dao.PizzaDao;
import com.wipro.bean.StoreBean;
@WebServlet("/UpdateStore")
public class UpdateStore extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strId="";
		Cookie[] cookies = req.getCookies();
		if(cookies!=null)
			for (int i = 0; i < cookies.length; i++) {
			  if(cookies[i].getName().equals("UpdateStrId")){
				 strId=cookies[i].getValue();
				 
			  }
		}
		String storeName=req.getParameter("storename"); 
		String phoneNumber=req.getParameter("phnumber"); 
		String address=req.getParameter("address"); 
		String state=req.getParameter("state"); 
		// int foodId=Integer.parseInt(req.getParameter("foodid"));
		StoreBean sb = new StoreBean();
        sb.setStoreId(Integer.parseInt( strId));
		sb.setStoreName(storeName);
		sb.setPhoneNumber(phoneNumber);
		sb.setState(state);
		sb.setAddress(address);
		// sb.setFoodId(foodId);
        System.out.println(storeName);
        System.out.println(phoneNumber);
        System.out.println(address);
        System.out.println(state);
        System.out.println(strId);
        
        
        try{
            PizzaDao dao=new PizzaDao();
            if (dao.UpdatePizzaStore(sb)) {
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
		Cookie cookie = new Cookie("UpdateStrId", "");
        cookie.setMaxAge(0);
        resp.addCookie(cookie);
	}

}
