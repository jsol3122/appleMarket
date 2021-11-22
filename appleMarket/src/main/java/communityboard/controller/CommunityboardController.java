package communityboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import communityboard.bean.CommunityboardDTO;
import communityboard.service.CommunityboardService;
import net.sf.json.JSONObject;

@Controller
public class CommunityboardController {
	@Autowired
	private CommunityboardService communityboardService;
	
	@GetMapping("/index")
	public String index() {
		return "/index";
	}
	
	@GetMapping("/board/communityboardList")
	public String communityboardList() {
		return "/board/commuityboardList;";
	}
	
	@GetMapping("/board/communityboardGetList")
	@ResponseBody
	public JSONObject communityboardGetList(@RequestParam int pg) {
		return communityboardService.communityboardGetList(pg);
	}
	
	@GetMapping("/board/communityboardWriteForm")
	public String communityboardWriteForm() {
		return "/board/communityboardWriteForm";
	}
	
	@PostMapping("/board/communityboardWrite")
	@ResponseBody
	public void communityboardWrite(@ModelAttribute CommunityboardDTO communityboardDTO) {
		communityboardService.communityboardWrite(communityboardDTO);
	}
	
	@GetMapping("/board/communityboardModifyForm")
	public String communityboardModifyForm() {
		return "/board/communityboardModifyForm";
	}
	
	@PostMapping("/board/communityboardModify")
	@ResponseBody
	public void communityboardModify(@ModelAttribute CommunityboardDTO communityboardDTO) {
		communityboardService.communityboardModify(communityboardDTO);
	}
	
	@GetMapping("/board/communityboardDelete")
	@ResponseBody
	public void communityboardDelete(@RequestParam int communityboard_seq) {
		communityboardService.communityboardDelete(communityboard_seq);
	}
	
	@GetMapping("/board/communityboardView")
	public String communityboardView() {
		return "/board/communityboardView";
	}
	
	@PostMapping("/board/communityboardGetView")
	public List<CommunityboardDTO>  communityboardGetView(@RequestParam int communityboard_seq){
		return 	communityboardService.communityboardGetView(communityboard_seq);	
	}
	
	
}
