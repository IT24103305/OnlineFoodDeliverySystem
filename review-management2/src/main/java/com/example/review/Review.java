package com.example.review;

public class Review {
    private String username;
    private String foodItem;
    private String comment;

    public Review(String username, String foodItem, String comment) {
        this.username = username;
        this.foodItem = foodItem;
        this.comment = comment;
    }

    public String getUsername() {
        return username;
    }

    public String getFoodItem() {
        return foodItem;
    }

    public String getComment() {
        return comment;
    }

    @Override
    public String toString() {
        return username + ";" + foodItem + ";" + comment;
    }

    public static Review fromString(String line) {
        String[] parts = line.split(";");
        return new Review(parts[0], parts[1], parts[2]);
    }
}
