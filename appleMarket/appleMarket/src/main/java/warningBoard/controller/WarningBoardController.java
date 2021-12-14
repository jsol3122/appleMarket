package warningBoard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import warningBoard.bean.WarningBoardDTO;
import warningBoard.service.WarningBoardService;

@Controller
public class WarningBoardController {
	
	@Autowired
	WarningBoardService warningBoardService;
	
	//게시글 작성 폼
	@GetMapping("/warningBoardForm")
	public String warningBoardForm() {
		return "/view/warningBoard/warningBoardForm";
	}
	
	//게시글 작성하기 
	@PostMapping("/warningBoardWrite")
	@ResponseBody
	public void warningBoard(@ModelAttribute WarningBoardDTO warningBoardDTO,  @RequestParam("input_file") MultipartFile input_file, HttpSession session) {
		
		
		//storage 위치 
		String filePath = session.getServletContext().getRealPath("storage");
		
		//실제 원래 이름 
		String fileName = input_file.getOriginalFilename();
		
		File file = new File(filePath, fileName);
		
		//파일 복사 --- 임시파일로 올라가서 무조건 업로드가 된다 그래서 파일을 복사시킨 것. 
		try {
			FileCopyUtils.copy(input_file.getInputStream(), new FileOutputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		warningBoardDTO.setWarning_image(fileName);//파일명만 db로 가면 된다. 
		
		warningBoardService.warningBoardWrite(warningBoardDTO);
	}
	
}
