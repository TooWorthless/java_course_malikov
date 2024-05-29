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

import com.malikov.event_registration_system_api.models.Event;
import com.malikov.event_registration_system_api.services.EventService;


@RestController
@RequestMapping("/events")
public class EventController {

    @Autowired
    private EventService eventService;

    @GetMapping("/all")
    public ResponseEntity<List<Event>> all() {
        return ResponseEntity.ok(eventService.listEvents());
    }
    

    @GetMapping("/{id}")
    public ResponseEntity<Event> getEventById(@PathVariable Long id) {
        Event event = eventService.getEventById(id);
        if (event == null) {
            return ResponseEntity.notFound().build();
        }
        
        return ResponseEntity.ok(event);
    }

    @PostMapping("/update")
    public ResponseEntity<String> updateEvent(@RequestBody Event event) {
        if (event.getId() == null) {
            return ResponseEntity.badRequest().body("Event ID is required for updating.");
        }
        
        Event existingEvent = eventService.getEventById(event.getId());
        if (existingEvent == null) {
            return ResponseEntity.notFound().build();
        }
        
        existingEvent.setName(event.getName());
        existingEvent.setTitle(event.getTitle());
        existingEvent.setDescription(event.getDescription());
        existingEvent.setPlace(event.getPlace());
        existingEvent.setImage(event.getImage());
        
        eventService.updateEvent(existingEvent);
        
        return ResponseEntity.ok("Event updated successfully.");
    }

    @PostMapping("/create")
    public String createEvent(@RequestBody Event event) {
        eventService.addEvent(event);
        return "ok";
    }

    @PostMapping("/delete/{id}")
    public String deleteEvent(@PathVariable Long id) {
        eventService.deleteEvent(id);
        return "ok";
    }
}