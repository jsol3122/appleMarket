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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import chat.bean.ChatDTO;
import chat.service.ChatService;
import lombok.extern.slf4j.Slf4j;
import saleboard.bean.SaleboardDTO;

@Controller
@Slf4j
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	// 새로운 채팅 시작 
	@PostMapping("/chat/newChat")
	public String newChat(@RequestParam("receiver") String user1, @RequestParam("sender") String user2){
	    int chatRoom_id = chatRoomJoinService.newRoom(user1,user2);
	    return "redirect:/personalChat/" + chatRoom_id;
	}
	
	
	// 팔고 게시판 채팅 시작 
	@PostMapping("/saleboard/saleboardChat") // 이게 밑에 enter 라는 메소드 보면 mypage2 / change 거친 다음에 chat 으로 들어가는듯?
    public ModelAndView saleboardChat(@ModelAttribute SaleboardDTO saleboardDTO, @RequestParam int chatRoom_id,ModelAndView mav,HttpSession session, HttpServletRequest request) {
		// 로그인 되어있는 유저 아이디 받아오기 (말 거는 사람)
		HttpSession loginSession = request.getSession();
		String user_id = (String)loginSession.getAttribute("member_id");
		System.out.println(user_id); //받아왔는지 테스트 출력
		 		
		List<ChatDTO> firstList = chatService.selectFirstChatList(chatRoom_id);
		mav.addObject("chatRoom_id", chatRoom_id);
		mav.addObject("user_id", user_id);
		mav.addObject("firstList",firstList);
		mav.setViewName("mypage2/chatting");
    	return mav;
    }

	@RequestMapping("/test/enter.do")
	public String enter() {
		return "mypage2/change";
	}
	//채팅 내역 가져오기
	@RequestMapping("/chat/chatList.do")
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

	// 채팅 메세지 전달
    @MessageMapping("/hello/{roomNo}") // sender
    @SendTo("/subscribe/chat/{roomNo}") // send to subscriber
    public ChatDTO broadcasting(ChatDTO chatDTO) {

    	log.debug("받아온 data={}",chatDTO); // log는 @Slf4j 이용해서 기록
    	Map<String,Object> map = new HashMap<>();
    	map.put("chatDTO", chatDTO);
    	
        chatDTO.setSendDate(new Date()); // 채팅 보내는 시간 설정
        int result = chatService.insertChat(chatDTO); // 아직 result가 뭔지 모르겠다.
        log.info("selectkey 사용 = {}",chatDTO);
        return chatDTO;
    }
    
	// 신고 메세지 전달
    @MessageMapping("/report/{roomNo}")
    @SendTo("/subscribe/report/{roomNo}")
    public Report updateDelete(Report report) {

    	log.debug("받아온 report={}",report);

    	
        //chat.setSendDate(new Date());
        
        return report;
    }
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
