package com.hcl.service;
//This interface is used for my user operations
public interface AuthenticationInterface {
	
	public boolean authenticate(String userName, String password);
	
	public void logout();
}
