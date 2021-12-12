package localCommunityboardComment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import communityboardComment.bean.CommunityboardCommentDTO;
import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;
import localCommunityboardComment.service.LocalCommunityboardCommentService;

@Controller
public class LocalCommunityboardCommentController {
	@Autowired
	private LocalCommunityboardCommentService localCommunityboardCommentService;
	
	@GetMapping("/localComment/localCommunityboardCommentGetList")
	@ResponseBody
	public List<LocalCommunityboardCommentDTO> localCommunityboardCommentGetList(@RequestParam String localcommunity_seq ){
		System.out.println(localCommunityboardCommentService.localCommunityboardCommentGetList(localcommunity_seq));
		return localCommunityboardCommentService.localCommunityboardCommentGetList(localcommunity_seq);
	}
	
	@GetMapping("/localComment/commentTotal") @ResponseBody
	public int commentTotal(@RequestParam String localcommunity_seq) {
		return localCommunityboardCommentService.commentTotal(localcommunity_seq);
	}
	
	@PostMapping("/localComment/localCommunityboardCommentWrite")
	@ResponseBody
	public void localCommunityboardCommentWrite(@ModelAttribute LocalCommunityboardCommentDTO localCommunityboardCommentDTO
												,HttpSession session
												, HttpServletRequest request) {
		HttpSession loginSession = request.getSession();
		String member_id = (String)loginSession.getAttribute("member_id");
		System.out.println(member_id);
		localCommunityboardCommentDTO.setLocalcommunity_comment_user_id(member_id);
		localCommunityboardCommentService.localCommunityboardCommentWrite(localCommunityboardCommentDTO);
	}
	
	@GetMapping("/localComment/localCommunityboardCommentModifyForm")
	public String localCommunityboardCommentModifyForm() {
		return "/localComment/localCommunityboardCommentModifyForm";
	}
	
	@PostMapping("/localComment/localCommunityboardCommentModify")
	@ResponseBody
	public void localCommunityboardCommentModify(@ModelAttribute LocalCommunityboardCommentDTO localCommunityboardCommentDTO) {
		localCommunityboardCommentService.localCommunityboardCommentModify(localCommunityboardCommentDTO);
	}
	
	@GetMapping("/localComment/localCommunityboardCommentDelete")
	@ResponseBody
	public void localCommunityboardCommentDelete(@RequestParam String localcommunity_comment_seq) {
		localCommunityboardCommentService.localCommunityboardCommentDelete(localcommunity_comment_seq);
	}
	
	@PostMapping("/localComment/localCommunityboardCommentReply")
	public void localCommunityboardCommentReply(@ModelAttribute LocalCommunityboardCommentDTO localCommunityboardCommentDTO) {
		
		int localCommunityboard_comment_pseq = localCommunityboardCommentDTO.getLocalcommunity_comment_seq();
		int localCommunityboard_seq = localCommunityboardCommentDTO.getLocalcommunity_seq();
		String localCommunityboard_comment_content = localCommunityboardCommentDTO.getLocalcommunity_comment_content();
		String localCommunityboard_comment_user_id = localCommunityboardCommentDTO.getLocalcommunity_comment_user_id();
		
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("localcommunity_comment_pseq", localCommunityboard_comment_pseq+"");
		map.put("localcommunity_seq", localCommunityboard_seq+"");
		map.put("localcommunity_comment_content", localCommunityboard_comment_content);
		map.put("localcommunity_comment_user_id", localCommunityboard_comment_user_id);
		
		localCommunityboardCommentService.localCommunityboardCommentReply(map);
	}
	
	
	
	
}
