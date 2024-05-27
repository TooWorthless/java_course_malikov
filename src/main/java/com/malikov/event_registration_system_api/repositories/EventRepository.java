package com.malikov.event_registration_system_api.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.malikov.event_registration_system_api.models.Event;

@Repository
public interface EventRepository extends JpaRepository<Event, Long> {
    
}