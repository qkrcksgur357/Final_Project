package com.kh.spring.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDAO;
import com.kh.spring.member.model.vo.Member;


//@Service :  MemberService Interface를 구현한 
//                   MemberServiceImpl 파일을 Service로 처리 . 

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int insertMember(Member member) {
		return memberDAO.insertMember(member);
	}
	@Override
	public Member selectOneMember(String userId) {
		return memberDAO.selectOneMember(userId);
	}
	@Override
	public int updateMember(Member member) {
		return memberDAO.updateMember(member);
	}
	@Override
	public int deleteMember(String userId) {
		return memberDAO.deleteMember(userId);
	}
	@Override
	public int checkIdDuplicate(String userId) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("userId", userId);
		return memberDAO.checkIdDuplicate(hmap);
	}
	
	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage, String key, String word) {
		
		return memberDAO.selectMemberIList(cPage, numPerPage, key, word);
	}
	@Override
	public int selectMemberTotalContents(String key, String word) {
		
		return memberDAO.selectMemberTotalContents(key,word);
	}
}
