package com.delishexpress.util;

import com.delishexpress.model.User;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    public List<User> readUsersFromFile(String filePath) throws Exception {
        List<User> users = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) {
            return users;
        }
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split(",");
                if (parts.length >= 3) {
                    String username = parts[0].trim();
                    String email = parts[1].trim();
                    String password = parts[2].trim();
                    users.add(new User(username, email, password));
                }
            }
        }
        return users;
    }

    public boolean writeUsersToFile(String filePath, List<User> users) throws Exception {
        File file = new File(filePath);
        try (PrintWriter pw = new PrintWriter(new FileWriter(file))) {
            for (User u : users) {
                pw.println(u.getUsername() + "," + u.getEmail() + "," + u.getPassword());
            }
        }
        return true;
    }

    public boolean appendUserToFile(String filePath, User user) throws Exception {
        File file = new File(filePath);
        try (PrintWriter pw = new PrintWriter(new FileWriter(file, true))) {
            pw.println(user.getUsername() + "," + user.getEmail() + "," + user.getPassword());
        }
        return true;
    }
}
