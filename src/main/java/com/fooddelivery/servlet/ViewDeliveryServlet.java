package com.fooddelivery.servlet;

import com.fooddelivery.model.Delivery;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class ViewDeliveryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);

        List<Delivery> deliveries = (List<Delivery>) request.getSession().getServletContext().getAttribute("deliveries");
        Delivery delivery = null;
        if (deliveries != null) {
            for (Delivery d : deliveries) {
                if (d.getId() == id) {
                    delivery = d;
                    break;
                }
            }
        }
        request.setAttribute("delivery", delivery);
        request.getRequestDispatcher("/jsp/viewDelivery.jsp").forward(request, response);
    }
}