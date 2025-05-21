package com.fooddelivery.servlet;

import com.fooddelivery.model.Delivery;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

public class CancelDeliveryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String delivery_IDStr = request.getParameter("delivery_ID");
        int delivery_ID;
        try {
            delivery_ID = Integer.parseInt(delivery_IDStr);
        } catch (NumberFormatException e) {
            System.out.println("CancelDeliveryServlet: Invalid delivery_ID format: " + delivery_IDStr);
            response.sendRedirect("viewDelivery?delivery_ID=" + delivery_IDStr);
            return;
        }

        List<Delivery> deliveries = (List<Delivery>) request.getSession().getServletContext().getAttribute("deliveries");
        if (deliveries == null) {
            System.out.println("CancelDeliveryServlet: No deliveries found in servlet context.");
            response.sendRedirect("viewDelivery?delivery_ID=" + delivery_ID);
            return;
        }

        for (Delivery delivery : deliveries) {
            if (delivery.getDelivery_ID() == delivery_ID) {
                LocalDateTime currentTime = LocalDateTime.now();
                LocalDateTime cutoffTime = delivery.getOrderTime().plusMinutes(10);
                System.out.println("CancelDeliveryServlet: Current Time=" + currentTime + ", Order Time=" + delivery.getOrderTime() +
                        ", Cutoff Time=" + cutoffTime);
                if (currentTime.isBefore(cutoffTime)) {
                    delivery.setStatus("Cancelled");
                    System.out.println("CancelDeliveryServlet: Delivery cancelled, delivery_ID=" + delivery_ID);
                    // Log the cancellation to deliveries.txt
                    String filePath = "C:\\Users\\dulee\\IdeaProjects\\FoodDeliveryApp\\deliveries.txt";
                    try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
                        String logEntry = "Delivery Cancelled: Order ID: " + delivery.getOrder_ID() +
                                " | Date & Time: " + currentTime + " | Status: Cancelled";
                        writer.write(logEntry);
                        writer.newLine();
                        writer.flush();
                        System.out.println("CancelDeliveryServlet: Logged to file: " + logEntry);
                    } catch (IOException e) {
                        System.out.println("CancelDeliveryServlet: Error writing to deliveries.txt: " + e.getMessage());
                        throw new ServletException("Failed to log cancellation", e);
                    }
                } else {
                    System.out.println("CancelDeliveryServlet: Cancellation not allowed, time exceeded for delivery_ID=" + delivery_ID);
                }
                break;
            }
        }

        response.sendRedirect("viewDelivery?delivery_ID=" + delivery_ID);
    }
}