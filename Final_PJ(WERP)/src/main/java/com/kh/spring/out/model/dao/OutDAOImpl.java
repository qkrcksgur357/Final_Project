package com.kh.spring.out.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.in.model.vo.InManagement;
import com.kh.spring.out.model.vo.OutManagement;
import com.kh.spring.pd.model.vo.PdVo;

@Repository
public class OutDAOImpl implements OutDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertOut(PdVo pd) {
		
		return sqlSession.insert("outSQL.insertOut", pd);
	}

	@Override
	public List<Map<String, String>> selectoutList(int cPage, int numPerPage) {
		// 데이터베이스에서 특정 갯수의 행만 가져오는 객체
		RowBounds rows = new RowBounds((cPage - 1 ) * numPerPage, numPerPage);
		return sqlSession.selectList("outSQL.selectoutList",null,rows);
	}

	@Override
	public int selectTotalOut() {
		
		return sqlSession.selectOne("outSQL.selectTotalOut");
	}

	@Override
	   public int updateStock(PdVo pd) {
	      
	      return sqlSession.update("outSQL.updateStock", pd);
	   }
	 
	@Override
	public OutManagement updateView(String outcode) {
		
		return sqlSession.selectOne("outSQL.updateView", outcode);
	}

	@Override
	public List<String> getProCodeList() {
		
		return sqlSession.selectList("outSQL.getProCodeList");
	}


	@Override
	public PdVo selectOneOutManagement(String procode) {
		
		return sqlSession.selectOne("outSQL.selectOneOutManagement", procode);
	}

	@Override
	public int updateComback(PdVo pd) {
		
		return sqlSession.update("outSQL.updateComback", pd);
	}

	@Override
	public int deleteList(PdVo pd) {
		
		return sqlSession.delete("outSQL.deleteList", pd);
	}
	

	




}
