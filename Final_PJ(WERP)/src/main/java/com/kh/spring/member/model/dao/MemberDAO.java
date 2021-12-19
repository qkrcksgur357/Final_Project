package com.kh.spring.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.spring.member.model.vo.Member;

public interface MemberDAO {

	int insertMember(Member member);
	
	Member selectOneMember(String userId);
	
	int updateMember(Member member);
	
	int deleteMember(String userId);

	int checkIdDuplicate(HashMap<String, Object> hmap);
	
	int checkIdDuplicate(String userId);
	
	List<Map<String, String>> selectMemberIList(int cPage, int numPerPage, String key,String word);

	int selectMemberTotalContents(String key, String word);
}
