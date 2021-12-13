package saleboard.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import admin.bean.AdminNoticeDTO;
import net.sf.json.JSONObject;
import saleboard.bean.InterestDTO;
import saleboard.bean.SaleboardDTO;
import saleboard.service.SaleboardService;

@Controller
public class SaleboardController {
	@Autowired
	private SaleboardService saleboardService;

	@GetMapping("/saleboard/saleboardList")
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
	
	@PostMapping("/saleboard/saleboardSearch")
	public List<SaleboardDTO> saleboardSearch(@ModelAttribute SaleboardDTO saleboardDTO){		
		return saleboardService.saleboardSearch(saleboardDTO);
	}	
	
	@GetMapping(value="/saleboard/saleboardWriteForm")
	public String saleboardWriteForm() {
		return "/view/saleboard/saleboardWriteForm";
	}

	@PostMapping(value="/saleboard/saleboardWrite")
	@ResponseBody
	public void saleboardWrite(@ModelAttribute SaleboardDTO saleboardDTO,
								@RequestParam("img[]") MultipartFile[] img,
							   HttpSession session
							   , HttpServletRequest request) { 
		HttpSession loginSession = request.getSession();
		String member_id = (String)loginSession.getAttribute("member_id");

		System.out.println(member_id);

		saleboardDTO.setMember_id(member_id);
		
		String uuid = UUID.randomUUID().toString();
		
		//String filePath = "C:\\Users\\초롱불\\Desktop\\jihyun\\appleMarket\\appleMarket\\src\\main\\webapp\\storage";
		String filePath = session.getServletContext().getRealPath("storage");
		System.out.println(filePath);
		//storage 게시판 별로 폴더 다르게 해야할까? saleboardStorage 이런 식으로?
		String fileName;
		File file;
		
		//파일 복사
		for(int i=0; i<img.length; i++) {
			if(img[i] != null) {
				fileName = uuid+"_"+img[i].getOriginalFilename();
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
		System.out.println(saleboardDTO);
		saleboardService.saleboardWrite(saleboardDTO);	
	}
	
	@PostMapping("/saleboard/saleboardModifyForm")
	public String saleboardModifyForm() {
		return "/saleboard/saleboardModifyForm";
	}
	
	@PostMapping("/saleboard/saleboardModify")
	@ResponseBody
	public void saleboardModify(@ModelAttribute SaleboardDTO saleboardDTO,
								@RequestParam("img[]") MultipartFile[] img,
								   HttpSession session
								   , HttpServletRequest request) { 
		HttpSession loginSession = request.getSession();
		String member_id = (String)loginSession.getAttribute("member_id");
		saleboardDTO.setMember_id(member_id);
		
		String uuid = UUID.randomUUID().toString();
		
		//String filePath = "C:\\Users\\초롱불\\Desktop\\jihyun\\appleMarket\\appleMarket\\src\\main\\webapp\\storage";
		String filePath = session.getServletContext().getRealPath("storage");
		System.out.println(filePath);
		//storage 게시판 별로 폴더 다르게 해야할까? saleboardStorage 이런 식으로?
		String fileName;
		File file;
		
		//파일 복사
		for(int i=0; i<img.length; i++) {
			if(img[i] != null) {
				fileName = uuid+"_"+img[i].getOriginalFilename();
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
		System.out.println(saleboardDTO);
		saleboardService.saleboardModify(saleboardDTO);
	}
	
	@PostMapping("/saleboard/saleboardDelete")
	@ResponseBody
	public void saleboardDelete(@RequestParam int sale_seq) {
		saleboardService.saleboardDelete(sale_seq);
	}
	
	@GetMapping(value="/saleboard/saleboardView")
	public String saleboardView(HttpServletResponse response ,HttpServletRequest request) {
		return "/saleboard/saleboardView";
	}
	

	@PostMapping("/saleboard/saleboardGetView") @ResponseBody
	public List<SaleboardDTO> saleboardGetView(@RequestParam int sale_seq){
		System.out.println("controller");
		return saleboardService.saleboardGetView(sale_seq);	
	}	
	
	@PostMapping("/saleboard/saleboardGetListId")
	@ResponseBody
	public List<SaleboardDTO> saleboardGetListId(@RequestParam String member_id, int sale_seq) {
		return saleboardService.saleboardGetListId(member_id, sale_seq);
	}

	
	@PostMapping("/saleboard/saleboardPick")
	public void saleboardPick(@ModelAttribute SaleboardDTO saleboardDTO, @RequestParam String member_id) {
		int sale_seq = saleboardDTO.getSale_seq();
		
		System.out.println(sale_seq);
		System.out.println(member_id);

		Map<String, String> map = new HashMap<String, String>();
		map.put("sale_seq", sale_seq+"");
		map.put("member_id", member_id);
	
	
		
		saleboardService.saleboardPick(map);
		
	}
	
	@PostMapping("/saleboard/saleboardPickCancel")
	public void saleboardPickCancel(String sale_seq) {
		SaleboardDTO saleboardDTO = saleboardService.member_idLoad(sale_seq);
		String member_id = saleboardDTO.getMember_id();

		Map<String, String> map = new HashMap<String, String>();
		map.put("sale_seq", sale_seq+"");
		map.put("member_id", member_id);

		saleboardService.saleboardPickCancel(map);
	}	
	
	
	@PostMapping("/saleboard/saleboardHit")
	@ResponseBody
	public void saleboardHit(@RequestParam int sale_seq) {
		saleboardService.saleboardHit(sale_seq);
	}
	
	@PostMapping("/saleboard/saleboardFollow")
	@ResponseBody
	public void saleboardFollow(@ModelAttribute SaleboardDTO saleboardDTO, HttpServletRequest request) {
		HttpSession loginSession = request.getSession();
		String member_id = saleboardDTO.getMember_id(); // follow 누른 게시글 seq의 작성자
		String following_id = (String)loginSession.getAttribute("member_id");

		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("following_id", following_id);
		
		saleboardService.saleboardFollow(map);
	}
		
	
	@PostMapping("/getinterestList")
	@ResponseBody
	public List<InterestDTO> getinterestList(String member_id){
		return saleboardService.getinterestList(member_id);
	}

	
	//찜게시판 삭제 
	@PostMapping("/interestDelete")
	@ResponseBody 
	public void interestDelete(int interestList_seq){
		saleboardService.interestDelete(interestList_seq);
	}
	
	//찜게시판 중복체크 막기
	@PostMapping("/doubleCheck")
	@ResponseBody 
	public InterestDTO doubleCheck(SaleboardDTO saleboardDTO){
		return saleboardService.doubleCheck(saleboardDTO);
	}
	
	//찜게시판 중복체크 막기
	@PostMapping("/intereUpdate")
	@ResponseBody 
	public void intereUpdate(int sale_seq){
		saleboardService.intereUpdate(sale_seq);
	}
}