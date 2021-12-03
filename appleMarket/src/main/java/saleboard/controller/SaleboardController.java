package saleboard.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.sf.json.JSONObject;
import saleboard.bean.SaleboardDTO;
import saleboard.service.SaleboardService;

@Controller
public class SaleboardController {
	@Autowired
	private SaleboardService saleboardService;

	@PostMapping("/saleboard/saleboardList")
	public String saleboardList() {
		return "/saleboard/saleboardList";
	}
	
	@PostMapping("/saleboard/saleboardGetList")
	@ResponseBody
	public JSONObject saleboardGetList(@RequestParam String pg) {
		int page = Integer.parseInt(pg);
		System.out.println(page);
		return saleboardService.saleboardGetList(page);
	}
	
	
	@PostMapping(value="/saleboard/saleboardWriteForm")
	public String saleboardWriteForm() {
		return "/saleboard/saleboardWriteForm";
	}

	@PostMapping(value="/saleboard/saleboardWrite")
	@ResponseBody
	public void saleboardWrite(@ModelAttribute SaleboardDTO saleboardDTO,
							   @RequestParam MultipartFile[] img,
							   HttpSession session) { 
		//String filePath = "C:\\Users\\초롱불\\Desktop\\jihyun\\appleMarket\\appleMarket\\src\\main\\webapp\\storage";
		String filePath = session.getServletContext().getRealPath("storage");
		System.out.println(filePath);
		//storage 게시판 별로 폴더 다르게 해야할까? saleboardStorage 이런 식으로?
		String fileName;
		File file;
		
		//파일 복사
		for(int i=0; i<5; i++) {
			if(img[i] != null) {
				fileName = img[i].getOriginalFilename();
				file = new File(filePath, fileName);
				System.out.println(fileName+"확인");
				try {
					FileCopyUtils.copy(img[i].getInputStream(), new FileOutputStream(file));
				} catch (IOException e) {
					e.printStackTrace();
				}

				// 문제점이 null 을 제거하고 jsp에 띄울 수 있으면 괜찮은데 그게 아니면 중간에 빈 파일 발생할 수 있다(파일 1, 3 으로 넣는 경우) css로 구현가능하면 이대로 가고 아니면 고치기
				if(i==0) saleboardDTO.setSale_image1(fileName); 
				if(i==1) saleboardDTO.setSale_image2(fileName);
				if(i==2) saleboardDTO.setSale_image3(fileName);
				if(i==3) saleboardDTO.setSale_image4(fileName);
				if(i==4) saleboardDTO.setSale_image5(fileName);
				
			}else {
				if(i==0) saleboardDTO.setSale_image1(""); 
				if(i==1) saleboardDTO.setSale_image2("");
				if(i==2) saleboardDTO.setSale_image3("");
				if(i==3) saleboardDTO.setSale_image4("");
				if(i==4) saleboardDTO.setSale_image5("");
			}
		}//for

		saleboardService.saleboardWrite(saleboardDTO);	
	}
	
	@PostMapping("/saleboard/saleboardModifyForm")
	public String saleboardModifyForm() {
		return "/saleboard/saleboardModifyForm";
	}
	
	@PostMapping("/saleboard/saleboardModify")
	@ResponseBody
	public void saleboardModify(@ModelAttribute SaleboardDTO saleboardDTO) {
		saleboardService.saleboardModify(saleboardDTO);
	}
	
	@PostMapping("/saleboard/saleboardDelete")
	@ResponseBody
	public void saleboardDelete(@RequestParam int saleboard_seq) {
		saleboardService.saleboardDelete(saleboard_seq);
	}
	
	@PostMapping(value="/saleboard/saleboardView")
	public String saleboardView(HttpServletResponse response ,HttpServletRequest request) {
		return "/saleboard/saleboardView";
	}
	
	@PostMapping("/saleboard/saleboardGetView")
	@ResponseBody
	public List<SaleboardDTO> saleboardGetView(@RequestParam int saleboard_seq){
		return saleboardService.saleboardGetView(saleboard_seq);	
	}	
	

	
}