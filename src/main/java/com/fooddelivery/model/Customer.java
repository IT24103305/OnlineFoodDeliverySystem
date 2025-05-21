package com.fooddelivery.model;

public class Customer extends Person {
    private String contactNumber;

    public Customer(String name, String contactNumber) {
        super(name);
        this.contactNumber = contactNumber;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }
}