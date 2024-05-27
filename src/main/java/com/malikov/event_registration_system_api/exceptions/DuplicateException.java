package com.malikov.event_registration_system_api.exceptions;

public class DuplicateException extends RuntimeException {

    public DuplicateException(String message) {
        super(message);
    }
}
