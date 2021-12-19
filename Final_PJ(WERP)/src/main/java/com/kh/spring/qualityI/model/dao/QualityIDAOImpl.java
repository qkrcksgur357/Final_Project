package com.kh.spring.qualityI.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.Utils;
import com.kh.spring.qualityI.model.vo.QualityI;

@Repository
public class QualityIDAOImpl implements QualityIDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectQualityIList(int cPage, int numPerPage, String key, String word) {
		// 데이터베이스에서 특정 갯수의 행만 가져오는 객체
				RowBounds rows = new RowBounds((cPage - 1)* numPerPage, numPerPage);
				Utils utils = new Utils(key, word);
				return sqlSession.selectList("qualityISQL.selectQualityIList", utils, rows);
	}

	@Override
	public int selectQualityITotalContents(String key, String word) {
		Utils utils = new Utils(key, word);
		return sqlSession.selectOne("qualityISQL.selectQualityITotalContents", utils);
	}
	
	@Override
	public int insertQualityI(QualityI qualityI) {
		
		return sqlSession.insert("qualityISQL.insertQualityI", qualityI);
	}
	
	@Override
	public int updateCount(QualityI qualityI) {
		
		return sqlSession.update("qualityISQL.updateCount",qualityI);
	}

	@Override
	public QualityI selectOneQualityI(int qualityiNo) {
		
		return sqlSession.selectOne("qualityISQL.selectOneQualityI", qualityiNo);
	}

	@Override
	public int updateQualityI(QualityI qualityI) {
		
		return sqlSession.update("qualityISQL.updateQualityI", qualityI);
		
	}

	@Override
	public int deleteQualityI(QualityI qualityI) {
		
		return sqlSession.delete("qualityISQL.deleteQualityI", qualityI);
	}
	
	@Override
	public void AlldeleteQualityI() {
		
		sqlSession.delete("qualityISQL.AlldeleteQualityI");
		
	}


}
