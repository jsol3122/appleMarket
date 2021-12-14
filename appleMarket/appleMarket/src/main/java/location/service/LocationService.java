package location.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import location.bean.LocationDTO;
import location.dao.LocationDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class LocationService {
	
	@Autowired
	private LocationDAO locationDAO;
	
	public String address(String loc,String member_id) {
		
		String [] ar  = loc.split("-");

		String addr = "https://dapi.kakao.com/v2/local/geo/coord2address.json?";

		addr= addr+"x=" +ar[1] +"&y="+ar[0];
	
		//위의 주소를 가지고 URL 객체를 생성
		try {

			//위의 주소를 가지고 URL 객체를 생성 
			URL url = new URL(addr);

			//URL 객체를 가지고 HttpURLConnection 객체 만들기
			HttpURLConnection con = (HttpURLConnection)url.openConnection();

			//인증부분은 받아야 하면 api에 작성되어있습니다.
			//인증받기 
			con.setRequestProperty("Authorization", "KakaoAK a75175027d8948d2fb91ba33dc1a3029");

			//옵션 설정 
			con.setConnectTimeout(20000);
			con.setUseCaches(false);

			//줄단위 데이터 읽기 
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));

			StringBuilder sb = new StringBuilder();

			while(true) {
				String line =br.readLine();
				if(line ==null) {
					break;
				}

				//읽은 데이터가 있으면 sb에추가 
				sb.append(line);
			}

			br.close();

			con.disconnect();

			System.out.println(sb);
			
			JSONObject obj = JSONObject.fromObject(sb.toString());
			
			System.out.println(obj);

			JSONArray imsi = obj.getJSONArray("documents");

			System.out.println(imsi);

			JSONObject o = imsi.getJSONObject(0);

			System.out.println(o);

			JSONObject c = o.getJSONObject("address");

			String address= c.getString("address_name");
			String dong = c.getString("region_3depth_name");
			
			//System.out.println(address);
			//System.out.println(dong);
			
			LocationDTO locationDTO = new LocationDTO();
			locationDTO.setMember_id(member_id);
			locationDTO.setLocation_addr(address);
			locationDTO.setLocation_dong(dong);
			locationDTO.setLocation_latitude(ar[1]);//위도 (확인요망)
			locationDTO.setLocation_longitude(ar[0]);//경도 (확인요망)
			
			String message = checkGPS(member_id);
			
			if(message=="non_exist") {
				locationDAO.write(locationDTO);
			}else {
				locationDAO.gpsUpdate(locationDTO);
			}
			
			
			return address;

		}catch (Exception e) {

			System.out.println("지도보이기" + e.getMessage());

			e.printStackTrace();

		}

		return null;

	}

	public String checkGPS(String member_id) {
		LocationDTO locationDTO = locationDAO.checkGPS(member_id);

		if(locationDTO == null) {
			return "non_exist";
		}else {
			return "exist";
		}
	
	}
	
	public void gpsUpdate(LocationDTO locationDTO) {
			locationDAO.gpsUpdate(locationDTO);

		
	}

	public LocationDTO getLocation(String member_id) {
		 return locationDAO.checkGPS(member_id);
	}

}
