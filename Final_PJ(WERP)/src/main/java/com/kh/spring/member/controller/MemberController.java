package com.kh.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.spring.common.Utils;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;


@Controller
@SessionAttributes({"member"})
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder; 	
	
	@RequestMapping("/enroll.do")
	public String MemberEnroll() {
		
		return "member/enroll";
	}
	
	@RequestMapping("/enrollEnd.do")
	public String MemberEnrollEnd(Member member , Model model,SessionStatus status) {
		// password crypt
		System.out.println(member);
		String pass1 = member.getUserPwd();// base password
		String pass2 = bcryptPasswordEncoder.encode(pass1); //encoded password
		
		member.setUserPwd(pass2);
		
		String phone = member.getPhone();
	
		String str1,str2,str3;
		str1= phone.substring(0, 3);
		str1= str1.concat("-");
		str2=phone.substring(3,7);
		str2=str2.concat("-");
		str3=phone.substring(7,phone.length());
		
		phone=str1.concat(str2.concat(str3));
		member.setPhone(phone);
		String loc= "/"; // welcome-file
		String msg="";
		
		//1. 서비스로 비즈니스(업무) 로직 수행하기
		
				try{
					int result = memberService.insertMember(member);
					
					//2. 처리결과에 따른 화면 처리
					
					
					
					if(result >0) {
						msg ="회원 가입 성공!";
						//가입후 생긴 session 종료
						status.setComplete();
					}else {
					
						msg="회원 가입 실패!";
					}
					
					
				}catch(Exception e) {
					msg="회원 가입 실패!";
					System.out.println("회원 가입시 에러 발생");
					status.setComplete();
					System.out.println(e.getMessage());
					
				}
				model.addAttribute("loc",loc);
				model.addAttribute("msg",msg);
				
			return "common/msg";
	}
	
	@RequestMapping("/member/memberList.do")
	public String memberList(@RequestParam (value="cPage", required=false, defaultValue="1") int cPage, 
											@RequestParam(value= "key", required=false, defaultValue="") String key,
											@RequestParam(value= "word", required=false, defaultValue="") String word,
												Model model) {
		
				// 한 페이지당 게시글 수
				int numPerPage = 7;
				
				// 현재 페이지의 게시글 수
				List<Map<String, String>> list = memberService.selectMemberList(cPage, numPerPage, key, word);
										
				// 전체 게시글 수
				int totalContents = memberService.selectMemberTotalContents(key, word);
				
				// 페이지 처리 Utils 사용하기
				String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "memberList.do", key, word);	
				
				model.addAttribute("list", list);
				model.addAttribute("totalContents");
				model.addAttribute("numPerPage", numPerPage);
				model.addAttribute("pageBar", pageBar);
				model.addAttribute("key", key);
				model.addAttribute("word", word);
				
				System.out.println(model);
				return "member/memberList";
		

	}
	
	@RequestMapping("/Login.do")
	public String memberLogin(@RequestParam String userId,
													@RequestParam String userPwd,
													Model model) {
	
		System.out.println("로그인 기능 접근확인!");
		// 1. 아이디를 통한 정보 가져오기
		Member result = memberService.selectOneMember(userId);
		
		String loc="/";
		String msg ="";
		
		if(result !=null)
		{
			if (bcryptPasswordEncoder.matches(userPwd, result.getUserPwd())) {
				//bcrypt에서 비교를 위한 메소드를 제공해줌.
				
				msg ="로그인 성공!";
				loc="/index.do";
				model.addAttribute("member",result);
		
				//model은 기본적으로 객체를 request 영역에 저장함.
				//@SessionAttributes 어노테이션을 통해 세선에 저장가능
				
			}else {
				msg="비밀번호가 일치하지 않습니다,";
			}
			
		}else {
			msg = "존재 하지 않는 아이디 입니다.!";
		}
		
		model.addAttribute("loc",loc);
		model.addAttribute("msg",msg);
		return "common/msg";
	}
	
	@RequestMapping("/Logout.do")
	public String memberLogout(SessionStatus status) {
		
		if(!status.isComplete()){
			status.setComplete();
		}
		return "redirect:/";
	}
	
	@RequestMapping("/memberView.do")
	public String memberView(@RequestParam String userId,Model model) {
		
		Member result = memberService.selectOneMember(userId);

		model.addAttribute("member",result);
		
		return "member/memberView";
	}
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(Member member,Model model,SessionStatus status) {
		System.out.println("[before]"+member);
		
		String pass1 = member.getUserPwd();// base password
		String pass2 = bcryptPasswordEncoder.encode(pass1); //encoded password
		
		member.setUserPwd(pass2);
		
		String phone = member.getPhone();
		if(phone.length()>11) {
			member.setPhone(phone);
		}else{
			String str1,str2,str3;
			str1= phone.substring(0, 3);
			str1= str1.concat("-");
			str2=phone.substring(3,7);
			str2=str2.concat("-");
			str3=phone.substring(7,phone.length());
			
			phone=str1.concat(str2.concat(str3));
			member.setPhone(phone);
		}
		
		
		System.out.println("[After]"+member);
		try {
			int result = memberService.updateMember(member);
			
			String loc="/";
			String msg="";
			
			if(result>0) {
				loc="/index.do";
				msg="회원정보 수정 완료! 재로그인 해 주세요!";
				model.addAttribute("member",member);
				status.setComplete();
			}else {
				msg="회원정보 수정 실패!";
			}
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
		}catch(Exception e) {
			System.out.println("회원정보 수정 에러 발생");
			System.out.println(e.getMessage());
		}
		return "common/msg";
	}
	@RequestMapping("/memberDelete.do")
	public String memberDelete(Member member , SessionStatus status, Model model){
		
		//1. 탈퇴할 회원 아이디
		//2 탈퇴한 회원 로그아웃
		int result = memberService.deleteMember(member.getUserId());
	
	String loc="/";
	String msg="";
	
	if(result>0) {
	 msg="회원 탈퇴 완료";
	status.setComplete();
	}else {
		msg ="회원 탈퇴 실패!";
	}
	model.addAttribute("loc",loc);
	model.addAttribute("msg",msg);
	return "common/msg";
	}
	@RequestMapping("/checkIdDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkIdDuplicate(@RequestParam String userId){
		Map<String, Object> map = new HashMap<String,Object>();
		
		int check =memberService.checkIdDuplicate(userId);
		System.out.println("check = "+check);
		if(check==0) {
			map.put("isUsable", true);
		}else {
			map.put("isUsable", false);
		}
		return map;
	}
	
}

