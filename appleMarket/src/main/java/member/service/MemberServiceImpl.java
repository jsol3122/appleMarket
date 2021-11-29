package member.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
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
	public String checkId(String member_id) {
		MemberDTO memberDTO = memberDAO.checkId(member_id);
		
		if(memberDTO == null) {
			return "non_exist"; 
		}else {
			return "exist";
		}
	}

	@Override
	public int login(MemberDTO memberDTO) {
		
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

	@Override
	public String searchId(String member_email) {
		MemberDTO memberDTO = memberDAO.searchId(member_email);
		
		if(memberDTO == null) {
			return "non_exist"; 
		}else {
			return "exist";
		}
	}

	@Override
	public void searchPwd(MemberDTO memberDTO,HttpServletResponse response) {
		
		memberDAO.searchPwd(memberDTO);
			
	}

	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(MemberDTO memberDTO, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "dosldnjsss@gmail.com";//서버 이메일 주소(보내는 사람 이메일 주소)";
		String hostSMTPpwd = "dusdnrtkfkdgo0@g";//"서버 이메일 비번(보내는 사람 이메일 비번)";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "dosldnjsss@gmail.com";//"보내는 사람 이메일주소(받는 사람 이메일에 표시됨)";
		String fromName = "appleMarket";//"프로젝트이름 또는 보내는 사람 이름";
		String subject = "[appleMarket]Please reset your password";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "베프마켓 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberDTO.getMember_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += memberDTO.getMember_pwd() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = memberDTO.getMember_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

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
//
//	//비밀번호 찾기
//		@Override
//		public void findPw(HttpServletResponse response, MemberDTO memberDTO) {
//			response.setContentType("text/html;charset=utf-8");
//			MemberDTO ck = mdao.readMember(vo.getId());
//			PrintWriter out = response.getWriter();
//			// 가입된 아이디가 없으면
//			if(mdao.idCheck(vo.getId()) == null) {
//				out.print("등록되지 않은 아이디입니다.");
//				out.close();
//			}
//			// 가입된 이메일이 아니면
//			else if(!vo.getEmail().equals(ck.getEmail())) {
//				out.print("등록되지 않은 이메일입니다.");
//				out.close();
//			}else {
//				// 임시 비밀번호 생성
//				String pw = "";
//				for (int i = 0; i < 12; i++) {
//					pw += (char) ((Math.random() * 26) + 97);
//				}
//				vo.setPw(pw);
//				// 비밀번호 변경
//				mdao.updatePw(vo);
//				// 비밀번호 변경 메일 발송
//				sendEmail(vo, "findpw");
//
//				out.print("이메일로 임시 비밀번호를 발송하였습니다.");
//				out.close();
//			}
//			
//		}
//	
//	
}
