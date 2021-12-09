package member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.bean.RecommendDTO;
import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public void write(MemberDTO memberDTO) {
		memberDAO.write(memberDTO);	
	}

	@Override
	public MemberDTO checkId(String member_id) {
		MemberDTO memberDTO = memberDAO.checkId(member_id);
		
		if(memberDTO == null) {
			return null; 
		}else {
			return memberDTO;
		}
	}

	@Override
	public Map<String, Integer> login(MemberDTO memberDTO) {
		
		return memberDAO.login(memberDTO);
	}

	@Override
	public List<ZipcodeDTO> checkPostSearch(ZipcodeDTO zipcodeDTO) {
		List<ZipcodeDTO> list = null; 
		
		if(zipcodeDTO.getSido() != null && zipcodeDTO.getRoadname() !=null) {
			list = memberDAO.getZipcodeList(zipcodeDTO.getSido(), zipcodeDTO.getSigungu(), zipcodeDTO.getRoadname());
			System.out.println(list);
		}
		if(zipcodeDTO.getSigungu() == null) {
			list = memberDAO.getZipcodeList(zipcodeDTO.getSido(), "", zipcodeDTO.getRoadname());
			System.out.println(list);
		}
	
		
		return list;
	}

	@Override
	public void delete(MemberDTO memberDTO) {
		memberDAO.delete(memberDTO);
		
	}

	@Override
	public void modify(MemberDTO memberDTO) {
		memberDAO.modify(memberDTO);
		
	}
	//아이디찾기 이메일 중복체크 
	@Override
	public String searchId(String member_email) {
		MemberDTO memberDTO = memberDAO.searchId(member_email);
		
		if(memberDTO == null) {
			return "non_exist"; 
		}else {
			return memberDTO.getMember_id();
		}
	}
	
	
	 //비밀번호찾기
	 
	 @Override 
	 public void searchPwd(MemberDTO memberDTO,HttpServletResponse response) { 
		 response.setContentType("text/html;charset=utf-8");
		 
		 try { 
			 sendEmail(memberDTO, "findpw"); 
		} catch (Exception e) {
			e.printStackTrace(); 
		}
	 }
	
	 
	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(MemberDTO memberDTO, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "bitcamp.appleMarket@gmail.com";//서버 이메일 주소(보내는 사람 이메일 주소)";
		String hostSMTPpwd = "appleMarket";//"서버 이메일 비번(보내는 사람 이메일 비번)";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "bitcamp.appleMarket@gmail.com";//"보내는 사람 이메일주소(받는 사람 이메일에 표시됨)";
		String fromName = "appleMarket";//"프로젝트이름 또는 보내는 사람 이름";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "[AppleMarket]Please reset your password";
			msg += "<br><br><br>";
			msg += "<img src='https://raw.githubusercontent.com/jsol3122/appleMarket/master/appleMarket/src/main/webapp/img/logo-basic.png' alt='사과마켓' style='margin-left: 500px; width:200px; height:100px;'>";
			msg += "<div style='margin-left: 500px'>";
			msg += "<h1>Reset your AppleMarket password</h1>";
			msg += "</div>";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana; width: 600px; margin-left: 500px;'>";
			msg += "<h2>AppleMarket password reset</h2>";
			msg += "We heard that you lost your AppleMarket password, Sorry about it that!";
			msg += "But don't worry! You can use the following button to reset your password :) ";
			msg += "<br><br><a href='http://localhost:8080/appleMarket/searchPwdForm' onclick='window.open(this.href, '_blank,' 'width=500, height=500,scrollbars=no, resizable=no,toolbars=no, menubar=no'); return false;\"><input type='button' value='Reset your password'/>";
			msg += "<br><br>";
			msg += "<p>Thanks,<br>The AppleMarket Team<br></p>";
			msg += "</div>";

		}

		// 받는 사람 E-Mail 주소
		//String mail = "bitcamp.appleMarket@gmail.com";
		
		String mail =memberDTO.getMember_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); 

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호 변경
	@Override
	public void changePwd(MemberDTO memberDTO) {
		memberDAO.changePwd(memberDTO);
		
	}

	@Override
	public void recommend(Map<String, String> map) {
		memberDAO.recommend(map);		
	}

	@Override
	public void recommended(Map<String, String> map) {
		memberDAO.recommended(map);			
	}
	
	@Override
	public int emailChk(String member_email) {
		
		return memberDAO.emailChk(member_email);
	}

	@Override
	public int recommendChk(Map<String, String> map) {
		
		return memberDAO.recommendChk(map);
	}
	
	@Override
	public List<RecommendDTO> recommendList(String member_id) {
		
		return memberDAO.recommendList(member_id);
	}

	@Override
	public void recommendCoupon(String member_id) {
		
		memberDAO.recommendCoupon(member_id);
		
	}


	

}

