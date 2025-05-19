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
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);

        List<Delivery> deliveries = (List<Delivery>) request.getSession().getServletContext().getAttribute("deliveries");
        if (deliveries != null) {
            for (Delivery delivery : deliveries) {
                if (delivery.getId() == id) {
                    if (LocalDateTime.now().isBefore(delivery.getOrderTime().plusMinutes(10))) {
                        delivery.setCancelled(true);
                        // Log the cancellation to deliveries.txt
                        String filePath = "C:\\Users\\dulee\\IdeaProjects\\FoodDeliveryApp\\deliveries.txt";
                        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
                            writer.write("Delivery Cancelled: ID: " + delivery.getId() + ", DateTime: " + LocalDateTime.now());
                            writer.newLine();
                            writer.flush(); // Force the buffer to write to the file immediately
                        }
                    }
                    break;
                }
            }
        }

        response.sendRedirect("viewDelivery?id=" + id);
    }
}