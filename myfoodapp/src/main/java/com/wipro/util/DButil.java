package com.wipro.util;
import java.sql.*;
import java.util.*;
public class DButil {
    
    public static Connection getConnection() throws Exception {
        // String url = "jdbc:mysql://localhost:3306/prp";
        String url = "jdbc:mysql://localhost:3306/hr";
        String user = "root";
        // String password = "Arha@721212";
        String password = "Shoaib@933";
        Connection con = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);
        return con;
    }
}
