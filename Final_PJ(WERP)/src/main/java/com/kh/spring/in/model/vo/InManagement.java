package com.kh.spring.in.model.vo;

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
public class InManagement implements Serializable  {
	
	private static final long serialVersionUID = 79337L;
	
	private String incode;	// 입고코드
	private String procode;	// 품목코드
	private String proname; // 품목명
	private String category; // 카테고리
	private int inNum;		// 입고수량
	private int inPrice;	// 입고단가
	private Date inputDate;	// 입력일
	
}