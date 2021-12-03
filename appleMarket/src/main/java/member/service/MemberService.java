package member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public interface MemberService {
	
	public void write(MemberDTO memberDTO);

	public String checkId(String member_id);

	public int login(MemberDTO memberDTO);

	public List<ZipcodeDTO> checkPostSearch(ZipcodeDTO zipcodeDTO);

	public void delete(MemberDTO memberDTO);

	public void modify(MemberDTO memberDTO);

	public String searchId(String member_email);

	public void searchPwd(MemberDTO memberDTO,HttpServletResponse response);

	//이메일발송
	public void sendEmail(MemberDTO memberDTO, String div) throws Exception;

	public void chagePwd(MemberDTO memberDTO);

	public void recommend(Map<String, String> map);

	public void recommended(Map<String, String> map);

}
