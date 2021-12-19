package com.kh.spring;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@RequestMapping("/chatting")
public class ChatHandler extends TextWebSocketHandler {

	//Session List
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	//Logger
	private static Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	
	// If client connected
	
	@Override 
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());
	}
	//If client send message to server 

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로부터 {} 받음 ",session.getId(),message.getPayload());
		// Server send message to all user
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(message.getPayload()));
		}
	}
	
	//If client disconnected
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결 끊김.", session.getId());
	}
	

}
