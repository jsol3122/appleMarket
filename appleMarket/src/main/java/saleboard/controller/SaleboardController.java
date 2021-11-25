package saleboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import saleboard.bean.SaleboardDTO;
import saleboard.service.SaleboardService;

@Controller
@RequestMapping(value="/saleboard")
public class SaleboardController {
	/*
	@Autowired
	private SaleboardService saleboardService;

	@RequestMapping(value="/saleboardWriteForm", method=RequestMethod.POST)
	public String saleboardWriteForm() {
		return "/saleboard/saleboardWriteForm";
		
	}
	

	
//	@RequestMapping(value="/checkId", method=RequestMethod.POST)
//	@ResponseBody // return exist 가 경로가 아니라 String 으로 보내지도록 설정.
//	public String checkId(@RequestParam String id) {
//		return saleboardService.checkId(id);
//	}
	
	
	@RequestMapping(value="/saleboardWrite", method=RequestMethod.POST)
	@ResponseBody
	public void saleboardWrite(@ModelAttribute SaleboardDTO saleboardDTO){
		saleboardService.saleboardWrite(saleboardDTO);
	}
	
	@GetMapping(value="/saleboardList")
	public String saleboardList() {
		return "/saleboard/saleboardList";
	} 
	
	@GetMapping(value="/saleboardView")
	public String saleboardView() {
		return "/saleboard/saleboardView";
	} 
	
	
	@PostMapping(value="/getUserList")
	@ResponseBody
	//메소드의 return형 앞에 @ResponseBody를 붙여서 사용하게되면 해당객체가 자동으로 JSON 객체로 변환되어 반환됩니다.
	/*
	<dependency>
      <groupId>org.codehaus.jackson</groupId>
      <artifactId>jackson-mapper-asl</artifactId>
      <version>버전</version>
	</dependency> 
	
	https://www.nextree.co.kr/p11205/
	
	
	public List<SaleboardDTO> getSaleboardList() {
		return saleboardService.getSaleboardList(); 
	}
	
	
	@GetMapping("/saleboardModifyForm")
	public String saleboardModifyForm() {
		return "/saleboard/saleboardModifyForm";
	}
	
	
	@PostMapping("/getSaleboard")
	@ResponseBody
	public SaleboardDTO getSaleboard(@RequestParam String searchId) {
		return saleboardService.getSaleboard(searchId);
	}
	// 이렇게 하다가 나중에 에러날 수 있는데 그러면 searchId 를 id 로 바꿔야 한다.
	
	@PostMapping("/saleboardModify")
	@ResponseBody
	public void saleboardModify(@ModelAttribute SaleboardDTO saleboardDTO) {
		saleboardService.saleboardModify(saleboardDTO);
	}
	
	@GetMapping("/saleboardDeleteForm")
	public String saleboardDeleteForm() {
		return "/saleboard/saleboardDeleteForm";
	}
	
	@PostMapping("/saleboardDelete")
	@ResponseBody
	public void saleboardDelete(@RequestParam String searchId) {
		saleboardService.saleboardDelete(searchId);
	}
	
	*/
	
	
	
}