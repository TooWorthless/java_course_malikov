package com.malikov.event_registration_system_api.services;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.malikov.event_registration_system_api.controllers.dtos.SignupRequest;
import com.malikov.event_registration_system_api.enums.Role;
import com.malikov.event_registration_system_api.exceptions.DuplicateException;
import com.malikov.event_registration_system_api.models.User;
import com.malikov.event_registration_system_api.repositories.UserRepository;

@Service
public class UserService {
    @Autowired
    private UserRepository repository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public void signup(SignupRequest request) {
        String name = request.getName();
        String email = request.getEmail();
        Optional<User> existingUser = repository.findByEmail(email);
        if (existingUser.isPresent()) {
            throw new DuplicateException(String.format("User with the email address '%s' already exists.", email));
        }

        String hashedPassword = passwordEncoder.encode(request.getPassword());
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setRoles(Collections.singleton(Role.USER));
        user.setPassword(hashedPassword);
        repository.save(user);
    }

    public List<User> getUsers() {
        return repository.findAll();
    }
}
