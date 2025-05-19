package com.fooddelivery.servlet;

import com.fooddelivery.model.Customer;
import com.fooddelivery.model.Delivery;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CreateDeliveryServlet extends HttpServlet {
    private static int deliveryIdCounter = 1;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String dish = request.getParameter("dish");

        Customer customer = new Customer(name, address);
        Delivery delivery = new Delivery(deliveryIdCounter++, customer, dish, LocalDateTime.now());

        HttpSession session = request.getSession();
        List<Delivery> deliveries = (List<Delivery>) session.getServletContext().getAttribute("deliveries");
        if (deliveries == null) {
            deliveries = new ArrayList<>();
            session.getServletContext().setAttribute("deliveries", deliveries);
        }
        deliveries.add(delivery);

        // Log to file with absolute path
        String filePath = "C:\\Users\\dulee\\IdeaProjects\\FoodDeliveryApp\\deliveries.txt";
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write("ID: " + delivery.getId() + ", Customer: " + name + ", Address: " + address +
                    ", Dish: " + dish + ", DateTime: " + delivery.getOrderTime());
            writer.newLine();
            writer.flush(); // Force the buffer to write to the file immediately
        }

        response.sendRedirect("viewDelivery?id=" + delivery.getId());
    }
}