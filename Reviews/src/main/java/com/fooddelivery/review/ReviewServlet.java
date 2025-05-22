package com.fooddelivery.review;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/review/*")
public class ReviewServlet extends HttpServlet {
    
    @Override
    public void init() throws ServletException {
        System.out.println("Initializing ReviewServlet");
        super.init();
        try {
            ReviewUtil.init(getServletContext());
            System.out.println("ReviewUtil initialized successfully");
        } catch (Exception e) {
            System.err.println("Failed to initialize ReviewUtil: " + e.getMessage());
            e.printStackTrace();
            throw new ServletException("Failed to initialize ReviewUtil", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Handling POST request");
        String action = req.getParameter("action");
        String contextPath = req.getContextPath();

        System.out.println("Action: " + action);
        System.out.println("Context Path: " + contextPath);

        try {
            if ("add".equals(action)) {
                String user = req.getParameter("user");
                String item = req.getParameter("item");
                String text = req.getParameter("review");

                System.out.println("Adding review - User: " + user + ", Item: " + item);

                if (user == null || user.trim().isEmpty()) {
                    throw new ServletException("User name is required");
                }
                if (item == null || item.trim().isEmpty()) {
                    throw new ServletException("Food item is required");
                }
                if (text == null || text.trim().isEmpty()) {
                    throw new ServletException("Review text is required");
                }

                Review review = new Review(user.trim(), item.trim(), text.trim());
                ReviewUtil.saveReview(review);
                System.out.println("Review saved successfully");
                
                resp.sendRedirect(contextPath + "/review");

            } else if ("delete".equals(action)) {
                String user = req.getParameter("user");
                if (user != null && !user.trim().isEmpty()) {
                    System.out.println("Deleting review for user: " + user);
                    ReviewUtil.deleteReview(user.trim());
                    System.out.println("Review deleted successfully");
                    resp.sendRedirect(contextPath + "/review");
                } else {
                    throw new ServletException("User name is required for deletion");
                }
            } else {
                throw new ServletException("Invalid action: " + action);
            }
        } catch (Exception e) {
            System.err.println("Error processing request: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("/review.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Handling GET request");
        try {
            List<Review> reviews = ReviewUtil.getAllReviews();
            System.out.println("Retrieved " + reviews.size() + " reviews");
            req.setAttribute("reviews", reviews);
            RequestDispatcher rd = req.getRequestDispatcher("/view_reviews.jsp");
            rd.forward(req, resp);
        } catch (Exception e) {
            System.err.println("Error retrieving reviews: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "Failed to load reviews: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("/view_reviews.jsp");
            rd.forward(req, resp);
        }

    }
}
