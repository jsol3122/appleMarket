package localCommunityboard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import localCommunityboard.bean.LocalCommunityboardDTO;

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
	public JSONObject localCommunityboardGetList(@RequestParam String pg, HttpSession session) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pg", pg);
		map.put("localcommunity_user_id", session.getAttribute("member_id"));
		
		return localCommunityboardService.localCommunityboardGetList(map);
	}
	

	@GetMapping("/localCommunityboard/localCommunityboardWriteForm")
	public String localCommunityboardWriteForm() {
		return "/localCommunityboard/localCommunityboardWriteForm";
	}
	
	@PostMapping("/localCommunityboard/localCommunityboardWrite")
	@ResponseBody
	public void localCommunityboardWrite(@ModelAttribute LocalCommunityboardDTO localCommunityboardDTO) {
		localCommunityboardService.localCommunityboardWrite(localCommunityboardDTO);

	}
	
	
	@GetMapping("/localCommunityboard/localCommunityboardModifyForm")
	public String localCommunityboardModifyForm() {
		return "/localCommunityboard/localCommunityboardModifyForm";
	}
	
	@PostMapping("/localCommunityboard/localCommunityboardModify")
	@ResponseBody
	public void localCommunityboardModify(@ModelAttribute LocalCommunityboardDTO localCommunityboardDTO) {
		
		localCommunityboardService.localCommunityboardModify(localCommunityboardDTO);
		
	}
	
	@GetMapping("/localCommunityboard/localCommunityboardDelete")
	@ResponseBody
	public void localCommunityboardDelete(@RequestParam String localcommunity_seq) {
		localCommunityboardService.localCommunityboardDelete(localcommunity_seq);
	}
	
	@GetMapping("/localCommunityboard/localCommunityboardView")
	public String localCommunityboardView() {
		
		return "/localCommunityboard/localCommunityboardView";
	}
	
	@PostMapping("/localCommunityboard/localCommunityboardGetView")
	@ResponseBody
	public LocalCommunityboardDTO localCommunityboardGetView(@RequestParam String localcommunity_seq){
		return localCommunityboardService.localCommunityboardGetView(localcommunity_seq);
	}
	
	@PostMapping("/localCommunityboard/localCommunityboardSearch")
	public List<LocalCommunityboardDTO> localCommunityboardSearch(@ModelAttribute LocalCommunityboardDTO localCommunityboardDTO){
		return localCommunityboardService.localCommunityboardSearch(localCommunityboardDTO);
	}
	

	@GetMapping("/localCommunityboard/localCommunityboardHit")
	@ResponseBody
	public void localCommunityboardHit(@RequestParam String localcommunity_seq) {
		localCommunityboardService.localCommunityboardHit(localcommunity_seq);
	}
	

}
