package buyerboard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import buyerboard.bean.BuyerboardDTO;
import buyerboard.service.BuyerboardService;
import net.sf.json.JSONObject;
import saleboard.bean.SaleboardDTO;

@Controller
public class BuyerboardController {

	@Autowired
	private BuyerboardService buyerboardService;
	
	@GetMapping("/buyerboard/buyerboardList")
	public String buyerboardList() {
		return "/buyerboard/buyerboardList";
	}
	

	@PostMapping("/buyerboard/buyerboardGetList") 
	@ResponseBody
	public JSONObject buyerboardGetList(@RequestParam String pg) {
		int page = Integer.parseInt(pg);
		System.out.println(page);
		return buyerboardService.buyerboardGetList(page);
	}
	
	
	@GetMapping("/buyerboard/buyerboardWriteForm")
	public String buyerboardWriteForm() {
		return "/view/buyerboard/buyerboardWriteForm";
	}
	
	@PostMapping("/buyerboard/buyerboardWrite")
	@ResponseBody
	public void buyerboardWrite(@ModelAttribute BuyerboardDTO buyerboardDTO, @RequestParam("img[]") MultipartFile[] img,
			HttpSession session) {
		String filePath = session.getServletContext().getRealPath("storage");
		System.out.println(filePath);

		String fileName;
		File file;

		// 파일 복사
		for (int i = 0; i < img.length; i++) {
			if (img[i] != null) {
				fileName = img[i].getOriginalFilename();
				file = new File(filePath, fileName);
				System.out.println(fileName + "확인");
				try {
					FileCopyUtils.copy(img[i].getInputStream(), new FileOutputStream(file));
				} catch (IOException e) {
					e.printStackTrace();
				}

				// 문제점이 null 을 제거하고 jsp에 띄울 수 있으면 괜찮은데 그게 아니면 중간에 빈 파일 발생할 수 있다(파일 1, 3 으로 넣는
				// 경우) css로 구현가능하면 이대로 가고 아니면 고치기
				if (i == 0)
					buyerboardDTO.setBuyerboard_image1(fileName);
				if (i == 1)
					buyerboardDTO.setBuyerboard_image2(fileName);
				if (i == 2)
					buyerboardDTO.setBuyerboard_image3(fileName);

			} else {
				if (i == 0)
					buyerboardDTO.setBuyerboard_image1("");
				if (i == 1)
					buyerboardDTO.setBuyerboard_image2("");
				if (i == 2)
					buyerboardDTO.setBuyerboard_image3("");

			}
		} // for
		buyerboardDTO.setMember_id((String) session.getAttribute("member_id"));
		System.out.println(buyerboardDTO);
		buyerboardService.buyerboardWrite(buyerboardDTO);
	}
	
	
	@PostMapping("/buyerboard/buyerboardModifyForm")
	public String buyerboardModifyForm() {
		
		return "/buyerboard/buyerboardModifyForm";
	}
	
	@PostMapping("/buyerboard/buyerboardModify")
	@ResponseBody
	public void buyerboardModify(@ModelAttribute BuyerboardDTO buyerboardDTO) {
		buyerboardService.buyerboardModify(buyerboardDTO);
	}
	
	@PostMapping("/buyerboard/buyerboardDelete")
	@ResponseBody
	public void buyerboardDelete (@RequestParam int buyerboard_seq) {
		buyerboardService.buyerboardDelete(buyerboard_seq);
	}
	
	@PostMapping("/buyerboard/buyerboardView")
	public String buyerboardView(HttpServletResponse response ,HttpServletRequest request) {
		return "/buyerboard/buyerboardView";
	}
	
	@PostMapping("/buyerboard/buyerboardGetView") @ResponseBody
	public List<BuyerboardDTO> buyerboardGetView(@RequestParam int buyerboard_seq){
		return buyerboardService.buyerboardGetView(buyerboard_seq);	
	}	
	
	@PostMapping("/buyerboard/buyerboardGetListId")
	@ResponseBody
	public List<BuyerboardDTO> saleboardGetListId(@RequestParam String member_id, int buyerboard_seq) {
		return buyerboardService.buyerboardGetListId(member_id, buyerboard_seq);
	}
	
	@PostMapping("/buyerboard/buyerboardHit")
	@ResponseBody
	public void buyerboardHit(@RequestParam int buyerboard_seq) {
		buyerboardService.buyerboardHit(buyerboard_seq);
	}
	
	//카테고리 조회
	@PostMapping("/boardcategoryFilter")
	@ResponseBody
	public List<BuyerboardDTO> boardcategoryFilter(@RequestParam String buyerboard_category) {
		return buyerboardService.boardcategoryFilter(buyerboard_category);
	}


	
}
