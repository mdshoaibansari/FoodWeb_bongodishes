package com.wipro.loginServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/someservlet")
public class someservlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String text = "some text";
    String i=(String)    req.getParameter("cid");
    resp.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
    resp.setCharacterEncoding("UTF-8"); // You want world domination, huh?
    
    resp.getWriter().write(i+10);       // Write response body.
    }
}
