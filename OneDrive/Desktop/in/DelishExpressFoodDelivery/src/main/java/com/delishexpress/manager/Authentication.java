package com.delishexpress.manager;

import com.delishexpress.model.User;

public class Authentication {
    private UserManager userManager;

    public Authentication() {
        this.userManager = new UserManager();
    }

    public User authenticate(String username, String password) throws Exception {
        return userManager.login(username, password);
    }
}
