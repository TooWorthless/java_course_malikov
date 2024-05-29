package com.malikov.event_registration_system_api.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.malikov.event_registration_system_api.models.Event;
import com.malikov.event_registration_system_api.models.EventRegistration;
import com.malikov.event_registration_system_api.models.User;
import com.malikov.event_registration_system_api.services.EventRegistrationService;
import com.malikov.event_registration_system_api.services.EventService;
import com.malikov.event_registration_system_api.services.UserDetailsServiceImpl;



@Controller
public class WebContentController {

    @Autowired
    private UserDetailsServiceImpl userDetailsServiceImpl;

    @Autowired
    private EventService eventService;

    @Autowired
    private EventRegistrationService eventRegistrationService;
    
    @GetMapping("/")
    public String main() {
        return "home";
    }

    @GetMapping("/home")
    public String home() {
        return "home";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/profile")
    public String profile(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated() && authentication.getName() != "anonymousUser") {
            User user = userDetailsServiceImpl.getUserByEmail(authentication.getName());
            Long userId = user.getId();
            model.addAttribute("user", user);

            List<EventRegistration> userEventRegistrations = eventRegistrationService.listRegistrationsByUser(userId);
            List<Event> userEvents = new ArrayList<>();

            for (EventRegistration er : userEventRegistrations) {
                userEvents.add(er.getEvent());
            }

            model.addAttribute("events", userEvents);
        }
        return "profile";
    }

    @GetMapping("/events")
    public String listEvents(Model model) {
        model.addAttribute("events", eventService.listEvents());
        return "events";
    }

    @GetMapping("/event/{id}")
    public String getEvent(@PathVariable Long id, Model model) {
        Event event = eventService.getEventById(id);
        Boolean isAlreadyRegistered = false;

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated() && authentication.getName() != "anonymousUser") {
            User user = userDetailsServiceImpl.getUserByEmail(authentication.getName());
            Long userId = user.getId();

            EventRegistration userRegistration = eventRegistrationService.getRegistrationByUserAndEvent(userId, id);
            if(userRegistration != null) {
                isAlreadyRegistered = true;
            }
            
            model.addAttribute("er", userRegistration);
        }
        
        model.addAttribute("event", event);
        model.addAttribute("isAlreadyRegistered", isAlreadyRegistered);
        return "event";
    }
    
}
