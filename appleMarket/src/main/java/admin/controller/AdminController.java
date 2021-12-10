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
import buyerboard.bean.BuyerboardDTO;
import member.bean.MemberDTO;
import saleboard.bean.SaleboardDTO;
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
	
	//판매게시판 리스트 화면
	@GetMapping(value="/adminSaleBoardList")
	public ModelAndView adminSaleBoardList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminSaleBoardList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	//판매게시판 리스트 데이터 출력
	@PostMapping("/getAdminSaleBoardList")
	@ResponseBody
	public List<SaleboardDTO> getAdminSaleBoardList(){
		return adminService.getAdminSaleBoardList();
	}
	
	//판매게시판 데이터 상세화면 
	@GetMapping(value="/adminSaleBoardView")
	public ModelAndView adminSaleBoardView() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminSaleBoardView.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}

	//판매게시판 데이터 상세 출력
	@PostMapping("/getAdminSaleBoardView")
	@ResponseBody
	public SaleboardDTO getAdminSaleBoardView(int sale_seq){
		return adminService.getAdminSaleBoardView(sale_seq);
	}
	
	//사고게시판 리스트 화면
	@GetMapping(value="/adminBuyerBoardList")
	public ModelAndView adminBuyerBoardList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminBuyerBoardList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	//사고게시판 리스트 데이터 출력
	@PostMapping("/getAdminBuyerBoardList")
	@ResponseBody
	public List<BuyerboardDTO> getAdminBuyerBoardList(){
		return adminService.getAdminBuyerBoardList();
	}
	
	
	//사고게시판 데이터 상세화면 
	@GetMapping(value="/adminBuyerBoardView")
	public ModelAndView adminBuyerBoardView() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminBuyerBoardView.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	//사고게시판 데이터 상세 출력
	@PostMapping("/getAdminBuyerBoardView")
	@ResponseBody
	public BuyerboardDTO getAdminBuyerBoardView(int buyerboard_seq){
		return adminService.getAdminBuyerBoardView(buyerboard_seq);
	}
	
	//팔고게시판 글 삭제
	@PostMapping("/adminSaleBoardDelete")
	@ResponseBody
	public void adminSaleBoardDelete(int sale_seq) {
		adminService.adminSaleBoardDelete(sale_seq);
	}
	
	//사고게시판 글 삭제
	@PostMapping("/adminBuyerBoardDelete")
	@ResponseBody
	public void adminBuyerBoardDelete(int buyerboard_seq) {
		adminService.adminBuyerBoardDelete(buyerboard_seq);
	}

	//판매게시판 리스트 데이터 출력 - 동네마다
	@PostMapping("/getAdminSaleBoardListDong")
	@ResponseBody
	public List<SaleboardDTO> getAdminSaleBoardListDong(String location_dong){
		return adminService.getAdminSaleBoardListDong(location_dong);
	}
	
	//조잘조잘(community) 리스트 화면
	@GetMapping(value="/adminCommunityBoardList")
	public ModelAndView adminCommunityBoardList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminCommunityBoardList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
}
