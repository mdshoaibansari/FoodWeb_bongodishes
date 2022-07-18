package com.wipro.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

import com.wipro.bean.AdminBean;
import com.wipro.bean.UserBean;
import com.wipro.util.DButil;

public class UserDao {
    public boolean checkUser(UserBean userbean) throws ClassNotFoundException {
        boolean status = false;
        String sql = "select pswd from userdb where uid=?";
        try {
            Connection conn = DButil.getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, userbean.getUserName());
          
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                Key key = generateKey();
               String val=decrypt( rs.getString(1),key);
               if(val.equals(userbean.getPassword()))
                status=true;
            }
               
            st.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;

    }

    public boolean setUser(UserBean ub) {
        boolean status=false;
        try {
            Connection conn=DButil.getConnection();
            String sql="INSERT INTO  userdb VALUES (?,?,?,?)";
            PreparedStatement st=conn.prepareStatement(sql);
            st.setString(1, ub.getUserName());
            st.setString(2, ub.getPassword());
            st.setString(3, ub.getEmail());
            st.setString(4, ub.getPhnumber());
            int rw=st.executeUpdate();
            if(rw>=1)
              status =true;
            st.close();
            conn.close();   
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return status;
    }

    public boolean changePass(String name,String oldPass,String newPass) {
            boolean status=false;
            try {
                Connection conn=DButil.getConnection();
                String sql="update userdb set pswd = ?  where uid=? and pswd=?;";
                PreparedStatement st=conn.prepareStatement(sql);
                st.setString(1, newPass);
                st.setString(2, name);
                st.setString(3, oldPass);
                int row=st.executeUpdate();
                if(row>=1)
                  status=true;
                st.close();
                conn.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            return status;
    }
    private static final byte[] keyValue = "1234567891234567".getBytes();
    private static Key generateKey() throws Exception {
        return new SecretKeySpec(keyValue, "AES");

    }


    public static String decrypt(String encryptedValue, Key key) throws Exception {
        // Key key = generateKey();
         Cipher cipher = Cipher.getInstance("AES");
         cipher.init(Cipher.DECRYPT_MODE, key);
          
         byte[] decodedBytes = new Base64().decode(encryptedValue.getBytes());
  
         byte[] enctVal = cipher.doFinal(decodedBytes);
         
         System.out.println("Decrypted Value :: " + new String(enctVal));
         return new String(enctVal);
     }
   
}
