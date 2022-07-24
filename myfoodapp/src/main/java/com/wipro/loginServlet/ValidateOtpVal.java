package com.wipro.loginServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipro.Dao.UserDao;
import com.wipro.bean.UserBean;

/**
 * Servlet implementation class ValidateOtp
 */
@WebServlet("/ValidateOtpVal")
public class ValidateOtpVal extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int value = Integer.parseInt(request.getParameter("otp"));
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");
        RequestDispatcher dispatcher = null;
        if (value == otp) {
            UserBean ub=(UserBean) session.getAttribute("userDetails");
            request.setAttribute("status", "success");
            session.setAttribute("name", ub.getEmail());
            UserDao dao = new UserDao();
            if (dao.setUser(ub)) { 
                request.getRequestDispatcher("NewUserHome.jsp").forward(request, response);    
            } else {

                request.setAttribute("error", "something went wronging");
                request.getRequestDispatcher("inin.jsp").forward(request, response);
            }
            
            return ;

        } else {
            request.setAttribute("message", "wrong otp");
            dispatcher = request.getRequestDispatcher("EnterOtpVal.jsp");
            dispatcher.forward(request, response);

        }

    }

}
