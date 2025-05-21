package com.delishexpress.util;

import java.util.regex.Pattern;

public class ValidationService {
    private static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
    private static final String PASSWORD_REGEX = "^(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$";

    public static boolean validateEmail(String email) {
        return Pattern.matches(EMAIL_REGEX, email);
    }

    public static boolean validatePassword(String password) {
        return Pattern.matches(PASSWORD_REGEX, password);
    }
}
