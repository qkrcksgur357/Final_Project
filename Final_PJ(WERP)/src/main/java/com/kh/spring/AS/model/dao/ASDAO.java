package com.kh.spring.AS.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.AS.model.vo.AS;
import com.kh.spring.pd.model.vo.PdVo;

public interface ASDAO {

	List<Map<String, String>> selectASList(int cPage, int numPerPage, String key, String word);

	int selectTotalAS(String key, String word);

	AS selectOneAS(int asCode);

	int updateAS(AS as);

	int deleteAS(int asCode);
	

	PdVo productInfo(String proCode);

}
