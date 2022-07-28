package com.foodapp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.Dao.PaymentDao;
import com.foodapp.bean.PaymentBean;

@WebServlet("/Payment")
public class Payment extends HttpServlet {
   

protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    resp.setContentType("text/html");
    PrintWriter out = resp.getWriter();
    String cardnumber=req.getParameter("number");
    String name = req.getParameter("name");
   
    String month = req.getParameter("month");
    String year = req.getParameter("year");
    String cvv=req.getParameter("cvv");
    // out.println("Working...");
    // out.println("<h1>"+username+"   "+passwd+"  "+email+"   "+phnumber+"</h1>");
    PaymentBean pb=new PaymentBean();
    pb.setCardnumber(cardnumber);
    pb.setName(name);
    pb.setMonth(month);
    pb.setYear(year);
    pb.setCvv(cvv);
   
    

    try {
        PaymentDao dao = new PaymentDao();
        if (dao.doPayment(pb)) {
            req.getRequestDispatcher("FinalPayment.jsp").forward(req, resp);
    
            
        } else {

            req.setAttribute("error", "something went wronging");
            req.getRequestDispatcher("NewUserHome.jsp").forward(req, resp);
        }
    } catch (Exception e) {

        e.printStackTrace();
    }
    out.close();
}
}