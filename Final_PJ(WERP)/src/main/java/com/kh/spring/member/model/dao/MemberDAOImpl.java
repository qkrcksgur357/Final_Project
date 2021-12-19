package com.kh.spring.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.Utils;
import com.kh.spring.member.model.vo.Member;


@Repository
public class MemberDAOImpl implements MemberDAO {
	
	// 사용할 sqlSession 의존성 주입을 위함
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member member) {
		return  sqlSession.insert("memberSQL.insertMember",member);
		
	}
	@Override
	public Member selectOneMember(String userId) {
		
		return sqlSession.selectOne("memberSQL.selectOneMember",userId);
	}
	@Override
	public int updateMember(Member member) {
		
		return sqlSession.update("memberSQL.updateMember",member);
	}

	@Override
	public int deleteMember(String userId) {
		return sqlSession.delete("memberSQL.deleteMember",userId);
	}
	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		System.out.println("[실행 전 ::] "+ hmap);
		sqlSession.selectOne("memberSQL.checkIdDuplicate",hmap);
		System.out.println("[실행 후 ::]" + hmap);
		return (Integer)hmap.get("result");
	}

	@Override
	public int checkIdDuplicate(String userId) {
		return sqlSession.selectOne("memberSQL.checkIdDuplicate", userId);
	}
	@Override
	public List<Map<String, String>> selectMemberIList(int cPage, int numPerPage, String key, String word) {
		RowBounds rows = new RowBounds((cPage - 1)* numPerPage, numPerPage);
		Utils utils = new Utils(key, word);
		return sqlSession.selectList("memberSQL.selectMemberList", utils, rows);
	}
	@Override
	public int selectMemberTotalContents(String key, String word) {
		Utils utils = new Utils(key, word);
		return sqlSession.selectOne("qualityISQL.selectQualityITotalContents", utils);
	}
}