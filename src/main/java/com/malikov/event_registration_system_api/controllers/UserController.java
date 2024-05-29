package com.malikov.event_registration_system_api.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.malikov.event_registration_system_api.models.User;
import com.malikov.event_registration_system_api.services.UserService;

@RestController
@RequestMapping(path = "/users")
public class UserController {
    
    @Autowired
    private UserService userService;

    @GetMapping("/all")
    public ResponseEntity<List<User>> all() {
        return ResponseEntity.ok(userService.getUsers());
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        User user = userService.getUserById(id);
        if (user == null) {
            return ResponseEntity.notFound().build();
        }
        
        return ResponseEntity.ok(user);
    }

    @PostMapping("/update")
    public ResponseEntity<String> updateEvent(@RequestBody User user) {
        if (user.getId() == null) {
            return ResponseEntity.badRequest().body("User ID is required for updating.");
        }
        
        User existingUser = userService.getUserById(user.getId());
        if (existingUser == null) {
            return ResponseEntity.notFound().build();
        }
        
        existingUser.setName(user.getName());
        existingUser.setEmail(user.getEmail());
        existingUser.setRoles(user.getRoles());
        
        userService.updateUser(existingUser);
        
        return ResponseEntity.ok("User updated successfully.");
    }

    @PostMapping("/create")
    public String createUser(@RequestBody User user) {
        userService.addUser(user);
        return "ok";
    }

    @PostMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return "ok";
    }

}
