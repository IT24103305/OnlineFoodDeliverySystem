package com.fooddelivery.review;


public class Review {
    private String userName;
    private String foodItem;
    private String reviewText;

    public Review(String userName, String foodItem, String reviewText) {
        this.userName = userName;
        this.foodItem = foodItem;
        this.reviewText = reviewText;
    }

    public String getUserName() {
        return userName;
    }

    public String getFoodItem() {
        return foodItem;
    }

    public String getReviewText() {
        return reviewText;
    }

    public String toFileString() {
        return userName + "," + foodItem + "," + reviewText.replace(",", " ") + "\n";
    }

    public static Review fromString(String line) {
        String[] parts = line.split(",", 3);
        if (parts.length < 3) return null;
        return new Review(parts[0], parts[1], parts[2]);
    }
}
