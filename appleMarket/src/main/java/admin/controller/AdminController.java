package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
}
