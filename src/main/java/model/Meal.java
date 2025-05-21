package model;

public class Meal extends FoodItem {
    public Meal(String foodId, String name, String description, String category, double price) {
        super(foodId, name, description, category, price);
    }

    @Override
    public String getItemType() {
        return "Meal";
    }
}