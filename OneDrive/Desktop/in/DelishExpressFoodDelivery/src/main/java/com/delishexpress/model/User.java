package com.delishexpress.model;

public class User extends Account {
    public User(String username, String email, String password) {
        super(username, email, password);
    }

    @Override
    public String getRole() {
        return "user";  // Could later be extended for admin etc.
    }
}
