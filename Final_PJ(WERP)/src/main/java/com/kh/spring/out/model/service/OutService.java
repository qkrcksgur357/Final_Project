package com.kh.spring.out.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.out.model.vo.OutManagement;
import com.kh.spring.pd.model.vo.PdVo;

public interface OutService {
	
	
	List<Map<String, String>> selectoutList(int cPage, int numPerPage);

	List<String> getProCodeList();
	
	PdVo selectOneOutManagement(String procode);
	
	int updateStock(PdVo pd);
	
	int selectTotalOut();

	OutManagement updateView(String outcode);
	
	int deleteList(PdVo pd);
	
}
