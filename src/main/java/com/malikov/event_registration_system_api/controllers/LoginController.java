package com.malikov.event_registration_system_api.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.malikov.event_registration_system_api.controllers.dtos.LoginRequest;
import com.malikov.event_registration_system_api.controllers.dtos.LoginResponse;
import com.malikov.event_registration_system_api.jwt.JwtHelper;


@Controller
@RequestMapping( value = "/login" )
public class LoginController {

    @Autowired
    private AuthenticationManager authenticationManager;
    

    @GetMapping
    public String home() {
        return "login";
    }

    @PostMapping
    public ResponseEntity<LoginResponse> login(LoginRequest request) {
        try {
            authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));
        } catch (BadCredentialsException e) {
            throw e;
        }

        String token = JwtHelper.generateToken(request.getEmail());
        return ResponseEntity.ok(new LoginResponse(request.getEmail(), token));
    }
    
}
