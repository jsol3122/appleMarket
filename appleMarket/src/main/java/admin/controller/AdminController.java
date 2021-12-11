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
import admin.bean.BlackListDTO;
import admin.service.AdminService;
import buyerboard.bean.BuyerboardDTO;
import communityboard.bean.CommunityboardDTO;
import communityboardComment.bean.CommunityboardCommentDTO;
import location.bean.LocationDTO;
import admin.bean.AdminNoticeDTO;
import admin.service.AdminService;
import localCommunityboard.bean.LocalCommunityboardDTO;
import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;
import member.bean.MemberDTO;
import saleboard.bean.SaleboardDTO;
import warningBoard.bean.WarningBoardDTO;

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

	//회원 데이터 출력
	@PostMapping("/getAdminMemberList")
	@ResponseBody
	public List<MemberDTO> getAdminMemberList(){
		return adminService.getAdminMemberList();
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
		adminlocationDelete(memberDTO.getMember_id());
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
	
	//블랙리스트 insert, 멤버 delete, 지역인증 delete (매너온도 < 20) 
	@PostMapping("/adminBlackListDelete")
	@ResponseBody
	public void adminBlackListDelete(@ModelAttribute MemberDTO memberDTO) {
		adminService.adminBlackListDelete(memberDTO);
		adminlocationDelete(memberDTO.getMember_id());
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
	
	//조잘조잘 리스트 데이터 출력
	@PostMapping("/getAdminCommunityBoardList")
	@ResponseBody
	public List<CommunityboardDTO> getAdminCommunityBoardList(){
		return adminService.getAdminCommunityBoardList();
	}
	
	//조잘조잘 데이터 상세화면 
	@GetMapping(value="/adminCommunityBoardView")
	public ModelAndView adminCommunityBoardView() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminCommunityBoardView.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	//회원 데이터 출력
	@PostMapping("/getAdminMemberListId")
	@ResponseBody
	public MemberDTO getAdminMemberListId(String member_id){
		return adminService.getAdminMemberListId(member_id);
	}

	//사고게시판 리스트 데이터 출력 - 동네마다
	@PostMapping("/getAdminBuyerBoardListDong")
	@ResponseBody
	public List<BuyerboardDTO> getAdminBuyerBoardListDong(String location_dong){
		return adminService.getAdminBuyerBoardListDong(location_dong);
	}

	
	
	//우리동네게시판 관리
	@GetMapping("/adminLocalCommunityList")
	public ModelAndView adminLocalCommunityList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminLocalCommunityList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	@PostMapping("/getAdminLocalCommunityList")
	@ResponseBody
	public List<LocalCommunityboardDTO> getAdminLocalCommunityList(){
		return adminService.getAdminLocalCommunityList();
	}
	
	@PostMapping("/getAdminLocalCommunityListId")
	@ResponseBody
	public List<LocalCommunityboardDTO> getAdminLocalCommunityListId(@RequestParam String localcommunity_user_id){
		return adminService.getAdminLocalCommunityListId(localcommunity_user_id);
	}
	
	@PostMapping("/adminLocalCommunityDelete")
	@ResponseBody
	public void adminLocalCommunityDelete(@RequestParam String localcommunity_seq) {
		adminService.adminLocalCommunityDelete(localcommunity_seq);
	}
	
	@GetMapping("/adminLocalCommunityView")
	public ModelAndView adminLocalCommunityView(@RequestParam String localcommunity_seq) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("localcommunity_seq", localcommunity_seq);
		modelAndView.addObject("display", "/admin/adminLocalCommunityView.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	@PostMapping("/getAdminLocalCommunityView")
	@ResponseBody
	public LocalCommunityboardDTO getAdminLocalCommunityView(@RequestParam String localcommunity_seq) {
		return adminService.getAdminLocalCommunityView(localcommunity_seq);
	}
	
	
	
	//우리동네댓글 관리
	@GetMapping("/adminLocalCommunityCommentList")
	public ModelAndView adminLocalCommunityCommentList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminLocalCommunityCommentList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	@PostMapping("/getAdminLocalCommunityComment")
	@ResponseBody
	public List<LocalCommunityboardCommentDTO> getAdminLocalCommunityComment(){
		System.out.println("1");
		return adminService.getAdminLocalCommunityComment();
	}
	
	@PostMapping("/adminLocalCommunityCommentDelete")
	@ResponseBody
	public void adminLocalCommunityCommentList(@RequestParam String localcommunity_comment_seq) {
		adminService.adminLocalCommunityCommentList(localcommunity_comment_seq);
	}
	

	//조잘조잘 데이터 상세 출력
	@PostMapping("/getadminCommunityBoardView")
	@ResponseBody
	public CommunityboardDTO getadminCommunityBoardView(int communityboard_seq){
		return adminService.getadminCommunityBoardView(communityboard_seq);
	}

	//조잘조잘게시판 글 삭제
	@PostMapping("/adminCommunityBoardDelete")
	@ResponseBody
	public void adminCommunityBoardDelete(int communityboard_seq) {
		adminService.adminCommunityBoardDelete(communityboard_seq);
	}
	
	//조잘조잘 리스트출력(아이디별)
	@PostMapping("/getAdminCommunityListId")
	@ResponseBody
	public List<CommunityboardDTO> getAdminCommunityListId(String communityboard_user_id){
		return adminService.getAdminCommunityListId(communityboard_user_id);
	}

	//조잘조잘댓글(communityComment) 리스트 화면
	@GetMapping(value="/adminCommunityCommentList")
	public ModelAndView adminCommunityCommentList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "/admin/adminCommunityCommentList.jsp");
		modelAndView.setViewName("/admin/adminNoticeList");
		return modelAndView;
	}
	
	//조잘조잘 댓글 리스트 데이터 출력
	@PostMapping("/getAdminCommunityCommentList")
	@ResponseBody
	public List<CommunityboardCommentDTO> getAdminCommunityCommentList(){
		return adminService.getAdminCommunityCommentList();
	}
	
	//
	@PostMapping("/adminCommunityCommentDelete")
	@ResponseBody
	public void adminCommunityCommentDelete(int communityboard_comment_seq) {
		adminService.adminCommunityCommentDelete(communityboard_comment_seq);
	}
	
	//회원탈퇴시 지역인증 삭제 
	@PostMapping("/adminlocationDelete")
	@ResponseBody
	public void adminlocationDelete(String member_id) {
		adminService.adminlocationDelete(member_id);
	}
	
	//블랙리스트 회원 확인여부 
	@PostMapping("/adminBlackListCheck")
	@ResponseBody
	public BlackListDTO adminBlackListCheck(String member_id) {
		return adminService.adminBlackListCheck(member_id);
	}
}

