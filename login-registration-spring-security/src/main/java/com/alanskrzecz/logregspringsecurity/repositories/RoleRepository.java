package com.alanskrzecz.logregspringsecurity.repositories;


import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.alanskrzecz.logregspringsecurity.models.Role;

public interface RoleRepository extends CrudRepository<Role, Long> {
    List<Role> findAll();
    
    List<Role> findByName(String name);
}


