package myPage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import buyerboard.bean.BuyerboardDTO;
import communityboard.bean.CommunityboardDTO;
import communityboardComment.bean.CommunityboardCommentDTO;
import localCommunityboard.bean.LocalCommunityboardDTO;
import myPage.service.MyPageService;
import net.sf.json.JSONObject;
import saleboard.bean.SaleboardDTO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	 // 조잘조잘 글 내역 폼
	@GetMapping("/communityHistory")
	public String communityHistory(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		request.setAttribute("display", "/view/myPage/communityHistory.jsp");
		return "/view/myPage/mypageMainForm";
	}
	
	// 조잘조잘 글 리스트 띄우기
	@PostMapping("/myCommunityGetList")
	@ResponseBody
	public JSONObject myCommunityGetList(@RequestParam String pg, HttpSession session
			   							, HttpServletRequest request) {
		
		HttpSession loginSession = request.getSession();
		String member_id = (String)loginSession.getAttribute("member_id");
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("pg", pg);
		map.put("communityboard_user_id", member_id);
		
		return myPageService.myCommunityGetList(map);
	}
	
	// 조잘조잘 글 삭제
	@PostMapping("/communityHistoryDelete") @ResponseBody
	public void communityHistoryDelete(@RequestParam String communityboard_seq) {
		myPageService.communityHistoryDelete(Integer.parseInt(communityboard_seq));
	}
	
	@GetMapping("/myCommunityView")
	public String myCommunityView() {
		return "/myCommunityView";
	}
	
	@PostMapping("/myCommunityGetView")
	@ResponseBody
	public CommunityboardDTO myCommunityGetView(@RequestParam int communityboard_seq) {
		return myPageService.myCommunityGetView(communityboard_seq);
	}
	
	// 조잘조잘 댓글 폼
	@GetMapping("/communityCommentHistory")
	public String communityCommentHistory(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		request.setAttribute("display", "/view/myPage/communityCommentHistory.jsp");
		return "/view/myPage/mypageMainForm";
	}
	
	// 조잘조잘 댓글 불러오기
	@PostMapping("/myCommunityCommentGetList")
	@ResponseBody
	public JSONObject myCommunityCommentGetList(@RequestParam String pg, 
							HttpSession session, HttpServletRequest request){
		HttpSession loginSession = request.getSession();
		String member_id = (String)loginSession.getAttribute("member_id");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("pg", pg);
		map.put("communityboard_comment_user_id", member_id);
		
		return myPageService.myCommunityCommentGetList(map);
	}
	
	// 우리동네 댓글 삭제
	@PostMapping("/myCommunityCommentDelete") @ResponseBody
	public void myCommunityCommentDelete(@RequestParam String communityboard_comment_seq) {
		myPageService.myCommunityCommentDelete(Integer.parseInt(communityboard_comment_seq));
	}
	
	@GetMapping("/myCommunityCommentView")
	public String myCommunityCommentView() {
		return "/myCommunityCommentView";
	}
	
	
	@PostMapping("/myCommunityCommentGetView")
	@ResponseBody
	public CommunityboardDTO myCommunityCommentGetView(@RequestParam int communityboard_seq) {
		return myPageService.myCommunityGetView(communityboard_seq);
	}
	
	// 우리동네 글 내역 열기
	@GetMapping("/localCommunityHistory")
	public String localCommunityHistory(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		request.setAttribute("display", "/view/myPage/localCommunityHistory.jsp");
		return "/view/myPage/mypageMainForm";
	}
	
	// 우리동네 글 내역 불러오기
	@PostMapping("/myLocalGetList")
	@ResponseBody
	public JSONObject myLocalGetList (@RequestParam String pg, 
			HttpSession session, HttpServletRequest request) {
		HttpSession loginSession = request.getSession();
		String member_id = (String)loginSession.getAttribute("member_id");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("pg", pg);
		map.put("localcommunity_user_id", member_id);
		
		
		return myPageService.myLocalGetList(map);
	}
	
	// 우리동네 글 삭제
	@PostMapping("/localCommunityHistoryDelete") @ResponseBody
	public void localCommunityHistoryDelete(@RequestParam String localcommunity_seq) {
		myPageService.localCommunityHistoryDelete(Integer.parseInt(localcommunity_seq));
	}
	
	@GetMapping("/myLocalView")
	public String myLocalView() {
		return "/myLocalView";
	}
	
	
	@PostMapping("/myLocalGetView")
	@ResponseBody
	public LocalCommunityboardDTO myLocalGetView(@RequestParam int localcommunity_seq) {
		return myPageService.myLocalGetView(localcommunity_seq);
	}
	
	// 우리동네 댓글 폼
	@GetMapping("/localCommunityCommentHistory")
	public String localCommunityCommentHistory(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		request.setAttribute("display", "/view/myPage/localCommunityCommentHistory.jsp");
		return "/view/myPage/mypageMainForm";
	}
	
	// 우리동네 댓글 불러오기
	@PostMapping("/myLocalCommentGetList")
	@ResponseBody
	public JSONObject myLocalCommentGetList(@RequestParam String pg, HttpSession session
				, HttpServletRequest request) {
		
		HttpSession loginSession = request.getSession();
		String member_id = (String)loginSession.getAttribute("member_id");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("pg", pg);
		map.put("localcommunity_comment_user_id", member_id);
		
		return myPageService.myLocalCommentGetList(map);
		
	}
	
	// 우리동네 댓글 삭제
	@PostMapping("/myLocalCommentDelete") @ResponseBody
	public void myLocalCommentDelete(@RequestParam String localcommunity_comment_seq) {
		myPageService.myLocalCommentDelete(Integer.parseInt(localcommunity_comment_seq));
	}
	
	@GetMapping("/myLocalCommentView")
	public String myLocalCommentView() {
		return "/myLocalCommentView";
	}
	
	@PostMapping("/myLocalCommentGetView")
	@ResponseBody
	public LocalCommunityboardDTO myLocalCommentGetView(@RequestParam int localcommunity_seq) {
		return myPageService.myLocalGetView(localcommunity_seq);
	}
	
	
	// 팔고게시판 글 리스트 열기
	@GetMapping(value="/salehistory")
	public String salehistory(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		request.setAttribute("display", "/view/myPage/salehistory.jsp");
		return "/view/myPage/mypageMainForm";
	}
	
	// 팔고게시판 글 불러오기
	@PostMapping("/mySaleGetList")
	@ResponseBody
	public JSONObject mySaleGetList(@RequestParam String pg, HttpSession session, HttpServletRequest request) {
		
		HttpSession loginSession = request.getSession();
		String member_id = (String)loginSession.getAttribute("member_id");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("pg", pg);
		map.put("member_id", member_id);
		
		return myPageService.mySaleGetList(map);
	}
	
	@GetMapping("/mySaleView")
	public String mySaleView() {
		return "/mySaleView";
	}
	
	@PostMapping("/mySaleGetView")
	@ResponseBody
	public SaleboardDTO mySaleGetView(@RequestParam int sale_seq) {
		return myPageService.mySaleGetView(sale_seq);
	}
	
	@PostMapping("/salehistoryDelete") @ResponseBody
	public void salehistoryDelete(@RequestParam String sale_seq) {
		myPageService.salehistoryDelete(Integer.parseInt(sale_seq));
	}
	
	// 사고게시판 글 리스트 열기
	@GetMapping(value="/buyhistory")
	public String buyhistory(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		request.setAttribute("display", "/view/myPage/buyhistory.jsp");
		return "/view/myPage/mypageMainForm";
	}
	
	// 사고게시판 글 리스트 불러오기
	@PostMapping("/myBuyerGetList")
	@ResponseBody
	public JSONObject myBuyerGetList(@RequestParam String pg, HttpSession session, HttpServletRequest request) {
		HttpSession loginSession = request.getSession();
		String member_id = (String)loginSession.getAttribute("member_id");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("pg", pg);
		map.put("member_id", member_id);
		return myPageService.myBuyerGetList(map);
		
	}
	
	// 사고게시판 글 삭제
	@PostMapping("/buyhistoryDelete") @ResponseBody
	public void buyhistoryDelete(@RequestParam String buyerboard_seq) {
		myPageService.buyhistoryDelete(Integer.parseInt(buyerboard_seq));
	}
	
	@GetMapping("/myBuyerView")
	public String myBuyerView() {
		
		return "/myBuyerView";
	}
	
	@PostMapping("/myBuyerGetView")
	@ResponseBody
	public BuyerboardDTO myBuyerGetView(@RequestParam int buyerboard_seq) {
		return myPageService.myBuyerGetView(buyerboard_seq);
	}
	
	
	
	
}
