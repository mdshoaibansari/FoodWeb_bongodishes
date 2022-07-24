package com.wipro.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wipro.Dao.StoreDao;
@WebServlet("/isAvailable")
public class isAvailable extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain"); 
        resp.setCharacterEncoding("UTF-8");
        String relationId=req.getParameter("rid");
        
        StoreDao sd=new StoreDao();
        String message="1";
        int quantity1=sd.getQauntity(relationId);
        Cookie[] c= req.getCookies();
        // String num="";
        int quantity2=-1;
        // boolean flag=true;
        if(c!=null){
    
            for(int i=0 ; i<c.length;i++){
                if(c[i].getName().equals(relationId)){
                     quantity2=Integer.parseInt(c[i].getValue());
                   
                } 
            }
        }
        // System.out.println("\n"+quantity1+"\n"+quantity2);
        if(quantity1<quantity2){
            message="-1";
        }
        
       
       resp.getWriter().write(message);
    }
}
