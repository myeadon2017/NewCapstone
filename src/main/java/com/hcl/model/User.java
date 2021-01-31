package com.hcl.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
//This is used as an entity class for my User's
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String password;
	private double total=0.00;
	private String shippingStreetAddress1;
	private String shippingStreetAddress2;
	private String shippingCity;
	private String shippingState;
	private String shippingZipcode;
	private String billingStreetAddress1;
	private String billingStreetAddress2;
	private String billingCity;
	private String billingState;
	private String billingZipcode;
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Album> userCart;
	

}
