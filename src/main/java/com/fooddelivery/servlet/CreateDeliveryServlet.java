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
import java.util.Random;

public class CreateDeliveryServlet extends HttpServlet {
    private static int delivery_IDCounter = 1;
    private static final String LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final Random random = new Random();

    // Method to generate a random order_ID in the format "XX###" (2 letters + 3 numbers)
    private String generateOrderID() {
        StringBuilder letters = new StringBuilder();
        for (int i = 0; i < 2; i++) {
            letters.append(LETTERS.charAt(random.nextInt(LETTERS.length())));
        }
        int numbers = random.nextInt(1000);
        String formattedNumbers = String.format("%03d", numbers);
        return letters.toString() + formattedNumbers;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String contactNumber = request.getParameter("contactNumber");

        // Validate contact number
        if (contactNumber == null || contactNumber.trim().isEmpty() || !contactNumber.matches(".*\\d{7,}.*")) {
            request.setAttribute("error", "Please enter a valid contact number (at least 7 digits).");
            request.getRequestDispatcher("/jsp/createDelivery.jsp").forward(request, response);
            return;
        }

        String order_ID = generateOrderID();

        Customer customer = new Customer(name, contactNumber);
        Delivery delivery = new Delivery(delivery_IDCounter++, customer, order_ID, address, LocalDateTime.now());

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
            writer.write("Delivery ID: " + delivery.getDelivery_ID() + " | Customer: " + name + " | Contact Number: " + contactNumber +
                    " | Address: " + address + " | Order ID: " + order_ID + " | Date & Time: " + delivery.getOrderTime() +
                    " | Status: " + delivery.getStatus());
            writer.newLine();
            writer.flush();
        }

        response.sendRedirect("viewDelivery?delivery_ID=" + delivery.getDelivery_ID());
    }
}