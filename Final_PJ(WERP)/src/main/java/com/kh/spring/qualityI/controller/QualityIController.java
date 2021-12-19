package com.kh.spring.qualityI.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.kh.spring.common.Utils;
import com.kh.spring.errorP.model.vo.Attachment;
import com.kh.spring.errorP.model.vo.ErrorP;
import com.kh.spring.qualityI.model.service.QualityIService;
import com.kh.spring.qualityI.model.vo.QualityI;

@Controller
public class QualityIController {
	
	@Autowired
	QualityIService qualityIService;

	@RequestMapping("/qualityI/qualityIList.do")
	public String selectqualityIList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value= "key", required=false, defaultValue="") String key,
			@RequestParam(value= "word", required=false, defaultValue="") String word,
			Model model	
			) {
		
		// 한 페이지당 게시글 수
		int numPerPage = 10;
		
		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = qualityIService.selectQualityIList(cPage, numPerPage, key, word);
		
		// 전체 게시글 수
		int totalContents = qualityIService.selectQualityITotalContents(key,word);
		
		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "qualityIList.do", key, word);	
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("key", key);
		model.addAttribute("word", word);
		
		System.out.println(model);
		return "qualityI/qualityIList";
		
	}
	
	
	
	
	@RequestMapping("/qualityI/qualityIForm.do")
	public String qualityIForm() { // 글쓰기 메소드!
		
		return "qualityI/qualityIForm";
	}
	

		
		
	@RequestMapping("/qualityI/qualityIFormEnd.do")
	public String insertqualityI(QualityI qualityI, Model model,			
							  HttpServletRequest request, HttpServletRequest req,
							  @RequestParam(value="upFile", required=false) MultipartFile[] upFiles)
												{
		
		
		
		// 6. 게시글 DB에 등록
		int result = qualityIService.insertQualityI(qualityI);
		
		String loc = "/qualityI/qualityIList.do";
		String msg = "";
		
			
			
		if( result > 0 ) {
			msg = "등록 완료";
			System.out.println(loc + "/" + msg);
		} else {
			msg = "등록 실패";
		}
	
		
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg1";
	}
	

	
	@RequestMapping("/qualityI/qualityIView.do")
	public String qualityIView(@RequestParam int qualityiNo, Model model) {
		
		QualityI qualityI = qualityIService.selectOneQualityI(qualityiNo);
		
		model.addAttribute("qualityI", qualityI);
		model.addAttribute("attachmentList");
		
		return "qualityI/qualityIView";
	}
	
	
	@RequestMapping("/qualityI/qualityIUpdateView.do")
	public String qualityIUpdateView(@RequestParam int qualityiNo, Model model) {
		
		QualityI qualityI = qualityIService.updateView(qualityiNo);
		model.addAttribute("qualityI", qualityI);
		return "qualityI/qualityIUpdateView";		
	}
	
	@RequestMapping("/qualityI/qualityIUpdate.do")
	public String qualityIUpdate(QualityI qualityI, HttpServletRequest request, Model model
						)  
							  {
		// 1. 원본 게시글 불러와 수정하기
		int qualityiNo = qualityI.getQualityiNo();
		
		QualityI originBoard = qualityIService.updateView(qualityiNo);
		
		originBoard.setManager( qualityI.getManager() );
		originBoard.setProcode( qualityI.getProcode() );
		originBoard.setProname( qualityI.getProname() );
		originBoard.setQualityiCount( qualityI.getQualityiCount() );
		originBoard.setState( qualityI.getState() );
	
		
		int result = qualityIService.updateQualityI(originBoard);  // 서비스 찾아가서 마저 구현해주기
		
		String loc = "/qualityI/qualityIView.do?qualityiNo="+qualityiNo;
		String msg = "";
		
		if( result > 0 ) {
			msg = "수정 완료";
		} else {
			msg = "수정 실패";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg1";
	}

	
	
	@ResponseBody
	@RequestMapping("/qualityI/qualityIDelete.do")
	public void qualityIDelete(
									@RequestParam(value="cchk[]") List<String> qualityiNo,
									QualityI qualityi,
									HttpServletRequest request) {																																														
		
		
		
		int result = 0;
		int qualityiNoNum= 0;
		
		// 첨부파일삭제 명단
				for(String i : qualityiNo) {
				// 게시글 삭제
					qualityiNoNum = Integer.parseInt(i);
					qualityi.setQualityiNo(qualityiNoNum);
					qualityIService.deleteQualityI(qualityi);
				
				}	
			
		
					
	}
	
	@ResponseBody
	@RequestMapping("/qualityI/qualityIAlldelete.do")
	public void qualityIAllDelete (HttpServletRequest request) {
			
		qualityIService.AlldeleteQualityI();
		
		
	}
	
	
	
	
	

	
}