package member.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.bean.BlackListDTO;
import admin.service.AdminService;
import member.bean.MemberDTO;
import member.bean.MessageDTO;
import member.bean.RecommendDTO;
import member.bean.ZipcodeDTO;
import member.service.MemberService;
import member.service.MessageService;


@Controller	
//@RequestMapping(value="/view/user")
@Validated
public class MemberController{
	@Autowired
	private MemberService memberSerivce;
	@Autowired
	private MessageService messageService;
	@Autowired
	private AdminService adminService;

	
	//메인창
	@GetMapping("/index")
	public String index(HttpServletResponse response) {
		Cookie cookie =new Cookie("view",null); 	//view라는 이름의 쿠키 생성
		cookie.setComment("게시글 조회 확인");		//해당 쿠키가 어떤 용도인지 커멘트
		cookie.setMaxAge(60*60*24);			//해당 쿠키의 유효시간을 설정 (초 기준)
		response.addCookie(cookie);				//사용자에게 해당 쿠키를 추가
		
		
		return "/index";
	}
	
	//회원가입 폼
	@GetMapping("/writeForm")
	public String writeForm() {
		return "/view/user/writeForm";
	}
	
	//회원가입 실패 폼
	@GetMapping("/view/user/writeFail")
	public String writeFail() {
		return "/view/user/writeFail";
	}
	

//	//회원가입
//	@RequestMapping("/write")
//	@ResponseBody
//	public void write(@ModelAttribute @Valid MemberDTO memberDTO) {
//		String Check = memberSerivce.checkId(memberDTO.getMember_id());
//		if(Check.equals("non_exist")) {
//			memberSerivce.write(memberDTO);
//		}else {
//			return;
//		}
//	}


	//이메일 중복체크
	@PostMapping("/emailChk")
	@ResponseBody
	public int emailChk(@RequestParam("member_email") String member_email) {
		int result = memberSerivce.emailChk(member_email);
		return result;
	}

   //회원가입 - index 이동(맞는지 확인 요망)
   @RequestMapping("/write")
   public String write(@ModelAttribute @Valid @Nullable MemberDTO memberDTO,@Nullable @RequestParam("recommend_id") String recommend_id, HttpSession session){
	   
	   String member_id=memberDTO.getMember_id();
	   MemberDTO Check = memberSerivce.checkId(memberDTO.getMember_id());
	   BlackListDTO blackListDTO = adminService.adminBlackListCheck(memberDTO.getMember_id());
	   
		 //추천인 등록      
		Map<String, String> map = new HashMap<String,String>();
		map.put("recommend_id", recommend_id);
		map.put("member_id", member_id);
		int recommendChk = memberSerivce.recommendChk(map);
		
		
		System.out.println("recommend_id=" + recommend_id);
		System.out.println("member_id="+memberDTO.getMember_id());
		System.out.println("recommendChk="+recommendChk);
		
		if(blackListDTO == null){
			if(Check == null) {
				
				System.out.println(blackListDTO);
				memberSerivce.write(memberDTO);
				//추천인 등록
				if(recommend_id!=""){
					if(recommendChk<5) { 
			            memberSerivce.recommend(map);
			            memberSerivce.recommended(map);
					}
				}
				
					
			}
		return "/view/user/writeFormSuccess";
      }else {
    	 session.invalidate();
         return "/view/user/writeFail";
      }
   }
   
   
	
