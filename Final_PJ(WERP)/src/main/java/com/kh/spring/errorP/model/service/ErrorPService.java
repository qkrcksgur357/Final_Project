package com.kh.spring.errorP.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.errorP.model.vo.Attachment;
import com.kh.spring.errorP.model.vo.ErrorP;


public interface ErrorPService {
	List<Map<String, String>> selectErrorPList(int cPage, int numPerPage, String key, String word);

	int selectErrorPTotalContents(String key, String word);
	
	int selectProCodeTotalContents(String key, String word);
	

	int checkErrorP(String procode);

	int insertErrorP(ErrorP errorP, List<Attachment> attachList);

	int updateCount(ErrorP errorP);

	ErrorP selectOneErrorP(int errorpNo);

	List<Attachment> selectAttachmentList(int errorpNo);

	ErrorP updateView(int errorpNo);
	
	int updateErrorP(ErrorP errorP, List<Attachment> attachList);
	
	int deleteFile(int attNo);

	void deleteErrorP(ErrorP errorP);

	void AlldeleteErrorP();

	List<Map<String, String>> selectProCodeList(int cPage, int numPerPage, String key, String word);





	
}
