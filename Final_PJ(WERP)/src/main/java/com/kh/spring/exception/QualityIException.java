package com.kh.spring.exception;

public class QualityIException extends RuntimeException {
	public QualityIException() { }
	
	public QualityIException(String msg) {
		super("[게시글 서비스] :" + msg);
	}
}
