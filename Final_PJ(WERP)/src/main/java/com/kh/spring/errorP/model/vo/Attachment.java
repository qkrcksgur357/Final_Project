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
public class Attachment implements Serializable{
		
	private static final long serialVersionUID = 6943L;
	
	private int attachmentNo;
	private int errorpNo;
	private String originalFileName;
	private String renamedFileName;
	private Date uploadDate;
	private int downloadCount;
	private String status;
}







