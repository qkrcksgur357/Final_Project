package com.kh.spring.qualityI.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import com.kh.spring.errorP.model.vo.ErrorP;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Component

public class QualityI implements Serializable {

	private static final long serialVersionUID = 79337L;
	
	private int qualityiNo;
	private Date qualityiDate;
	private String manager;
	private String procode;
	private String proname;
	private int qualityiCount;
	private String state;
	
	
	
	
}
