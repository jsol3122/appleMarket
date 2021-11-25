package communityboard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.CookieGenerator;

import communityboard.bean.CommunityboardDTO;
import communityboard.service.CommunityboardService;
import net.sf.json.JSONObject;

@Controller
public class CommunityboardController {
	@Autowired
	private CommunityboardService communityboardService;
	
	@GetMapping("/index")
	public String index(HttpServletResponse response) {
		
		
		
		return "/index";
	}
	
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
	
	@GetMapping("/communityboard/communityboardWriteForm")
	public String communityboardWriteForm() {
		return "/communityboard/communityboardWriteForm";
	}
	
	@PostMapping("/communityboard/communityboardWrite")
	@ResponseBody
	public void communityboardWrite(@ModelAttribute CommunityboardDTO communityboardDTO 
									, @RequestParam MultipartFile img) {
		String filePath = "D:\\git_home\\appleMarket\\appleMarket\\src\\main\\webapp\\storage";
		String fileName = img.getOriginalFilename();
		File file = new File(filePath,fileName);
		
		//file copy
		try {
			
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			
		}catch (IOException e) {
			
			e.printStackTrace();
			
		}	
		
		communityboardDTO.setCommunityboard_image(fileName);
		
	
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
	public List<CommunityboardDTO>  communityboardGetView(@RequestParam int communityboard_seq){
		return 	communityboardService.communityboardGetView(communityboard_seq);	
	}
	
	@PostMapping("/communityboard/communityboardSearch")
	public List<CommunityboardDTO> communityboardSearch(@ModelAttribute CommunityboardDTO communityboardDTO){
		
		return communityboardService.communityboardSearch(communityboardDTO);
	}
	
	
	@GetMapping("/communityboard/communityboardHit")
	@ResponseBody
	public void communityboardHit(@RequestParam String communityboard_seq) {
		communityboardService.communityboardHit(communityboard_seq);
	}
	
	
	
}
