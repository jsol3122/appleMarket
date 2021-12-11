package chat.dao;

import java.util.List;
import java.util.Map;

import chat.bean.ChatDTO;
import chat.bean.ChatRoomDTO;

public interface ChatDAO {

	public List<ChatDTO> selectchatList(Map<String, Object> map);

	public List<ChatDTO> selectFirstChatList(int roomNo);

	public void insertChat(ChatDTO chatDTO); // 채팅메세지 입력

	public Integer checkChatRoom(Map<String, String> map); // 채팅방 중복 확인

	public Integer newChatRoom(Map<String, String> map);

	public List<ChatRoomDTO> chatList(String user_id);

	public List<ChatDTO> personalChatHistory(int chatRoom_id);

}
