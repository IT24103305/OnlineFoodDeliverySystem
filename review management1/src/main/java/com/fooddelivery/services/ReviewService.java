package com.fooddelivery.services;

import com.fooddelivery.models.Review;
import com.fooddelivery.utils.FileUtils;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class ReviewService {
    private static final String FILE_PATH = "/WEB-INF/resources/data/reviews.txt";
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    public void addReview(Review review, String realPath) throws IOException {
        List<Review> reviews = getAllReviews(realPath);
        int newId = reviews.isEmpty() ? 1 : reviews.get(reviews.size() - 1).getReviewId() + 1;
        review.setReviewId(newId);
        reviews.add(review);
        saveAllReviews(reviews, realPath);
    }

    public List<Review> getAllReviews(String realPath) throws IOException {
        List<String> lines = FileUtils.readLines(realPath + FILE_PATH);
        List<Review> reviews = new ArrayList<>();

        for (String line : lines) {
            if (!line.trim().isEmpty()) {
                reviews.add(parseReview(line));
            }
        }
        return reviews;
    }

    public Review getReviewById(int id, String realPath) throws IOException {
        return getAllReviews(realPath).stream()
                .filter(r -> r.getReviewId() == id)
                .findFirst()
                .orElse(null);
    }

    public void updateReview(Review updatedReview, String realPath) throws IOException {
        List<Review> reviews = getAllReviews(realPath);
        for (int i = 0; i < reviews.size(); i++) {
            if (reviews.get(i).getReviewId() == updatedReview.getReviewId()) {
                reviews.set(i, updatedReview);
                break;
            }
        }
        saveAllReviews(reviews, realPath);
    }

    public void deleteReview(int id, String realPath) throws IOException {
        List<Review> reviews = getAllReviews(realPath);
        reviews.removeIf(r -> r.getReviewId() == id);
        saveAllReviews(reviews, realPath);
    }

    private void saveAllReviews(List<Review> reviews, String realPath) throws IOException {
        List<String> lines = new ArrayList<>();
        for (Review review : reviews) {
            lines.add(formatReview(review));
        }
        FileUtils.writeLines(realPath + FILE_PATH, lines);
    }

    private String formatReview(Review review) {
        return review.getReviewId() + "|" +
                review.getOrderId() + "|" +
                review.getUserId() + "|" +
                review.getRating() + "|" +
                review.getComment() + "|" +
                review.getReviewDate().format(DATE_FORMATTER);
    }

    private Review parseReview(String line) {
        String[] parts = line.split("\\|");
        Review review = new Review();
        review.setReviewId(Integer.parseInt(parts[0]));
        review.setOrderId(Integer.parseInt(parts[1]));
        review.setUserId(parts[2]);
        review.setRating(Integer.parseInt(parts[3]));
        review.setComment(parts[4]);
        review.setReviewDate(LocalDateTime.parse(parts[5], DATE_FORMATTER));
        return review;
    }
}