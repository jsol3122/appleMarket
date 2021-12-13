package location.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import location.bean.LocationDTO;
import location.service.LocationService;

@Controller
public class LocationController {
	
	@Autowired
	LocationService locationService;
	
	
	//gps api 
	@PostMapping("/address")
	@ResponseBody
	public Map<String, String> login(String loc, HttpServletRequest request) {

		Map<String, String> map = new HashMap<String, String>();

		// 서비스에서 주소를 가져오는 메소드 호출
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		String address = locationService.address(loc, member_id);
		
		map.put("address", address);

		System.out.println(loc);
		
		return map;

	}

	
	@PostMapping("/checkGPS")
	@ResponseBody
	public String checkGPS(@RequestParam String member_id) {//location_id
		return locationService.checkGPS(member_id);
	}
	
	@PostMapping("/gpsUpdate")
	@ResponseBody
	public String gpsUpdate(@RequestParam LocationDTO locationDTO) {//location_id
		System.out.println("gps");
		locationService.gpsUpdate(locationDTO);
		return locationDTO.getLocation_dong();
	}
	
	@GetMapping(value="/myMap")	
	public String modifyForm(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		request.setAttribute("display", "/view/myPage/myMap.jsp");
		return "/view/myPage/mypageMainForm";
	}
	
	
	@PostMapping("/getLocation")
	@ResponseBody
	public LocationDTO getLocation(String member_id) {
		return locationService.getLocation(member_id);
	}
	
}
