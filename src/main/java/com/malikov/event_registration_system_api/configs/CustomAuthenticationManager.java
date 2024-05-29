package com.malikov.event_registration_system_api.configs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.malikov.event_registration_system_api.services.UserDetailsServiceImpl;

@Component
public class CustomAuthenticationManager implements AuthenticationManager {

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();
        String password = authentication.getCredentials().toString();

        UserDetails user = userDetailsService.loadUserByUsername(username);

        if (isPasswordEncoded(password)) {
            if (!user.getPassword().equals(password)) {
                throw new BadCredentialsException("Invalid credentials");
            }
        } else {
            if (!passwordEncoder().matches(password, user.getPassword())) {
                throw new BadCredentialsException("Invalid credentials");
            }
        }

        return new UsernamePasswordAuthenticationToken(user, password, user.getAuthorities());
    }

    private boolean isPasswordEncoded(String password) {
        return password.startsWith("$2a$") || password.startsWith("$2b$") || password.startsWith("$2y$");
    }
}