package chat.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import chat.bean.ChatDTO;
import chat.bean.ChatRoomDTO;

public interface ChatService {
	
	public List<ChatDTO> selectFirstChatList(int roomNo); // 채팅룸 리스트에서 미리보기로 보일 첫번째 채팅 말하는듯...?

	public void insertChat(ChatDTO chatDTO); // 채팅 치기

	public int newRoom(Map<String, String> map) ; // 새로운 방 생성

	public List<ChatRoomDTO> ChatList(String user_id); // 채팅방 목록

	public List<ChatDTO> personalChatHistory(int chatRoom_id); // 대화 기록 불러오기
	
	public void test();

}