	/*
	 * 인증번호 전송 api
	 * 1. 인증번호를 전송한다.
	 * 2. 해당 고객의 인증번호를 db에 입력한다.
	 * 3. 인증번호를 response 준다.
	 */
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody 
	public String sendSMS(@RequestParam("phone") @NotBlank @Pattern(regexp="^[0-9]+$", message = "핸드폰번호 양식을 지켜주세요.") String userPhoneNumber) {// 휴대폰 문자보내기 
		//난수 생성
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		System.out.println(randomNumber);
		//돈 나가서 잠시 주석
		//messageService.certifiedPhoneNumber(userPhoneNumber,randomNumber); 
		
		
		MessageDTO messageDTO = new MessageDTO();
		messageDTO.setPhone(userPhoneNumber);
		messageDTO.setCertificationNumber(randomNumber);
		
		String message = messageService.checkPhone(userPhoneNumber);
		
		if(message=="non_exist") {
			messageService.certificationCheck(messageDTO);
		}else if(message=="exist"){
			messageService.phoneUpdate(messageDTO);
		}		
		return Integer.toString(randomNumber); 
		
	}
	
	/*
	 * 인증번호 검증 api
	 * parameter : 핸드폰번호
	 * 1. db에 핸드폰번호 기준으로 인증번호를 조회한다.
	 * 2. 인증번호가 없으면 -> 검증 실패
	 * 3. 인증번호가 있고 일치 & 시간이 몇분 경과했는지 체크 -> 검증 성공
	 * 4. 인증번호가 있고 일치 안하거나 || 시간이 경과 했으면 -> 검증 실패
	 */
	@PostMapping("/phoneCheckNum")
	@ResponseBody
	public String checkSMS(@RequestParam("phone2") String Checknum,@RequestParam("phone") String userPhoneNumber) {
		
		MessageDTO messageDTO = messageService.checkSMS(userPhoneNumber);
		
		String today = null; 
		Date date = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		
		today = dateFormat.format(cal.getTime());
		String checkTime= dateFormat.format(messageDTO.getTransmissionTime());
		
		//3분 전
		cal.add(Calendar.MINUTE, -3);
		today = dateFormat.format(cal.getTime());
		
		cal.setTime(date);
		
		System.out.println("checkTime="+checkTime);
		System.out.println("today="+today);
		
		int result = today.compareTo(checkTime);
		
//		if(Integer.parseInt(Checknum) == messageDTO.getCertificationNumber() && result < 0) {
		if(Integer.parseInt(Checknum) == messageDTO.getCertificationNumber() && result < 0) {
			return "ok";
		}else {
			return "fail";
		}

	}

	//아이디 중복체크
	@PostMapping("/user/checkId")
	@ResponseBody
	public MemberDTO checkId(@RequestParam String member_id) {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberSerivce.checkId(member_id);
		System.out.println(memberDTO);
		return memberDTO;
	}
	
	
	//우편번호폼
	@GetMapping("/view/user/checkPost")
	public String checkPost() {
		return "/view/user/checkPost";
	}
	
	//우편번호 조회
	@PostMapping("/view/user/checkPostSearch")
	@ResponseBody
	public List<ZipcodeDTO> checkPostSearch(@ModelAttribute ZipcodeDTO zipcodeDTO) {
		return memberSerivce.checkPostSearch(zipcodeDTO);
	}
	
	//로그인폼
	@GetMapping("/loginForm")
	public String loginForm() {
		return "/login/loginForm";
	}
	
	//로그인
	@PostMapping("/login")
	@ResponseBody
	public Map<String, Integer> login(@RequestParam("member_id") String member_id, @RequestParam("member_pwd") String member_pwd, HttpSession session) {
		
		String path="";
		
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setMember_id(member_id);
		memberDTO.setMember_pwd(member_pwd);
		
		Map<String, Integer> result = memberSerivce.login(memberDTO);
	
		session.setAttribute("member_id", member_id);
		session.setAttribute("login_info", memberDTO);		
		session.setAttribute("kakaoInfo", memberDTO);
		session.setAttribute("member_siteCheck", 0);
		
		

		
		path = result+"";
		
		return result;
	}
	
	//로그아웃 요청 
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		
		 session.removeAttribute("login_info"); 
		 session.removeAttribute("kakaoInfo");
		 session.removeAttribute("member_id");
		 
		
		
