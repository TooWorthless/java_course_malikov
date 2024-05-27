package com.malikov.event_registration_system_api.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.malikov.event_registration_system_api.models.EventRegistration;
import com.malikov.event_registration_system_api.repositories.EventRegistrationRepository;

@Service
public class EventRegistrationService {

    @Autowired
    private EventRegistrationRepository eventRegistrationRepository;

    public void registerUserForEvent(EventRegistration eventRegistration) {
        eventRegistrationRepository.save(eventRegistration);
    }

    public void unregisterUserFromEvent(Long id) {
        eventRegistrationRepository.deleteById(id);
    }

    public List<EventRegistration> listRegistrationsByUser(Long userId) {
        return eventRegistrationRepository.findByUserId(userId);
    }

    public List<EventRegistration> listRegistrationsByEvent(Long eventId) {
        return eventRegistrationRepository.findByEventId(eventId);
    }
}