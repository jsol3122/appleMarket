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
	
	@GetMapping("/myCommunityList")
	public String myCommunityList() {
		return "/myCommunityList";
	}
	
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
	
	@GetMapping("/myCommunityView")
	public String myCommunityView() {
		return "/myCommunityView";
	}
	
	@PostMapping("/myCommunityGetView")
	@ResponseBody
	public CommunityboardDTO myCommunityGetView(@RequestParam int communityboard_seq) {
		return myPageService.myCommunityGetView(communityboard_seq);
	}
	
	@GetMapping("/myCommunityCommentList")
	public String myCommunityCommentList() {
		return "/myCommunityCommentList";
	}
	
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
	
	@GetMapping("/myCommunityCommentView")
	public String myCommunityCommentView() {
		return "/myCommunityCommentView";
	}
	
	
	@PostMapping("/myCommunityCommentGetView")
	@ResponseBody
	public CommunityboardDTO myCommunityCommentGetView(@RequestParam int communityboard_seq) {
		return myPageService.myCommunityGetView(communityboard_seq);
	}
	
	@GetMapping("/myLocalList")
	public String myLocalList() {
		return "/myLocalList";
	}
	
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
	
	@GetMapping("/myLocalView")
	public String myLocalView() {
		return "/myLocalView";
	}
	
	
	@PostMapping("/myLocalGetView")
	@ResponseBody
	public LocalCommunityboardDTO myLocalGetView(@RequestParam int localcommunity_seq) {
		return myPageService.myLocalGetView(localcommunity_seq);
	}
	
	@GetMapping("/myLocalCommentList")
	public String myLocalCommentList() {
		return "/myLocalCommentList";
	}
	
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
	
	@GetMapping("/myLocalCommentView")
	public String myLocalCommentView() {
		return "/myLocalCommentView";
	}
	
	@PostMapping("/myLocalCommentGetView")
	@ResponseBody
	public LocalCommunityboardDTO myLocalCommentGetView(@RequestParam int localcommunity_seq) {
		return myPageService.myLocalGetView(localcommunity_seq);
	}
	
	
	//마이페이지 판매내역 폼
	@GetMapping(value="/salehistory")
	public String salehistory(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		request.setAttribute("display", "/view/myPage/salehistory.jsp");
		return "/view/myPage/mypageMainForm";
	}
	
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
	
	//마이페이지 구매내역 폼
	@GetMapping(value="/buyhistory")
	public String buyhistory(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		request.setAttribute("display", "/view/myPage/buyhistory.jsp");
		return "/view/myPage/mypageMainForm";
	}
	
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
