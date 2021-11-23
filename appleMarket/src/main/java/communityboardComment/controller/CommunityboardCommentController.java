package communityboardComment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import communityboardComment.bean.CommunityboardCommentDTO;
import communityboardComment.service.CommunityboardCommentService;

@Controller
public class CommunityboardCommentController {
	
	@Autowired
	CommunityboardCommentService communityboardCommentService;
	
	
	@GetMapping("/comment/communityboardCommentGetList")
	public List<CommunityboardCommentDTO> communityboardCommentGetList(@RequestParam String communityboard_seq){
		
		return communityboardCommentService.communityboardCommentGetList(communityboard_seq);
		
	}
	
	@PostMapping("/comment/communityboardCommentWrite")
	@ResponseBody
	public void communityboardCommentWrite(@RequestParam String communityboard_seq) {
		communityboardCommentService.communityboardCommentWrite();
	}
}
