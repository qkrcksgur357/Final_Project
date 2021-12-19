package com.kh.spring.errorP.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.Utils;
import com.kh.spring.errorP.model.dao.ErrorPDAO;
import com.kh.spring.errorP.model.vo.Attachment;
import com.kh.spring.errorP.model.vo.ErrorP;
import com.kh.spring.exception.ErrorPException;
@Service
public class ErrorPServiceImpl implements ErrorPService {
	
	@Autowired
	ErrorPDAO errorPDAO;
	
	@Override
	public List<Map<String, String>> selectErrorPList(int cPage, int numPerPage, String key, String word) {
		
		return errorPDAO.selectErrorPList(cPage, numPerPage, key, word);
		
	}

	@Override
	public int selectErrorPTotalContents(String key, String word) {
		
		return errorPDAO.selectErrorPTotalContents(key, word);
	}

	@Override
	public int checkErrorP(String procode) {
		
		return errorPDAO.checkErrorP(procode);
	}
	
	@Override
	public int insertErrorP(ErrorP errorP, List<Attachment> attachList) {
		
		int errorPResult = errorPDAO.insertErrorP(errorP);
		
		// 첨부파일이 boardNo를 알 수 있는 방법
		// 1. BoardDAO를 통해서 가장 최근에 추가된 게시글 번호 가져오기 ( O )
		// 2. mapper 파일을 통해서             ..  
		
		if( attachList.size() > 0) {
			// 첨부파일이 있을 때만 실행해라
			
			for(Attachment a : attachList) {
				int attachResult = errorPDAO.insertAttachment(a);
				if( attachResult == 0 ) throw new ErrorPException("첨부파일 전송 실패!");
			}
		}
				
		return errorPResult;
	}
	
	@Override
	public int updateCount(ErrorP errorP) {
		
		return errorPDAO.updateCount(errorP);
	}


	@Override
	public ErrorP selectOneErrorP(int errorpNo) {
		ErrorP errorP = errorPDAO.selectOneErrorP(errorpNo);
		
		return errorP;
	}

	@Override
	public List<Attachment> selectAttachmentList(int errorpNo) {
		
		return errorPDAO.selectAttachmentList(errorpNo);
	}

	@Override
	public ErrorP updateView(int errorpNo) {

		return errorPDAO.selectOneErrorP(errorpNo);
	
	}
	
	

	@Override
	public int updateErrorP(ErrorP errorP, List<Attachment> attachList) {
		int totalResult = 0;
		
		List<Attachment> originList = errorPDAO.selectAttachmentList(errorP.getErrorpNo());
		
		totalResult = errorPDAO.updateErrorP(errorP);  // DAO 로 이동하기
		
		if(totalResult == 0) throw new ErrorPException("게시글 수정 실패!");
		
		if( originList.size() > 0) { 
			// 기존 첨부파일이 DB에 있다면
			totalResult = errorPDAO.deleteAttachment(errorP.getErrorpNo());
			
			if(totalResult == 0) throw new ErrorPException("첨부파일 삭제 실패!");
		}
		
		if( attachList.size() > 0) {
			for(Attachment a : attachList) {
				totalResult = errorPDAO.updateAttachment(a);
				
				if(totalResult == 0) throw new ErrorPException("게시글 첨부파일 수정 실패!");
			}
		}
		
		return totalResult;
	}

	
	@Override
	public void deleteErrorP(ErrorP errorP) {
		
		 errorPDAO.deleteErrorP(errorP);
		}
		
	

	@Override
	public int deleteFile(int attNo) {
		
		return errorPDAO.deleteFile(attNo);
	}
	
	@Override
	public 	void AlldeleteErrorP() {
		
		errorPDAO.AlldeleteErrorP();
	}

	@Override
	public List<Map<String, String>> selectProCodeList(int cPage, int numPerPage, String key, String word) {
		
		
		
		return errorPDAO.selectProCodeList(cPage, numPerPage, key, word);
	}

	@Override
	public int selectProCodeTotalContents(String key, String word) {
		
		return errorPDAO.selectProCodeTotalContents(key, word);
	}

}
