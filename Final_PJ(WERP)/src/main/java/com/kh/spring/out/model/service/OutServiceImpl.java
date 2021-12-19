package com.kh.spring.out.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.out.model.dao.OutDAO;
import com.kh.spring.out.model.vo.OutManagement;
import com.kh.spring.pd.model.vo.PdVo;


@Service
public class OutServiceImpl implements OutService {
	@Autowired
	OutDAO outDAO;
	

	@Override
	public List<Map<String, String>> selectoutList(int cPage, int numPerPage) {
		
		return outDAO.selectoutList(cPage, numPerPage);
	}

	@Override
	public int selectTotalOut() {
		
		return outDAO.selectTotalOut();
	}

	@Override
	   public int updateStock(PdVo pd) {
		  // 출고 처리
		  int result = outDAO.insertOut(pd);
		  
		  if(result > 0) {
			  // 재고 감소
			  result = outDAO.updateStock(pd);
		  } else {
			  result = 0;
		  }
		  
	     return result;
	   }
	

	@Override
	public OutManagement updateView(String outcode) {
		
		return outDAO.updateView(outcode);
	}
	

	@Override
	public List<String> getProCodeList() {
		
		return outDAO.getProCodeList();
	}


	@Override
	public PdVo selectOneOutManagement(String procode) {
		
		return outDAO.selectOneOutManagement(procode);
	}

	
	@Override
	public int deleteList(PdVo pd) {
		
		// 재고 복귀
		int result = outDAO.updateComback(pd);
				
		if( result > 0) {
			// 리스트 삭제
			result = outDAO.deleteList(pd);
		} else {
			result = 0;
		}
				
		return result;
	}





	
}
