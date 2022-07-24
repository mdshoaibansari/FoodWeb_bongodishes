package com.wipro.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/isSignIn")
public class isSignIn extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain"); 
        resp.setCharacterEncoding("UTF-8");
        HttpSession session=req.getSession();
        String message="1";
        String userName=(String)session.getAttribute("name");
        if(userName==null){
           message="-1";
       }
       resp.getWriter().write(message);
    }
}
