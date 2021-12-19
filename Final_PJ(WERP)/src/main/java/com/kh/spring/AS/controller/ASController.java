package com.kh.spring.AS.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.AS.model.service.ASService;
import com.kh.spring.AS.model.vo.AS;
import com.kh.spring.common.Utils;
import com.kh.spring.pd.model.vo.PdVo;

@Controller
public class ASController {
   
   @Autowired
   ASService asService;
   
   // AS 조회 페이지 이동 및 조회 메소드
   @RequestMapping("/AS/ASReceipt.do")
   public String selectASList(
         @RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
         @RequestParam(value= "key", required=false, defaultValue="") String key,
         @RequestParam(value= "word", required=false, defaultValue="") String word,
         Model model) {
      
      int numPerPage = 10;
      
      List<Map<String, String>> list = asService.selectASList(cPage, numPerPage, key, word);
      
      System.out.println("key : " + key);
      System.out.println("word : " + word);
      
      // 전체 AS 수 조회
      int totalAS = asService.selectTotalAS(key, word);
      
      String pageBar = Utils.getPageBar(totalAS, cPage, numPerPage, "ASReceipt.do", key, word);

      model.addAttribute("list", list);
      model.addAttribute("totalAS", totalAS);
      model.addAttribute("numPerPage", numPerPage);
      model.addAttribute("pageBar", pageBar);
      model.addAttribute("key", key);
      model.addAttribute("word", word);
     
      // System.out.println("totalAS : " + totalAS);
      
      return "AS/ASReceipt";
   }
   
   // AS 상세 조회 페이지 이동 메소드
   @RequestMapping("/AS/ASView.do")
   public String viewAS(@RequestParam int asCode, Model model) {
         
      AS as = asService.selectOneAS(asCode);      
      
      model.addAttribute("AS", as);
      
      System.out.println("AS : " + as);
      
      return "AS/ASView";
   }
   
   // AS 수정 메소드
   @RequestMapping("/AS/updateAS.do")
   public String updateStage(AS as, String stage, Date date, Model model) {
      
      System.out.println("asCode : " + as.getAsCode());
      
      as.setAsStage(stage);
      as.setAsExpectedDate(date);
      
      int result = asService.updateAS(as);   
      
      // System.out.println("stage : " + stage);
      
      if(result > 0) {
         System.out.println("수정 성공");
      } else {
         System.out.println("수정 실패");
      }
      
      return "redirect:/AS/ASReceipt.do";      
   }
   
   // AS 삭제 메소드
   @RequestMapping("/AS/deleteAS.do")
   public String deleteAS(@RequestParam int asCode, Model model) {
      
      int result = asService.deleteAS(asCode);     
      
      System.out.println("asCode : " + asCode);
      
      if(result > 0) {
         System.out.println("삭제 성공");
      } else {
         System.out.println("삭제 실패");
      }
      
      return "redirect:/AS/ASReceipt.do";
   }      
   
   // 상품 정보 조회
   @RequestMapping("AS/productInfo.do")
   public String productInfo(@RequestParam String proCode, @RequestParam int asCode, Model model) {
      
      PdVo pdvo = asService.productInfo(proCode);
      
      String msg = "상품명 : " + pdvo.getProname() + 
                   "  카테고리 : " + pdvo.getCategory() + 
                   "  재고수량 : " + pdvo.getStock();
      String loc = "/AS/ASView.do?asCode="+asCode;
      
      model.addAttribute("PdVo", pdvo);
      model.addAttribute("msg", msg);
      model.addAttribute("loc", loc);
      
      return "common/msg";
   }
   
   
}