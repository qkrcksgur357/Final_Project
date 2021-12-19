package com.kh.spring.pd.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.pd.model.vo.PdVo;

@Repository
public class PdDAOimpl implements PdDAO{
	

	
	//매퍼
	private static String namespace = "pdSQL";
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertPd(PdVo pd) {
		return sqlSession.insert("pdSQL.insertPd", pd);
	}

	@Override
	public List<PdVo> pdlist() throws Exception {
		return sqlSession.selectList("pdSQL.pdlist");
	}
	
	
	
	// 품목 조회
	@Override
	public PdVo pdView(String procode) throws Exception {
		return sqlSession.selectOne("pdSQL.pdview", procode);
	}
	
	// 품목 수정 view
	@Override
	public PdVo pdModify(String procode) throws Exception {
		
		System.out.println(procode);
		return sqlSession.selectOne("pdSQL.pdview", procode);
	}
	
	// 품목 수정 update
	@Override
	public int pdUpdate(PdVo pd) throws Exception {
		return sqlSession.update("pdSQL.pdModify", pd);
	}
	
	// 품목 삭제
	@Override
	public int pdDelete(String procode) {
		return sqlSession.delete("pdSQL.pdDelete", procode);
	}
}
