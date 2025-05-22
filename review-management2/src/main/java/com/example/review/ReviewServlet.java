package com.example.review;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {
    private String filePath;

    @Override
    public void init() throws ServletException {
        // Get the absolute path of the web application
        String appPath = getServletContext().getRealPath("/");
        // Create a 'data' directory if it doesn't exist
        File dataDir = new File(appPath, "data");
        if (!dataDir.exists()) {
            dataDir.mkdir();
        }
        filePath = new File(dataDir, "reviews.txt").getAbsolutePath();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String foodItem = request.getParameter("foodItem");
        String comment = request.getParameter("comment");

        if (username == null || foodItem == null || comment == null || 
            username.trim().isEmpty() || foodItem.trim().isEmpty() || comment.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required");
            return;
        }

        Review review = new Review(username, foodItem, comment);
        try (FileWriter fw = new FileWriter(filePath, true)) {
            fw.write(review.toString() + "\n");
        } catch (IOException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error saving review");
            return;
        }

        response.sendRedirect("review");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Review> reviews = new ArrayList<>();
        File file = new File(filePath);
        
        if (file.exists()) {
            try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
                String line;
                while ((line = br.readLine()) != null) {
                    try {
                        reviews.add(Review.fromString(line));
                    } catch (Exception e) {
                        // Skip invalid lines
                        continue;
                    }
                }
            } catch (IOException e) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error reading reviews");
                return;
            }
        }
        
        request.setAttribute("reviews", reviews);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewReviews.jsp");
        dispatcher.forward(request, response);
    }
}
