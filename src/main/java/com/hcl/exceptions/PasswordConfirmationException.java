package com.hcl.exceptions;

//This is used as a exception for password confirmation
@SuppressWarnings("serial")
public class PasswordConfirmationException extends Exception {
	public PasswordConfirmationException(String message) {
		super(message);
	}
}
