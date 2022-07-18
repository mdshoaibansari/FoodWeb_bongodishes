package com.wipro.food;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wipro.Dao.PizzaDao;
@WebServlet("/deletestore")
public class DeleteStore extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		String val= (String) req.getParameter("data1");
		boolean status=new PizzaDao().deleteStore(val);
		System.out.println(val);
		resp.getWriter().write(String.valueOf(status));
	}

}
