package com.fooddelivery.reviews;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Review {
    private String id;
    private String userId;
    private String orderId;
    private String foodItemId;
    private int rating;
    private String comment;
    private String timestamp;

    public Review() {
        this.timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getOrderId() { return orderId; }
    public void setOrderId(String orderId) { this.orderId = orderId; }

    public String getFoodItemId() { return foodItemId; }
    public void setFoodItemId(String foodItemId) { this.foodItemId = foodItemId; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public String getTimestamp() { return timestamp; }

    @Override
    public String toString() {
        return id + "|" + userId + "|" + orderId + "|" + foodItemId + "|" +
                rating + "|" + comment + "|" + timestamp;
    }

    public static Review fromString(String reviewStr) {
        String[] parts = reviewStr.split("\\|");
        Review review = new Review();
        review.setId(parts[0]);
        review.setUserId(parts[1]);
        review.setOrderId(parts[2]);
        review.setFoodItemId(parts[3]);
        review.setRating(Integer.parseInt(parts[4]));
        review.setComment(parts[5]);
        review.timestamp = parts[6];
        return review;
    }
}