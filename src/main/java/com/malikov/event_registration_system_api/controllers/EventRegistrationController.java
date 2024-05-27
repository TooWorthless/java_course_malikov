package com.malikov.event_registration_system_api.controllers;


import java.security.Principal;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.malikov.event_registration_system_api.models.EventRegistration;
import com.malikov.event_registration_system_api.models.User;
import com.malikov.event_registration_system_api.services.EventRegistrationService;
import com.malikov.event_registration_system_api.services.UserDetailsServiceImpl;

@Controller
@RequestMapping("/registrations")
public class EventRegistrationController {

    @Autowired
    private EventRegistrationService eventRegistrationService;
    
    @Autowired
    private UserDetailsServiceImpl userDetails;

    @PostMapping("/register")
    public String registerForEvent(@ModelAttribute EventRegistration eventRegistration, Principal principal) {
        User user = userDetails.getUserByEmail(principal.getName());

        eventRegistration.setUser(user);
        eventRegistration.setRegistrationDate(LocalDate.now());
        eventRegistrationService.registerUserForEvent(eventRegistration);
        return "redirect:/events";
    }

    @PostMapping("/unregister/{id}")
    public String unregisterFromEvent(@PathVariable Long id) {
        eventRegistrationService.unregisterUserFromEvent(id);
        return "redirect:/events";
    }
}