package member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import member.bean.MemberDTO;
import member.bean.RecommendDTO;
import member.bean.ZipcodeDTO;

public interface MemberService {
	
	public void write(MemberDTO memberDTO);

	public String checkId(String member_id);

	public Map<String,Integer> login(MemberDTO memberDTO);

	public List<ZipcodeDTO> checkPostSearch(ZipcodeDTO zipcodeDTO);

	public void delete(MemberDTO memberDTO);

	public void modify(MemberDTO memberDTO);

	public String searchId(String member_email);

	public void searchPwd(MemberDTO memberDTO,HttpServletResponse response);
	/*
	 * public String searchPwd(String member_id, String
	 * member_email,HttpServletResponse response);
	 */
	
	//이메일발송
	public void sendEmail(MemberDTO memberDTO, String div) throws Exception;

	public void changePwd(MemberDTO memberDTO);

	public void recommend(Map<String, String> map);

	public void recommended(Map<String, String> map);

	public int recommendChk(Map<String, String> map);
	
	public int emailChk(String member_email);

	public List<RecommendDTO> recommendList(String member_id);

	public void recommendCoupon(String member_id);



}
