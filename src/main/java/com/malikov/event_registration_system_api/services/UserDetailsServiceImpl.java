package com.malikov.event_registration_system_api.services;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.malikov.event_registration_system_api.models.User;
import com.malikov.event_registration_system_api.repositories.UserRepository;
import com.malikov.event_registration_system_api.exceptions.NotFoundException;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

  private final UserRepository repository;

  public UserDetailsServiceImpl(UserRepository repository) {
    this.repository = repository;
  }

  @Override
  public UserDetails loadUserByUsername(String email) {

    User user = repository.findByEmail(email).orElseThrow(() ->
        new NotFoundException(String.format("User does not exist, email: %s", email)));

    return org.springframework.security.core.userdetails.User.builder()
        .username(user.getUsername())
        .password(user.getPassword())
        .build();
  }
}