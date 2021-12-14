package chat.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import buyerboard.bean.BuyerboardDTO;
import chat.bean.ChatDTO;
import chat.bean.ChatRoomDTO;
import chat.service.ChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import member.bean.MemberDTO;
import saleboard.bean.SaleboardDTO;

@Controller
@RequiredArgsConstructor
public class ChatController {
	@NotNull
	@Autowired
	private ChatService chatService;


	
/*	
	@MessageMapping("/chat/send")
    public void sendMsg(ChatMessageForm message) throws Exception {
        String receiver = message.getReceiver();
        chatMessageService.save(message);
        simpMessagingTemplate.convertAndSend("/subscribe/" + receiver,message);
    }	
*/	
/*	
	@RequestMapping(value="/chatting.do")
	public ModelAndView chat(ModelAndView mv) {
		mv.setViewName("chat/chattingview");
		
		//사용자 정보 출력(세션)
		MemberDTO member_id = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("user name : " + member_id.getMember_id());
		
		System.out.println("normal chat page");
		
		mv.addObject("member_id", member_id.getMember_id());
		
		return mv;	
	}
*/	
	// 새로운 채팅 시작 : 작성글에서 "채팅으로 거래하기"  
	// => 글번호, user 두명 초대해서 return "redirect:/personalChat/" + chatRoom_id; 여기로 연결
	
	@PostMapping("/chat/newChat")
	@ResponseBody
	public int newChat(@ModelAttribute SaleboardDTO saleboardDTO, @ModelAttribute BuyerboardDTO buyerboardDTO,ModelAndView mv, HttpSession loginSession){
		//HttpSession loginSession = request.getSession();
		String user_id = (String)loginSession.getAttribute("member_id");
		System.out.println(user_id + " 세션 받았다!");
		String sale_seq;
		String buyerboard_seq;
		String member_id;
		int chatRoom_id=0;
		
		sale_seq = saleboardDTO.getSale_seq()+"";
		buyerboard_seq = buyerboardDTO.getBuyerboard_seq()+"";
		member_id = saleboardDTO.getMember_id();
		System.out.println("sale_seq"+sale_seq);
		System.out.println("buyerboard_seq"+buyerboard_seq);
		
		if (sale_seq != null) {
			buyerboard_seq = "0";
		} else {
			sale_seq = "0";
		}
		member_id = buyerboardDTO.getMember_id();		
		
		System.out.println(sale_seq+member_id+ "sale DTO 데이터 받았다!");
		System.out.println(buyerboard_seq+user_id+ "buyer DTO 데이터 받았다!");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("sale_seq", sale_seq+"");
		map.put("buyerboard_seq", buyerboard_seq+"");
		map.put("member_id", member_id); // 글 작성자 (채팅 걸리는 사람)
		map.put("user_id", user_id); // 로그인 세션 아이디 (채팅 거는 사람)	
		map.put("chatRoom_id", chatRoom_id+"");
		
		Iterator<String> keys = map.keySet().iterator();
        while( keys.hasNext() ){
            String key = keys.next();
            String value = map.get(key);
            System.out.println("키 : "+key+", 값 : "+value);
        }
				 
		chatService.test();
		chatRoom_id = chatService.newRoom(map); // 여기까지 해결
		System.out.println("newRoom을 다녀온"+chatRoom_id);
		//List<ChatDTO> list = chatService.personalChatHistory(chatRoom_id);
		map.put("chatRoom_id", chatRoom_id+"");
		//chatService.makeChatRoom(map);
		/*
		ModelAndView mv = new ModelAndView(); 
		mv.setView(null)
		*/
		System.out.println("return 전까진 작동한다.");
		
		//mv.setViewName(member_id)
		
		//chatService.personalChat(map);
		//personalChat(chatRoom_id);
		//System.out.println("personalChat 서비스까지 작동한다.");
		return chatRoom_id;
		//"/view/personalChat";
		//return mv;
	}
	
	@RequestMapping("/chat/personalChat")
	public String enter(HttpServletRequest request, Model model){
	       String chatRoom_id = request.getParameter("chatRoom_id");
	       System.out.println("enter까지, chatRoom_id="+chatRoom_id);
	       //chatRoom_id 로 글 seq 랑 member_id 빼오기
	       ChatRoomDTO chatRoomDTO = chatService.chatRoom_idDTO(chatRoom_id); // 혹시 오류나면 selectOne 을 selectList 로 바꿔주기
	       String sale_seq = chatRoomDTO.getSale_seq();
	       String buyerboard_seq = chatRoomDTO.getBuyerboard_seq();
	       String member_id = chatRoomDTO.getMember_id();
	       String user_id = chatRoomDTO.getUser_id();
	       
	       model.addAttribute("chatRoom_id", chatRoom_id);
	       model.addAttribute("sale_seq", sale_seq);
	       model.addAttribute("buyerboard_seq", buyerboard_seq);
	       model.addAttribute("member_id", member_id);
	       model.addAttribute("user_id", user_id);
	       
	       System.out.println("enter의 user_id" + user_id);
	       
	       List<ChatRoomDTO> chatRoomDTOlist = chatService.ChatList(user_id);
	       model.addAttribute("chatRoomDTOlist", chatRoomDTOlist);
	       
			Map<String,String> map = new HashMap<>();
			map.put("user_id", user_id);
			map.put("chatRoom_id", chatRoom_id);
	       //List<ChatDTO> newPersonalChatHistory = chatService.newPersonalChatHistory(user_id);
	       //model.addAttribute("newPersonalChatHistory", newPersonalChatHistory);
			List<ChatDTO> chatHistory = chatService.chatHistory(map);	
	       model.addAttribute("chatHistory", chatHistory);
	       
	       return "/view/chat/personalChat";
	 
	    }
/*	
	@PostMapping("/chat/personalChat/{chatRoom_id}")
	private void personalChat(@RequestParam int chatRoom_id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/chat/personalChat"); // 뷰의 이름 
		mv.addObject("chatRoom_id", chatRoom_id); // 뷰로 보낼 데이터 값
		mv.getView();
	}
	
*/
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

