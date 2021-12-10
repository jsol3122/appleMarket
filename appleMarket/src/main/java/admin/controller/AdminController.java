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
import org.springframework.web.servlet.ModelAndView;

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
	
	//공지사항 작성
	@GetMapping("/adminNoticeWriteForm")
	public ModelAndView adminNoticeWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminNoticeWriteForm.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	@PostMapping("/getadminNoticeWrite")
	@ResponseBody
	public void getadminNoticeWrite(@ModelAttribute AdminNoticeDTO adminNoticeDTO ) {
		adminService.getadminNoticeWrite(adminNoticeDTO);
	}
	
	//공지사항 수정
	@GetMapping("/adminNoticeModifyForm")
	public ModelAndView adminNoticeModifyForm(@ModelAttribute AdminNoticeDTO adminNoticeDTO ) {
		System.out.println("adminNoticeModifyForm "+adminNoticeDTO.getAdmin_notice_seq());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("admin_notice_seq", adminNoticeDTO.getAdmin_notice_seq());
		modelAndView.addObject("display", "/admin/adminNoticeModifyForm.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}

	@PostMapping("getadminNoticeModify")
	@ResponseBody
	public void getadminNoticeModify(@ModelAttribute AdminNoticeDTO adminNoticeDTO ) {
		adminService.getadminNoticeModify(adminNoticeDTO);
	}
	
	@PostMapping("/getadminNoticeView")
	@ResponseBody
	public AdminNoticeDTO getadminNoticeView(@RequestParam int admin_notice_seq ){
		System.out.println("getadminNoticeView "+admin_notice_seq);
		return adminService.getadminNoticeView(admin_notice_seq);
	}
	
	//공지사항 삭제 
	@PostMapping("/adminNoticeDelete")
	@ResponseBody 
	public void adminNoticeDelete(@ModelAttribute AdminNoticeDTO adminNoticeDTO ){
		adminService.adminNoticeDelete(adminNoticeDTO);
	}


	
	//회원 데이터 
	@GetMapping("/adminMemberList")
	public ModelAndView adminMemberList(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminMemberList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}

	
	//회원탈퇴
	@PostMapping("/adminMemberDelete")
	@ResponseBody
	public void adminMemberDelete(@ModelAttribute MemberDTO memberDTO) {
		adminService.adminMemberDelete(memberDTO);
	}

	
	
	//우리동네게시판 관리
	@GetMapping("/adminLocalCommunityList")
	public ModelAndView adminLocalCommunityList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminLocalCommunityList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	//우리동네댓글 관리
	@GetMapping("/adminLocalCommunityCommentList")
	public ModelAndView adminLocalCommunityCommentList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminLocalCommunityCommentList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	
	//조잘조잘게시판 관리
	@GetMapping("/adminCommunityList")
	public ModelAndView adminCommunityList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminCommunityList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	//조잘조잘댓글 관리
	@GetMapping("/adminCommunityCommentList")
	public ModelAndView adminCommunityCommentList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminCommunityCommentList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	
	
	//신고 데이터 화면 
}