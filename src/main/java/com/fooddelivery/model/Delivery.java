package com.fooddelivery.model;

import java.time.LocalDateTime;

public class Delivery {
    private int id;
    private Customer customer;
    private String dish;
    private LocalDateTime orderTime;
    private boolean cancelled;

    public Delivery(int id, Customer customer, String dish, LocalDateTime orderTime) {
        this.id = id;
        this.customer = customer;
        this.dish = dish;
        this.orderTime = orderTime;
        this.cancelled = false;
    }

    public int getId() {
        return id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public String getDish() {
        return dish;
    }

    public LocalDateTime getOrderTime() {
        return orderTime;
    }

    public boolean isCancelled() {
        return cancelled;
    }

    public void setCancelled(boolean cancelled) {
        this.cancelled = cancelled;
    }
}