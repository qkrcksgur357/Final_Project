package com.kh.spring.out.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.out.model.vo.OutManagement;
import com.kh.spring.pd.model.vo.PdVo;

public interface OutDAO {
	
	int insertOut(PdVo pd);
	
	List<Map<String, String>> selectoutList(int cPage, int numPerPage);

	List<String> getProCodeList();
	
	PdVo selectOneOutManagement(String procode);
	
	int updateStock(PdVo pd);
	
	int selectTotalOut();

	OutManagement updateView(String outcode);
	
	int updateComback(PdVo pd);
	
	int deleteList(PdVo pd);

}
