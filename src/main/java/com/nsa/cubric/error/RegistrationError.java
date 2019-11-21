package com.nsa.cubric.error;

public class RegistrationError extends Exception
    {
        private int code;

        public RegistrationError(String message, int code)
            {
                super(message);
                this.code = code;
            }

        public int getCode()
            {
                return code;
            }

    }
