package com.malikov.event_registration_system_api.controllers.dtos;

import org.hibernate.validator.constraints.Length;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;

public class LoginRequest {
    @NotNull @Email @Length(min = 5, max = 50)
	private String email;
	
	@NotNull @Length(min = 5, max = 200)
	private String password;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
