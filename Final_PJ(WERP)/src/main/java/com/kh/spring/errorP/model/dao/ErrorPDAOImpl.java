package com.kh.spring.errorP.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.Utils;
import com.kh.spring.errorP.model.vo.Attachment;
import com.kh.spring.errorP.model.vo.ErrorP;

@Repository
public class ErrorPDAOImpl implements ErrorPDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectErrorPList(int cPage, int numPerPage, String key, String word) {
		// 데이터베이스에서 특정 갯수의 행만 가져오는 객체
				RowBounds rows = new RowBounds((cPage - 1)* numPerPage, numPerPage);
				Utils utils = new Utils(key, word);
				return sqlSession.selectList("errorPSQL.selectErrorPList", utils, rows);
	}

	@Override
	public int selectErrorPTotalContents(String key, String word) {
		Utils utils = new Utils(key, word);
		return sqlSession.selectOne("errorPSQL.selectErrorPTotalContents", utils);
	}
	
	@Override
	public int checkErrorP(String procode) {
		
		return sqlSession.selectOne("errorPSQL.checkErrorP",procode);
	}

	@Override
	public int insertErrorP(ErrorP errorP) {
		
		return sqlSession.insert("errorPSQL.insertErrorP", errorP);
	}
	
	@Override
	public int updateCount(ErrorP errorP) {
		
		return sqlSession.update("errorPSQL.updateCount",errorP);
	}


	@Override
	public int insertAttachment(Attachment a) {
		
		return sqlSession.insert("errorPSQL.insertAttachment", a);
		
	}

	@Override
	public ErrorP selectOneErrorP(int errorpNo) {
		
		return sqlSession.selectOne("errorPSQL.selectOneErrorP", errorpNo);
	}

	@Override
	public List<Attachment> selectAttachmentList(int errorpNo) {
		
		return sqlSession.selectList("errorPSQL.selectAttachmentList", errorpNo);
	}

	@Override
	public int updateErrorP(ErrorP errorP) {
		
		return sqlSession.update("errorPSQL.updateErrorP", errorP);
		
	}

	@Override
	public int updateAttachment(Attachment a) {
		
		return sqlSession.update("errorPSQL.updateAttachment", a);
	}

	@Override
	public void deleteErrorP(ErrorP errorP) {
		
		sqlSession.delete("errorPSQL.deleteErrorP", errorP);
	}

	@Override
	public int deleteAttachment(int errorpNo) {
		 
		return sqlSession.delete("errorPSQL.deleteAttachment", errorpNo);
	}

	@Override
	public int deleteFile(int attNo) {
		
		return sqlSession.delete("errorPSQL.deleteFile", attNo);
	}
	
	@Override
	public void AlldeleteErrorP() {
		
		sqlSession.delete("errorPSQL.AlldeleteErrorP");
		
	}

	@Override
	public List<Map<String, String>> selectProCodeList(int cPage, int numPerPage, String key, String word) {
		RowBounds rows = new RowBounds((cPage - 1)* numPerPage, numPerPage);
		Utils utils = new Utils(key, word);
		return sqlSession.selectList("errorPSQL.selectProCodeList", utils, rows );
	}

	@Override
	public int selectProCodeTotalContents(String key, String word) {
		
		Utils utils = new Utils(key, word);
		return sqlSession.selectOne("errorPSQL.selectProCodeTotalContents", utils);
	}

}
