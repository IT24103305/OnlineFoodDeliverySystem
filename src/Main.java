import user_manager.AuthenticationService;
import user_manager.User;
import user_manager.FileHandler;

public class Main {
    public static void main(String[] args) {
        // Initialize FileHandler and append a test user record, if not already added
        FileHandler fileHandler = new FileHandler("users.txt");
        // Uncomment the following line if you want to add a test record
        // fileHandler.appendLine("U001,Hansaja,hansaja@example.com,SecurePass123");

        // Initialize AuthenticationService
        AuthenticationService authService = new AuthenticationService();

        // Test authentication with correct credentials
        User user = authService.authenticate("hansaja@example.com", "SecurePass123");
        if (user != null) {
            System.out.println("Logged in user: " + user);
        }

        // Test logging out
        authService.logout(user);

        // Test authentication with wrong credentials
        User invalidUser = authService.authenticate("hansaja@example.com", "WrongPassword");
        if (invalidUser == null) {
            System.out.println("No valid user found with provided credentials.");
        }
    }
}
