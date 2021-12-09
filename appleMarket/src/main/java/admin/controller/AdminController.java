package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.BlackListDTO;
import admin.service.AdminService;
import member.bean.MemberDTO;
import warningBoard.bean.WarningBoardDTO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//관리자페이지 화면
	@GetMapping("/admin/adminindex")
	public String adminMemberListForm() {
		return "/admin/adminindex";
	}
	
	//관리자메인 폼 - 공지사항
	@GetMapping(value="/adminNoticeList")
	public String mypageMainForm() {
		return "/admin/adminNoticeList";
	}

	//회원 데이터 
	@GetMapping("/adminMemberList")
	public ModelAndView adminMemberList(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminMemberList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	//회원 데이터 출력
	@PostMapping("/getAdminMemberList")
	@ResponseBody
	public List<MemberDTO> getAdminMemberList(){
		return adminService.getAdminMemberList();
	}
	
	//회원탈퇴
	@PostMapping("/adminMemberDelete")
	@ResponseBody
	public void adminMemberDelete(@ModelAttribute MemberDTO memberDTO) {
		adminService.adminMemberDelete(memberDTO);
	}
	
	//신고게시판 데이터 화면
	@GetMapping(value="/adminWarningList")
	public ModelAndView adminWarningList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminWarningList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	//신고게시판 데이터 출력
	@PostMapping("/getAdminWarningList")
	@ResponseBody
	public List<WarningBoardDTO> getAdminWarningList(){
		return adminService.getAdminWarningList();
	}
	
	//신고게시판 데이터 상세 화면
	@GetMapping(value="/adminWarningView")
	public ModelAndView adminWarningView() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminWarningView.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}

	//신고게시판 데이터 상세 출력
	@PostMapping("/getAdminWarningView")
	@ResponseBody
	public WarningBoardDTO getadminWarningView(int warning_seq){
		return adminService.getAdminWarningView(warning_seq);
	}
	
	//신고게시판 처리완료로 바꾸기 
	@PostMapping("/adminWarningChange")
	@ResponseBody
	public void adminWarningChange(@ModelAttribute WarningBoardDTO warningBoardDTO) {
		adminService.adminWarningChange(warningBoardDTO);
	}
	
	//매너온도 5씩 내리기
	@PostMapping("/adminReputationDown")
	@ResponseBody
	public void adminReputationDown(@ModelAttribute MemberDTO memberDTO) {
		adminService.adminReputationDown(memberDTO);
	}
	
	//매너온도 5씩 올리기
	@PostMapping("/adminReputationUp")
	@ResponseBody
	public void adminReputationUp(@ModelAttribute MemberDTO memberDTO) {
		adminService.adminReputationUp(memberDTO);
	}
	
	//블랙리스트 insert, 멤버 delete (매너온도 < 20) 
	@PostMapping("/adminBlackListDelete")
	@ResponseBody
	public void adminBlackListDelete(@ModelAttribute MemberDTO memberDTO) {
		adminService.adminBlackListDelete(memberDTO);
	}
	
	
	//블랙리스트 회원 데이터 
	@GetMapping("/adminBlackList")
	public ModelAndView adminBlackList(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminBlackList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	//블랙리스트 회원 데이터 출력
	@PostMapping("/getAdminBlackList")
	@ResponseBody
	public List<BlackListDTO> getAdminBlackList(){
		return adminService.getAdminBlackList();
	}
}
