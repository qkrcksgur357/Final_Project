package com.kh.spring.AS.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.AS.model.vo.AS;
import com.kh.spring.common.Utils;
import com.kh.spring.pd.model.vo.PdVo;

@Repository
public class ASDAOImpl implements ASDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectASList(int cPage, int numPerPage, String key, String word) {

		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		Utils utils = new Utils(key, word);

		return sqlSession.selectList("asSQL.selectASList", utils, rows);
	}

	@Override
	public int selectTotalAS(String key, String word) {

		Utils utils = new Utils(key, word);

		return sqlSession.selectOne("asSQL.selectTotalAS", utils);
	}

	@Override
	public AS selectOneAS(int asCode) {

		return sqlSession.selectOne("asSQL.selectOneAS", asCode);
	}

	@Override
	public int updateAS(AS as) {

		return sqlSession.update("asSQL.updateAS", as);
	}

	@Override
	public int deleteAS(int asCode) {

		return sqlSession.delete("asSQL.deleteAS", asCode);
	}

	@Override
	public PdVo productInfo(String proCode) {

		return sqlSession.selectOne("asSQL.productInfo", proCode);
	}

}
