package com.malikov.event_registration_system_api.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.malikov.event_registration_system_api.models.Event;
import com.malikov.event_registration_system_api.models.EventRegistration;
import com.malikov.event_registration_system_api.models.User;
import com.malikov.event_registration_system_api.repositories.EventRegistrationRepository;
import com.malikov.event_registration_system_api.services.UserDetailsServiceImpl;



@Controller
public class HomeController {

    @Autowired
    private UserDetailsServiceImpl userDetailsServiceImpl;

    @Autowired
    private EventRegistrationRepository eventRegistrationRepository;
    
    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/home")
    public String home2() {
        return "home";
    }

    @GetMapping("/profile")
    public String profile(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated() && authentication.getName() != "anonymousUser") {
            User user = userDetailsServiceImpl.getUserByEmail(authentication.getName());
            Long userId = user.getId();

            model.addAttribute("user", user);

            List<Event> userEvents = new ArrayList<>();

            List<EventRegistration> events = eventRegistrationRepository.findAll();
            for (EventRegistration er : events) {
                if(er.getUser().getId() == userId) {
                    userEvents.add(er.getEvent());
                }
            }

            model.addAttribute("events", userEvents);
        }
        return "profile";
    }
    
}
