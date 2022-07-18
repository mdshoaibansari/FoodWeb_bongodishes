package com.wipro.store;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wipro.Dao.FoodDao;
import com.wipro.Dao.StoreDao;
@WebServlet("/DeleteMultFoodInStore")
public class DeleteMultFoodInStore extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StringBuilder rid= new StringBuilder();
		for(String name: req.getParameterValues("relationid")) {
			rid.append("'").append(name).append("',");
		}
		rid.deleteCharAt(rid.length()-1);
		StoreDao sd=new StoreDao();
		sd.deleteFoodInStore(rid);
		String strid=req.getParameter("storeid");
        resp.sendRedirect("ManageStore.jsp?storeid="+strid);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        StringBuilder rid= new StringBuilder();
        System.out.println(req.getParameter("relationid"));
		for(String name: req.getParameterValues("relationid")) {
			rid.append("'").append(name).append("',");
		}
		rid.deleteCharAt(rid.length()-1);
		StoreDao sd=new StoreDao();
		sd.deleteFoodInStore(rid);
		resp.sendRedirect("ManageStore.jsp?storeid="+"");
    }

}