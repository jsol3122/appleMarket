package chat.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import chat.bean.ChatDTO;
import chat.dao.ChatDAO;

public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDAO chatDAO;
	
	@Override
	public List<ChatDTO> selectChatList(Map<String, Object> map) {
		List<ChatDTO> list = chatDAO.selectchatList(map);
//		log.info("daoList={}",list);
		return list;
	}

	@Override
	public List<ChatDTO> selectFirstChatList(int roomNo) {
		return chatDAO.selectFirstChatList(roomNo);
	}


	@Override
	public int insertChat(ChatDTO chatDTO) {
		return chatDAO.insertChat(chatDTO);
	}

	@Override
	public int newRoom(int sale_seq, String user_id) {
	    int ret = check(user1,user2);
	    if(ret != 0){
	        //이미 존재하는 방이면 해당 방 번호 리턴
	        return ret;
	    }
	    ChatRoom chatRoom = new ChatRoom();
	    ChatRoom newChatRoom = chatRoomRepository.save(chatRoom);
	    if(user1.equals(user2)){
	        //나 자신과의 채팅은 한명만 존재
	        createRoom(user1,newChatRoom);
	    }
	    else{
	        //두명 다 입장
	        createRoom(user1,newChatRoom);
	        createRoom(user2,newChatRoom);
	    }
	    return newChatRoom.getId();
	}
	
	public Long check(String user1,String user2){
	    Users userFirst = usersService.findByName(user1);
	    List<ChatRoomJoin> listFirst = chatRoomJoinRepository.findByUser(userFirst);
	    Set<ChatRoom> setFirst = new HashSet<>();
	    for(ChatRoomJoin chatRoomJoin : listFirst){
	        setFirst.add(chatRoomJoin.getChatRoom());
	    }
	    Users userSecond = usersService.findByName(user2);
	    List<ChatRoomJoin> listSecond = chatRoomJoinRepository.findByUser(userSecond);
	    for(ChatRoomJoin chatRoomJoin : listSecond){
	        if(setFirst.contains(chatRoomJoin.getChatRoom())){
	            return chatRoomJoin.getChatRoom().getId();
	        }
	    }
	    return 0L;
	}

}
