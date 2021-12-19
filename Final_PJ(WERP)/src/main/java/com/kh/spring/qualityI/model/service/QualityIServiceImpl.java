package com.kh.spring.qualityI.model.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.exception.QualityIException;
import com.kh.spring.qualityI.model.dao.QualityIDAO;
import com.kh.spring.qualityI.model.vo.QualityI;

@Service
public class QualityIServiceImpl implements QualityIService {
	
	@Autowired
	QualityIDAO qualityIDAO;
	@Override
	public List<Map<String, String>> selectQualityIList(int cPage, int numPerPage, String key, String word) {
		
		return qualityIDAO.selectQualityIList(cPage, numPerPage, key, word);
		
	}

	@Override
	public int selectQualityITotalContents(String key, String word) {
		
		return qualityIDAO.selectQualityITotalContents(key, word);
	}

	
	@Override
	public int insertQualityI(QualityI qualityI) {
		
		int qualityIResult = qualityIDAO.insertQualityI(qualityI);	
				
		return qualityIResult;
	}
	
	@Override
	public int updateCount(QualityI qualityI) {
		
		return qualityIDAO.updateCount(qualityI);
	}


	@Override
	public QualityI selectOneQualityI(int qualityiNo) {
		QualityI qualityI = qualityIDAO.selectOneQualityI(qualityiNo);
		return qualityI;
	}


	@Override
	public QualityI updateView(int qualityiNo) {

		return qualityIDAO.selectOneQualityI(qualityiNo);
	
	}
	
	

	@Override
	public int updateQualityI(QualityI qualityI) {
		int totalResult = 0;
			
		totalResult = qualityIDAO.updateQualityI(qualityI);  // DAO 로 이동하기
		
		if(totalResult == 0) throw new QualityIException("게시글 수정 실패!");
	
		return totalResult;
	}

	
	@Override
	public void deleteQualityI(QualityI qualityI) {
		
		 qualityIDAO.deleteQualityI(qualityI);
		}
		
	
	@Override
	public 	void AlldeleteQualityI() {
		
		qualityIDAO.AlldeleteQualityI();
	}

}
