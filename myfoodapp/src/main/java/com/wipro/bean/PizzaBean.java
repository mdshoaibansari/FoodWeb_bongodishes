package com.wipro.bean;

public class PizzaBean {
   
    private int FoodId; 
    private String Type; 
    private String FoodName; 
    private String Price; 
    private String imagePath;
    public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public PizzaBean() {
    }

	public int getFoodId() {
		return FoodId;
	}
	
	
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getFoodName() {
		return FoodName;
	}
	public void setFoodName(String foodName) {
		FoodName = foodName;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}

	public void setFoodId(int int1) {
		// TODO Auto-generated method stub
		FoodId=int1;
		
	}
	
	
    
    
}