package com.malikov.event_registration_system_api.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.malikov.event_registration_system_api.configs.CustomAuthenticationManager;
import com.malikov.event_registration_system_api.controllers.dtos.ApiErrorResponse;
import com.malikov.event_registration_system_api.controllers.dtos.LoginRequest;
import com.malikov.event_registration_system_api.controllers.dtos.LoginResponse;
import com.malikov.event_registration_system_api.controllers.dtos.SignupRequest;
import com.malikov.event_registration_system_api.enums.Role;
import com.malikov.event_registration_system_api.exceptions.AccessDeniedException;
import com.malikov.event_registration_system_api.jwt.JwtHelper;
import com.malikov.event_registration_system_api.models.User;
import com.malikov.event_registration_system_api.services.UserDetailsServiceImpl;
// import com.malikov.event_registration_system_api.services.LoginService;
import com.malikov.event_registration_system_api.services.UserService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;

@RestController
@RequestMapping(path = "/api/auth", produces = MediaType.APPLICATION_JSON_VALUE)
public class AuthController {

    @Autowired
    private CustomAuthenticationManager authenticationManager;

    @Autowired
    private UserService userService;

    @Autowired
    private UserDetailsServiceImpl userDetailsServiceImpl;

    @PostMapping("/signup")
    public ResponseEntity<Void> signup(@Valid @RequestBody SignupRequest requestDto) {
        userService.signup(requestDto);
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @PostMapping(value = "/login")
    public ResponseEntity<?> login(@Valid @RequestBody LoginRequest request) {
        try {
            Authentication authentication = authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));

            if (authentication == null) {
                throw new AccessDeniedException("Access Denied!");
            }

            User user = userDetailsServiceImpl.getUserByEmail(authentication.getName());
            if (!user.getAuthorities().contains(Role.ADMIN)) {
                throw new AccessDeniedException("Access Denied!");
            }

            String token = JwtHelper.generateToken(request.getEmail());
            // loginService.addLoginAttempt(request.email(), true);
            return ResponseEntity.ok(new LoginResponse(request.getEmail(), token));
        } catch (BadCredentialsException | AccessDeniedException e) {
            // throw e;
            return ResponseEntity.badRequest().body(new ApiErrorResponse(HttpServletResponse.SC_BAD_REQUEST, e.getMessage()));
        }
    }
}
