package com.fooddelivery.reviews;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ReviewServlet", value = {"/reviews", "/reviews/add", "/reviews/edit"})
public class ReviewServlet extends HttpServlet {
    private ReviewService reviewService = new ReviewService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/reviews/add":
                    showAddForm(request, response);
                    break;
                case "/reviews/edit":
                    showEditForm(request, response);
                    break;
                case "/reviews":
                default:
                    listReviews(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/reviews/add":
                    addReview(request, response);
                    break;
                case "/reviews/edit":
                    updateReview(request, response);
                    break;
                default:
                    listReviews(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listReviews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("reviews", reviewService.getAllReviews());
        request.getRequestDispatcher("/reviews/review-list.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/reviews/add-review.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Review review = reviewService.getReviewById(id);
        request.setAttribute("review", review);
        request.getRequestDispatcher("/reviews/edit-review.jsp").forward(request, response);
    }

    private void addReview(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Review review = new Review();
        review.setOrderId(request.getParameter("orderId"));
        review.setRating(Integer.parseInt(request.getParameter("rating")));
        review.setComment(request.getParameter("comment"));

        try {
            reviewService.addReview(review);
            response.sendRedirect("reviews");
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/reviews/add-review.jsp").forward(request, response);
        }
    }

    private void updateReview(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        Review review = reviewService.getReviewById(id);
        review.setOrderId(request.getParameter("orderId"));
        review.setRating(Integer.parseInt(request.getParameter("rating")));
        review.setComment(request.getParameter("comment"));

        try {
            reviewService.updateReview(review);
            response.sendRedirect("reviews");
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.setAttribute("review", review);
            request.getRequestDispatcher("/reviews/edit-review.jsp").forward(request, response);
        }
    }
}