package chat.dao;

import java.util.List;
import java.util.Map;

import chat.bean.ChatDTO;

public interface ChatDAO {

	public List<ChatDTO> selectchatList(Map<String, Object> map);

	public List<ChatDTO> selectFirstChatList(int roomNo);

	public int insertChat(ChatDTO chatDTO); // 채팅메세지 입력

}
