package com.fooddelivery.reviews;

import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.stream.Collectors;

public class ReviewService {
    private static final String REVIEWS_FILE = "reviews.txt";
    private Path filePath;

    public ReviewService() {
        try {
            filePath = Paths.get(getClass().getClassLoader().getResource(REVIEWS_FILE).toURI());
            if (!Files.exists(filePath)) {
                Files.createFile(filePath);
            }
        } catch (Exception e) {
            throw new RuntimeException("Could not initialize ReviewService", e);
        }
    }

    public void addReview(Review review) throws IOException {
        review.setId(UUID.randomUUID().toString());
        Files.write(filePath, (review.toString() + System.lineSeparator()).getBytes(), StandardOpenOption.APPEND);
    }

    public List<Review> getAllReviews() throws IOException {
        if (Files.size(filePath) == 0) return new ArrayList<>();

        return Files.readAllLines(filePath).stream()
                .map(Review::fromString)
                .collect(Collectors.toList());
    }

    public Review getReviewById(String id) throws IOException {
        return getAllReviews().stream()
                .filter(r -> r.getId().equals(id))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Review not found"));
    }

    public void updateReview(Review updatedReview) throws IOException {
        List<Review> reviews = getAllReviews();
        reviews = reviews.stream()
                .map(r -> r.getId().equals(updatedReview.getId()) ? updatedReview : r)
                .collect(Collectors.toList());

        Files.write(filePath,
                reviews.stream().map(Review::toString).collect(Collectors.joining(System.lineSeparator())).getBytes(),
                StandardOpenOption.TRUNCATE_EXISTING);
    }
}