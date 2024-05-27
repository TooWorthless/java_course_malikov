package com.malikov.event_registration_system_api.controllers.dtos;

import jakarta.validation.constraints.NotNull;

public class ApiErrorResponse {
    @NotNull
    private int errorCode;

    @NotNull
    private String description;

    public ApiErrorResponse() {
        
    }
	
	public ApiErrorResponse(int errorCode, String description) {
		this.errorCode = errorCode;
		this.description = description;
	}
    
    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public int getErrorCode() {
        return this.errorCode;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return this.description;
    }
}