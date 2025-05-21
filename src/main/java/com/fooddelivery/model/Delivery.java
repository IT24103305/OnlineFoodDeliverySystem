package com.fooddelivery.model;

import java.time.LocalDateTime;

public class Delivery {
    private int delivery_ID;
    private Customer customer;
    private String order_ID;
    private String address;
    private LocalDateTime orderTime;
    private String status;

    public Delivery(int delivery_ID, Customer customer, String order_ID, String address, LocalDateTime orderTime) {
        this.delivery_ID = delivery_ID;
        this.customer = customer;
        this.order_ID = order_ID;
        this.address = address;
        this.orderTime = orderTime;
        this.status = "Active";
    }

    public int getDelivery_ID() {
        return delivery_ID;
    }

    public Customer getCustomer() {
        return customer;
    }

    public String getOrder_ID() {
        return order_ID;
    }

    public String getAddress() {
        return address;
    }

    public LocalDateTime getOrderTime() {
        return orderTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}