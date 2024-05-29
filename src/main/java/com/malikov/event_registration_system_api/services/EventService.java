package com.malikov.event_registration_system_api.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.malikov.event_registration_system_api.models.Event;
import com.malikov.event_registration_system_api.repositories.EventRepository;

@Service
public class EventService {

    @Autowired
    private EventRepository eventRepository;

    @Autowired
    private EventRegistrationService eventRegistrationService;

    public void addEvent(Event event) {
        eventRepository.save(event);
    }

    public void deleteEvent(Long id) {
        eventRegistrationService.deleteRegistrationsByEvent(id);
        eventRepository.deleteById(id);
    }

    public List<Event> listEvents() {
        return eventRepository.findAll();
    }

    public Event getEventById(Long id) {
        return eventRepository.findById(id).orElse(null);
    }

    public void updateEvent(Event updatedEvent) {
        Event existingEvent = eventRepository.findById(updatedEvent.getId()).orElse(null);
        if (existingEvent != null) {
            eventRepository.save(updatedEvent);
        }
    }
}