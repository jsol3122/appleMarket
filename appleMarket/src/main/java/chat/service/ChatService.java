package chat.service;

import java.util.List;
import java.util.Map;

import chat.bean.ChatDTO;

public interface ChatService {
	
	public List<ChatDTO> selectChatList(Map<String, Object> map); // 채팅 내역 불러오기 (채팅방 안에서)

	public List<ChatDTO> selectFirstChatList(int roomNo); // 채팅룸 리스트에서 미리보기로 보일 첫번째 채팅 말하는듯...?

	public int insertChat(ChatDTO chatDTO); // 채팅 치기

	public int newRoom(int sale_seq, String user_id);
}
