package com.foodapp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.Dao.UserDao;
import com.foodapp.bean.UserBean;

public class ResetPassword extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newPass= req.getParameter("password");
        UserDao ud=new UserDao();
        HttpSession session=req.getSession();
		String uid= (String)session.getAttribute("name");
        ud.changePass(uid, newPass);
    }
}
