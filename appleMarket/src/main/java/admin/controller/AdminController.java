package admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.bean.AdminNoticeDTO;
import admin.service.AdminService;
import member.bean.MemberDTO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//관리자페이지 화면
	@GetMapping("/adminindex")
	public String adminMemberListForm() {
		return "/admin/adminindex";
	}
	
	//관리자메인 폼 - 공지사항
	@GetMapping(value="/adminNoticeList")
	public String mypageMainForm() {
		return "/admin/adminNoticeList";
	}
	
	//공지사항 데이터 출력
	@PostMapping("/getAdminNoticeList")
	@ResponseBody
	public List<AdminNoticeDTO> getAdminNoticeList(){
		return adminService.getAdminNoticeList();
	}
	
	//공지사항 삭제 
	@PostMapping("/adminNoticeDelete")
	@ResponseBody 
	public void adminNoticeDelete(@ModelAttribute AdminNoticeDTO adminNoticeDTO ){
		adminService.adminNoticeDelete(adminNoticeDTO);
	}

	//회원 데이터 폼
	@GetMapping("/adminMemberList")
	public String adminMemberListForm(HttpServletRequest request){
		//request.setAttribute("display", "/admin/adminMemberList.jsp");
		return "/admin/adminMemberList";
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

	
	//신고 데이터 화면 
}