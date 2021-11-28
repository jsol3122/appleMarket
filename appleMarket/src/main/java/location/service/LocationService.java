package location.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class LocationService {
	public String address(String loc) {

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
//JSONObject.fromObject(JSONSerializer.toJSON(jsonData));
			//new JSONObject();
			JSONObject obj = JSONObject.fromObject(sb.toString());
			
			System.out.println(obj);

			JSONArray imsi = obj.getJSONArray("documents");

			System.out.println(imsi);

			JSONObject o = imsi.getJSONObject(0);

			System.out.println(o);

			JSONObject c = o.getJSONObject("address");

			String address= c.getString("address_name");

			

			return address;

		}catch (Exception e) {

			System.out.println("지도보이기" + e.getMessage());

			e.printStackTrace();

		}

		

		

		return null;

	}
}
