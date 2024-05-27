package com.malikov.event_registration_system_api.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.malikov.event_registration_system_api.models.EventRegistration;

@Repository
public interface EventRegistrationRepository extends JpaRepository<EventRegistration, Long> {
    List<EventRegistration> findByUserId(Long userId);
    List<EventRegistration> findByEventId(Long eventId);
}