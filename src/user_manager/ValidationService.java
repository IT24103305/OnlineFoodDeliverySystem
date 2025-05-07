package user_manager;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidationService {

    // Regular expression for a simple email validation.
    private static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
    // Define minimum password length (for example, 8 characters)
    private static final int MIN_PASSWORD_LENGTH = 8;

    /**
     * Validates whether the given email adheres to a standard email format.
     *
     * @param email The email address to validate.
     * @return true if the email is valid, false otherwise.
     */
    public boolean isValidEmail(String email) {
        if (email == null) return false;
        Pattern pattern = Pattern.compile(EMAIL_REGEX);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    /**
     * Validates the password strength based on multiple criteria:
     * - At least MIN_PASSWORD_LENGTH characters.
     * - Contains at least one upper-case letter.
     * - Contains at least one lower-case letter.
     * - Contains at least one digit.
     * - Contains at least one special character.
     *
     * @param password The password to validate.
     * @return true if the password is strong, false otherwise.
     */
    public boolean isValidPassword(String password) {
        if (password == null || password.length() < MIN_PASSWORD_LENGTH) {
            return false;
        }

        boolean hasUpperCase = false;
        boolean hasLowerCase = false;
        boolean hasDigit = false;
        boolean hasSpecial = false;

        for (char c : password.toCharArray()) {
            if (Character.isUpperCase(c)) {
                hasUpperCase = true;
            } else if (Character.isLowerCase(c)) {
                hasLowerCase = true;
            } else if (Character.isDigit(c)) {
                hasDigit = true;
            } else if (!Character.isLetterOrDigit(c)) {
                hasSpecial = true;
            }
        }

        return hasUpperCase && hasLowerCase && hasDigit && hasSpecial;
    }

    /**
     * Checks if the provided email is already registered.
     * This method expects a list of current users to compare against.
     *
     * @param email The email to check.
     * @param users List of User objects.
     * @return true if a user with the given email already exists, false otherwise.
     */
    public boolean isDuplicateEmail(String email, List<User> users) {
        if (email == null || users == null) {
            return false;
        }
        for (User user : users) {
            if (email.equalsIgnoreCase(user.getEmail())) {
                return true;
            }
        }
        return false;
    }
}
