package com.malikov.event_registration_system_api.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.malikov.event_registration_system_api.models.Event;
import com.malikov.event_registration_system_api.models.EventRegistration;
import com.malikov.event_registration_system_api.models.User;
import com.malikov.event_registration_system_api.repositories.EventRegistrationRepository;
import com.malikov.event_registration_system_api.services.EventRegistrationService;
import com.malikov.event_registration_system_api.services.EventService;
import com.malikov.event_registration_system_api.services.UserDetailsServiceImpl;

@Controller
@RequestMapping("/events")
public class EventController {

    @Autowired
    private EventService eventService;

    @Autowired
    private EventRegistrationRepository eventRegistrationRepository;

    @Autowired
    private UserDetailsServiceImpl userDetailsServiceImpl;

    @GetMapping
    public String listEvents(Model model) {
        model.addAttribute("events", eventService.listEvents());
        return "events";
    }

    @GetMapping("/{id}")
    public String getEvent(@PathVariable Long id, Model model) {
        Event event = eventService.getEventById(id);
        Boolean isAlreadyRegistered = false;

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        // Проверяем, авторизован ли пользователь
        if (authentication != null && authentication.isAuthenticated() && authentication.getName() != "anonymousUser") {
            User user = userDetailsServiceImpl.getUserByEmail(authentication.getName());
            Long userId = user.getId();

            List<EventRegistration> events = eventRegistrationRepository.findAll();
            for (EventRegistration er : events) {
                if (er.getUser().getId() == userId && er.getEvent().getId() == id) {
                    isAlreadyRegistered = true;
                }
            }
        }

        model.addAttribute("event", event);
        model.addAttribute("isAlreadyRegistered", isAlreadyRegistered);
        return "event";
    }

    @GetMapping("/create")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String createEventForm(Model model) {
        model.addAttribute("event", new Event());
        return "create_event";
    }

    @PostMapping("/create")
    public String createEvent(@ModelAttribute Event event) {
        eventService.addEvent(event);
        return "redirect:/events";
    }

    @PostMapping("/delete/{id}")
    public String deleteEvent(@PathVariable Long id) {
        eventService.deleteEvent(id);
        return "redirect:/events";
    }
}