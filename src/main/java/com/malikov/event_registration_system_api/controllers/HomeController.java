package com.malikov.event_registration_system_api.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
    
    @GetMapping("/home")
    public String home() {
        return "home";
    }
    
}
