package com.hcl.service;

import java.util.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.dao.AlbumDAO;
import com.hcl.dao.UserDAO;
import com.hcl.model.Album;
import com.hcl.model.User;

import lombok.Data;
import lombok.val;
//This class is used for my album service functions
@Data
@Service
public class AlbumService implements AlbumInterface {


	@Autowired
	AlbumDAO albumDao;

	 public List<Album> retrieveAlbums() {
	        return (List<Album>) albumDao.findAll();
	    }


		
	 public void addAlbum(String cover, String title, String artist, String genre,
		 Double price, Integer inventory) { albumDao.save(new Album(cover, title,
		 artist, genre, price, inventory));
		 }
		 

	 public void deleteAlbum(int id) {
	        albumDao.deleteById(id);
	    }
	

}

