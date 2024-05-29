package com.malikov.event_registration_system_api.controllers;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.malikov.event_registration_system_api.enums.Role;
import com.malikov.event_registration_system_api.exceptions.AccessDeniedException;
import com.malikov.event_registration_system_api.models.User;
import com.malikov.event_registration_system_api.services.EventService;
import com.malikov.event_registration_system_api.services.UserDetailsServiceImpl;


@Controller
@RequestMapping( value = "/admin" )
public class AdminController {

    @Autowired
    private EventService eventService;

    @Autowired
    protected UserDetailsServiceImpl userDetailsServiceImpl;
    
    @GetMapping
    public String main() {
        if(!checkRole(SecurityContextHolder.getContext().getAuthentication())) {
            throw new AccessDeniedException("Access Denied!");
        }
        
        return "admin";
    }

    @GetMapping("/events")
    public String events(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(!checkRole(authentication)) {
            throw new AccessDeniedException("Access Denied!");
        }

        User user = userDetailsServiceImpl.getUserByEmail(authentication.getName());
        
        model.addAttribute("email", user.getEmail());
        model.addAttribute("password", user.getPassword());
        
        model.addAttribute("events", eventService.listEvents());
        return "admin_events";
    }

    @GetMapping("/events/create")
    public String createEvent(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(!checkRole(authentication)) {
            throw new AccessDeniedException("Access Denied!");
        }

        User user = userDetailsServiceImpl.getUserByEmail(authentication.getName());
        
        model.addAttribute("email", user.getEmail());
        model.addAttribute("password", user.getPassword());

        return "admin_create_event";
    }
    

    protected Boolean checkRole(Authentication authentication) {
        User user = userDetailsServiceImpl.getUserByEmail(authentication.getName());

        if(user.getAuthorities().contains(Role.ADMIN)) {
            return true;
        }

        return false;
    }
    
}
