package user_manager;

import java.util.List;

public class AuthenticationService {
    private static final String FILE_PATH = "users.txt";
    private FileHandler fileHandler;

    public AuthenticationService() {
        // Initialize FileHandler with the path to your users file.
        this.fileHandler = new FileHandler(FILE_PATH);
    }

    /**
     * Authenticates a user by comparing the provided email and password with the stored data.
     *
     * @param email    User's email address.
     * @param password User's password.
     * @return The User object if credentials match; otherwise, returns null.
     */
    public User authenticate(String email, String password) {
        // Read all user records from file
        List<String> lines = fileHandler.readAllLines();
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 4) {
                String storedEmail = parts[2];
                String storedPassword = parts[3];
                if (storedEmail.equalsIgnoreCase(email) && storedPassword.equals(password)) {
                    System.out.println("Authentication successful for user: " + parts[1]);
                    // Return a new User object from the matched record (userId, name, email, password)
                    return new User(parts[0], parts[1], parts[2], parts[3]);
                }
            }
        }
        System.out.println("Authentication failed. Invalid email or password.");
        return null;
    }

    /**
     * Logs out a user. In this simple implementation, logout just displays a message.
     *
     * @param user The user who is logging out.
     */
    public void logout(User user) {
        if (user != null) {
            System.out.println("User " + user.getName() + " has logged out successfully.");
        } else {
            System.out.println("No user is currently logged in.");
        }
    }
}
