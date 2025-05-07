package user_manager;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class UserManager {

    private static final String FILE_PATH = "users.txt";

    /**
     * Registers a new user by appending the user data to the file.
     *
     * @param user the User object containing user details.
     */
    public void registerUser(User user) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            // Save user record as: userId,name,email,password
            writer.write(user.getUserId() + "," + user.getName() + "," + user.getEmail() + "," + user.getPassword());
            writer.newLine();
            System.out.println("User registered successfully!");
        } catch (IOException e) {
            System.out.println("Error registering user: " + e.getMessage());
        }
    }

    /**
     * Searches for and returns a User based on the given userId.
     *
     * @param userId the unique ID of the user.
     * @return the User object if found; otherwise, returns null.
     */
    public User findUserById(String userId) {
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                // Ensure that the line has the expected number of elements
                if (parts.length >= 4 && parts[0].equals(userId)) {
                    return new User(parts[0], parts[1], parts[2], parts[3]);
                }
            }
        } catch (IOException e) {
            System.out.println("Error finding user: " + e.getMessage());
        }
        return null;
    }

    /**
     * Updates the specified user's email and password.
     *
     * @param userId      the unique ID of the user.
     * @param newEmail    the new email address.
     * @param newPassword the new password.
     */
    public void updateUser(String userId, String newEmail, String newPassword) {
        List<String> updatedLines = new ArrayList<>();
        boolean updated = false;
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 4 && parts[0].equals(userId)) {
                    // Update email and password
                    parts[2] = newEmail;
                    parts[3] = newPassword;
                    updated = true;
                    line = String.join(",", parts);
                }
                updatedLines.add(line);
            }
        } catch (IOException e) {
            System.out.println("Error updating user: " + e.getMessage());
            return;
        }

        // Write the updated content back to the file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (String updatedLine : updatedLines) {
                writer.write(updatedLine);
                writer.newLine();
            }
            if (updated) {
                System.out.println("User updated successfully!");
            } else {
                System.out.println("User not found. No updates made.");
            }
        } catch (IOException e) {
            System.out.println("Error writing the updated user file: " + e.getMessage());
        }
    }

    /**
     * Deletes the user with the specified userId from the file.
     *
     * @param userId the unique ID of the user to be deleted.
     */
    public void deleteUser(String userId) {
        List<String> remainingUsers = new ArrayList<>();
        boolean found = false;
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 4 && parts[0].equals(userId)) {
                    found = true;
                    continue;  // Skip the record for deletion.
                }
                remainingUsers.add(line);
            }
        } catch (IOException e) {
            System.out.println("Error deleting user: " + e.getMessage());
            return;
        }

        // Write the remaining user records back to the file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (String userRecord : remainingUsers) {
                writer.write(userRecord);
                writer.newLine();
            }
            if (found) {
                System.out.println("User deleted successfully!");
            } else {
                System.out.println("User not found. No deletion occurred.");
            }
        } catch (IOException e) {
            System.out.println("Error writing file during deletion: " + e.getMessage());
        }
    }
}
