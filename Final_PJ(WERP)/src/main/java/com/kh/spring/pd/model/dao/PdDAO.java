package com.kh.spring.pd.model.dao;

import java.util.List;


import com.kh.spring.pd.model.vo.PdVo;

public interface PdDAO {

	int insertPd(PdVo pd);

	
	// 품목 목록
	public List<PdVo> pdlist() throws Exception;
	
	// 품목 조회
	public PdVo pdView(String procode) throws Exception;
	
	// 품목 수정 view
	public PdVo pdModify(String procode) throws Exception;


	// 품목 수정 update
	int pdUpdate(PdVo pd) throws Exception;
	
	// 품목 삭제
	public int pdDelete(String procode) throws Exception;


	

}
