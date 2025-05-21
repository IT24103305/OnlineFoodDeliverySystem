package com.delishexpress.manager;

import com.delishexpress.model.User;
import com.delishexpress.util.FileHandler;
import com.delishexpress.util.ValidationService;
import java.util.ArrayList;
import java.util.List;

public class UserManager {
    private static final String USER_FILE = "users.txt";
    private FileHandler fileHandler;

    public UserManager() {
        fileHandler = new FileHandler();
    }

    // Register a new user
    public boolean registerUser(User user) throws Exception {
        // Validate email and password
        if (!ValidationService.validateEmail(user.getEmail()) ||
                !ValidationService.validatePassword(user.getPassword())) {
            return false;
        }
        List<User> users = getAllUsers();
        for (User u : users) {
            if (u.getUsername().equalsIgnoreCase(user.getUsername()) ||
                    u.getEmail().equalsIgnoreCase(user.getEmail())) {
                return false; // Duplicate found
            }
        }
        users.add(user);
        return fileHandler.writeUsersToFile(USER_FILE, users);
    }

    public List<User> getAllUsers() throws Exception {
        List<User> users = fileHandler.readUsersFromFile(USER_FILE);
        return users != null ? users : new ArrayList<>();
    }

    public boolean updateUser(User updatedUser) throws Exception {
        List<User> users = getAllUsers();
        boolean found = false;
        for (int i = 0; i < users.size(); i++) {
            User u = users.get(i);
            if (u.getUsername().equalsIgnoreCase(updatedUser.getUsername())) {
                users.set(i, updatedUser);
                found = true;
                break;
            }
        }
        if (found)
            return fileHandler.writeUsersToFile(USER_FILE, users);
        return false;
    }

    public boolean deleteUser(String username) throws Exception {
        List<User> users = getAllUsers();
        boolean removed = users.removeIf(u -> u.getUsername().equalsIgnoreCase(username));
        if (removed)
            return fileHandler.writeUsersToFile(USER_FILE, users);
        return false;
    }

    public User login(String username, String password) throws Exception {
        List<User> users = getAllUsers();
        for (User u : users) {
            if (u.getUsername().equalsIgnoreCase(username) &&
                    u.getPassword().equals(password)) {
                return u;
            }
        }
        return null;
    }
}
