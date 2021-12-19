package com.kh.spring.out.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.common.Utils;
import com.kh.spring.in.model.vo.InManagement;
import com.kh.spring.out.model.service.OutService;
import com.kh.spring.out.model.vo.OutManagement;
import com.kh.spring.pd.model.vo.PdVo;

@Controller
public class OutController {

	@Autowired
	OutService OutService;

	// 출고 등록 페이지 이동
	@RequestMapping("/out/out_form.do")
	public String OutManagement(Model model, @RequestParam(required = false, defaultValue = "null") String searchcode) {
		System.out.println("출고관리 접근확인!");

		// 품목코드 가져오기
		List<String> proCodeList = OutService.getProCodeList();

		// 품목코드 선택 값 가져오기
		PdVo selectOneOutManagement = OutService.selectOneOutManagement(searchcode);
		System.out.println("searchcode 확인 : " + searchcode);

		System.out.println("proCodeList : " + proCodeList);
		System.out.println("selectOneOutManagement : " + selectOneOutManagement);

		model.addAttribute("proCodeList", proCodeList);
		model.addAttribute("PdVo", selectOneOutManagement);

		return "out/out_form";
	}

	// 출고 수정(수량)
	@RequestMapping("/out/outUpdate.do")
	public String updateOutManagement(String procode, int stock, int outNum, Model model) {

		// System.out.println("setStock : " + pd.getStock());

		PdVo pdvo = new PdVo();
			
		pdvo.setOutNum(outNum);
		pdvo.setProcode(procode);
		
		if (outNum < stock) {
			// 입력한 수량이 재고 수량보다 적으면
			int result = OutService.updateStock(pdvo);

		} else {
			String loc = "/out/outView.do";
			String msg = "입력한 수량이 재고 수량을 초과했습니다.";

			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);

			return "common/msg";
		}

		return "redirect:/out/outView.do";
	}

	// 출고 현황 조회 페이지
	@RequestMapping("/out/outView.do")
	public String selectoutList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {

		// 한 페이지당 게시글 수
		int numPerPage = 10;

		// 현재 페이지의 게시글 수
		List<Map<String, String>> outlist = OutService.selectoutList(cPage, numPerPage);

		// 전체 게시글 수
		int totalOut = OutService.selectTotalOut();

		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalOut, cPage, numPerPage, "outView.do");

		model.addAttribute("outlist", outlist);
		model.addAttribute("totalOut", totalOut);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		System.out.println("totalOut : " + totalOut);
		System.out.println("pageBar : " + pageBar);

		return "out/outView";
	}

	// 출고 등록 수정 조회 페이지
	@RequestMapping("/out/outUpdateView.do")
	public String updateList(String outcode, Model model) {

		OutManagement originoutNum = OutService.updateView(outcode);

		model.addAttribute("originoutNum", originoutNum);

		return "out/outUpdateView";
	}

	// 출고 등록 삭제 
	@RequestMapping("/out/outDelete.do")
	public String deleteInManagement(String procode, int outcode, int outNum, Model model) {

		 PdVo pdvo = new PdVo();
		 
		 pdvo.setProcode(procode);
		 pdvo.setOutNum(outNum);
		 pdvo.setOutcode(outcode);
		 
		int result = OutService.deleteList(pdvo);
	
		System.out.println("procode" + procode);
		System.out.println("outNum: " + outNum);
		System.out.println("outcode: " + outcode);
		
		if( result > 0 ) {
			System.out.println("삭제 성공!");
		} else {
			System.out.println("삭제 실패!");
		}
		
		
		return "redirect:/out/outView.do";
	}

}