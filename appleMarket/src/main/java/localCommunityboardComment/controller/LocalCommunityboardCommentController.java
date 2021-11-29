package localCommunityboardComment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;
import localCommunityboardComment.service.LocalCommunityboardCommentService;

@Controller
public class LocalCommunityboardCommentController {
	@Autowired
	LocalCommunityboardCommentService localCommunityboardCommentService;
	
	@GetMapping("/localComment/localCommunityboardCommentGetList")
	@ResponseBody
	public List<LocalCommunityboardCommentDTO> localCommunityboardCommentGetList(@RequestParam String localcommunity_seq ){
		return localCommunityboardCommentService.localCommunityboardCommentGetList(localcommunity_seq);
	}
	
	@PostMapping("/localComment/localCommunityboardCommentWrite")
	@ResponseBody
	public void localCommunityboardCommentWrite(@ModelAttribute LocalCommunityboardCommentDTO localCommunityboardCommentDTO ) {
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
	
}
