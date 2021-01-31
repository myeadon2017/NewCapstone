package com.hcl.exceptions;

//This is used as an exception for invalid user login
@SuppressWarnings("serial")
public class InvalidUserException extends Exception {

	public InvalidUserException(String message) {
		super(message);
	}
}
