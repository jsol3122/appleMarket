package member.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MessageDTO;
import member.dao.MessageDAO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MessageService {
	
	@Autowired
	private MessageDAO messageDAO;
	
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) { 
		String api_key = "NCSDPD4TM1ASE7NJ"; 
		String api_secret = "HTCSIE199QC0YVOBDLQQDXIHUPS3GUBC"; 
		Message coolsms = new Message(api_key, api_secret); 
		
		// 4 params(to, from, type, text) are mandatory. must be filled 
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber); // 수신전화번호 
		params.put("from", "01064961134"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨 
		params.put("type", "SMS"); 
		params.put("text", "[애플마켓] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력 
		params.put("app_version", "test app 1.2"); // application name and version 
		
		try { 
			JSONObject obj = (JSONObject) coolsms.send(params); 
			System.out.println(obj.toString()); 
		} catch (CoolsmsException e) { 
			System.out.println(e.getMessage()); 
			System.out.println(e.getCode()); 
		}
	}



	public void certificationCheck(MessageDTO messageDTO) {
		messageDAO.phoneCheck(messageDTO);	
		
	}

	public MessageDTO checkSMS(String checknum) {
		return messageDAO.checkSMS(checknum);
		
	}

	public String checkPhone(String phone) {
		MessageDTO messageDTO =  messageDAO.CheckPhone(phone);
		
		if(messageDTO == null) {
			return "non_exist";
		}else {
			return "exist";
		}
	}


	public void phoneUpdate(MessageDTO messageDTO) {
		messageDAO.phoneUpdate(messageDTO);
		
	}
	
	

}