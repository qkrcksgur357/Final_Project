package com.kh.spring.pd.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.pd.model.service.PdService;

import com.kh.spring.pd.model.vo.PdVo;


@Controller
public class PdController {

	// private static final Logger logger = (Logger) LoggerFactory.getLogger(PdController.class);

	@Autowired
	private PdService pdService;
	
	/* 상품 등록 페이지 접속 */
	@RequestMapping(value = "/pd/pdManage", method = RequestMethod.GET)
	public String pdManageGET() throws Exception{
		// logger.info("상품 등록 페이지 접속");
		
		
		
		return "pd/pdView";
	}
	
    /* 상품 등록 */
	@RequestMapping("/pd/pdEnroll")
	public String pdPOST(PdVo pd,
			@RequestParam String inputdateStr, RedirectAttributes rttr) throws Exception {
		
		pd.setInputdate(Date.valueOf(inputdateStr));
		System.out.println(pd);
		
		pdService.pdEnroll(pd);
		
		rttr.addFlashAttribute("enroll_result", pd.getProname());
		
		
		
		return "redirect:/pd/pdManage";
	}
	
	
	
	
	
	/* 상품 목록 */
	@RequestMapping(value = "/pd/list", method = RequestMethod.GET)
	public void getPdList(Model model) throws Exception {
		
		List<PdVo> list = pdService.pdlist();
		
		model.addAttribute("list", list);
	}
	

	
	
	/* 품목 조회 */
	@RequestMapping(value = "/pd/view", method = RequestMethod.GET)
	public void getPdView(@RequestParam("n") String procode, Model model) throws Exception {
		
		
		PdVo pd1 = pdService.pdView(procode);
		
		model.addAttribute("pd", pd1);
	}
	
	/* 품목 수정 view */
	@RequestMapping(value = "/pd/modify", method = {RequestMethod.POST, RequestMethod.GET})
	public void PdModify(PdVo pd, @RequestParam("n") String procode, Model model) throws Exception {
		
		
		
		System.out.println(pd);
		
		PdVo pd2 = pdService.pdView(procode);
		
		model.addAttribute("pd", pd2);

		
	}
	
	
	
	/* 품목 수정 update */
	@RequestMapping(value = "/pd/pdUpdate", method = RequestMethod.POST)
	public String pdUpdate(PdVo pd, @RequestParam  String inputdateStr, HttpServletRequest request, Model model) throws Exception {
		
		
		
		pd.setInputdate(Date.valueOf(inputdateStr));
		
		
		int result = pdService.pdUpdate(pd);
		
		String loc = "/pd/view";
		String msg = "";
		
		if( result > 0) {
			msg = " 품목 수정 성공!";
			
		} else {
			msg = " 품목 수정 실패! ";
			
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return loc;
		
	}
	
	/* 품목 삭제 */
	@RequestMapping(value = "/pd/delete")
	public String pdDelete(@RequestParam String n, HttpServletRequest request, Model model) throws Exception {
		
		int result = pdService.pdDelete(n);
		
		String loc = "/pd/view";
		String msg = "";
		
		if( result > 0) {
			msg = "삭제 완료!";
			
		} else {
			msg = "삭제 실패!";
		}
		
		model.addAttribute("lod", loc);
		model.addAttribute("msg", msg);
		
		return loc;
	}
}






