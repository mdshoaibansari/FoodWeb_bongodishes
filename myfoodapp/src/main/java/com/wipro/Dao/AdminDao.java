package com.wipro.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wipro.bean.AdminBean;
import com.wipro.bean.UserBean;
import com.wipro.util.DButil;

public class AdminDao {
    public boolean checkAdmin(AdminBean aBean) throws ClassNotFoundException {
        boolean status=false;
        try {
            Connection conn=DButil.getConnection();
            String sql="select * from admindb where aid=? and pswd=?";
            PreparedStatement st=conn.prepareStatement(sql);
            st.setString(1, aBean.getUserName());
            st.setString(2, aBean.getPassword());
            ResultSet rs=st.executeQuery();
            if(rs.next())
                status=true;
            st.close();
            rs.close();
            conn.close();
        } catch (Exception e) {
         
            e.printStackTrace();
        }
        return status;
    }
        

    
    // public String AddPizzaStore(String adminName){
    //     String sql="insert into pizzaStore values(?,?,?,?,?)";
    //     try (Connection conn = DButil.getConnection();
    //     PreparedStatement st= conn.prepareStatement(sql);) {
            
    //     } catch (Exception e) {
    //         //TODO: handle exception
    //     }
        
    // }
    // public String ModifyPizzaStore(String adminName);
    // public String ViewPizzaStore(String adminName);
    // public String UpdatePizzaStore(String adminName);
    // public String ViewPizzaStore(String adminName);
    // public boolean setUser(UserBean ub) {
    //     boolean status=false;
    //     try {
    //         Connection conn=DButil.getConnection();
    //         String sql="insert into userdb values (?,?,?,?,?,?,?)";
    //         PreparedStatement st=conn.prepareStatement(sql);
    //         st.setString(1, ub.getUserName());
    //         st.setString(2, ub.getPassword());
    //         st.setString(3, ub.getDob());
    //         st.setString(4, ub.getGender());
    //         st.setString(5, ub.getState());
    //         st.setString(6, ub.getContact());
    //         st.setString(7, ub.getAddress()); 
    //         int rw=st.executeUpdate();
    //         if(rw>=1)
    //           status =true;
    //         st.close();
    //         conn.close();   
    //     } catch (Exception e) {
    //         // TODO Auto-generated catch block
    //         e.printStackTrace();
    //     }
    //     return status;
    // }

    // public boolean changePass(String name,String oldPass,String newPass) {
    //         boolean status=false;
    //         try {
    //             Connection conn=DButil.getConnection();
    //             String sql="update userdb set pswd = ?  where uid=? and pswd=?;";
    //             PreparedStatement st=conn.prepareStatement(sql);
    //             st.setString(1, newPass);
    //             st.setString(2, name);
    //             st.setString(3, oldPass);
    //             int row=st.executeUpdate();
    //             if(row>=1)
    //               status=true;
    //             st.close();
    //             conn.close();
    //         }
    //         catch(Exception e)
    //         {
    //             e.printStackTrace();
    //         }
    //         return status;
    // }
}
