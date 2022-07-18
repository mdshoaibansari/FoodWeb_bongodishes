package com.wipro.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/cartserlvet")
public class cartservlet extends HttpServlet {
   


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");  // Set content type of the response so that jQuery knows what it can expect.
        String id =req.getParameter("cid");
        Cookie[] c= req.getCookies();
        String num="";
        boolean flag=true;
        if(c!=null){
    
            for(int i=0 ; i<c.length;i++){
                if(c[i].getName().equals(id)){
                    int v=Integer.parseInt(c[i].getValue());
                    v=v+1;
                    num=Integer.toString(v);
                    flag=false;
                } 
            }
        }
    
        if(flag){
            num="1";
        }
        Cookie c1=new Cookie(id,num );
        resp.addCookie(c1);
        
        
        resp.getWriter().write(num);
    }
}
