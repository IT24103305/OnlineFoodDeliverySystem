package com.fooddelivery.servlet;

import com.fooddelivery.model.Delivery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class AdminDeliveryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Delivery> deliveries = (List<Delivery>) request.getSession().getServletContext().getAttribute("deliveries");
        request.setAttribute("deliveries", deliveries);
        request.getRequestDispatcher("/jsp/adminDelivery.jsp").forward(request, response);
    }
}