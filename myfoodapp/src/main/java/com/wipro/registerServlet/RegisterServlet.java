package com.wipro.registerServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

import com.wipro.Dao.UserDao;
import com.wipro.bean.UserBean;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

   

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
       
        String username = req.getParameter("username");
        String passwd = req.getParameter("pass");
        String email = req.getParameter("email");
        String phnumber = req.getParameter("phnumber");
        // out.println("Working...");
        // out.println("<h1>"+username+" "+passwd+" "+email+" "+phnumber+"</h1>");
        try {
            UserBean ub = new UserBean();

            ub.setUserName(username);
            Key key = generateKey();
            ub.setPassword(encrypt(passwd, key));
            ub.setEmail(email);
            ub.setPhnumber(phnumber);

            UserDao dao = new UserDao();
            if (dao.setUser(ub)) {

                req.getRequestDispatcher("index.jsp").forward(req, resp);
            } else {

                req.setAttribute("error", "something went wronging");
                req.getRequestDispatcher("inin.jsp").forward(req, resp);
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
        out.close();
    }
    private static final byte[] keyValue = "1234567891234567".getBytes();
    private static Key generateKey() throws Exception {
        return new SecretKeySpec(keyValue, "AES");

    }

    public static String encrypt(String valueToEnc, Key key) throws Exception {

        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, key);

        byte[] encValue = cipher.doFinal(valueToEnc.getBytes());
        byte[] encryptedByteValue = new Base64().encode(encValue);
        System.out.println("Encrypted Value :: " + new String(encryptedByteValue));

        return new String(encryptedByteValue);
    }
}