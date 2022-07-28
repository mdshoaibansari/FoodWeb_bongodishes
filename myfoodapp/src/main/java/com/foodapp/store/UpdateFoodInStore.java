package com.foodapp.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/UpdateFoodInStore")
public class UpdateFoodInStore extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String strId="";
		Cookie[] cookies = req.getCookies();
		if(cookies!=null)
			for (int i = 0; i < cookies.length; i++) {
			  if(cookies[i].getName().equals("managestoreid")){
				 strId=cookies[i].getValue();
				 
			  }
		}
    }
}
