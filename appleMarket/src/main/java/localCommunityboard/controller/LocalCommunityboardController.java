package localCommunityboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import localCommunityboard.service.LocalCommunityboardService;
import net.sf.json.JSONObject;

@Controller
public class LocalCommunityboardController {
	@Autowired
	private LocalCommunityboardService localCommunityboardService;
	
	@GetMapping("/localCommunityboard/localCommunityboardList")
	public String localCommunityboardList() {
		return "/localCommunityboard/localCommunityboardList";
	}
	
	@GetMapping("/localCommunityboard/localCommunityboardGetList")
	@ResponseBody
	public JSONObject localCommunityboardGetList(@RequestParam String pg) {
		int page = Integer.parseInt(pg);
		return localCommunityboardService.localCommunityboardGetList(page);
	}
	
	
	
	
	
}
