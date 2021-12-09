package handler;

import java.util.ArrayList;
import java.util.List;


import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import chat.controller.ChatController;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class EchoHandler extends TextWebSocketHandler{
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//맵을 쓸 때 방법
		//sessions.put(session.getId(), session);
		
		//List 쓸 때 방법
		sessionList.add(session);
		//세션값을 불러온
		//0번째 중괄호에 session.getId()를 넣으라는 뜻
		log.info("{} 연결됨", session.getId());
		
		
	}
	
}
