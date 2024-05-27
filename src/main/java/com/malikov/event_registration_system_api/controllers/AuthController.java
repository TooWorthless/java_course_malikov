package com.malikov.event_registration_system_api.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.malikov.event_registration_system_api.controllers.dtos.LoginRequest;
import com.malikov.event_registration_system_api.controllers.dtos.LoginResponse;
import com.malikov.event_registration_system_api.controllers.dtos.SignupRequest;
import com.malikov.event_registration_system_api.jwt.JwtHelper;
// import com.malikov.event_registration_system_api.services.LoginService;
import com.malikov.event_registration_system_api.services.UserService;

import jakarta.validation.Valid;

@RestController
@RequestMapping(path = "/api/auth", produces = MediaType.APPLICATION_JSON_VALUE)
public class AuthController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserService userService;

    // @Autowired
    // private LoginService loginService;

    @PostMapping("/signup")
    public ResponseEntity<Void> signup(@Valid @RequestBody SignupRequest requestDto) {
        userService.signup(requestDto);
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @PostMapping(value = "/login")
    public ResponseEntity<LoginResponse> login(@Valid @RequestBody LoginRequest request) {
        try {
            authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));
        } catch (BadCredentialsException e) {
            // loginService.addLoginAttempt(request.email(), false);
            throw e;
        }

        String token = JwtHelper.generateToken(request.getEmail());
        // loginService.addLoginAttempt(request.email(), true);
        return ResponseEntity.ok(new LoginResponse(request.getEmail(), token));
    }
}
