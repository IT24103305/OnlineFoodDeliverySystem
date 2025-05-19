package model;

public class FoodItem {
    private String foodId;
    private String name;
    private String description;
    private String category;
    private double price;

    public FoodItem(String foodId, String name,String discription, String category, double price) {
        this.foodId = foodId;
        this.name = name;
        this.description = description;
        this.category = category;
        this.price = price;
    }

    public String getFoodId() {
        return foodId;
    }

    public String getName() {
        return name;
    }
    public String getDescription() { return description;}
    public String getCategory() {
        return category;
    }

    public double getPrice() {
        return price;
    }

// You can add setters if needed


    public void setFoodId(String foodId) { this.foodId = foodId; }
    public void setName(String name) { this.name = name; }
    public void setDescription(String description) { this.description = description;}
    public void setCategory(String category) { this.category = category; }
    public void setPrice(double price) { this.price = price; }


}
