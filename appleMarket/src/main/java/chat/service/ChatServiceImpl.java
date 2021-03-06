package chat.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chat.bean.ChatDTO;
import chat.bean.ChatRoomDTO;
import chat.dao.ChatDAO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService{
   @Autowired
   private ChatDAO chatDAO;

/*   
   @Override
   public List<ChatDTO> selectChatList(Map<String, Object> map) {
      List<ChatDTO> list = chatDAO.selectchatList(map);
//      log.info("daoList={}",list);
      return list;
   }
*/
   @Override
   public List<ChatDTO> selectFirstChatList(int roomNo) {
      return chatDAO.selectFirstChatList(roomNo);
   }


   @Override
   public void insertChat(ChatDTO chatDTO) {
      chatDAO.insertChat(chatDTO);
   }


   @Override
   public int newRoom(Map<String, String> map) {
      String sale_seq = map.get("sale_seq");
      String buyerboard_seq = map.get("buyerboard_seq");
      String member_id = map.get("member_id");
      String user_id = map.get("user_id"); 
      Integer chatRoom_id = Integer.parseInt(map.get("chatRoom_id"));
      System.out.println(sale_seq+" "+member_id+""+user_id);
      
      chatRoom_id = checkChatRoom(map); // check : 전에 만들어진 방이 있는지 중복 체크
      System.out.println(chatRoom_id + " null이면 새로운 채팅방 생성");
      
       if(chatRoom_id != null) { //이미 존재하는 방(chatRoom_id != 0)이면 해당 방 번호 리턴
          return chatRoom_id; 
       } else {               //새로운 방이라면
          chatRoom_id = chatDAO.newChatRoom(map);
          return chatRoom_id;
       }
   }
   
   //방 중복체크
   private Integer checkChatRoom(Map<String, String> map) {
      return chatDAO.checkChatRoom(map);
   }

   @Override
   public List<ChatRoomDTO> ChatList(String user_id) {
      return chatDAO.chatList(user_id);
   }

   @Override
   public List<ChatDTO> personalChatHistory(int chatRoom_id) {
      return chatDAO.personalChatHistory(chatRoom_id);
   }


   @Override
   public void test() {
   System.out.println("서비스로 왔따 !");
   
   }


   @Override
   public void makeChatRoom(Map<String, String> map) {
      chatDAO.makeChatRoom(map);
      
   }


   @Override
   public ChatRoomDTO chatRoom_idDTO(String chatRoom_id) {
      return chatDAO.chatRoom_idDTO(chatRoom_id);
   }


   @Override
   public List<ChatDTO> newPersonalChatHistory(String user_id) {
      return chatDAO.newPersonalChatHistory(user_id);
   }


   @Override
   public List<ChatDTO> chatHistory(Map<String, String> map) {
      return chatDAO.chatHistory(map);
   }
   
/*
   public int checkChatRoom(Map<String, String> map){
       return chatDAO.checkChatRoom(map);
      
      
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
*/
}