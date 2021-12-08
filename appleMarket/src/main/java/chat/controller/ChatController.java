package chat.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import buyerboard.bean.BuyerboardDTO;
import chat.bean.ChatDTO;
import chat.bean.ChatRoomDTO;
import chat.service.ChatMessageService;
import chat.service.ChatService;
import lombok.extern.slf4j.Slf4j;
import saleboard.bean.SaleboardDTO;

@Controller
@Slf4j
public class ChatController {
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	private ChatMessageService chatMessageService;
	private ChatService chatService;
/*	
	@MessageMapping("/chat/send")
    public void sendMsg(ChatMessageForm message) throws Exception {
        String receiver = message.getReceiver();
        chatMessageService.save(message);
        simpMessagingTemplate.convertAndSend("/subscribe/" + receiver,message);
    }	
*/	
	
	// 새로운 채팅 시작 : 작성글에서 "채팅으로 거래하기"  
	// => 글번호, user 두명 초대해서 return "redirect:/personalChat/" + chatRoom_id; 여기로 연결
	@RequestMapping("/chat/newChat")
	public String newChat(@ModelAttribute SaleboardDTO saleboardDTO, @ModelAttribute BuyerboardDTO buyerboardDTO, HttpServletRequest request){
		HttpSession loginSession = request.getSession();
		String user_id = (String)loginSession.getAttribute("member_id");
		System.out.println(user_id + " 세션 받았다!");
		String board_seq;
		String member_id;
		int board_name=0;
	
		if(board_name==1) {
			board_seq = String.valueOf(saleboardDTO.getSale_seq());
			member_id = saleboardDTO.getMember_id();
		} else {
			board_seq = String.valueOf(buyerboardDTO.getBuyerboard_seq());
			member_id = buyerboardDTO.getMember_id();		
		}
		System.out.println(board_seq+member_id + board_name + " 데이터 받았다!222");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("board_seq", board_seq);
		map.put("member_id", member_id); // 글 작성자 (채팅 걸리는 사람)
		map.put("user_id", user_id); // 로그인 세션 아이디 (채팅 거는 사람)			
		
		int chatRoom_id = chatService.newRoom(map);
		List<ChatDTO> list = chatService.personalChatHistory(chatRoom_id);
		
	    return "redirect:/personalChat/" + chatRoom_id;
	}

	
	// 채팅방들 목록 :  1) index 페이지에서 채팅 ui 클릭하면 보이게
	//				2) /personalChat/chatRoom_id/ 에서 목록으로 돌아가기 버튼을 부를 때
	@PostMapping("/chat/chatList")
	@ResponseBody
	public List<ChatRoomDTO> ChatList(@ModelAttribute ChatRoomDTO chatRoomDTO, HttpServletRequest request){
		//무한 스크롤 걸 예정 https://retrieverj.tistory.com/60?category=984977 여기 참조하기.
		HttpSession loginSession = request.getSession();
		String user_id = (String)loginSession.getAttribute("member_id");
		
		List<ChatRoomDTO> list = chatService.ChatList(user_id);
		return list;
	} 
	
	// 채팅방 목록에서 채팅방 입장
	// 채팅방 목록 하나 클릭할 때 거기서 js 로 chatRoom_id 보내야 한다. 
	@PostMapping("/chat/enter") // 지금 endpoint 랑 chat, chat namespace 이 두개가 겹치는데 그냥 써도 되나?
	public String enterChat(@RequestParam int chatRoom_id){
		List<ChatDTO> list = chatService.personalChatHistory(chatRoom_id); 
	    return "redirect:/personalChat/" + chatRoom_id;
	}	
	
/*	
	//채팅창으로 입장 // 임의 테스트
	@RequestMapping("/enter/chat.do")
    public ModelAndView enterChat(@RequestParam int roomNo,ModelAndView mav,HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		List<Chat> firstList = chatService.selectFirstChatList(roomNo);
		mav.addObject("roomNo",roomNo);
		mav.addObject("memberId",memberId);
		mav.addObject("firstList",firstList);
		mav.setViewName("mypage2/chatting");
    	return mav;
    }	
*/	
	
/*	
	//personal chat 방 안에서 채팅 내역 가져오기
	//@RequestMapping("/chat/chatList.do")
	@ResponseBody
	public List<ChatDTO> selectChatList(@RequestParam int roomNo,@RequestParam int endNo) {
		int startNo = endNo-11; // startNo랑 endNo 가 어디의 시작과 끝인지?
//		int roomNo = Integer.parseInt(room);

			
		Map<String,Object> map = new HashMap<>();
		map.put("roomNo", roomNo);
		map.put("startNo",endNo-1);
//		map.put("endNo", endNo-1);
		List<ChatDTO> list = chatService.selectChatList(map);
		log.info("list= {}", list);
//		mav.addObject("list", list);
//		mav.addObject("roomNo",roomNo);
//		mav.setViewName("mypage2/chatting");
		return list;
	}
*/
	
/*	
	// 채팅 메세지 전달
    @MessageMapping("/personalChat/{chatRoom_id}") // sender
    @SendTo("/subscribe/chat/{chatRoom_id}") // send to subscriber
    public ChatDTO broadcasting(ChatDTO chatDTO) {
    	log.debug("받아온 data={}",chatDTO); // log는 @Slf4j 이용해서 기록
    	Map<String,Object> map = new HashMap<>();
    	map.put("chatDTO", chatDTO);
   	
        chatDTO.setSendDate(new Date()); // 채팅 보내는 시간 설정
        int result = chatService.insertChat(chatDTO); // 아직 result가 뭔지 모르겠다.
        log.info("selectkey 사용 = {}",chatDTO);
        return chatDTO;
    }
 */
    
	
	// 채팅 메세지 전달
    @MessageMapping("/personalChat/{chatRoom_id}") // sender
    @SendTo("/subscribe/chat/{chatRoom_id}") // send to subscriber
    public void sendChat(ChatDTO chatDTO) {
    	/*
    	String receiver = message.getReceiver();
    	simpMessagingTemplate.convertAndSend("/subscribe/" + receiver,message);
    	*/
    	chatDTO.setSendDate(new Date());
    	Map<String,Object> map = new HashMap<>();
    	map.put("chatDTO", chatDTO);
    	
    	chatService.insertChat(chatDTO);
    }
    
    
    
 /*   
	// 신고 메세지 전달
    @MessageMapping("/report/{roomNo}")
    @SendTo("/subscribe/report/{roomNo}")
    public Report updateDelete(Report report) {

    	log.debug("받아온 report={}",report);

    	
        //chat.setSendDate(new Date());
        
        return report;
    }
 */   
//  //채팅 저장
//    @RequestMapping("/chat/insertChat.do")
//    @ResponseBody
//    public int insertChat(Chat chat) {
////    	Map<String,Object> map = new HashMap<>();
////    	map.put("chatDTO", chatDTO);
//    	int result = chatService.insertChat(chat);
//    	return result;
//    }
//    
}
