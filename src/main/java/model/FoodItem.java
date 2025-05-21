package model;

public class FoodItem {
    protected String foodId;
    protected String name;
    protected String description;
    protected String category;
    protected double price;

    public FoodItem(String foodId, String name, String description, String category, double price) {
        this.foodId = foodId;
        this.name = name;
        this.description = description;
        this.category = category;
        this.price = price;
    }

    public String getFoodId() { return foodId; }
    public String getName() { return name; }
    public String getDescription() { return description; }
    public String getCategory() { return category; }
    public double getPrice() { return price; }

    public String getItemType() {
        return "Generic Food";
    }
}