package com.wipro.store;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.wipro.Dao.StoreDao;
import com.wipro.bean.RelStoreFoodBean;

/**
 * Servlet implementation class AddNewFoodInStore
 */
@WebServlet("/AddNewFoodInStore")
@MultipartConfig
public class AddNewFoodInStore extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNewFoodInStore() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try{
		String resp = "";
		response.setContentType("text/plain"); // Set content type of the response so that jQuery knows what it can
												// expect.
		response.setCharacterEncoding("UTF-8");
		int storeid=Integer.parseInt(request.getParameter("storeid"));
		
		int foodid = Integer.parseInt(request.getParameter("foodid"));
		int price = Integer.parseInt(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		/*
		 * // Part part=request.getPart("imagefile");
		 * 
		 */
		Part imagePart = request.getPart("imageFile");
		String fileName = imagePart.getSubmittedFileName();		
		String filePath = "C:\\Users\\shoai\\Documents\\apache-tomcat-9.0.62\\webapps\\ROOT\\uploadImg";
		String path="http://localhost:8080/uploadImg/"+fileName;
		// filePath="G:\\UploadedImage";
		System.out.println(filePath + File.separatorChar + fileName);
		
		long imgSize = imagePart.getSize();
		// if size is greter than 1 MB
		if (imgSize > (1024 * 1024))
			resp = "Size is greater than 1 MB";
		else {
			for (Part part : request.getParts()) {
				part.write(filePath + File.separatorChar + fileName);
			}
			
			// for(Part part : request.getParts()){
			// 	part.write(filePath + File.separatorChar + fileName);
			// }
			RelStoreFoodBean rsfb =new RelStoreFoodBean();
			rsfb.setStoreid(storeid);
			rsfb.setFoodid(foodid);
			rsfb.setPrice(price);
			rsfb.setQuantity(quantity);
			rsfb.setPath(path);
			StoreDao sd =new StoreDao();
			System.out.println(sd.addFood(rsfb));
			resp = "File uploaded successfully";
		}
		
		response.getWriter().write(resp);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
// filePath="resources\\images\\uploadedimages\\";
// request.getServletContext().getRealPath("uploadedimages");
// System.out.println(request.getRealPath("uploadimages"));
