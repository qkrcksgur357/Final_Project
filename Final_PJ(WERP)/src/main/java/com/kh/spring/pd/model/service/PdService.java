package com.kh.spring.pd.model.service;

import java.util.List;


import com.kh.spring.pd.model.vo.PdVo;

public interface PdService {

	/* 상품 등록 */
	/*public int pdEnroll(PdVo pd);*/

	// 
	
	int insertPd(PdVo pd);

	int pdEnroll(PdVo pd);

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
