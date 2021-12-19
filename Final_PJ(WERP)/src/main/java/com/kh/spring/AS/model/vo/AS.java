package com.kh.spring.AS.model.vo;

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
public class AS implements Serializable {
	
	private static final long serialVersionUID = 11111L;

	private int asCode; 	 		// AS 고유코드
	private Date asDate; 	 		// AS 접수번호(= 접수일)
	private String customer; 		// 고객명
	private String proCode;  		// 상품 코드
	private String asTitle;  		// 접수 제목
	private String asContent; 		// 접수 내용
	private Date asExpectedDate;	// 수리 예정일
	private String asStage; 		// 접수 단계(현황)
	
	
}
