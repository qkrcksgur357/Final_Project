package com.kh.spring.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member member);

	Member selectOneMember(String userId);
	
	int updateMember(Member member);
	
	int deleteMember(String userId);

	int checkIdDuplicate(String userId);

	List<Map<String, String>> selectMemberList(int cPage, int numPerPage, String key, String word);

	int selectMemberTotalContents(String key, String word);
}
