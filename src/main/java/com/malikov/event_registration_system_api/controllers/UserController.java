package com.malikov.event_registration_system_api.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.malikov.event_registration_system_api.models.User;
import com.malikov.event_registration_system_api.services.UserService;

@RestController
@RequestMapping(path = "/users")
public class UserController {
    
    @Autowired
    private UserService userService;

    @GetMapping
    public List<User> usersList() {
        return userService.getUsers();
    }

}
