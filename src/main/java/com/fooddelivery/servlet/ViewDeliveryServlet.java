package com.fooddelivery.servlet;

import com.fooddelivery.model.Delivery;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

public class ViewDeliveryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String delivery_IDStr = request.getParameter("delivery_ID");
        int delivery_ID;
        try {
            delivery_ID = Integer.parseInt(delivery_IDStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid delivery ID.");
            request.getRequestDispatcher("/jsp/viewDelivery.jsp").forward(request, response);
            return;
        }

        List<Delivery> deliveries = (List<Delivery>) request.getSession().getServletContext().getAttribute("deliveries");
        Delivery delivery = null;
        if (deliveries != null) {
            for (Delivery d : deliveries) {
                if (d.getDelivery_ID() == delivery_ID) {
                    delivery = d;
                    break;
                }
            }
        } else {
            System.out.println("ViewDeliveryServlet: No deliveries found in servlet context.");
        }

        if (delivery != null) {
            LocalDateTime currentTime = LocalDateTime.now();
            LocalDateTime cutoffTime = delivery.getOrderTime().plusMinutes(10);
            boolean canCancel = delivery.getStatus().equals("Active") && currentTime.isBefore(cutoffTime);
            System.out.println("ViewDeliveryServlet: delivery_ID=" + delivery_ID + ", Current Time=" + currentTime +
                    ", Order Time=" + delivery.getOrderTime() + ", Cutoff Time=" + cutoffTime + ", Can Cancel=" + canCancel);
            request.setAttribute("canCancel", canCancel);
            request.setAttribute("isAfterCutoff", currentTime.isAfter(cutoffTime));
            request.setAttribute("delivery", delivery);
        } else {
            System.out.println("ViewDeliveryServlet: Delivery not found for delivery_ID=" + delivery_ID);
            request.setAttribute("error", "Delivery not found.");
        }

        request.getRequestDispatcher("/jsp/viewDelivery.jsp").forward(request, response);
    }
}