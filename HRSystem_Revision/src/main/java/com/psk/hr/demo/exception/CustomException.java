package com.psk.hr.demo.exception;

public class CustomException extends RuntimeException{
	public CustomException() {
		super("error occured");
	}
	
	public CustomException(String message) {
		super(message);
	}
}
