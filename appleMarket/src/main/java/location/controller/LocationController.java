package location.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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


	
}
