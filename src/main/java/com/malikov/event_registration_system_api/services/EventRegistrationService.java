package com.malikov.event_registration_system_api.services;

import java.util.ArrayList;
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

    public List<EventRegistration> listRegistrations() {
        return eventRegistrationRepository.findAll();
    }

    public List<EventRegistration> listRegistrationsByUser(Long userId) {
        List<EventRegistration> registrations = listRegistrations();
        List<EventRegistration> userRegistrations = new ArrayList<>();

        for (EventRegistration er : registrations) {
            if(er.getUser().getId() == userId) {
                userRegistrations.add(er);
            }
        }

        return userRegistrations;
    }

    public List<EventRegistration> listRegistrationsByEvent(Long eventId) {
        List<EventRegistration> registrations = listRegistrations();
        List<EventRegistration> userRegistrations = new ArrayList<>();

        for (EventRegistration er : registrations) {
            if(er.getEvent().getId() == eventId) {
                userRegistrations.add(er);
            }
        }

        return userRegistrations;
    }

    public EventRegistration getRegistrationByUserAndEvent(Long userId, Long eventId) {
        List<EventRegistration> registrations = listRegistrations();
        EventRegistration userRegistration = null;

        for (EventRegistration er : registrations) {
            if(er.getUser().getId() == userId && er.getEvent().getId() == eventId) {
                userRegistration = er;
            }
        }

        return userRegistration;
    }

    public void deleteRegistrationsByEvent(Long eventId) {
        List<EventRegistration> allRegistrations = listRegistrations();

        for(EventRegistration er : allRegistrations) {
            if(er.getEvent().getId() == eventId) {
                unregisterUserFromEvent(er.getId());
            }
        }
    }

    public void deleteRegistrationsByUser(Long userId) {
        List<EventRegistration> allRegistrations = listRegistrations();

        for(EventRegistration er : allRegistrations) {
            if(er.getUser().getId() == userId) {
                unregisterUserFromEvent(er.getId());
            }
        }
    }
}