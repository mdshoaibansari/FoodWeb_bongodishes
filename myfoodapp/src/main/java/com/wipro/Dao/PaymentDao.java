package com.wipro.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wipro.bean.UserBean;
import com.wipro.util.DButil;
import com.wipro.bean.PaymentBean;

public class PaymentDao {
	public boolean doPayment(PaymentBean pb) {
        boolean status=false;
        try {
            Connection conn=DButil.getConnection();
            String sql="INSERT INTO  paymentDb VALUES (?,?,?,?,?)";
            PreparedStatement st=conn.prepareStatement(sql);
            st.setString(1,pb.getCardnumber() );
            st.setString(2,pb.getName() );
            st.setString(3,pb.getMonth() );
            st.setString(4,pb.getYear() );
            st.setString(5,pb.getCvv());
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
}
