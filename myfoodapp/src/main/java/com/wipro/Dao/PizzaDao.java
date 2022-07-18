package com.wipro.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



import com.wipro.bean.PizzaBean;
import com.wipro.bean.StoreBean;
import com.wipro.util.DButil;

public class PizzaDao {
	public boolean addPizzaStore(StoreBean sb) {
        boolean status=false;
        try {
            Connection conn=DButil.getConnection();
            String sql="INSERT INTO storedb (`storename`, `phnumber`, `address`, `state`) VALUES (?, ?,?,?);";
            PreparedStatement st=conn.prepareStatement(sql);
             st.setString(1,sb.getStoreName());
             st.setString(2, sb.getPhoneNumber());
             st.setString(3, sb.getAddress());
             st.setString(4, sb.getState());
             
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
	public boolean addPizzaFood(PizzaBean pb) {
	    boolean status=false;
	    try {
	        Connection conn=DButil.getConnection();
	        String sql="INSERT INTO food_db (`foodName`, `price`,`type`) VALUES (?, ?,?);";
	        PreparedStatement st=conn.prepareStatement(sql);
	        
	        st.setString(1, pb.getFoodName());
	        st.setString(2, pb.getPrice());
	        st.setString(3, pb.getType());
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
	public ArrayList<PizzaBean> getAllFood(){
		ArrayList<PizzaBean> list=new ArrayList<PizzaBean>();
		try {
			
			Connection conn=DButil.getConnection();
			String sql="select * from food_db";
			PreparedStatement st=conn.prepareStatement(sql);
		    ResultSet rs   = st.executeQuery();
			while(rs.next()){
				PizzaBean pb=new PizzaBean();
				pb.setFoodId(rs.getInt(1));
				pb.setFoodName(rs.getString(2));
				pb.setPrice(rs.getString(3));
				pb.setType(rs.getString(4));
				pb.setImagePath(rs.getString(5));
				list.add(pb);
	    
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	public ArrayList<StoreBean> getAllStore(){
		ArrayList<StoreBean> list=new ArrayList<StoreBean>();
		try {
			
			Connection conn=DButil.getConnection();
			String sql="select * from storedb";
			PreparedStatement st=conn.prepareStatement(sql);
		    ResultSet rs   = st.executeQuery();
			while(rs.next()){
				StoreBean sb=new StoreBean();
				sb.setStoreId(rs.getInt(1));
				sb.setStoreName(rs.getString(2));
				sb.setPhoneNumber(rs.getString(3));
				sb.setAddress(rs.getString(4));
				sb.setState(rs.getString(5));
			    sb.setFoodId(rs.getInt(6));
				list.add(sb);
	    
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	public PizzaBean getPizza(int foodid){
		PizzaBean pb=new PizzaBean();
		try {
			
			Connection conn=DButil.getConnection();
			String sql="select * from food_db where foodid=?";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setInt(1, foodid);
			ResultSet rs=st.executeQuery();
			if(rs.next()){
				pb.setFoodId(rs.getInt(1));
				pb.setFoodName(rs.getString(2));
				pb.setPrice(rs.getString(3));
				pb.setType(rs.getString(4));
				pb.setImagePath(rs.getString(5));
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return pb;
	}
	public boolean deleteStore(String val) {
         try {
			Connection conn=DButil.getConnection();
			String sql="DELETE FROM storedb WHERE storeid=?;";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setInt(1, Integer.parseInt(val));
		    int rw  = st.executeUpdate();
			if(rw==1)
				return true;
	    
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	public boolean deleteFood(String val) {
		try {
			Connection conn=DButil.getConnection();
			String sql="DELETE FROM food_db WHERE foodid=?;";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setInt(1, Integer.parseInt(val));
		    int rw  = st.executeUpdate();
			if(rw==1)
				return true;
	    
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	public StoreBean getStore(int val) {
		StoreBean sb=new StoreBean();
		try {
			
			Connection conn=DButil.getConnection();
			String sql="select * from storedb where storeid=?";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setInt(1, val);
			ResultSet rs=st.executeQuery();
			if(rs.next()){
				
				sb.setStoreId(rs.getInt(1));
				sb.setStoreName(rs.getString(2));
				sb.setPhoneNumber(rs.getString(3));
				sb.setAddress(rs.getString(4));
				sb.setState(rs.getString(5));
				
			}

		} catch (Exception e) {
		
			e.printStackTrace();
		}
		return sb;
	}
	public boolean UpdatePizzaStore(StoreBean sb) {
		boolean status=false;
        try {
            Connection conn=DButil.getConnection();
            String sql="UPDATE storedb SET storename=? , phnumber=?, address=?, state=? where storeid=?;";
            PreparedStatement st=conn.prepareStatement(sql);
             st.setString(1,sb.getStoreName());
             st.setString(2, sb.getPhoneNumber());
             st.setString(3, sb.getAddress());
             st.setString(4, sb.getState());
             st.setInt(5, sb.getStoreId());
             
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
