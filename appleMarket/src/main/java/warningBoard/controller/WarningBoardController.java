package warningBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public void warningBoard(@ModelAttribute WarningBoardDTO warningBoardDTO) {
		warningBoardService.warningBoardWrite(warningBoardDTO);
	}
	
}
