package communityboard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import communityboard.bean.CommunityboardDTO;
import communityboard.service.CommunityboardService;
import net.sf.json.JSONObject;


@Controller
public class CommunityboardController {
	@Autowired
	private CommunityboardService communityboardService;
	
	
	
	@GetMapping("/communityboard/communityboardList")
	public String communityboardList() {
		return "/communityboard/communityboardList";
	}
	
	@GetMapping("/communityboard/communityboardGetList")
	@ResponseBody
	public JSONObject communityboardGetList(@RequestParam String pg) {
		int page = Integer.parseInt(pg);
		System.out.println(page);
		return communityboardService.communityboardGetList(page);
	}
	
	@GetMapping("/communityboard/commentTotal") @ResponseBody
	public int commentTotal(@RequestParam String communityboard_seq) {
		return communityboardService.commentTotal(communityboard_seq);
	}
	
	@GetMapping("/communityboard/communityboardWriteForm")
	public String communityboardWriteForm() {
		return "/communityboard/communityboardWriteForm";
	}
	
	@PostMapping("/communityboard/communityboardWrite")
	@ResponseBody
	public void communityboardWrite(@ModelAttribute CommunityboardDTO communityboardDTO) {
		communityboardService.communityboardWrite(communityboardDTO);
	}
	
	@GetMapping("/communityboard/communityboardModifyForm")
	public String communityboardModifyForm() {
		return "/communityboard/communityboardModifyForm";
	}
	
	@PostMapping("/communityboard/communityboardModify")
	@ResponseBody
	public void communityboardModify(@ModelAttribute CommunityboardDTO communityboardDTO) {
		communityboardService.communityboardModify(communityboardDTO);
	}
	
	@GetMapping("/communityboard/communityboardDelete")
	@ResponseBody
	public void communityboardDelete(@RequestParam int communityboard_seq) {
		communityboardService.communityboardDelete(communityboard_seq);
	}
	
	@GetMapping("/communityboard/communityboardView")
	public String communityboardView(HttpServletResponse response ,HttpServletRequest request) {	
		return "/communityboard/communityboardView";
	}
	
	@PostMapping("/communityboard/communityboardGetView")
	@ResponseBody
	public CommunityboardDTO  communityboardGetView(@CookieValue(name = "view") String cookie,HttpServletResponse response,
													@RequestParam int communityboard_seq,Model model){
		
		System.out.println(cookie);
		String seq = communityboard_seq+"";
		
		if (!(cookie.contains(String.valueOf(communityboard_seq)))) {
			cookie += "communityboard_seq"+communityboard_seq + "/";
			communityboardHit(seq);
		}
		response.addCookie(new Cookie("view", cookie));
		
		return 	communityboardService.communityboardGetView(communityboard_seq);	
	}
	
	@PostMapping("/communityboard/communityboardSearch")
	public List<CommunityboardDTO> communityboardSearch(@ModelAttribute CommunityboardDTO communityboardDTO){
		
		return communityboardService.communityboardSearch(communityboardDTO);
	}
	
	
	public void communityboardHit(String communityboard_seq ) {
	
		communityboardService.communityboardHit(communityboard_seq);
		
	}
	
}
