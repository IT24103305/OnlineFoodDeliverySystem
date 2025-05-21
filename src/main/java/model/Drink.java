package model;

public class Drink extends FoodItem {
    public Drink(String foodId, String name, String description, String category, double price) {
        super(foodId, name, description, category, price);
    }

    @Override
    public String getItemType() {
        return "Drink";
    }
}
