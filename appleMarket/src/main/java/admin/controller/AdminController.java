package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.service.AdminService;
import member.bean.MemberDTO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//회원 데이터 화면
	@GetMapping("/adminMemberListForm")
	public String adminMemberListForm() {
		return "/admin/adminMemberListForm";
	}
	
	//회원 데이터 출력
	@PostMapping("/adminMemberList")
	@ResponseBody
	public List<MemberDTO> adminMemberList(){
		return adminService.adminMemberList();
	}
	
	//회원탈퇴
	@PostMapping("/adminMemberDelete")
	@ResponseBody
	public void adminMemberDelete(@ModelAttribute MemberDTO memberDTO) {
		adminService.adminMemberDelete(memberDTO);
	}
}
