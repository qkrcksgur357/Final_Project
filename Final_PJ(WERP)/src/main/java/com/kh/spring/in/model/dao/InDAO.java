package com.kh.spring.in.model.dao;


import java.util.List;
import java.util.Map;

import com.kh.spring.in.model.vo.InManagement;
import com.kh.spring.pd.model.vo.PdVo;


public interface InDAO {
	

	int insertIn(PdVo pd);
	
	List<Map<String, String>> selectinList(int cPage, int numPerPage);

	List<String> getProCodeList();
	
	PdVo selectOneInManagement(String procode);
	
	int selectTotalIn();
	
	int updateStock(PdVo pd);
	
	int updateComback(PdVo pd);
	
	int deleteList(PdVo pd);

	
}