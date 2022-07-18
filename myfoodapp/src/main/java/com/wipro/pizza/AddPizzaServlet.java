package com.wipro.pizza;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wipro.Dao.AdminDao;
@WebServlet("/AddPizzaServlet")
public class AddPizzaServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // String StoreId=req.getParameter("StoreId");
        // // ......Your..Code...
        // PizzaSotre ps=new PizzaStore();
        // ps.setStoreId(StoreId);
        // // ....Your..code
        // try{
        //     AdminDao dao=new AdminDao();
        //     String message=dao.AddPizzaStore();
        //     if(message.equals("Success")){
        //     //  ..Your code
        //     }
        //     else if(message.equals("InvStrId")){
        //         // ..
        //     }
        //     else{
        //         // failed
        //     }
        // }
        // catch(Exception e){
        //     e.printStackTrace();
        // }

    }
}
