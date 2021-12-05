package chat.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import chat.bean.ChatDTO;

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
	public int insertChat(ChatDTO chatDTO) {
		return sqlSession.insert("chat.insertChat",chatDTO);
	}
}
