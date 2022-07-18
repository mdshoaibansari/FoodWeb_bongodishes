package com.wipro.Dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



import com.wipro.bean.PizzaBean;
import com.wipro.bean.StoreBean;
import com.wipro.util.DButil;

public class FoodDao {
	public int deleteStore(StringBuilder val) {
        int rw=0;
		try {
			Connection conn=DButil.getConnection();
			String sql="DELETE FROM food_db WHERE foodid in("+val+")";
			System.out.println(sql);
			PreparedStatement st=conn.prepareStatement(sql);
		    rw  = st.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rw;
	}

	public boolean UpdateFood(PizzaBean pb) {
		boolean status=false;
		try {
			Connection conn=DButil.getConnection();
			String sql="UPDATE food_db SET foodname=? , price=? , type=? where foodid=?";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setString(1, pb.getFoodName());
			st.setString(2, pb.getPrice());
			st.setString(3, pb.getType());
			st.setInt(4, pb.getFoodId());
			int rw=st.executeUpdate();
			if(rw>=1)
				status =true;
			st.close();
			conn.close();  

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	public String getFoodName(int foodid) {
		String foodName=null;
		try {

		Connection conn=DButil.getConnection();
		String sql="select foodname from food_db where foodid=?";
		PreparedStatement st=conn.prepareStatement(sql);
		st.setInt(1, foodid);
		ResultSet rs = st.executeQuery();
		while(rs.next()){
			foodName= rs.getString(1);
		}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return foodName;
	}
	
}
