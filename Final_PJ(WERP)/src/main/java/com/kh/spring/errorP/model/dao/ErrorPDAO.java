package com.kh.spring.errorP.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.errorP.model.vo.Attachment;
import com.kh.spring.errorP.model.vo.ErrorP;


public interface ErrorPDAO {
	List<Map<String, String>> selectErrorPList(int cPage, int numPerPage, String key, String word);

	int selectErrorPTotalContents(String key, String word);
	
	int checkErrorP(String procode);

	int insertErrorP(ErrorP errorP);

	int updateCount(ErrorP errorP);
	
	int insertAttachment(Attachment a);
	
	ErrorP selectOneErrorP(int errorpNo);

	List<Attachment> selectAttachmentList(int errorpNo);
	
	int updateErrorP(ErrorP errorP);

	int updateAttachment(Attachment a);

	void deleteErrorP(ErrorP errorP);

	int deleteAttachment(int errorpNo);

	int deleteFile(int attNo);

	void AlldeleteErrorP();

	List<Map<String, String>> selectProCodeList(int cPage, int numPerPage, String key, String word);

	int selectProCodeTotalContents(String key, String word);
	


}
