package com.kh.spring.AS.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.AS.model.dao.ASDAO;
import com.kh.spring.AS.model.vo.AS;
import com.kh.spring.pd.model.vo.PdVo;

@Service
public class ASServiceImpl implements ASService {
   
   @Autowired
   ASDAO asDAO;

   @Override
   public List<Map<String, String>> selectASList(int cPage, int numPerPage, String key, String word) {
      
      return asDAO.selectASList(cPage, numPerPage, key, word);
   }

   @Override
   public int selectTotalAS(String key, String word) {
      
      return asDAO.selectTotalAS(key, word);
   }

   @Override
   public AS selectOneAS(int asCode) {
      
      return asDAO.selectOneAS(asCode);
   }

   @Override
   public int updateAS(AS as) {
      
      return asDAO.updateAS(as);
   }
   
   @Override
   public int deleteAS(int asCode) {
      
      return asDAO.deleteAS(asCode);
   }
   
   @Override
   public PdVo productInfo(String proCode) {

      return asDAO.productInfo(proCode);
   }

}