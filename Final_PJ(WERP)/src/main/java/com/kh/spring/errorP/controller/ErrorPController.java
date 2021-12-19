package com.kh.spring.errorP.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.Utils;
import com.kh.spring.errorP.model.service.ErrorPService;
import com.kh.spring.errorP.model.vo.Attachment;
import com.kh.spring.errorP.model.vo.ErrorP;

@Controller
public class ErrorPController {
	
	@Autowired
	ErrorPService errorPService;

	@RequestMapping("/errorP/errorPList.do")
	public String selectErrorPList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value= "key", required=false, defaultValue="") String key,
			@RequestParam(value= "word", required=false, defaultValue="") String word,
			Model model	
			) {
		
		// 한 페이지당 게시글 수
		int numPerPage = 10;
		
		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = errorPService.selectErrorPList(cPage, numPerPage, key, word);
		
		// 전체 게시글 수
		int totalContents = errorPService.selectErrorPTotalContents(key,word);
		
		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "errorPList.do", key, word);	
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("key", key);
		model.addAttribute("word", word);
		
		System.out.println(model);
		return "errorP/errorPList";
		
	}
	
	@RequestMapping("/errorP/proCodeList.do")
	public String selectproCodeList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value= "key", required=false, defaultValue="") String key,
			@RequestParam(value= "word", required=false, defaultValue="") String word,
			Model model	
			) {
		
		// 한 페이지당 게시글 수
		int numPerPage = 7;
		
		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = errorPService.selectProCodeList(cPage, numPerPage, key, word);
		
		// 전체 게시글 수
		int totalContents = errorPService.selectProCodeTotalContents(key,word);
		
		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "proCodeList.do", key, word);	
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("key", key);
		model.addAttribute("word", word);
		
		System.out.println(model);
		return "errorP/proCodeList";
		
	}
	
	
	
	
	@RequestMapping("/errorP/errorPForm.do")
	public String errorPForm() { // 글쓰기 메소드!
		
		return "errorP/errorPForm";
	}
	

		
		
	@RequestMapping("/errorP/errorPFormEnd.do")
	public String insertErrorP(ErrorP errorP, Model model,
							@RequestParam(value="proCode", required=false) String proCode,
							HttpServletRequest request, HttpServletRequest req,
							  @RequestParam(value="upFile", required=false) MultipartFile[] upFiles)
												{
		
		// 1. 파일 저장 경로 및 파일 정보를 담을 객체 생성
		String savePath = req.getServletContext().getRealPath("/resources/boardUpload");
		List<Attachment> attachList = new ArrayList<Attachment>();
		
		// 2. 파일 업로드
		for(MultipartFile f : upFiles) {
			if(f.isEmpty() == false) {
				
				// 3. 파일 이름 변경
				String originName = f.getOriginalFilename(); // 원본 이름
				String changeName = fileNameChanger(originName); // 서버에서 관리할 이름
			// 4. 파일 저장
				try {
					f.transferTo(new File(savePath + "/" + changeName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				// 5. attachList에 담기
				Attachment a = new Attachment();
				a.setOriginalFileName(originName);
				a.setRenamedFileName(changeName);
				
				attachList.add(a);				
			}
		}
		// 6. 게시글 DB에 등록
		int check = errorPService.checkErrorP(proCode);
		int result, result2;
		String loc = "/errorP/errorPList.do";
		String msg = "";
		
		
		if(check==0) {	
			result = errorPService.insertErrorP(errorP, attachList);
		
		if( result > 0 ) {
			msg = "등록 완료";
			System.out.println(loc + "/" + msg);
		} else {
			msg = "등록 실패";
		}
	
		}
		
		else {
		result2 = errorPService.updateCount(errorP);	
		if( result2 > 0 ) {
			msg = "등록 완료";
			System.out.println(loc + "/" + msg);
		} else {
			msg = "등록 실패";
		}
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg1";
	}
	
	public String fileNameChanger(String oldName) {

		String ext = oldName.substring(oldName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		int rnd = (int)(Math.random() * 1000);
		
		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext; 
			
	}
	
	@RequestMapping("/errorP/errorPView.do")
	public String errorPView(@RequestParam int errorpNo, Model model) {
		
		ErrorP errorP = errorPService.selectOneErrorP(errorpNo);
		List<Attachment> attachmentList = errorPService.selectAttachmentList(errorpNo);
		
		model.addAttribute("errorP", errorP);
		model.addAttribute("attachmentList", attachmentList);
		
		return "errorP/errorPView";
	}
	
	@RequestMapping("/errorP/fileDownload.do")
	public void fileDownload(@RequestParam String oName,
			                 @RequestParam String rName,
			                 HttpServletRequest request,
			                 HttpServletResponse response) {
		
		// 파일 저장 디렉토리(폴더)
		String saveDirectory = request.getServletContext().getRealPath("/resources/boardUpload");
		
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		
		try {
			sos = response.getOutputStream();
			
			File saveFile = new File(saveDirectory + "/" + rName);
			response.setContentType("application/octet-stream; charset=utf-8");
			
			String responseFileName = "";
			boolean isMSIE =
					request.getHeader("user-agent").indexOf("MSIE") != -1 
					|| request.getHeader("user-agent").indexOf("Trident") != -1;
			
			
			if(isMSIE == true) {
				// IE는 UTF-8 인코딩을 명시적으로 선언해줘야 한다.
				// 또한 한글, 일본어, 독일어 등과 같은 외국어를 특수기호로 처리하기 때문에
				// 이를 인코딩하여 올바른 문자표기로 변환해주어야 한다.
				responseFileName = URLEncoder.encode(oName, "UTF-8"); // 홍길동 -> %ED%99%8D%EA%B8%B8%EB%8F%99		
				responseFileName = responseFileName.replaceAll("\\+", "%20");
			} else {
				responseFileName = new String(oName.getBytes("UTF-8"), "ISO-8859-1");
				System.out.println("일반 표기 : " + responseFileName);
			}
			
			response.addHeader("Content-Disposition", "attachment; filename=\"" + responseFileName +"\"");
			
			// 파일의 크기에 따라 데이터 전송
			response.setContentLength((int)saveFile.length());
			
			FileInputStream fis = new FileInputStream(saveFile);
			bis = new BufferedInputStream(fis);
			int read = 0;
			
			while((read = bis.read()) != -1) {
				sos.write(read);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			
		} finally {
			try {
				sos.close();
				bis.close();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("/errorP/errorPUpdateView.do")
	public String errorPUpdateView(@RequestParam int errorpNo, Model model) {
		
		ErrorP errorP = errorPService.updateView(errorpNo);
		
		List<Attachment> attachmentList = errorPService.selectAttachmentList(errorpNo);
		
		model.addAttribute("errorP", errorP);
		model.addAttribute("attachmentList", attachmentList);
		
		return "errorP/errorPUpdateView";		
	}
	
	@RequestMapping("/errorP/errorPUpdate.do")
	public String errorPUpdate(ErrorP errorP, HttpServletRequest request, Model model, 
							  @RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
		// 1. 원본 게시글 불러와 수정하기
		int errorpNo = errorP.getErrorpNo();
		
		ErrorP originBoard = errorPService.updateView(errorpNo);
		
		originBoard.setErrorpContent( errorP.getErrorpContent() );
		originBoard.setErrorpCount( errorP.getErrorpCount() );
	
		
		// 2. 첨부파일 수정하기
		String savePath = request.getServletContext().getRealPath("/resources/boardUpload");
		
		List<Attachment> attachList = errorPService.selectAttachmentList(errorpNo);
		if( attachList == null ) attachList = new ArrayList<Attachment>();
		
		int idx = 0;
		for(MultipartFile f : upFiles) {
			Attachment temp = null;
			
			if( f.isEmpty() == false ) {
				
				if(attachList.size() > idx) { // 파일이 있다면
					File oldFile = new File(savePath + "/" + attachList.get(idx).getRenamedFileName());										
					temp = attachList.get(idx);
				} else {
					temp = new Attachment();
					temp.setErrorpNo(errorpNo);				
					attachList.add(temp);
				}
				
				// 파일 저장용 이름 바꾸기
				String originName = f.getOriginalFilename();
				String changeName = fileNameChanger(originName);
				
				// 파일 저장
				try {
					f.transferTo(new File(savePath + "/" + changeName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				temp.setOriginalFileName(originName);
				temp.setRenamedFileName(changeName);
				
				attachList.set(idx, temp);
			}
			idx++;
		}
		
		int result = errorPService.updateErrorP(originBoard, attachList);  // 서비스 찾아가서 마저 구현해주기
		
		String loc = "/errorP/errorPView.do?errorpNo="+errorpNo;
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

	@RequestMapping("/errorP/fileDelete.do")
	@ResponseBody
	public boolean fileDelete(@RequestParam int attNo,
							  @RequestParam String rName,
							  HttpServletRequest request) {
		
		String savePath = request.getServletContext().getRealPath("/resources/boardUpload");
		
		// 1. DB에서 첨부파일 삭제
		int result = errorPService.deleteFile(attNo);
		
		if( result == 1 ) {
			File goodbye = new File(savePath + "/" + rName);
			
			goodbye.delete();
			
			return true;
		} else {						
			return false;
		}
	}
	
	@ResponseBody
	@RequestMapping("/errorP/errorPDelete.do")
	public void errorPDelete(
								@RequestParam(value="cchk[]") List<String> errorpNoList,					
								ErrorP errorP,
								HttpServletRequest request
								) {
				
	int result = 0;
	int errorpNoNum = 0;
		
		// 첨부파일삭제 명단
		for(String i : errorpNoList) {
		// 게시글 삭제
			errorpNoNum = Integer.parseInt(i);
			errorP.setErrorpNo(errorpNoNum);
			errorPService.deleteErrorP(errorP);
		
					
		}	
	
		
	}
	@ResponseBody
	@RequestMapping("/errorP/errorPAlldelete.do")
	public void errorPAllDelete (HttpServletRequest request) {
			
		errorPService.AlldeleteErrorP();
		
		
	}
	
	
	
	
	

	
}