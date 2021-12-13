package chat.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import chat.bean.ChatDTO;
import chat.bean.ChatRoomDTO;

@Repository
public class ChatDAOMybatis implements ChatDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ChatDTO> selectchatList(Map<String, Object> map) {
		return sqlSession.selectList("chat.selectChatList",map);
	}

	@Override
	public List<ChatDTO> selectFirstChatList(int roomNo) {
		return sqlSession.selectList("chat.selectFirstChatList",roomNo);
	}

	@Override
	public Integer checkChatRoom(Map<String, String> map) {
		return sqlSession.selectOne("checkChatRoom", map);
	}

	@Override
	public Integer newChatRoom(Map<String, String> map) {
		sqlSession.insert("newChatRoom1", map);
		return sqlSession.selectOne("newChatRoom2", map);
	}

	@Override
	public List<ChatRoomDTO> chatList(String user_id) {
		return sqlSession.selectList("chatList", user_id);
	}

	@Override
	public List<ChatDTO> personalChatHistory(int chatRoom_id) {
		return sqlSession.selectList("personalChatHistory", chatRoom_id);
	}

	@Override
	public void insertChat(ChatDTO chatDTO) {
		sqlSession.insert("insertChat",chatDTO);
	}

	@Override
	public void makeChatRoom(Map<String, String> map) {
		sqlSession.insert("newChatRoom1", map);
		
	}

	@Override
	public ChatRoomDTO chatRoom_idDTO(String chatRoom_id) {
		return sqlSession.selectOne("chatRoom_idDTO", chatRoom_id);
	}

	@Override
	public List<ChatDTO> newPersonalChatHistory(String user_id) {
		return sqlSession.selectList("newPersonalChatHistory", user_id);
	}
}
