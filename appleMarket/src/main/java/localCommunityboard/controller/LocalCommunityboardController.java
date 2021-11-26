package localCommunityboard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

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
	public JSONObject localCommunityboardGetList(@RequestParam String pg) {
		int page = Integer.parseInt(pg);
		return localCommunityboardService.localCommunityboardGetList(page);
	}
	

	@GetMapping("/localCommunityboard/localCommunityboardWriteForm")
	public String localCommunityboardWriteForm() {
		return "/localCommunityboard/localCommunityboardWriteForm";
	}
	
	@PostMapping("/localCommunityboard/localCommunityboardWrite")
	@ResponseBody
	public void communityboardWrite(@ModelAttribute LocalCommunityboardDTO localCommunityboardDTO
									,@RequestParam MultipartFile img, HttpSession session) {
		String filePath = session.getServletContext().getRealPath("storage");
		String fileName = img.getOriginalFilename();
		File file = new File(filePath,fileName);
		//file copy
			try {
				
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
				
			}catch (IOException e) {
				
				e.printStackTrace();
				
			}	
			localCommunityboardDTO.setLocalcommunity_image(fileName);
			
			localCommunityboardService.localCommunityboardWrite(localCommunityboardDTO);
		
	}
	
	
	
	
	
	
}
