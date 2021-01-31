package com.hcl.dao;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.hcl.model.User;

//This interface is used as a repository for User CRUD operations
public interface UserDAO extends CrudRepository<User, Integer> {
	
	public Optional<User> findOneByNameAndPassword(String name, String password);

	
}
