package com.kh.spring;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	// log기록을 남기기 위한 logger 
	private Logger logger= LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/index.do")
	public String IntoMain(Locale locale) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "index";
	}

	@RequestMapping("/chat.go")
	public String goChatting() {
		logger.info("Chatting Page check");
		return "common/chat";
	}
}
