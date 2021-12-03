package member.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.bean.MemberDTO;
import member.bean.MessageDTO;
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
	
	
	//메인창
	@GetMapping("/index")
	public String index() {
		return "/index";
	}
	
	//회원가입 폼
	@GetMapping("/writeForm")
	public String writeForm() {
		return "/user/writeForm";
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
	
	//회원가입 - index 이동(맞는지 확인 요망)
	@RequestMapping("/write")
	public String write(@ModelAttribute @Valid MemberDTO memberDTO,@RequestParam("recommend_id")String recommend_id) {
		String Check = memberSerivce.checkId(memberDTO.getMember_id());
		if(Check.equals("non_exist")) {
			memberSerivce.write(memberDTO);
			
			//추천인 등록
			String member_id=memberDTO.getMember_id();
			System.out.println("recommend_id=" + recommend_id);
			System.out.println("member_id="+memberDTO.getMember_id());
			Map<String, String> map = new HashMap<String,String>();
			map.put("recommend_id", recommend_id);
			map.put("member_id", member_id);
			
			memberSerivce.recommend(map);
			memberSerivce.recommended(map);
			
			return "/index";
		}else {
			return "/user/writeForm";
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
	
	//핸드폰 중복체크 
	@PostMapping("/checkPhone")
	@ResponseBody
	public String checkPhone(@RequestParam String phone) {
		return messageService.checkPhone(phone);
	}

	//아이디 중복체크
	@PostMapping("/user/checkId")
	@ResponseBody
	public String checkId(@RequestParam String member_id) {
		return memberSerivce.checkId(member_id);
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
	public String login(@RequestParam("member_id") String member_id, @RequestParam("member_pwd") String member_pwd, HttpSession session) {
		
		String path="";
		
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setMember_id(member_id);
		memberDTO.setMember_pwd(member_pwd);
		
		int result = memberSerivce.login(memberDTO);
		

		session.setAttribute("member_id", member_id);
		session.setAttribute("login_info", memberDTO);
		session.setAttribute("member_siteCheck", 0);
		
		path = result+"";
		
		return path;
	}
	
	//로그아웃 요청 
	@GetMapping("/logout")
	@ResponseBody
	public void logout(HttpSession session) {
		session.removeAttribute("login_info");
	}
	
	//탈퇴하기 폼
	@GetMapping(value="/deleteForm")
	public String deleteForm() {
		return "/deleteForm";
	}
	
	//탈퇴하기 
	@PostMapping("/delete")
	@ResponseBody
	public void delete(@ModelAttribute MemberDTO memberDTO) {
		memberSerivce.delete(memberDTO);
	}

	
	//수정하기 폼
	@GetMapping(value="/modifyForm")
	public String modifyForm() {
		return "/modifyForm";
	}
	
	//수정하기 
	@PostMapping("/modify")
	@ResponseBody
	public void modify(@ModelAttribute MemberDTO memberDTO) {
		memberSerivce.modify(memberDTO);
	}
	
	//아이디찾기 폼
	@GetMapping(value="/searchIdForm")
	public String searchIdForm() {
		return "/searchIdForm";
	}
	
	//아이디찾기 
	@PostMapping(value="/searchId")
	@ResponseBody
	public String idSearch(@RequestParam("member_email") String member_email) {
		return memberSerivce.searchId(member_email);
	}
	
	//비밀번호찾기 폼
	@GetMapping(value="/searchPwdForm")
	public String searchPwdForm() {
		return "/searchPwdForm";
	}
	
	
	//비밀번호찾기
	@PostMapping(value="/searchPwd")
	@ResponseBody
	public void searchPwd(@ModelAttribute MemberDTO memberDTO, HttpServletResponse response) {
		memberSerivce.searchPwd(memberDTO, response);
	}
	
	//비밀번호 변경 폼 
	@GetMapping(value="/changePwdForm")
	public String changePwdForm() {
		return "/changePwdForm";
	}
	
	//비밀번호 변경 
	@PostMapping(value="/changePwd")
	@ResponseBody
	public void changePwd(@RequestParam("member_id")String member_id,@RequestParam("member_pwd")String member_pwd) {
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_id(member_id);
		memberDTO.setMember_pwd(member_pwd);

		memberSerivce.chagePwd(memberDTO);
	
	}
}