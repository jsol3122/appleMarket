package buyerboard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public JSONObject buyerboardGetList(@RequestParam String pg, @Nullable @RequestParam("buyerboard_category") String buyerboard_category) {
		int page = Integer.parseInt(pg);
		System.out.println(page);
		System.out.println(buyerboard_category);
		return buyerboardService.buyerboardGetList(page,buyerboard_category);
	}
	
	
	@GetMapping("/buyerboard/buyerboardWriteForm")
	public String buyerboardWriteForm() {
		return "/view/buyerboard/buyerboardWriteForm";
	}
	
	@PostMapping("/buyerboard/buyerboardWrite")
	@ResponseBody

	public void buyerboardWrite(@ModelAttribute BuyerboardDTO buyerboardDTO, @RequestParam("img[]") MultipartFile[] img,
			HttpSession session) {
		String uuid = UUID.randomUUID().toString();
		
		String filePath = session.getServletContext().getRealPath("storage");
		System.out.println(filePath);
		
		String fileName;
		File file;

		// ?????? ??????
		for (int i = 0; i < img.length; i++) {
			if (img[i] != null) {
				fileName = uuid+"_"+img[i].getOriginalFilename();
				file = new File(filePath, fileName);
				System.out.println(fileName + "??????");
				try {
					FileCopyUtils.copy(img[i].getInputStream(), new FileOutputStream(file));
				} catch (IOException e) {
					e.printStackTrace();
				}

				// ???????????? null ??? ???????????? jsp??? ?????? ??? ????????? ???????????? ?????? ????????? ????????? ??? ?????? ????????? ??? ??????(?????? 1, 3 ?????? ??????
				// ??????) css??? ?????????????????? ????????? ?????? ????????? ?????????
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
	
	
	@GetMapping("/buyerboard/buyerboardModifyForm")
	public String buyerboardModifyForm() {
		
		return "/buyerboard/buyerboardModifyForm";
	}
	
	@PostMapping("/buyerboard/buyerboardModify")
	@ResponseBody
	public void buyerboardModify(@ModelAttribute BuyerboardDTO buyerboardDTO, @RequestParam("img[]") MultipartFile[] img,
			HttpSession session) {
		String uuid = UUID.randomUUID().toString();
		
		String filePath = session.getServletContext().getRealPath("storage");
		System.out.println(filePath);

		String fileName;
		File file;

		// ?????? ??????
		for (int i = 0; i < img.length; i++) {
			if (img[i] != null) {
				fileName = uuid+"_"+img[i].getOriginalFilename();
				file = new File(filePath, fileName);
				System.out.println(fileName + "??????");
				try {
					FileCopyUtils.copy(img[i].getInputStream(), new FileOutputStream(file));
				} catch (IOException e) {
					e.printStackTrace();
				}

				// ???????????? null ??? ???????????? jsp??? ?????? ??? ????????? ???????????? ?????? ????????? ????????? ??? ?????? ????????? ??? ??????(?????? 1, 3 ?????? ??????
				// ??????) css??? ?????????????????? ????????? ?????? ????????? ?????????
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
	
	//???????????? ??????
	@PostMapping("/boardcategoryFilter")
	@ResponseBody
	public List<BuyerboardDTO> boardcategoryFilter(@RequestParam String buyerboard_category) {
		return buyerboardService.boardcategoryFilter(buyerboard_category);
	}

	@PostMapping("/buyerboard/buyerboardPick")
	public void buyerboardPick(@ModelAttribute BuyerboardDTO buyerboardDTO, @RequestParam String member_id) {
		int buyerboard_seq = buyerboardDTO.getBuyerboard_seq();
		
		System.out.println(buyerboard_seq);
		System.out.println(member_id);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("buyerboard_seq", buyerboard_seq+"");
		map.put("member_id", member_id);
	
	
		
		buyerboardService.buyerboardPick(map);
		
	}
	
}
