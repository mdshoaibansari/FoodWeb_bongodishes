package com.wipro.changeServlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wipro.Dao.UserDao;
import com.wipro.bean.UserBean;

public class ChangePass extends HttpServlet{

    // @Override
    // protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //     resp.setContentType("text/html");
    //     PrintWriter out=resp.getWriter();
    //     String newPass=req.getParameter("inputPassword");
    //     UserBean uB=(UserBean) req.getAttribute("UserBean");
        
    //     UserDao dao=new UserDao();
    //     dao.changePass(uB,newPass);
        
    // }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
       
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
      
     
        String name=req.getParameter("inputUserName");
        String oldPass=req.getParameter("inputOldPassword");
        String newPass=req.getParameter("inputPassword");
        // out.println("<h2>"+uB.getUserName()+"</h2>");
        UserDao dao=new UserDao();
        if(dao.changePass(name,oldPass,newPass))
         {
            out.println("<h2>Paasword Change Successfully</h2>");
            Cookie c=new Cookie("UserName", name);
            resp.addCookie( c);
            req.getRequestDispatcher("welcome.jsp").include(req, resp);
        }
        else{
            out.println("<h2>Invalid Credential</h2>");
            req.getRequestDispatcher("welcome.jsp").include(req, resp);
        }
    }
    
}
