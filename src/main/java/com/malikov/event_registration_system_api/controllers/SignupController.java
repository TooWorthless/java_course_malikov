package com.malikov.event_registration_system_api.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.malikov.event_registration_system_api.controllers.dtos.SignupRequest;
import com.malikov.event_registration_system_api.services.UserService;


@Controller
@RequestMapping(path = "/signup")
public class SignupController {

    @Autowired
    private UserService userService;

    @PostMapping
    public String signupFormUrlEncoded(SignupRequest requestDto) {
        userService.signup(requestDto);
        return "redirect:/login";
    }
    
}
