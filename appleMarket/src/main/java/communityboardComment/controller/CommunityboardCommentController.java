package communityboardComment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import communityboardComment.bean.CommunityboardCommentDTO;
import communityboardComment.service.CommunityboardCommentService;

@Controller
public class CommunityboardCommentController {
	
	@Autowired
	CommunityboardCommentService communityboardCommentService;
	
	
	@GetMapping("/comment/communityboardCommentGetList")
	@ResponseBody
	public List<CommunityboardCommentDTO> communityboardCommentGetList(@RequestParam String communityboard_seq){
		
		return communityboardCommentService.communityboardCommentGetList(communityboard_seq);
		
	}
	
	@PostMapping("/comment/communityboardCommentWrite")
	@ResponseBody
	public void communityboardCommentWrite(@ModelAttribute CommunityboardCommentDTO communityboardCommentDTO) {

		communityboardCommentService.communityboardCommentWrite(communityboardCommentDTO);
	}
	
	@GetMapping("/comment/communityboardCommentModifyForm")
	public String communityboardCommentModifyForm() {
		
		return "/comment/communityboardCommentModifyForm";
	}
	
	@PostMapping("/comment/communityboardCommentModify")
	@ResponseBody
	public void communityboardCommentModify(@ModelAttribute CommunityboardCommentDTO communityboardCommentDTO) {
		communityboardCommentService.communityboardCommentModify(communityboardCommentDTO);
	}
	
	@PostMapping("/comment/communityboardCommentReply")
	public void communityboardCommentReply(@ModelAttribute CommunityboardCommentDTO communityboardCommentDTO) {
		
		int communityboard_comment_pseq = communityboardCommentDTO.getCommunityboard_comment_seq();
		int communityboard_seq = communityboardCommentDTO.getCommunityboard_seq();
		String communityboard_comment_content = communityboardCommentDTO.getCommunityboard_comment_content();
		String communityboard_comment_user_id = communityboardCommentDTO.getCommunityboard_comment_user_id();
		
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("communityboard_comment_pseq", communityboard_comment_pseq+"");
		map.put("communityboard_seq", communityboard_seq+"");
		map.put("communityboard_comment_content", communityboard_comment_content);
		map.put("communityboard_comment_user_id", communityboard_comment_user_id);
		
		communityboardCommentService.communityboardCommentReply(map);
	}
	
	
	
	
	
}
