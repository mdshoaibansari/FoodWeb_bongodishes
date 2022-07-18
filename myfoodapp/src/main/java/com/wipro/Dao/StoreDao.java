package com.wipro.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wipro.bean.FoodBean;
import com.wipro.bean.PizzaBean;
import com.wipro.bean.RelStoreFoodBean;
import com.wipro.bean.StoreBean;
import com.wipro.util.DButil;

public class StoreDao {
	public int deleteStore(StringBuilder val) {
        int rw=0;
		try {
			Connection conn=DButil.getConnection();
			String sql="DELETE FROM storedb WHERE storeid in("+val+")";
			System.out.println(sql);
			PreparedStatement st=conn.prepareStatement(sql);
		    rw  = st.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rw;
	}
	public ArrayList<RelStoreFoodBean> getAllRelations(){
		ArrayList<RelStoreFoodBean> list=new ArrayList<RelStoreFoodBean>();
		try {
			Connection conn=DButil.getConnection();
			String sql="select * from relationstorefood";
			PreparedStatement st=conn.prepareStatement(sql);
            ResultSet rs   = st.executeQuery();
            while(rs.next()) {
            	RelStoreFoodBean rsf=new RelStoreFoodBean();
            	rsf.setRelationId(rs.getInt(1));
            	rsf.setStoreid(rs.getInt(2));
            	rsf.setFoodid(rs.getInt(3));
            	rsf.setPrice(rs.getInt(4));
            	rsf.setPath(rs.getString(6));
            	rsf.setQuantity(rs.getInt(5));
            	list.add(rsf);
            }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	public ArrayList<RelStoreFoodBean> getAllFood(int storeid){
		ArrayList<RelStoreFoodBean> list=new ArrayList<RelStoreFoodBean>();
		try {
			Connection conn=DButil.getConnection();
			String sql="select * from relationstorefood where storeid2=?";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setInt(1, storeid);
            ResultSet rs   = st.executeQuery();
            while(rs.next()) {
            	RelStoreFoodBean rsf=new RelStoreFoodBean();
            	rsf.setRelationId(rs.getInt(1));
            	rsf.setStoreid(rs.getInt(2));
            	rsf.setFoodid(rs.getInt(3));
            	rsf.setPrice(rs.getInt(4));
            	rsf.setPath(rs.getString(6));
            	rsf.setQuantity(rs.getInt(5));
            	list.add(rsf);
            }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	public String getStoreName(int storeid) {
		String storeName=null;
		try {
			
			Connection conn=DButil.getConnection();
			String sql="select storename from storedb where storeid=?";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setInt(1, storeid);
		    ResultSet rs   = st.executeQuery();
			while(rs.next()){
				
			storeName= rs.getString(1);	
				
	    
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return storeName;
	}
	public String addFood(RelStoreFoodBean rsfb) {
		String message="something went worng ..";
		try {
			
			Connection conn=DButil.getConnection();
			String sql="INSERT INTO relationstorefood (`storeid2`, `foodid2`, `price`,`quantity`, `path`) VALUES (?,?, ?,?,?);";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setInt(1, rsfb.getStoreid());
			st.setInt(2, rsfb.getFoodid());
			st.setInt(3, rsfb.getPrice());
			st.setInt(4, rsfb.getQuantity());
			st.setString(5, rsfb.getPath());
			int row=st.executeUpdate();
		    if(row>=1)
			  message="food added successfully";
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
    public int deleteFoodInStore(StringBuilder rfs) {
		int rw=0;
		try {
			Connection conn=DButil.getConnection();
			String sql="DELETE FROM relationstorefood WHERE relationid in("+rfs+")";
			System.out.println(sql);
			PreparedStatement st=conn.prepareStatement(sql);
		    rw  = st.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rw;
    }
	public FoodBean getFoodbyfdid(int foodid){
		FoodBean fb=new FoodBean();
		try {
			
			Connection conn=DButil.getConnection();
			String sql="select * from food_db where foodid=?";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setInt(1, foodid);
			ResultSet rs=st.executeQuery();
			if(rs.next()){
				fb.setFoodId(rs.getInt(1));
				fb.setFoodName(rs.getString(2));
				fb.setPrice(rs.getString(3));
				fb.setType(rs.getString(4));
				fb.setImagePath(rs.getString(5));
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return fb;
	}
	public String getFoodName(int foodid){
	   String foodname=null;
		try {
			
			Connection conn=DButil.getConnection();
			String sql="select foodname from food_db where foodid=?";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setInt(1, foodid);
			ResultSet rs=st.executeQuery();
			if(rs.next()){
				foodname=rs.getString(1);
				
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return foodname;
	}
	
}
