package com.kh.spring.exception;

public class ErrorPException extends RuntimeException {
	public ErrorPException() { }
	
	public ErrorPException(String msg) {
		super("[게시글 서비스] :" + msg);
	}
}
