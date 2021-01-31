package com.hcl.dao;


import org.springframework.data.repository.CrudRepository;

import com.hcl.model.Album;

//This interface is used as a repository for Album CRUD operations
public interface AlbumDAO extends CrudRepository<Album, Integer> {
		
}
