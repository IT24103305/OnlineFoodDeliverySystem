package com.fooddelivery.review;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewUtil {
    private static String filePath;
    
    public static void init(ServletContext context) {
        try {
            filePath = context.getRealPath("/WEB-INF/reviews.txt");
            System.out.println("Reviews file path: " + filePath);

            File file = new File(filePath);
            File parentDir = file.getParentFile();

            if (!parentDir.exists()) {
                boolean created = parentDir.mkdirs();
                System.out.println("Created directory " + parentDir + ": " + created);
            }

            if (!file.exists()) {
                boolean created = file.createNewFile();
                System.out.println("Created file " + file + ": " + created);
            }
        } catch (Exception e) {
            System.err.println("Error initializing ReviewUtil: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static void saveReview(Review review) throws IOException {
        try {
            System.out.println("Attempting to save review to: " + filePath);
            System.out.println("Review content: " + review.toFileString());

            if (filePath == null) {
                throw new IOException("File path is not initialized");
            }

            File file = new File(filePath);
            if (!file.exists()) {
                System.out.println("File doesn't exist, creating new file");
                file.createNewFile();
            }

            try (FileWriter fw = new FileWriter(file, true);
                 BufferedWriter bw = new BufferedWriter(fw)) {
                bw.write(review.toFileString());
                bw.flush();
                System.out.println("Review saved successfully");
            }
        } catch (Exception e) {
            System.err.println("Error saving review: " + e.getMessage());
            e.printStackTrace();
            throw new IOException("Failed to save review: " + e.getMessage(), e);
        }
    }

    public static List<Review> getAllReviews() throws IOException {
        List<Review> reviews = new ArrayList<>();

        try {
            System.out.println("Attempting to read reviews from: " + filePath);

            if (filePath == null) {
                System.out.println("File path is not initialized");
                return reviews;
            }

            File file = new File(filePath);
            if (!file.exists()) {
                System.out.println("Reviews file does not exist");
                return reviews;
            }

            try (BufferedReader br = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = br.readLine()) != null) {
                    System.out.println("Read line: " + line);
                    Review review = Review.fromString(line);
                    if (review != null) {
                        reviews.add(review);
                    }
                }
            }
            System.out.println("Successfully read " + reviews.size() + " reviews");
        } catch (Exception e) {
            System.err.println("Error reading reviews: " + e.getMessage());
            e.printStackTrace();
            throw new IOException("Failed to read reviews: " + e.getMessage(), e);
        }
        return reviews;
    }

    public static void updateReview(String userName, String newReviewText) throws IOException {
        List<Review> reviews = getAllReviews();
        try (PrintWriter pw = new PrintWriter(new FileWriter(filePath))) {
            for (Review r : reviews) {
                if (r.getUserName().equals(userName)) {
                    r = new Review(userName, r.getFoodItem(), newReviewText);
                }
                pw.print(r.toFileString());
            }
        }
    }

    public static void deleteReview(String userName) throws IOException {
        try {
            System.out.println("Attempting to delete review for user: " + userName);
            List<Review> reviews = getAllReviews();
            try (PrintWriter pw = new PrintWriter(new FileWriter(filePath))) {
                for (Review r : reviews) {
                    if (!r.getUserName().equals(userName)) {
                        pw.print(r.toFileString());
                    }
                }
            }
            System.out.println("Review deletion completed");
        } catch (Exception e) {
            System.err.println("Error deleting review: " + e.getMessage());
            e.printStackTrace();
            throw new IOException("Failed to delete review: " + e.getMessage(), e);
        }
    }
}
