package com.kh.spring.in.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.in.model.dao.InDAO;
import com.kh.spring.in.model.vo.InManagement;
import com.kh.spring.pd.model.vo.PdVo;

@Service
public class InServiceImpl implements InService {

	@Autowired
	InDAO inDAO;
	
	@Override
	public List<Map<String, String>> selectinList(int cPage, int numPerPage) {
		
		return inDAO.selectinList(cPage, numPerPage);
	}

	@Override
	public int selectTotalIn() {
		
		return inDAO.selectTotalIn();
	}

	@Override
	public int updateStock(PdVo pd) {
		
		// 입고 처리
		int result = inDAO.insertIn(pd);
		
		if( result > 0) {
			// 재고 증가
			result = inDAO.updateStock(pd);
		} else {
			 result = 0;
		}
		return result;
	}

	

	@Override
	public List<String> getProCodeList() {
		
		return inDAO.getProCodeList();
	}

	@Override
	public PdVo selectOneInManagement(String procode) {
	
		return inDAO.selectOneInManagement(procode);
	}

	@Override
	public int deleteList(PdVo pd) {
		
		// 재고 복귀
		int result = inDAO.updateComback(pd);
				
		if( result > 0) {
			// 리스트 삭제
			result = inDAO.deleteList(pd);
		} else {
			result = 0;
		}
				
		return result;
	}


}