	@PostMapping("/chat/personalChat")
	public ModelAndView personalChat() {
		
		
		
		return null;
	}
*/	
/*	
	// 채팅 메세지 전달
    @MessageMapping("/personalChat/{chatRoom_id}") // sender
    @SendTo("/subscribe/chat/{chatRoom_id}") // send to subscriber
    public ChatDTO broadcasting(ChatDTO chatDTO) {
    	System.out.println("브로드캐스팅 여기까지 오나?");
    	log.debug("받아온 data={}",chatDTO); // log는 @Slf4j 이용해서 기록
 
    	String receiver = chatDTO.getMember_id();	
       	simpMessagingTemplate.convertAndSend("/subscribe/" + receiver, chatDTO);
        
    	Map<String,Object> map = new HashMap<>();
    	map.put("chatDTO", chatDTO);
   	
        chatDTO.setSendDate(new Date()); // 채팅 보내는 시간 설정
        //int result = chatService.insertChat(chatDTO); // 아직 result가 뭔지 모르겠다.
        chatService.insertChat(chatDTO);
        log.info("selectkey 사용 = {}",chatDTO);
        return chatDTO;
    }
 */
    
/*	
	// 채팅 메세지 전달
    @MessageMapping("/personalChat/{chatRoom_id}") // sender
    @SendTo("/subscribe/chat/{chatRoom_id}") // send to subscriber
    public void sendChat(ChatDTO chatDTO, @ModelAttribute ChatRoomDTO chatRoomDTO) {
    	System.out.println("들어오긴 하나?");
    	int chatRoom_id = chatRoomDTO.getChatRoom_id();
    	String sale_seq = chatRoomDTO.getSale_seq();
    	String buyerboard_seq = chatRoomDTO.getBuyerboard_seq();
    	String member_id = chatRoomDTO.getMember_id();
    	String user_id = chatRoomDTO.getUser_id();
    	
    	String receiver = chatDTO.getMember_id();
    	chatDTO.setSendDate(new Date());
    	simpMessagingTemplate.convertAndSend("/subscribe/" + receiver, chatDTO);
    	
     	chatDTO.setChatRoom_id(chatRoom_id);
     	chatDTO.setSale_seq(sale_seq);
     	chatDTO.setBuyerboard_seq(buyerboard_seq);
     	chatDTO.setMember_id(member_id);
     	chatDTO.setUser_id(user_id);
    	
    	Map<String,Object> map = new HashMap<>();
    	map.put("chatDTO", chatDTO);
    	
    	chatService.insertChat(chatDTO);
    }   
  */  
    
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
  //채팅 저장
    @PostMapping("/chat/insertChat")
    @ResponseBody
    public void insertChat(@ModelAttribute ChatRoomDTO chatRoomDTO, @ModelAttribute ChatDTO chatDTO) {
    //Map<String,Object> map = new HashMap<>();
   	//map.put("chatDTO", chatDTO);
   	//result = chatService.insertChat(chat);
   	
	System.out.println("들어오긴 하나?");
	int chatRoom_id = chatDTO.getChatRoom_id();
	String sale_seq = chatDTO.getSale_seq();
	String buyerboard_seq = chatDTO.getBuyerboard_seq();
	String member_id = chatDTO.getMember_id();
	String user_id = chatDTO.getUser_id();
	String chatContent = chatDTO.getChatContent();
	System.out.println(sale_seq);
	//String receiver = chatDTO.getMember_id();
	//chatDTO.setSendDate(new Date());
	//simpMessagingTemplate.convertAndSend("/subscribe/" + receiver, chatDTO);
	
 	chatDTO.setChatRoom_id(chatRoom_id);
 	chatDTO.setSale_seq(sale_seq);
 	chatDTO.setBuyerboard_seq(buyerboard_seq);
 	chatDTO.setMember_id(member_id);
 	chatDTO.setUser_id(user_id);
 	//chatDTO.setChatContent(chatContent);
 	
	Map<String,Object> map = new HashMap<>();
	map.put("chatDTO", chatDTO);
	
	chatService.insertChat(chatDTO);
   	
   
    }
    
}
