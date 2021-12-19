package com.kh.spring.qualityI.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kh.spring.errorP.model.vo.Attachment;
import com.kh.spring.qualityI.model.vo.QualityI;


public interface QualityIDAO {
	
	List<Map<String, String>> selectQualityIList(int cPage, int numPerPage, String key, String word);

	int selectQualityITotalContents(String key, String word);

	int insertQualityI(QualityI qualityI);

	int updateCount(QualityI qualityI);

	QualityI selectOneQualityI(int qualityiNo);
	
	int updateQualityI(QualityI qualityI);

	int deleteQualityI(QualityI qualityI);

	void AlldeleteQualityI();
	


}
