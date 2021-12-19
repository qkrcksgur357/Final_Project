package com.kh.spring.out.model.vo;

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
public class OutManagement implements Serializable  {
	
	private static final long serialVersionUID = 79337L;
	
	private String outcode;	// 출고코드
	private String procode;	// 품목코드
	private String proname; // 품목명
	private String category; // 카테고리
	private int outNum;		// 출고수량
	private int outPrice;   // 출고단가
	private Date inputDate;	// 입력일
	
}