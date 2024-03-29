package com.foodapp.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapp.Dao.FoodDao;

/**
 * Servlet implementation class DeleteMultFood
 */
@WebServlet("/DeleteMultFood")
public class DeleteMultFood extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMultFood() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		StringBuilder userNames= new StringBuilder();
		for(String name: request.getParameterValues("userName")) {
			userNames.append("'").append(name).append("',");
		}
		userNames.deleteCharAt(userNames.length()-1);
		FoodDao fd=new FoodDao();
		fd.deletemultfood(userNames);
		response.sendRedirect("AllFood.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