		return "/index";
	}
	
	//탈퇴하기 폼
	@GetMapping(value="/deleteForm")
	public String deleteForm(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		request.setAttribute("display", "/view/myPage/deleteForm.jsp");
		return "/view/myPage/mypageMainForm";
		
	}
	
	//탈퇴하기 
	@PostMapping("/delete")
	@ResponseBody
	public void delete(@ModelAttribute MemberDTO memberDTO,HttpSession session) {
		System.out.println(memberDTO);
		memberSerivce.delete(memberDTO);
		adminService.adminlocationDelete(memberDTO.getMember_id());
		
		//모든 세션 다 죽인다.
		session.invalidate();
	}


	//마이페이지 메인 폼
	@GetMapping(value="/mypageMainForm")
	public String mypageMainForm() {
		return "/view/myPage/mypageMainForm";
	}
	//수정하기 폼 
	@GetMapping(value="/modifyForm")
	public String modifyForm(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		request.setAttribute("display", "/view/myPage/modifyForm.jsp");
		return "/view/myPage/mypageMainForm";
	}
	
	//수정하기 
	@PostMapping("/modify")
	@ResponseBody
	public void modify(@ModelAttribute MemberDTO memberDTO) {
		memberSerivce.modify(memberDTO);
	}
	
	//아이디찾기, 비밀번호찾기 폼
	@GetMapping(value="/searchIdPwdForm")
	public String searchIdForm() {
		return "view/user/searchIdPwdForm";
	}
	
	//아이디찾기 
	@PostMapping(value="/searchId")
	@ResponseBody
	public String idSearch(@RequestParam("member_email") String member_email) {
		return memberSerivce.searchId(member_email);
	}

	
	//비밀번호찾기
	@PostMapping(value="/searchPwd")
	@ResponseBody 
	public void searchPwd(@ModelAttribute MemberDTO memberDTO,HttpServletResponse response) {
		memberSerivce.searchPwd(memberDTO, response);
	}



	//비밀번호찾기- 비밀번호변경
	@GetMapping(value="/searchPwdForm")
	public String changePwdForm(){			
		return "/view/user/searchPwdForm";
	}

	//마이페이지 비밀번호 변경 폼
	@GetMapping(value="/changePwdForm")
	public String changePwdForm(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		request.setAttribute("display", "/view/myPage/changePwdForm.jsp");
		return "/view/myPage/mypageMainForm";
	}
	
	//비밀번호 변경 
	@PostMapping(value="/changePwd")
	@ResponseBody
	public void changePwd(@RequestParam("member_id")String member_id,@RequestParam("member_pwd")String member_pwd) {
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_id(member_id);
		memberDTO.setMember_pwd(member_pwd);

		memberSerivce.changePwd(memberDTO);
	
	}
	

	//====================================================마이페이지 추천인=======================================================
		//추천하기폼
		@GetMapping("/recommendForm")
		public String recommendForm(HttpServletRequest request, HttpServletResponse response) throws Throwable{
			request.setAttribute("display", "/view/myPage/recommend/recommendForm.jsp");
			return "/view/myPage/mypageMainForm";
		}

		//추천하기 리스트
		@PostMapping("/recommendList")
		@ResponseBody
		public List<RecommendDTO> recommendList(@RequestParam("member_id")String member_id) {
			return memberSerivce.recommendList(member_id);
		}
		
		//추천하기 - 쿠폰 발송 후 recommend_YN 'N' -> 'Y'로 바꾸기 
		@PostMapping("/recommendCoupon")
		@ResponseBody
		public void recommendCoupon(@RequestParam("member_id")String member_id) {
			memberSerivce.recommendCoupon(member_id);
		}

		
		//추천하기 쿠폰 발송
		@GetMapping("/recommendSMS")
		@ResponseBody
		public void recommendSMS(@ModelAttribute MemberDTO memberDTO) {
			//돈나가서 잠시 주석
			messageService.smsCoupon(memberDTO);
		
		}
	//============================================================================================
	
	
}