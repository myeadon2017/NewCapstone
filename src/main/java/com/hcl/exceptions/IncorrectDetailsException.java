package com.hcl.exceptions;

//This is used as a exception for incorrect details
@SuppressWarnings("serial")
public class IncorrectDetailsException extends Exception {
	public IncorrectDetailsException(String message) {
		super(message);
	}
}
