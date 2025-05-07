package com.fooddelivery.controllers;

import com.fooddelivery.models.Review;
import com.fooddelivery.services.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;  // Added missing import

@WebServlet(name = "ReviewServlet", urlPatterns = {"/reviews", "/reviews/add", "/reviews/edit", "/reviews/delete"})
public class ReviewServlet extends HttpServlet {
    private ReviewService reviewService;

    @Override
    public void init() throws ServletException {
        super.init();
        reviewService = new ReviewService();
    }

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
                case "/reviews/delete":
                    deleteReview(request, response);
                    break;
                default:
                    listReviews(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            if (action.equals("/reviews/add")) {
                addReview(request, response);
            } else if (action.equals("/reviews/edit")) {
                updateReview(request, response);
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void listReviews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String realPath = getServletContext().getRealPath("");
        List<Review> reviews = reviewService.getAllReviews(realPath);
        request.setAttribute("reviews", reviews);
        request.getRequestDispatcher("/WEB-INF/views/review/list.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/review/add.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String realPath = getServletContext().getRealPath("");
        Review review = reviewService.getReviewById(id, realPath);
        request.setAttribute("review", review);
        request.getRequestDispatcher("/WEB-INF/views/review/edit.jsp").forward(request, response);
    }

    private void addReview(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Review review = new Review();
        review.setOrderId(Integer.parseInt(request.getParameter("orderId")));
        review.setUserId(request.getParameter("userId"));
        review.setRating(Integer.parseInt(request.getParameter("rating")));
        review.setComment(request.getParameter("comment"));

        String realPath = getServletContext().getRealPath("");
        reviewService.addReview(review, realPath);
        response.sendRedirect("reviews");
    }

    private void updateReview(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("reviewId"));
        String realPath = getServletContext().getRealPath("");
        Review existingReview = reviewService.getReviewById(id, realPath);

        if (existingReview != null) {
            existingReview.setOrderId(Integer.parseInt(request.getParameter("orderId")));
            existingReview.setUserId(request.getParameter("userId"));
            existingReview.setRating(Integer.parseInt(request.getParameter("rating")));
            existingReview.setComment(request.getParameter("comment"));
            reviewService.updateReview(existingReview, realPath);
        }
        response.sendRedirect("reviews");
    }

    private void deleteReview(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String realPath = getServletContext().getRealPath("");
        reviewService.deleteReview(id, realPath);
        response.sendRedirect("reviews");
    }
}