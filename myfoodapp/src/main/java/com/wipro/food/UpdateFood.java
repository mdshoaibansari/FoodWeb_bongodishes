package com.wipro.food;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wipro.Dao.FoodDao;
import com.wipro.Dao.PizzaDao;
import com.wipro.bean.PizzaBean;

/**
 * Servlet implementation class UpdateFood
 */
@WebServlet("/UpdateFood")
public class UpdateFood extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFood() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
        PrintWriter out=response.getWriter();
    	
        int foodid=Integer.parseInt(request.getParameter("userName"));
		String Type=request.getParameter("type"); 
		String FoodName=request.getParameter("name"); 
		String Price=request.getParameter("price"); 
		//File to be chosen
		
		PizzaBean pb = new PizzaBean();
		pb.setFoodId(foodid);
        pb.setType(Type);
        pb.setFoodName(FoodName);
        pb.setPrice(Price);
        
        try{
            FoodDao dao=new FoodDao();
            if (dao.UpdateFood(pb)) {
            	request.setAttribute("message","Food Update Successfully");
                response.sendRedirect("AllFood.jsp");
            } else {

                request.setAttribute("message", "something went wronging");
                request.getRequestDispatcher("adminhome.jsp").forward(request, response);
            }
           }
        catch(Exception e){
                 e.printStackTrace();
        }
        
        
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
