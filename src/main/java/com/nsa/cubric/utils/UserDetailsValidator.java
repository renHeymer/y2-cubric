package com.nsa.cubric.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Utils class that verifies registration details that a user rovides
 * are correct (although a RegistrationError is not thrown here).
 */
public class UserDetailsValidator
    {
        /**
         * @param firstHalfOfPostCode
         * @return true or false based on whether or not a user provides a String
         * beginning with two letters and ending with two numbers
         */
        public static boolean isValidFirstHalfOfPostCode(String firstHalfOfPostCode)
            {
                return firstHalfOfPostCode.matches("^[A-Za-z]{2}[0-9]{2}$");
            }

        /**
         * @param email
         * @return true if an email follows the format of someone@example.com
         * and false if not
         */
        public static boolean isValidEmail(String email)
            {
                return email.matches("^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})");
            }

        /**
         * @param password
         * @return true if a password has at least one uppercase character and one letter
         * and is a minimum of 8 characters in length
         */
        public static boolean isValidPassword(String password)
            {
                return password.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$");
            }

        /**
         * @param password
         * @param passwordConfirm
         * @return true if password and passwordConfirm are identical and false otherwise
         */
        public static boolean passwordsMatch(String password, String passwordConfirm)
            {
                return password.equals(passwordConfirm);
            }

        /**
         * @param username
         * @return true if a username doesn't contain spaces and false otherwise
         */
        public static boolean isValidUsername(String username)
            {
                Pattern whitespace = Pattern.compile("\\s\\s");
                Matcher matcher = whitespace.matcher(username);
                if (matcher.find())
                {
                    return false;
                } else {
                    return true;
                }
            }

        /**
         * @param age
         * @return true if a users age is between 5 and 110 and false otherwise
         */
        public static boolean isValidAge(Integer age)
            {
                return age <= 110 && age >= 5;
            }
    }
