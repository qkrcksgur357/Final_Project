package com.kh.spring.errorP.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Component
public class ErrorP implements Serializable {
	
	private static final long serialVersionUID = 79337L;
	
	private int errorpNo;
	private String procode;
	private String proname;
	private String errorpContent;
	private String errorpCount;
	private Date inputDate;
	
	private int fileCount;
}
