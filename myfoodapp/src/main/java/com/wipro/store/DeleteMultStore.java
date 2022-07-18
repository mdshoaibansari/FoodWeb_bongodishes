package com.wipro.store;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wipro.Dao.StoreDao;

/**
 * Servlet implementation class DeleteMultStore
 */
@WebServlet("/DeleteMultStore")
public class DeleteMultStore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMultStore() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuilder userNames= new StringBuilder();
		for(String name: request.getParameterValues("userName")) {
			userNames.append("'").append(name).append("',");
		}
		userNames.deleteCharAt(userNames.length()-1);
		StoreDao sd=new StoreDao();
		System.out.println( sd.deleteStore(userNames));
		response.sendRedirect("AllStore.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
