package com.wipro.loginServlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import com.wipro.Dao.AdminDao;
import com.wipro.Dao.UserDao;
import com.wipro.bean.AdminBean;
import com.wipro.bean.UserBean;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.setContentType("text/html");
       PrintWriter out=resp.getWriter();
       String usernm=req.getParameter("inputUserId");
       String password=req.getParameter("inputPassword");
       String usertype=req.getParameter("UserType");
       
       if(usertype.equals("User")){
       UserBean uBean=new UserBean();
       uBean.setUserName(usernm);
       uBean.setPassword(password);
       try{
        UserDao dao=new UserDao();
        boolean status=dao.checkUser(uBean);
        if(status){
           
            HttpSession session=req.getSession();
            session.setAttribute("name", usernm);
            resp.sendRedirect("NewUserHome.jsp");
            // req.getRequestDispatcher("NewUserHome.jsp").forward(req, resp);
        }
        else{
            req.setAttribute("Error", "Invalid Credential");
            // out.println("<h3></h3>");
            // req.getAttribute("Error");
            req.getRequestDispatcher("inin.jsp").forward(req, resp);
        }
       }
       catch(Exception e){
           e.printStackTrace();
       }
       out.close();
    }
    else{
        AdminBean aBean=new AdminBean();
        aBean.setUserName(usernm);
        aBean.setPassword(password);
        try {
            AdminDao dao=new AdminDao();
            boolean status=dao.checkAdmin(aBean);
            if(status){
                HttpSession session=req.getSession();
                session.setAttribute("name", usernm);
               
                  resp.sendRedirect("adminhome.jsp");
//                 req.getRequestDispatcher("adminhome.jsp").forward(req, resp);
            }
            else{
                req.setAttribute("Error", "Invalid Credential");
                req.getRequestDispatcher("inin.jsp").forward(req, resp);
            }
        } catch (Exception e) {
           e.printStackTrace();
        }
    }
    }
   

}
