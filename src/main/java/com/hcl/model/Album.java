package com.hcl.model;


import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
//This is used as an entity class for my Album's
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Album {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String cover;
	private String title;
	private String artist;
	private String genre;
	private Double price;
	private Integer inventory;
	@ManyToOne(fetch = FetchType.EAGER)
	@ToString.Exclude
	private User user;
	
	public Album(String cover, String title, String artist, String genre, Double price, Integer inventory) {
		super();
		this.cover = cover;
		this.title = title;
		this.artist = artist;
		this.genre = genre;
		this.price = price;
		this.inventory = inventory;
	}
	
	
	
}
