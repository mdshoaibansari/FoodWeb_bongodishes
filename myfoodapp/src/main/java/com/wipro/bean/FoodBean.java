package com.wipro.bean;

public class FoodBean {

	   private int FoodId; 
	    private String Type; 
	    private String FoodName; 
	    private String Price; 
	    private String imagePath;
	    private String Ingredients;
	    public String getImagePath() {
			return imagePath;
		}

		public String getIngredients() {
			return Ingredients;
		}

		public void setIngredients(String ingredients) {
			Ingredients = ingredients;
		}

		public void setImagePath(String imagePath) {
			this.imagePath = imagePath;
		}

		public FoodBean() {
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
